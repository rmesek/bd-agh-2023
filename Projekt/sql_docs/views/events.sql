CREATE VIEW [dbo].[events]
AS
    SELECT webinar_id as 'service_id', 'webinar' as 'service_type', 1 as 'service_type_id',
           webinar_type as 'online/stationary', price, title, start_time, end_time FROM webinars
    INNER JOIN webinar_types ON webinars.webinar_type_id = webinar_types.webinar_type_id
    UNION
    SELECT course_id, 'course', 2, course_type, price, title, (
        SELECT MIN(start_time) from course_modules WHERE courses.course_id=course_modules.course_id
        ) as 'start_time', (
            SELECT MAX(end_time) from course_modules WHERE courses.course_id=course_modules.course_id
        ) FROM courses
    INNER JOIN course_types ON courses.course_type_id = course_types.course_type_id
    UNION
    SELECT studies_id, 'studies', 3, 'Hybrid', (
        SELECT dbo.fn_get_number_of_college_classes(studies_id)*member_price as 'class_number'
        FROM studies_price_per_classes WHERE studies.studies_id=studies_price_per_classes.studies_id
        ) as 'price', name, start_date, (
            SELECT MAX(end_time) FROM studies_classes WHERE studies.studies_id=studies_classes.studies_id
        ) as 'end_time'
    FROM studies
    UNION
    SELECT class_id, 'studies_classes', 4, dbo.fn_get_study_class_type(class_id),
    (SELECT member_price FROM studies_price_per_classes WHERE
    studies_classes.studies_id=studies_price_per_classes.studies_id) as 'price',
    studies_classes.title, studies_classes.start_time, studies_classes.end_time
    FROM studies_classes
GO
