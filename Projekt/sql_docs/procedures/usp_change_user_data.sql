CREATE PROCEDURE [dbo].[usp_change_user_data](
    @user_id int,
    @user_type_id int,
    @e_mail nvarchar(MAX),
    @hashed_passwd nvarchar(MAX),
    @first_name nvarchar(MAX),
    @last_name nvarchar(MAX)
)
AS BEGIN
    UPDATE dbo.users
    SET user_type_id=@user_type_id, e_mail=@e_mail, hashed_passwd=@hashed_passwd,
        first_name=@first_name, last_name=@last_name
    WHERE user_id = @user_id
END