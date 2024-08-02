-- Function to check if staff isn't busy
CREATE FUNCTION [dbo].[fn_staff_has_free_time](
    @employee_id int,
    @start_time datetime,
    @end_time datetime
)
RETURNS BIT AS
    BEGIN
       DECLARE @has_free_time bit;
       SET @has_free_time = (
           SELECT MAX(CAST(dbo.fn_two_datetimes_intersect(@start_time, @end_time,
                      start_time, end_time) AS INT))
           FROM staff_time_table
           WHERE teacher_id = @employee_id OR translator_id = @employee_id
       )
       RETURN @has_free_time;
    END
GO

