CREATE FUNCTION fn_calc_limit_left(@service_id INT, @service_type_id INT)
RETURNS INT AS
BEGIN
    DECLARE @limit_left INT = (
        SELECT (limit - dbo.fn_calc_enrollment(@service_id, @service_type_id))
        FROM dbo.events_purchase_deadline epd
        WHERE epd.service_id=@service_id AND epd.service_type_id=@service_type_id
        );
    IF @limit_left IS NULL
        RETURN NULL;
    RETURN IIF(@limit_left>0, @limit_left, 0);
END