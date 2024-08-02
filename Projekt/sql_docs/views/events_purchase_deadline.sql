CREATE    VIEW events_purchase_deadline AS
SELECT    webinar_id AS 'service_id',
          1 AS 'service_type_id',
          start_time AS 'purchase_deadline',
		  NULL AS 'limit'
FROM      webinars
UNION    
SELECT    course_id,
          2,
          DATEADD(DAY, -3, (
          SELECT    MIN(start_time)
          FROM      course_modules
          WHERE     courses.course_id = course_modules.course_id
          )) AS 'purchase_deadline',
		  (SELECT MIN(cd.limit) 
          FROM course_modules cm JOIN course_classroom_modules ccm
		  ON cm.module_id=ccm.module_id JOIN classroom_details cd
		  ON cd.classroom_id=ccm.classroom_id
          WHERE cm.course_id=courses.course_id)
          AS 'limit'
FROM      courses
UNION    
SELECT    studies_id,
          3,
          DATEADD(DAY, -3, (
          SELECT    MIN(start_time)
          FROM      studies_classes
          WHERE     studies.studies_id = studies_classes.studies_id
          )) AS 'purchase_deadline',
		  studies.student_limit AS 'limit'
FROM      studies
UNION    
SELECT    class_id,
          4,
          DATEADD(DAY, -3, studies_classes.start_time) AS 'purchase_deadline',
		  (SELECT MIN(cd.limit) 
          FROM studies_classes sc JOIN studies_classroom_classes scc
		  ON sc.class_id=scc.class_id JOIN classroom_details cd
		  ON cd.classroom_id=scc.classroom_id)
		  AS 'limit'
FROM      studies_classes 
GO