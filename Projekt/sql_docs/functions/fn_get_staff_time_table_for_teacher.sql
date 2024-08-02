CREATE FUNCTION [dbo].[fn_get_staff_time_table_for_teacher](@teacher_id int)
RETURNS TABLE AS RETURN
    SELECT * from staff_time_table
    WHERE teacher_id=@teacher_id
GO

