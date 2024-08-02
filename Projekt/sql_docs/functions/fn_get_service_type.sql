CREATE FUNCTION [dbo].[fn_get_service_type](@service_id int, @service_type_id int) -- BT
RETURNS nvarchar(MAX) AS
    BEGIN
        DECLARE @service_type nvarchar(MAX);
        SET @service_type = CASE
            WHEN @service_type_id = 2 THEN (
                SELECT course_type FROM course_types
                WHERE course_type_id = (SELECT course_type_id FROM courses
                                        WHERE course_id = @service_id)
            )
            ELSE
                dbo.fn_get_meeting_type(@service_id, @service_type_id)
            END
        RETURN @service_type
    end
GO

