CREATE FUNCTION fn_has_access(@customer_id INT, @service_id INT, @service_type_id INT)
RETURNS BIT AS
BEGIN
    DECLARE @has_access BIT;
    SET @has_access = 0;

	/* Sprawdź czy klient, kupował ten produkt. */
    SET @has_access = IIF(EXISTS(
		SELECT customer_id, service_id, service_type_id 
		FROM user_completed_payment_details
		WHERE customer_id=@customer_id AND service_id=@service_id 
    	AND service_type_id=@service_type_id
		UNION
		SELECT customer_id, service_id, service_type_id 
		FROM user_pending_payment_details
		WHERE customer_id=@customer_id AND service_id=@service_id 
    	AND service_type_id=@service_type_id), 1, 0)
	
	/* Jeśli nie kupował to nie ma dostępu. */
	IF @has_access=0
		RETURN 0;

	/* Sprawdź czy nie zalega z oczekującymi opłatami. */
	SET @has_access = IIF(EXISTS(SELECT * FROM dbo.user_pending_payment_details
	WHERE customer_id=@customer_id AND service_id=@service_id 
    AND service_type_id=@service_type_id AND GETDATE()>payment_due), 0, 1)

    RETURN @has_access;
END