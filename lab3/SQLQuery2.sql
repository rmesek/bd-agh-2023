USE Northwind

-- 1
SELECT OrderID, COUNT(ProductID) AS NoProducts
FROM [Order Details]
GROUP BY OrderID
HAVING COUNT(ProductID)>5

-- 1 check
SELECT *
FROM [Order Details]
WHERE OrderID=11077

-- 2
SELECT CustomerID, Count(OrderID) AS NoOrders, SUM(Freight) AS NoFreight
FROM Orders
WHERE YEAR(ShippedDate)=1998
GROUP BY CustomerID
HAVING Count(OrderID)>8
ORDER BY SUM(Freight) DESC