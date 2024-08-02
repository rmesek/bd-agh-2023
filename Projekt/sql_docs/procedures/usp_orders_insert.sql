CREATE PROCEDURE usp_orders_insert(
    @customer_id INT,
    @discount DECIMAL(3,2) = 0,
    @services_table SERVICES_TABLE_TYPE READONLY,
    @instalments_table INSTALMENTS_TABLE_TYPE READONLY
) AS
BEGIN
    DECLARE @errorMessage NVARCHAR(MAX);
    SET @errorMessage = 'Nie udało dodać się zamówienia';
    BEGIN TRY
        BEGIN TRANSACTION [insert_order]

        DECLARE @order_id INT
        DECLARE @order_time DATETIME
        SET @order_id = (SELECT ISNULL(MAX(order_id), 0) + 1 FROM orders)
        SET @order_time = GETDATE()

        IF NOT EXISTS (SELECT * FROM @services_table)
        BEGIN
            SET @errorMessage = 'Brak order_details';
            THROW 50000, @errorMessage, 1;
        END

        IF EXISTS (
            SELECT @customer_id, service_id, service_type_id FROM @services_table
            INTERSECT 
            SELECT customer_id, service_id, service_type_id FROM dbo.orders_for_user)
        BEGIN
            SET @errorMessage = 'Ten użytkownik posiada już któryś z produktów.';
            THROW 50000, @errorMessage, 1;
        END

        /* Sprawdź czy jest przed deadlinem zapisu. */
        DECLARE @min_dealine DATETIME = (
            SELECT MIN(ISNULL(dbo.fn_get_deadline(service_id, service_type_id),0)) 
            FROM @services_table
        );
        IF GETDATE() > @min_dealine
        BEGIN
            SET @errorMessage = 'Jeden z produktów nie jest już w okresie zapisów.';
            THROW 50000, @errorMessage, 1;
        END

        /* Sprawdź czy są miejsca. NULL - bez limitu */
        DECLARE @min_limit DATETIME = (
            SELECT MIN(dbo.fn_calc_limit_left(service_id, service_type_id)) 
            FROM @services_table
        );
        IF @min_limit IS NOT NULL AND @min_limit <= 0
        BEGIN
            SET @errorMessage = 'Brak wolnych miejsc na jeden z produktów.';
            THROW 50000, @errorMessage, 1;
        END

        -- dodaj order
        INSERT INTO orders (order_id, customer_id, order_time)
        VALUES
            (@order_id, @customer_id, @order_time)

        -- dodaj poszczególne pozycje
        INSERT INTO order_details (order_id, service_id, service_type_id)
        SELECT @order_id, service_id, service_type_id
        FROM @services_table

        -- dodaj płatność
        DECLARE @total_price MONEY
        DECLARE @payment_id INT

        SELECT @total_price = [dbo].[fn_sum_services_table](@services_table)
        SELECT @payment_id = ISNULL(MAX(payment_id), 0) + 1 FROM pending_payments

        -- sprawdz czy raty sumują się do całości zamówienia
        IF (SELECT SUM(instalment) FROM @instalments_table)!=@total_price
        BEGIN
            SET @errorMessage = 'Nieprawidłowy rozkład na raty';
            THROW 50000, @errorMessage, 1;
        END

        INSERT INTO pending_payments 
        (payment_id, order_id, payment_amount, payment_due, payment_link)
        SELECT
            @payment_id + instalment_id,
            @order_id, 
            instalment*(1-@discount), 
            payment_due,
            payment_link
        FROM @instalments_table

        COMMIT TRANSACTION [insert_order];
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION [insert_order];
        THROW 50000, @errorMessage, 1;
    END CATCH
END

GO
