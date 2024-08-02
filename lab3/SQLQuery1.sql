USE Northwind

-- 1
SELECT OrderID, MAX(UnitPrice) AS MaxPrice
FROM [Order Details]
GROUP BY OrderID
ORDER BY MaxPrice

-- 2
SELECT OrderID, MAX(UnitPrice) AS MaxPrice, MIN(UnitPrice) AS MinPrice
FROM [Order Details]
GROUP BY OrderID


-- 3
SELECT ShipVia, COUNT(OrderID) AS NoOrders
FROM Orders
GROUP BY ShipVia
ORDER BY 2 DESC

-- 4
SELECT TOP 1 ShipVia, COUNT(OrderID) AS NoOrders
FROM Orders
WHERE YEAR(ShippedDate)=1997
GROUP BY ShipVia
ORDER BY NoOrders DESC
