CREATE VIEW basket_products AS
SELECT    o.order_id,
          e.service_type,
          e.title,
          e.[online/stationary],
          e.start_time,
          e.end_time,
          pp.payment_id,
          pp.payment_amount,
          pp.payment_due,
          pp.payment_link
FROM      order_details od
JOIN      orders o ON o.order_id = od.order_id
JOIN      pending_payments pp ON pp.order_id = o.order_id
JOIN      service_types st ON st.service_type_id = od.service_type_id
JOIN      dbo.events e ON e.service_id = od.service_id
          AND e.service_type = st.service_type_name