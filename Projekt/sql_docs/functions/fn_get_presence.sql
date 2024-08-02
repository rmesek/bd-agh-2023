CREATE FUNCTION [dbo].[fn_get_presence](@customer_id int, @service_id int, @service_type_id int) -- BT
RETURNS bit AS
    BEGIN
        DECLARE @was_present bit;

        SET @was_present = CASE
            WHEN @service_type_id = 1 THEN (SELECT 1) -- pointless for this argument
            WHEN @service_type_id = 2 THEN (
                IIF(EXISTS(SELECT customer_id FROM course_presences
                       WHERE customer_id = @customer_id AND module_id = @service_id), 1, 0)
            )
            WHEN @service_type_id = 3 THEN (SELECT 1) -- pointless for this argument
            WHEN @service_type_id = 4 THEN (
                IIF(EXISTS(SELECT customer_id FROM studies_presences
                      WHERE customer_id = @customer_id AND class_id = @service_id), 1, 0)
                )
        END

        RETURN @was_present
END
GO
