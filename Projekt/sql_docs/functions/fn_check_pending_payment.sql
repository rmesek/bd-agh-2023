CREATE FUNCTION fn_check_pending_payment(@customer_id INT, @service_id INT, @service_type_id INT)
RETURNS BIT
AS
BEGIN
    DECLARE @result BIT

    IF EXISTS (SELECT * FROM user_pending_payment_details WHERE customer_id=@customer_id AND service_id=@service_id AND service_type_id=@service_type_id)
        SET @result = 1;
    ELSE
        SET @result = 0;

    RETURN @result
END
GO