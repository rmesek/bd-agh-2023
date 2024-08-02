USE Northwind

SELECT Products.ProductName, Suppliers.CompanyName, Suppliers.Phone
FROM Products INNER JOIN Suppliers
ON Suppliers.SupplierID=Products.SupplierID
WHERE Products.UnitsInStock=0