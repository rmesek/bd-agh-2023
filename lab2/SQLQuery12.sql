-- 1
SELECT COUNT (*)
FROM Products
WHERE UnitPrice NOT BETWEEN 10 AND 20

-- 2
SELECT MAX(UnitPrice)
FROM Products
WHERE UnitPrice < 20

-- 3
SELECT MAX(UnitPrice) AS 'Max Price', MIN(UnitPrice) AS 'Min Price'
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%'


-- 4.1
SELECT AVG(UnitPrice)
FROM Products

-- 4.2
SELECT *
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)

-- 5
SELECT SUM(UnitPrice*Quantity*(1-Discount))
FROM [Order Details]
WHERE OrderID=10250