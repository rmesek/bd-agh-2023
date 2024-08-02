CREATE FUNCTION fn_get_deadline(@service_id INT, @service_type_id INT)
RETURNS DATETIME AS
BEGIN
    RETURN (
        SELECT purchase_deadline FROM dbo.events_purchase_deadline epd
        WHERE epd.service_id=@service_id AND epd.service_type_id=@service_type_id
        )
END