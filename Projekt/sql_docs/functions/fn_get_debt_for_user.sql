CREATE FUNCTION [dbo].[fn_get_debt_for_user](@user_id int)
RETURNS TABLE AS RETURN
    SELECT debtors.customer_id, debtors.Debt from debtors
    INNER JOIN dbo.customers c on debtors.customer_id = c.customer_id
    where @user_id = debtors.customer_id
GO

