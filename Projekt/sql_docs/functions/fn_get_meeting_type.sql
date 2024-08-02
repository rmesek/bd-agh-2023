CREATE FUNCTION [dbo].[fn_get_meeting_type](@service_id int, @service_type_id int) -- BT
RETURNS nvarchar(MAX) AS
    BEGIN
        DECLARE @meeting_type nvarchar(MAX);
        SET @meeting_type = CASE
            WHEN @service_type_id = 1 THEN (
                SELECT webinar_type FROM dbo.webinar_types WHERE webinar_type_id = (
                    SELECT webinar_type_id FROM dbo.webinars WHERE webinar_id = @service_id)
            )
            WHEN @service_type_id = 2 THEN (
                SELECT module_type_name FROM course_module_types WHERE module_type_id = (
                    SELECT module_type_id FROM course_modules WHERE course_id = @service_id)
            )
            WHEN @service_type_id = 3 THEN (
                SELECT 'Hybrid'
            )
            WHEN @service_type_id = 4 THEN (
                SELECT dbo.fn_get_study_class_type(@service_id)
            )
            end
        RETURN @meeting_type
    end
GO
