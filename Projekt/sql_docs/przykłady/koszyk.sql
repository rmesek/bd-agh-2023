/* Wyczyść zamówienia powyżej 30 */
DELETE    FROM pending_payments
WHERE     order_id > 30;

DELETE    FROM completed_payments
WHERE     order_id > 30;

DELETE    FROM order_details
WHERE     order_id > 30;

DELETE    FROM orders
WHERE     order_id > 30;

GO
/* Koszyk zwraca listę produktów */ 
DECLARE @services_table SERVICES_TABLE_TYPE
INSERT INTO @services_table (service_id, service_type_id) VALUES
    (1, 1),
    (2, 1)
-- SELECT dbo.fn_sum_services_table(@services_table)  -- 35.00

/* Ustalamy raty */
DECLARE @instalments_table INSTALMENTS_TABLE_TYPE
INSERT    INTO @instalments_table (instalment, payment_due, payment_link)
VALUES    (10.00, '2045-01-04 12:00:00', 'link1'),
          (25.00, '2049-01-04 12:00:00', 'link2')

/* Dodajemy oczekującą płatność */
EXEC usp_orders_insert 
    @customer_id = 30,
    @discount = 0.1,
    @services_table = @services_table,
    @instalments_table = @instalments_table;

GO
/* Pokaż koszyk */
SELECT * FROM dbo.basket_products
WHERE order_id=31
ORDER BY payment_id

GO
/* Po otrzymaniu potwierdzenia dodajemy do zakończonych płatności */
EXEC usp_complete_payment 
    @payment_id = 31,
    @payment_time = '2040-01-04 13:55:55'

GO
/* Sprawdzamy rezulatat */
SELECT    *
FROM      orders
WHERE     order_id > 30;

SELECT    *
FROM      order_details
WHERE     order_id > 30;

SELECT    *
FROM      pending_payments
WHERE     order_id > 30;

SELECT    *
FROM      completed_payments
WHERE     order_id > 30;

GO