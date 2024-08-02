CREATE PROCEDURE [dbo].[usp_change_address] (
    @user_id int,
    @street nvarchar(MAX),
    @number int,
    @zip nvarchar(MAX),
    @city nvarchar(63),
    @country nvarchar(63)
)
AS BEGIN
    UPDATE dbo.adress_details
    SET street = @street, number = @number, zip = @zip,
        city = @city, country = @country
    WHERE user_id = @user_id

    IF NOT EXISTS (SELECT * FROM countries_cities WHERE country=@country AND city=@city)
    BEGIN
        INSERT INTO dbo.countries_cities(country, city)
        VALUES (@city, @country)
    END
END