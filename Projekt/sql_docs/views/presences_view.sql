CREATE VIEW presences_view AS

SELECT
ofu.service_id AS 'event_id', 
ofu.service_type_id AS 'event_type_id',
'webinar' AS 'event_name', 
w.title AS 'title',
1 AS 'is_online',
w.start_time AS 'start_time',
w.end_time AS 'end_time',
ofu.customer_id AS 'customer_id',
u.first_name AS 'first_name',
u.last_name AS 'last_name',
1 AS 'was_present'
FROM webinars w
JOIN dbo.orders_for_user ofu ON w.webinar_id = ofu.service_id AND ofu.service_type_id=1
JOIN customers cus ON cus.customer_id=ofu.customer_id
JOIN users u ON u.user_id=cus.user_id

UNION

SELECT 
ofu.service_id AS 'event_id', 
ofu.service_type_id AS 'event_type_id',
'course' AS 'event_name', 
(c.title + ': ' + cm.module_title) AS 'title',
IIF(cm.module_type_id=2, 1, 0) AS 'is_online',
cm.start_time AS 'start_time',
cm.end_time AS 'end_time',
ofu.customer_id AS 'customer_id',
u.first_name AS 'first_name',
u.last_name AS 'last_name',
IIF(EXISTS (SELECT * FROM course_presences WHERE customer_id=ofu.customer_id), 1, 0) AS 'was_present'
FROM course_modules cm
JOIN courses c ON c.course_id=cm.course_id
JOIN dbo.orders_for_user ofu ON c.course_id = ofu.service_id AND ofu.service_type_id=2
JOIN customers cus ON cus.customer_id=ofu.customer_id
JOIN users u ON u.user_id=cus.user_id

UNION

SELECT 
ofu.service_id AS 'event_id', 
ofu.service_type_id AS 'event_type_id',
'studies_class' AS 'event_name', 
(s.name + ': ' + sc.title) AS 'title',
IIF(EXISTS (SELECT * FROM studies_online_classes soc WHERE soc.class_id=sc.class_id), 1, 0) AS 'is_online',
sc.start_time AS 'start_time',
sc.end_time AS 'end_time',
ofu.customer_id AS 'customer_id',
u.first_name AS 'first_name',
u.last_name AS 'last_name',
IIF(EXISTS (SELECT * FROM studies_presences WHERE customer_id=ofu.customer_id), 1, 0) AS 'was_present'
FROM studies_classes sc
JOIN studies s ON s.studies_id=sc.studies_id
JOIN dbo.orders_for_user ofu ON s.studies_id = ofu.service_id AND ofu.service_type_id=3
JOIN customers cus ON cus.customer_id=ofu.customer_id
JOIN users u ON u.user_id=cus.user_id

UNION

SELECT 
ofu.service_id AS 'event_id', 
ofu.service_type_id AS 'event_type_id',
'practice' AS 'event_name', 
('Practice at: ' + spm.company_name) AS 'title',
0 AS 'is_online',
CAST(spm.start_date AS DATETIME) AS 'start_time',
CAST(spm.end_date AS DATETIME) AS 'end_time',
ofu.customer_id AS 'customer_id',
u.first_name AS 'first_name',
u.last_name AS 'last_name',
IIF(EXISTS (SELECT * FROM studies_passes WHERE customer_id=ofu.customer_id), 1, 0) AS 'was_present'
FROM studies_practice_modules spm
JOIN studies s ON spm.studies_id=s.studies_id
JOIN dbo.orders_for_user ofu ON s.studies_id = ofu.service_id AND ofu.service_type_id=3
JOIN customers cus ON cus.customer_id=ofu.customer_id
JOIN users u ON u.user_id=cus.user_id

GO