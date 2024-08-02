/* Create a table type. */
CREATE TYPE SERVICES_TABLE_TYPE AS TABLE (
    service_id INT,
    service_type_id INT
)

GO

/* Create function calculating total price. */
CREATE FUNCTION fn_sum_services_table(@services_table SERVICES_TABLE_TYPE READONLY)
RETURNS money AS
    BEGIN
       DECLARE @totalVal money
       SET @totalVal = (
           SELECT SUM([dbo].[fn_get_price_of_service](service_id, service_type_id))
           FROM @services_table
           )
       RETURN @totalVal
END

GO

/* Create a procedure. */
CREATE PROCEDURE usp_orders_insert(
    @customer_id INT,
    @discount DECIMAL(3,2),
    @payment_due DATETIME,
    @payment_link VARCHAR(MAX),
    @services_table SERVICES_TABLE_TYPE READONLY
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION [insert_order]

        DECLARE @order_id INT
        DECLARE @order_time DATETIME
        SET @order_id = (SELECT ISNULL(MAX(order_id), 0) + 1 FROM orders)
        SET @order_time = GETDATE()

        IF NOT EXISTS (SELECT * FROM @services_table)
        BEGIN
            THROW 50000, 'Brak order_details', 1;
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
        INSERT INTO pending_payments (payment_id, order_id, payment_amount, payment_due, payment_link)
        VALUES
        (@payment_id, @order_id, @total_price*(1-@discount), @payment_due, @payment_link)
    
        COMMIT TRANSACTION [insert_order];
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION [insert_order];
        THROW 50000, 'Nie udało dodać się zamówienia', 1;
    END CATCH
END

GO
/*
/* Create order details table and exec. */
DECLARE @services_table SERVICES_TABLE_TYPE
INSERT INTO @services_table(service_id, service_type_id)
VALUES
    (1, 1),
    (2, 1)

EXEC usp_orders_insert 
    @customer_id=30, 
    @discount=0.1, 
    @payment_due='2050-01-04 12:00:00', 
    @payment_link='http://new_link.com', 
    @services_table=@services_table;
*/
-- payment_amount should be 31.95