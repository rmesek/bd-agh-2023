CRATE TRIGGER trg_delete_details_on_order_delete
ON orders INSTEAD OF DELETE AS
BEGIN
	/* usuwaj szczegóły kolejnych zamówień */

	DECLARE cursor_order_id CURSOR
	FOR SELECT
		order_id
	FROM
		deleted;

	OPEN cursor_order_id;

	FETCH NEXT FROM cursor_order_id INTO
		@order_id;

	WHILE @@FETCH_STATUS=0
		BEGIN
			/* Usuwaj szczegóły */
			DELETE FROM completed_payments WHERE order_id=@order_id;
			DELETE FROM pending_payments WHERE order_id=@order_id;
			DELETE FROM order_details WHERE order_id=@order_id;
			DELETE FROM orders WHERE order_id=@order_id;

			FETCH NEXT FROM cursor_order_id INTO
				@order_id;
		END;

	CLOSE cursor_order_id;
	DEALLOCATE cursor_order_id;
END