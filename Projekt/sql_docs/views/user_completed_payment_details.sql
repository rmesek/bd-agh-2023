CREATE    VIEW user_completed_payment_details AS
SELECT    orders.customer_id,
          completed_payments.payment_id,
          completed_payments.order_id,
          order_details.service_id,
          order_details.service_type_id,
          completed_payments.payment_time
FROM      completed_payments
JOIN      orders ON completed_payments.order_id = orders.order_id
JOIN      order_details ON orders.order_id = order_details.order_id