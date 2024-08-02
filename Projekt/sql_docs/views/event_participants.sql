CREATE VIEW [dbo].[event_participants] -- BT
AS
    SELECT c.customer_id, e.service_id, e.service_type, e.[online/stationary], e.price,
           e.title, e.start_time, e.end_time, 
           dbo.fn_has_access(c.customer_id, e.service_id, st.service_type_id) as 'has_access'
    FROM customers c
    INNER JOIN orders ON c.customer_id = orders.customer_id
    INNER JOIN order_details ON orders.order_id = order_details.order_id
    INNER JOIN dbo.service_types st on order_details.service_type_id = st.service_type_id
    INNER JOIN dbo.events e ON order_details.service_id = e.service_id AND
         st.service_type_name = e.service_type
GO

