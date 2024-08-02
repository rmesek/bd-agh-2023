CREATE PROCEDURE [dbo].[usp_webinar_insert](
    @webinar_type_id int,
    @price money,
    @title nvarchar(MAX),
    @subject_name nvarchar(MAX),
    @teacher_id int,
    @start_time datetime,
    @end_time datetime,
    @translator_id int = NULL,
    @link nvarchar(MAX) = NULL,
    @link_expires datetime = NULL
)
AS BEGIN
    TRY
        -- CHECK IF STAFF's TIME TABLE DOESN'T COLLIDE WITH WEBINAR
        IF(dbo.fn_staff_has_free_time(
@teacher_id, @start_time, @end_time) = 0 OR
           dbo.fn_staff_has_free_time(
@translator_id, @start_time, @end_time) = 0
        )
        BEGIN
            THROW 50000, N'Nauczyciel/tlumacz jest zajety w danym terminie', 1
        end

        -- CHECK IF START_TIME IS IN THE FUTURE
        IF(@start_time < getdate())
        BEGIN
            THROW 50000, N'Data startu webinaru już upłynęła.', 1
        end

        IF(@link_expires IS NOT NULL AND @link_expires < getdate())
        BEGIN
            THROW 50000, N'Data wygaśnięcia linku już upłynęła', 1
        end

        DECLARE @webinar_id int;
        SET @webinar_id = (SELECT ISNULL(MAX(webinar_id), 0) + 1 FROM webinars)


        INSERT INTO webinars (webinar_id, webinar_type_id, price, title,
                              subject_name, link, link_expires, teacher_id, start_time, end_time)
        VALUES (@webinar_id, @webinar_type_id, @price, @title,
                @subject_name, @link, @link_expires, @teacher_id, @start_time, @end_time)

        IF(@translator_id IS NOT NULL)
        BEGIN
            INSERT INTO webinars_transaltions(webinar_id, translator_id)
            VALUES (@webinar_id, @translator_id)
        end
    END TRY
    BEGIN CATCH
        IF(@@TRANCOUNT > 0)
            ROLLBACK TRAN
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorNumber INT;
        DECLARE @ErrorState INT;

        SET @ErrorNumber = ERROR_NUMBER();
        SET @ErrorMessage = ERROR_MESSAGE();
        SET @ErrorState = ERROR_STATE();

        THROW @ErrorNumber, @ErrorMessage, @ErrorState
    END CATCH
GO

