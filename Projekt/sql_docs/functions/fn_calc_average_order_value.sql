CREATE FUNCTION [dbo].[fn_calc_average_order_value]()
RETURNS money AS
    BEGIN
        DECLARE @average money;
        SET @average = (
            SELECT AVG(dbo.fn_calc_total_order_value(order_id))
            FROM orders
        );
        RETURN @average;
    end
GO
