CREATE PROCEDURE [dbo].[usp_users_insert](
    @user_type_id INT,
    @e_mail NVARCHAR(MAX),
    @hashed_password NVARCHAR(MAX),
    @first_name NVARCHAR(MAX),
    @last_name NVARCHAR(MAX),
    @phone_number NVARCHAR(MAX) = NULL,
    @street NVARCHAR(MAX),
    @number int,
    @zip NVARCHAR(MAX),
    @city NVARCHAR(63),
    @country NVARCHAR(63),
    @language_id int = NULL
)
AS BEGIN
    TRY
        DECLARE @user_id int;
        SET @user_id = (SELECT ISNULL(MAX(user_id), 0) + 1 FROM users);

    --     INSERT INTO users TABLE
        INSERT INTO dbo.users(user_id, user_type_id, e_mail, hashed_passwd, first_name, last_name, phone_number)
        VALUES (@user_id, @user_type_id, @e_mail, @hashed_password, @first_name,
                @last_name, @phone_number)

    --     INSERT INTO adress
        INSERT INTO adress_details(user_id, street, number, zip, city, country)
        VALUES (@user_id, @street, @number, @zip, @city, @country)

    --     INSERT INTO countries_cities if not exists
        IF NOT EXISTS (SELECT * FROM countries_cities
                        WHERE country = @country AND city = @city)
        BEGIN
            INSERT INTO countries_cities(country, city)
            VALUES (@country, @city)
        END

    --     CHECK NEW USER TYPE
        DECLARE @user_type_name NVARCHAR(MAX);
        SET @user_type_name = (SELECT user_type_name FROM user_types
                                     WHERE user_type_id = @user_type_id);

    --     IF WE ARE ADDING A TEACHER
        IF @user_type_name = 'Teacher'
        BEGIN
            EXEC usp_teacher_insert @user_id
        END

    --     IF WE ARE ADDING A TRANSLATOR
        IF @user_type_name = 'Translator'
        BEGIN
            EXEC usp_translator_insert @user_id, @language_id
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        PRINT ERROR_MESSAGE()
        RAISERROR ('Cos poszlo nie tak', 10, 1)
    END CATCH