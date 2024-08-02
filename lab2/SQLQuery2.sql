SELECT OrderID, OrderDate, CustomerID
FROM Orders
WHERE ( ShippedDate IS NULL OR ShippedDate > GETDATE() )
	AND ShipCountry = 'Argentina'