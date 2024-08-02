ALTER PROCEDURE usp_delete_pending_order(@order_id INT) AS
BEGIN
    DECLARE @errorMessage NVARCHAR(MAX);
    SET @errorMessage = 'Nie udało się usunąć oczekującej płatnośći.';
    BEGIN TRY
        BEGIN TRANSACTION [delete_order]

        IF NOT EXISTS (SELECT * FROM pending_payments WHERE order_id=@order_id)
        BEGIN
			SET @errorMessage = 'Brak oczekującego zamówienia order_id: ' 
                + CONVERT(NVARCHAR, @order_id);
			THROW 50000, @errorMessage, 1;
        END

        IF EXISTS (SELECT * FROM pending_payments WHERE order_id=@order_id
                    AND GETDATE()>=pending_payments.payment_due)
        BEGIN
			SET @errorMessage = 'Nie można anulować zalegającej płatności order_id: ' 
                + CONVERT(NVARCHAR, @order_id);
			THROW 50000, @errorMessage, 1;
        END

        /* Sprawdź czy nie jest już po deadlinie zapisów. 
        Użytkownik już mógł skorzystać z jakiegoś serwisu! */
        DECLARE @min_dealine DATETIME = (
            SELECT MIN(ISNULL(dbo.fn_get_deadline(service_id, service_type_id),0)) 
            FROM order_details od WHERE od.order_id=@order_id
        );
        IF GETDATE() >= @min_dealine
        BEGIN
            SET @errorMessage = 'Za późno na automatyczne anulowanie zamówienia.';
            THROW 50000, @errorMessage, 1;
        END

        IF EXISTS (SELECT * FROM completed_payments WHERE order_id=@order_id)
        BEGIN
			SET @errorMessage = 
            'Część zamówienia została opłacona. ' +
            'Należy manualnie rozwiązać problem dla order_id: ' 
            + CONVERT(NVARCHAR, @order_id);
			THROW 50000, @errorMessage, 1;
        END

        -- usuń zamówienie oczekujące na płatność
        DELETE FROM pending_payments WHERE order_id=@order_id
    
        COMMIT TRANSACTION [delete_order];
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION [delete_order];
        THROW 50000, @errorMessage, 1;
    END CATCH
END