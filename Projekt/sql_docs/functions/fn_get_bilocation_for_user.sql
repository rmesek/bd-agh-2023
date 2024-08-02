CREATE FUNCTION [dbo].[fn_get_bilocation_for_user](@user_id int)
RETURNS TABLE AS RETURN
    SELECT * from bilocation_raport
    where id_klienta = @user_id
GO

