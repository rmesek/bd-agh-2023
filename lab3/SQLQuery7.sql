USE Northwind

-- 1
SELECT Products.ProductName, Products.UnitPrice, Suppliers.Address
FROM Products INNER JOIN Suppliers
ON Products.SupplierID=Suppliers.SupplierID
WHERE Products.UnitPrice BETWEEN 20 AND 30

-- 2
SELECT Products.ProductName, Products.UnitsInStock
FROM Suppliers INNER JOIN Products
ON Suppliers.SupplierID=Products.SupplierID
WHERE Suppliers.CompanyName='Tokyo Traders'

-- 3
SELECT Customers.CustomerID, Customers.Address
FROM Customers LEFT OUTER JOIN Orders 
ON Orders.CustomerID=Customers.CustomerID AND YEAR(Orders.OrderDate)=1997 
WHERE Orders.OrderID IS NULL

SELECT *
FROM Orders
WHERE CustomerID='CENTC'