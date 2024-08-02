CREATE FUNCTION [dbo].[fn_calc_total_order_value](@order_id int)
RETURNS money AS
    BEGIN
       DECLARE @totalVal money;
       SET @totalVal = (
           SELECT SUM(dbo.fn_get_price_of_service(service_id, service_type_id))
           FROM order_details
           WHERE order_id = @order_id
           )
       RETURN @totalVal;
    END
GO
