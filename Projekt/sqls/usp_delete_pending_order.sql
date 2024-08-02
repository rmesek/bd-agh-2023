CREATE PROCEDURE usp_delete_pending_order(@order_id INT) AS
BEGIN
    DECLARE @errorMessage NVARCHAR(MAX);
    SET @errorMessage = 'Nie udało się usunąć oczekującej płatnośći.';
    BEGIN TRY
        BEGIN TRANSACTION [delete_order]

        IF NOT EXISTS (SELECT * FROM pending_payments WHERE order_id=@order_id)
        BEGIN
			SET @errorMessage = 'Brak oczekującego zamówienia order_id: ' + CONVERT(NVARCHAR, @order_id);
			THROW 50000, @errorMessage, 1;
        END

        IF EXISTS (SELECT * FROM completed_payments WHERE order_id=@order_id)
        BEGIN
			SET @errorMessage = 'Część zamówienia została opłacona. Należy manualnie rozwiązać problem dla order_id: ' + CONVERT(NVARCHAR, @order_id);
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