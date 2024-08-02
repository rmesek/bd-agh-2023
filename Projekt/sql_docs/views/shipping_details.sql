CREATE VIEW [dbo].[shipping_details]
AS
SELECT dbo.customers.customer_id, dbo.adress_details.user_id, dbo.users.first_name, dbo.users.last_name, dbo.adress_details.street, dbo.adress_details.number, dbo.adress_details.zip, dbo.adress_details.city, dbo.adress_details.country, 
                  dbo.studies.name, dbo.studies.studies_id as ID, dbo.fn_is_passed(dbo.studies.studies_id, 3, dbo.customers.customer_id) AS 'is_passed'
FROM     dbo.adress_details INNER JOIN
                  dbo.users ON dbo.adress_details.user_id = dbo.users.user_id INNER JOIN
                  dbo.customers ON dbo.users.user_id = dbo.customers.user_id INNER JOIN
                  dbo.orders ON dbo.customers.customer_id = dbo.orders.customer_id INNER JOIN
                  dbo.order_details ON dbo.orders.order_id = dbo.order_details.order_id INNER JOIN
                  dbo.studies_classes ON dbo.order_details.service_id = dbo.studies_classes.class_id INNER JOIN
                  dbo.studies ON dbo.studies_classes.studies_id = dbo.studies.studies_id
UNION
SELECT dbo.customers.customer_id, dbo.adress_details.user_id, dbo.users.first_name, dbo.users.last_name, dbo.adress_details.street, dbo.adress_details.number, dbo.adress_details.zip, dbo.adress_details.city, dbo.adress_details.country, 
                  dbo.courses.title, dbo.courses.course_id, dbo.fn_is_passed(dbo.courses.course_id, 2, dbo.customers.customer_id) AS 'is_passed'
FROM     dbo.adress_details INNER JOIN
                  dbo.users ON dbo.adress_details.user_id = dbo.users.user_id INNER JOIN
                  dbo.customers ON dbo.users.user_id = dbo.customers.user_id INNER JOIN
                  dbo.orders ON dbo.customers.customer_id = dbo.orders.customer_id INNER JOIN
                  dbo.order_details ON dbo.orders.order_id = dbo.order_details.order_id INNER JOIN
                  dbo.courses ON dbo.order_details.service_id = dbo.courses.course_id
UNION
SELECT dbo.customers.customer_id, dbo.adress_details.user_id, dbo.users.first_name, dbo.users.last_name, dbo.adress_details.street, dbo.adress_details.number, dbo.adress_details.zip, dbo.adress_details.city, dbo.adress_details.country, 
                  dbo.webinars.title, dbo.webinars.webinar_id, dbo.fn_is_passed(dbo.webinars.webinar_id, 1, dbo.customers.customer_id) AS 'is_passed'
FROM     dbo.adress_details INNER JOIN
                  dbo.users ON dbo.adress_details.user_id = dbo.users.user_id INNER JOIN
                  dbo.customers ON dbo.users.user_id = dbo.customers.user_id INNER JOIN
                  dbo.orders ON dbo.customers.customer_id = dbo.orders.customer_id INNER JOIN
                  dbo.order_details ON dbo.orders.order_id = dbo.order_details.order_id INNER JOIN
                  dbo.webinars ON dbo.order_details.service_id = dbo.webinars.webinar_id

GO

