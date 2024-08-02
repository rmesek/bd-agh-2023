CREATE FUNCTION [dbo].[fn_get_staff_time_table_for_translator](@translator_id int)
RETURNS TABLE AS RETURN
    SELECT * from staff_time_table
    WHERE teacher_id=@translator_id
GO

