/*
1. Wybierz nazwy i numery telefonów klientów , którym w 1997 roku przesyłki dostarczała firma United Package.
*/
use northwind
select companyname, phone from customers
where exists (select * from orders where orders.CustomerID=customers.CustomerID and year(orders.ShippedDate)=1997
and orders.ShipVia=(select shipperid from shippers where CompanyName='United Package'))

/*
2. Wybierz nazwy i numery telefonów klientów, którzy kupowali produkty z kategorii Confections.
*/
use northwind
select companyname, phone from customers c
where exists 
(select * from orders o where o.CustomerID=c.CustomerID and exists
	(select * from [Order Details] od where od.OrderID=o.OrderID and exists
		(select * from products p where p.ProductID=od.ProductID and exists
			(select * from categories cc where cc.CategoryID=p.CategoryID and categoryname='Confections'))))

/*
3. Wybierz nazwy i numery telefonów klientów, którzy nie kupowali produktów z kategorii Confections.
*/
use northwind
select companyname, phone from customers c
where not exists 
(select * from orders o where o.CustomerID=c.CustomerID and exists
	(select * from [Order Details] od where od.OrderID=o.OrderID and exists
		(select * from products p where p.ProductID=od.ProductID and exists
			(select * from categories cc where cc.CategoryID=p.CategoryID and categoryname='Confections'))))
