CREATE FUNCTION [dbo].[fn_get_least_expensive_order_price]()
RETURNS money AS
    BEGIN
        DECLARE @minimum money;
        SET @minimum = (
            SELECT MIN(dbo.fn_calc_total_order_value(order_id))
            FROM orders
        );
        RETURN @minimum;
    end
GO
