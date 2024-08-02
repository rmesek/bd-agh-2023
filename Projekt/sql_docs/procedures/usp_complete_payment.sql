CREATE PROCEDURE usp_complete_payment(
    @payment_id INT,
    @payment_time DATETIME
)
AS
BEGIN
	DECLARE @errorMessage NVARCHAR(MAX);

    BEGIN TRY
        BEGIN TRANSACTION [complete_payment]

        IF NOT EXISTS (SELECT * FROM pending_payments WHERE payment_id=@payment_id)
        BEGIN
			SET @errorMessage = 'Brak zamówienia dla payment_id: ' + 
            CONVERT(NVARCHAR, @payment_id);
			THROW 50000, @errorMessage, 1;
        END

        -- dodaj do completed_payments
        INSERT INTO completed_payments 
        (payment_id, order_id, payment_amount, payment_time)
        SELECT @payment_id, order_id, payment_amount, @payment_time
        FROM pending_payments WHERE payment_id=@payment_id

        -- usuń z pending_payments
        DELETE FROM pending_payments WHERE payment_id=@payment_id
    
        COMMIT TRANSACTION [complete_payment];
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION [complete_payment];

			SET @errorMessage = 'Nie udało przetworzyć payment_id: ' + 
            CONVERT(NVARCHAR, @payment_id);
			THROW 50000, @errorMessage, 1;
    END CATCH
END

GO