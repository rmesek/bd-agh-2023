USE Northwind
--1
SELECT CompanyName, Address
FROM Customers
WHERE City = 'LONDON'

--2
SELECT CompanyName, Address
FROM Customers
WHERE Country = 'FRANCE' OR Country = 'SPAIN'

--3
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 20.00 AND 30.00

--4.1
SELECT * FROM Categories
--4.2
SELECT ProductName, UnitPrice
FROM Products
WHERE CategoryID = 6

--5.1
SELECT SupplierID
FROM Suppliers
WHERE CompanyName = 'Tokyo Traders'
--5.2
SELECT ProductName, UnitsInStock
FROM Products
WHERE SupplierID = 4

--6
SELECT ProductName
FROM Products
WHERE UnitsInStock = 0