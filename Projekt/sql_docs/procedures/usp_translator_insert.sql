CREATE PROCEDURE [dbo].[usp_translator_insert](
    @user_id int,
    @language_id int
)
AS BEGIN
    TRY
        DECLARE @teacher_id int;
        SET @teacher_id = (SELECT ISNULL(MAX(teacher_id), 0) + 1 FROM teachers);

        DECLARE @translator_id int;
        SET @translator_id = (SELECT ISNULL(MAX(translator_id), 0) + 1 FROM translators);

    --     INSERT INTO TEACHER TABLE
        INSERT INTO teachers(teacher_id, user_id)
        VALUES (@teacher_id, @user_id)

    --     INSERT INTO TRANSLATOR TABLE
        INSERT INTO translators(translator_id, teacher_id, language_id)
        VALUES (@translator_id, @teacher_id, @language_id)
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        PRINT ERROR_MESSAGE()
        RAISERROR ('Cos poszlo nie tak', 10, 1)
    END CATCH