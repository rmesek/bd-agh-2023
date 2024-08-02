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