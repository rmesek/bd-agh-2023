CREATE FUNCTION [dbo].[fn_get_most_expensive_order_price]()
RETURNS money AS
    BEGIN
        DECLARE @maximum money;
        SET @maximum = (
            SELECT MAX(dbo.fn_calc_total_order_value(order_id))
            FROM orders
        );
        RETURN @maximum;
    end
GO
