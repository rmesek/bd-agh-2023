USE Northwind
-- WITH ROLLUP
SELECT productid, orderid, SUM(quantity) AS total_quantity 
FROM orderhist
GROUP BY productid, orderid
WITH ROLLUP
ORDER BY productid, orderid

-- WITHOUT ROLLUP
SELECT NULL AS productid, NULL AS orderid, SUM(quantity) AS total_quantity 
FROM orderhist
UNION ALL
SELECT productid, NULL AS orderid, SUM(quantity) AS total_quantity 
FROM orderhist
GROUP BY productid
HAVING productid=1
UNION ALL
SELECT productid, orderid, SUM(quantity) AS total_quantity 
FROM orderhist
GROUP BY productid, orderid
HAVING productid=1

UNION ALL
SELECT productid, NULL AS orderid, SUM(quantity) AS total_quantity 
FROM orderhist
GROUP BY productid
HAVING productid=2
UNION ALL
SELECT productid, orderid, SUM(quantity) AS total_quantity 
FROM orderhist
GROUP BY productid, orderid
HAVING productid=2

UNION ALL
SELECT productid, NULL AS orderid, SUM(quantity) AS total_quantity 
FROM orderhist
GROUP BY productid
HAVING productid=3
UNION ALL
SELECT productid, orderid, SUM(quantity) AS total_quantity 
FROM orderhist
GROUP BY productid, orderid
HAVING productid=3