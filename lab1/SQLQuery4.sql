--ten serwer nie rozróżnia dużych i małych liter
SELECT CompanyName
FROM Customers
WHERE CompanyName LIKE '%Restaurant%'

SELECT CompanyName
FROM Customers
WHERE CompanyName LIKE '%Restaurant'

--1
SELECT *
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%'

--2
SELECT Title, LastName
FROM Employees
WHERE LastName LIKE '[B-L]%'

--3
SELECT Title, LastName
FROM Employees
WHERE LastName LIKE '[BL]%'

--4
SELECT CategoryName
FROM Categories
WHERE Description LIKE '%,%'

--5
SELECT CompanyName
FROM Customers
WHERE CompanyName LIKE '%STORE%'