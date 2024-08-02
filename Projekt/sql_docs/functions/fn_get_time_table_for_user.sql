CREATE FUNCTION [dbo].[fn_get_time_table_for_user](@user_id int)
RETURNS TABLE AS RETURN
    SELECT * from time_table
    where id_klienta = @user_id
GO

