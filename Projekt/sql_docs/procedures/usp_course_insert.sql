CREATE PROCEDURE [dbo].[usp_course_insert](
    @course_type_id int,
    @title nvarchar(MAX),
    @subject_name nvarchar(MAX),
    @price money,
    @module_list_JSON as nvarchar(MAX)
)
AS
    BEGIN
        TRY
            DECLARE @course_id int;
            SET @course_id = (SELECT ISNULL(MAX(course_id), 0) + 1 FROM courses);

            INSERT INTO courses(course_id, course_type_id, title, subject_name, price)
            VALUES (@course_id, @course_type_id, @title, @subject_name, @price)


    --         now we want to add all courses into their corresponding tables
    --         first we need to unpack module list out of json
            DECLARE @module_type_id INT;
            DECLARE @module_title NVARCHAR(MAX);
            DECLARE @teacher_id INT;
            DECLARE @start_time DATETIME;
            DECLARE @end_time DATETIME;
            DECLARE @translator_id INT;
            DECLARE @link NVARCHAR(MAX);
            DECLARE @classroom_id INT;
            DECLARE @module_list Table (
                module_type_id int,
                module_title nvarchar(MAX),
                teacher_id int,
                start_time datetime,
                end_time datetime,
                translator_id int NULL,
                link nvarchar(MAX) NULL,
                classroom_id int NULL
            );

            INSERT INTO @module_list (module_type_id, module_title, teacher_id, start_time, end_time, translator_id, link, classroom_id)
            SELECT module_type_id, module_title, teacher_id, start_time, end_time, translator_id, link, classroom_id
            FROM OPENJSON(@module_list_JSON)
            WITH (
                module_type_id int,
                module_title nvarchar(MAX),
                teacher_id int,
                start_time datetime,
                end_time datetime,
                translator_id int,
                link nvarchar(MAX),
                classroom_id int
            );


    --         now create cursor and iterate over modules, adding them with procedure
            DECLARE cur_iterator CURSOR FOR
            SELECT module_type_id, module_title, teacher_id, start_time,
                   end_time, translator_id, link, classroom_id
            FROM @module_list;

            OPEN cur_iterator;
            FETCH NEXT FROM cur_iterator INTO @module_type_id, @module_title, @teacher_id, @start_time,
                @end_time, @translator_id, @link, @classroom_id;

            WHILE @@FETCH_STATUS = 0
            BEGIN
    --             insert module course into corresponding tables
                EXEC usp_course_module_insert @module_type_id, @module_title, @teacher_id, @start_time,
                                              @end_time, @translator_id, @link, @classroom_id;

                FETCH NEXT FROM cur_iterator INTO @module_type_id, @module_title, @teacher_id, @start_time,
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

