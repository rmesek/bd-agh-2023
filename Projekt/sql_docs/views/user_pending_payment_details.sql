CREATE    VIEW user_pending_payment_details AS
SELECT    orders.customer_id,
          pending_payments.payment_id,
          pending_payments.order_id,
          order_details.service_id,
          order_details.service_type_id,
          pending_payments.payment_due
FROM      pending_payments
JOIN      orders ON pending_payments.order_id = orders.order_id
JOIN      order_details ON orders.order_id = order_details.order_id