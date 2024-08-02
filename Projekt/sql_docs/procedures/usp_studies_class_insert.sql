CREATE PROCEDURE [dbo].[usp_studies_class_insert](
    @studies_id int,
    @title nvarchar(MAX),
    @teacher_id int,
    @start_time datetime,
    @end_time datetime,
    @translator_id int = NULL,
    @link nvarchar(MAX) = NULL,
    @classroom_id int = NULL
)
AS BEGIN
    TRY
        IF (@link IS NULL AND @classroom_id IS NULL) OR (@link IS NOT NULL AND @classroom_id IS NOT NULL)
        BEGIN
            THROW 50000, 'Both "link" and "classroom_id" specified or unspecified. Class cannot be both/neither stationary and online at the same time', 1
        end

        IF(@start_time < getdate())
        BEGIN
            THROW 50000, N'Zajęcia już się rozpoczęły, nie można ich dodać do bazy', 1
        end

        IF( SELECT COUNT(*) FROM studies_classes WHERE studies_id=@studies_id AND
            dbo.fn_two_datetimes_intersect(start_time, end_time,
            @start_time, @end_time) = 1) > 0
        BEGIN
            THROW 50000, N'Moduły studiów o tym samym id kolidują ze sobą', 1
        end

        IF(dbo.fn_staff_has_free_time(@teacher_id, @start_time, @end_time) = 0 OR
           dbo.fn_staff_has_free_time(@translator_id, @start_time, @end_time) = 0)
        BEGIN
            THROW 50000, N'Nauczyciel/tłumacz jest w momencie zajęć zajęty', 1
        end

        DECLARE @class_id int;
        SET @class_id = (SELECT ISNULL(MAX(class_id), 0) + 1 FROM studies_classes);

        INSERT INTO studies_classes(class_id, studies_id, title, teacher_id, start_time, end_time)
        VALUES (@class_id, @studies_id, @title, @teacher_id, @start_time, @end_time);

    --     ADD translator if its not null (if its set)
        IF(@translator_id IS NOT NULL)
        BEGIN
            INSERT INTO studies_class_translators(class_id, translator_id)
            VALUES (@class_id, @translator_id)
        end

    --     ADD TO ONLINE IF LINK SPECIFIED
        IF(@link IS NOT NULL)
        BEGIN
            INSERT INTO studies_online_classes(class_id, link)
            VALUES (@class_id, @link)
        end

    --     ADD TO STATIONARY IF CLASSROOM SPECIFIED
        IF(@classroom_id IS NOT NULL)
        BEGIN
            INSERT INTO studies_classroom_classes(class_id, classroom_id)
            VALUES (@classroom_id, @classroom_id)
        end
    END TRY
    BEGIN CATCH
        IF(@@TRANCOUNT > 0)
            ROLLBACK TRAN
        THROW;
    END CATCH
GO

