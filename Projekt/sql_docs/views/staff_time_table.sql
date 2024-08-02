CREATE VIEW [dbo].[staff_time_table] AS
    SELECT webinars.webinar_id, webinar_type, 'webinar' as 'type', title,
           teacher_id, translator_id, start_time, end_time
    FROM webinars
    INNER JOIN webinar_types ON webinars.webinar_type_id = webinar_types.webinar_type_id
    LEFT JOIN webinars_transaltions ON webinars.webinar_id = webinars_transaltions.webinar_id
    UNION
    SELECT course_modules.module_id, module_type_name, 'courses' as 'type', module_title,
           teacher_id, translator_id, start_time, end_time
    FROM course_modules
    INNER JOIN course_module_types ON
        course_module_types.module_type_id = course_modules.module_type_id
    LEFT JOIN course_translations ON
        course_modules.module_id = course_translations.module_id
    UNION
    SELECT studies_classes.class_id, dbo.fn_get_study_class_type(studies_classes.class_id),
           'studies_classes' as 'type', title, teacher_id, translator_id, start_time, end_time
    FROM studies_classes
    LEFT JOIN studies_class_translators ON
        studies_classes.class_id = studies_class_translators.class_id
GO

