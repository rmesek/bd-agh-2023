CREATE PROCEDURE [dbo].[usp_add_presence](
    @service_id int,
    @service_type_name nvarchar(MAX),
    @customer_id int,
    @is_excused bit = 0
)
AS BEGIN
    IF(@service_type_name != 'course' AND @service_type_name != 'studies_classes')
    BEGIN
        THROW 50000, 'Wrong service type name', 1
    end
    IF(@service_type_name = 'course')
    BEGIN
        IF NOT EXISTS (SELECT * FROM course_modules where module_id=@service_id)
        BEGIN
            THROW 50000, 'Course module with such id does not exist', 1
        end

        INSERT INTO course_presences(module_id, customer_id)
        VALUES (@service_id, @customer_id)
    end
    IF(@service_type_name = 'studies_classes')
    BEGIN
        IF NOT EXISTS (SELECT * FROM studies_classes where class_id=@service_id)
        BEGIN
            THROW 50000, 'Studies classes with such id do not exist', 1
        end

        INSERT INTO studies_presences(class_id, customer_id, is_excused_absence)
        VALUES (@service_id, @customer_id, @is_excused)
    end
end
GO

