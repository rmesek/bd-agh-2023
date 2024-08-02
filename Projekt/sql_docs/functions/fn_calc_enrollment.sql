CREATE FUNCTION fn_calc_enrollment(@service_id INT, @service_type_id INT)
RETURNS INT AS
BEGIN
    RETURN (
        COUNT customer_id FROM dbo.event_participants ep
        WHERE ep.service_id=@service_id AND (
            SELECT service_type_id FROM service_types st 
            WHERE st.service_type_name=ep.service_type_name
            )=@service_type_id
        )
END