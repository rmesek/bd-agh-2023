CREATE PROCEDURE [dbo].[usp_studies_insert](
    @name nvarchar(MAX),
    @start_date date,
    @student_limit int,
    @member_price money,
    @non_member_price money,
    @module_list_JSON as nvarchar(MAX)
) -- BT
AS
    BEGIN
    TRY
        DECLARE @studies_id int;
        SET @studies_id = (SELECT ISNULL(MAX(studies_id), 0) + 1 FROM studies);

        INSERT INTO studies(studies_id, name, start_date, student_limit)
        VALUES (@studies_id, @name, @start_date, @student_limit);

--         ADD prices
        INSERT INTO studies_price_per_classes(studies_id, member_price, non_member_price)
        VALUES (@studies_id, @member_price, @non_member_price);
--         now we want to add all courses into their corresponding tables
--         first we need to unpack module list out of json
        DECLARE @title NVARCHAR(MAX);
        DECLARE @teacher_id INT;
        DECLARE @start_time DATETIME;
        DECLARE @end_time DATETIME;
        DECLARE @translator_id INT;
        DECLARE @link NVARCHAR(MAX);
        DECLARE @classroom_id INT;
        DECLARE @module_list Table (
            title nvarchar(MAX),
            teacher_id int,
            start_time datetime,
            end_time datetime,
            translator_id int,
            link nvarchar(MAX),
            classroom_id int
        );

        INSERT INTO @module_list (title, teacher_id, start_time, end_time, translator_id, link, classroom_id)
        SELECT title, teacher_id, start_time, end_time, translator_id, link, classroom_id
        FROM OPENJSON(@module_list_JSON)
        WITH (
            title nvarchar(MAX),
            teacher_id int,
            start_time datetime,
            end_time datetime,
            translator_id int,
            link nvarchar(MAX),
            classroom_id int
        );


--         now create cursor and iterate over modules, adding them with procedure
        DECLARE cur_iterator CURSOR FOR
        SELECT title, teacher_id, start_time,
               end_time, translator_id, link, classroom_id
        FROM @module_list;

        OPEN cur_iterator;
        FETCH NEXT FROM cur_iterator INTO @title, @teacher_id, @start_time,
            @end_time, @translator_id, @link, @classroom_id;

        WHILE @@FETCH_STATUS = 0
        BEGIN
--             insert module course into corresponding tables
            EXEC usp_studies_class_insert @studies_id, @title, @teacher_id, @start_time,
                                          @end_time, @translator_id, @link, @classroom_id;

            FETCH NEXT FROM cur_iterator INTO @title, @teacher_id, @start_time,
                                             @end_time, @translator_id, @link, @classroom_id;
        END;

--         close cursor
        CLOSE cur_iterator;
        DEALLOCATE cur_iterator;
    END TRY
    BEGIN CATCH
        IF(@@TRANCOUNT > 0)
            ROLLBACK TRAN
        THROW;
    END CATCH
GO

