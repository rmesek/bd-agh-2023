CREATE PROCEDURE [dbo].[usp_teacher_insert](
    @user_id int
)
AS BEGIN
    TRY
        DECLARE @teacher_id int;
        SET @teacher_id = (SELECT ISNULL(MAX(teacher_id), 0) + 1 FROM teachers);

    --     INSERT INTO TEACHER TABLE
        INSERT INTO teachers(teacher_id, user_id)
        VALUES (@teacher_id, @user_id)
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        PRINT ERROR_MESSAGE()
        RAISERROR ('Cos poszlo nie tak', 10, 1)
    END CATCH