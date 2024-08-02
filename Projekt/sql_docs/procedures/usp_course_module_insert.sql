CREATE PROCEDURE [dbo].[usp_course_module_insert](
    @course_id int,
    @module_type_id int,
    @module_title nvarchar(MAX),
    @teacher_id int,
    @start_time datetime,
    @end_time datetime,
    @translator_id int = NULL,
    @link nvarchar(MAX) = NULL,
    @classroom_id int = NULL
)
AS BEGIN
    TRY
        DECLARE @module_id int;
        SET @module_id = (SELECT ISNULL(MAX(module_id), 0) + 1 from course_modules);

        IF (@link IS NULL AND @classroom_id IS NULL) OR (@link IS NOT NULL AND @classroom_id IS NOT NULL)
        BEGIN
            THROW 50000, 'Both "link" and "classroom_id" specified or unspecified. Class cannot be both/neither stationary and online at the same time', 1
        end

        IF(@start_time < getdate())
        BEGIN
            THROW 50000, N'Zajęcia już się rozpoczęły, nie można ich dodać do bazy', 1
        end

        IF(dbo.fn_staff_has_free_time(@teacher_id, @start_time, @end_time) = 0 OR
           dbo.fn_staff_has_free_time(@translator_id, @start_time, @end_time) = 0)
        BEGIN
            THROW 50000, N'Nauczyciel/tłumacz jest w momencie zajęć zajęty', 1
        end

        IF( SELECT COUNT(*) FROM course_modules WHERE course_id=@course_id AND
            dbo.fn_two_datetimes_intersect(start_time, end_time,
            @start_time, @end_time) = 1) > 0
        BEGIN
            THROW 50000, N'Moduły kursu o tym samym id kolidują ze sobą', 1
        end

    --     ADD TO MAIN TABLE
        INSERT INTO course_modules(module_id, course_id, module_type_id,
                                   module_title, teacher_id, start_time, end_time)
        VALUES (@module_id, @course_id, @module_type_id, @module_title, @teacher_id, @start_time, @end_time)


    --     ADD TRANSLATOR INTO course_translations TABLE (assuming only 1 translator per course module)
        IF @translator_id IS NOT NULL
        BEGIN
            INSERT INTO course_translations(module_id, translator_id)
            VALUES(@module_id, @translator_id)
        end


        DECLARE @module_type_name nvarchar(MAX);
        SET @module_type_name = (SELECT module_type_name FROM course_module_types
                                                         WHERE module_type_id = @module_type_id)

        -- CHECK IF module_type_id matches given attributes
        IF((@module_type_name = 'Online' AND @link IS NULL) OR
           (@module_type_name = 'Stationary' AND @classroom_id IS NULL))
        BEGIN
            THROW 50000, N'Podbano złą kombinację module_type_id + link/classroom_id', 1
        end

        IF(@module_type_name = 'Online')
        BEGIN
            INSERT INTO course_online_modules(module_id, link)
            VALUES (@module_id, @link);
        end
        ELSE IF(@module_type_name = 'Stationary')
        BEGIN
            INSERT INTO course_classroom_modules(module_id, classroom_id)
            VALUES (@module_id, @classroom_id);
        end
    END TRY
    BEGIN CATCH
        IF(@@TRANCOUNT > 0)
            ROLLBACK TRAN
        THROW;
    END CATCH
GO

