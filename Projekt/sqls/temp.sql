DROP
PROCEDURE usp_orders_insert;

DROP
FUNCTION  fn_sum_services_table;

DROP
TYPE      SERVICES_TABLE_TYPE;

/* Wyczyść płatności */
DELETE    FROM pending_payments
WHERE     order_id > 30;

DELETE    FROM completed_payments
WHERE     order_id > 30;

DELETE    FROM order_details
WHERE     order_id > 30;

DELETE    FROM orders
WHERE     order_id > 30;
/* Koniec czyszczenia płatności */

SELECT    *
FROM      orders;

SELECT    *
FROM      order_details;

SELECT    *
FROM      pending_payments;

DECLARE @services_table SERVICES_TABLE_TYPE
INSERT    INTO @services_table (service_id, service_type_id)
VALUES    (1, 1),
          (2, 1) EXEC usp_orders_insert @customer_id = 30,
          @discount = 0.1,
          @payment_due = '2050-01-04 12:00:00',
          @payment_link = 'http://new_link.com',
          @services_table = @services_table;

-- payment_amount should be 31.95
/*##################################################################################*/
DROP
PROCEDURE usp_complete_payment;

SELECT    *
FROM      pending_payments;

SELECT    *
FROM      completed_payments;

/*##################################################################################*/

SELECT dbo.fn_check_pending_payment()

/*##################################################################################*/

DECLARE @table INSTALMENTS_TABLE_TYPE
INSERT    INTO @table (instalment, payment_due, payment_link)
VALUES    (100.00, '2045-01-04 12:00:00', 'link1'),
          (150.00, '2049-01-04 12:00:00', 'link2')