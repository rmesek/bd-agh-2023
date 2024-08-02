/*
1. Podaj łączną wartość zamówienia o numerze 1025 (uwzględnij cenę za przesyłkę).
*/
use northwind
select orderid, sum(unitprice*quantity*(1-discount)) + 
(select freight from orders o where o.OrderID=od.OrderID)  
from [Order Details] od group by orderid having orderid=1025

/*
2. Podaj łączną wartość zamówień każdego zamówienia (uwzględnij cenę za przesyłkę).
*/
use northwind
select orderid, sum(unitprice*quantity*(1-discount)) + 
(select freight from orders o where o.OrderID=od.OrderID)  
from [Order Details] od group by orderid

/*
3. Czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku, 
jeśli tak to pokaż ich dane adresowe.
*/
use northwind
select address from customers c
where not exists(select * from orders o where o.CustomerID=c.CustomerID and year(o.orderdate)=1997)

/*
4. Podaj produkty kupowane przez więcej niż jednego klienta.
*/
use northwind
select p.productid, p.productname from products p
where (select count(distinct customerid) from orders o
		inner join [Order Details] od on od.ProductID=p.ProductID and o.OrderID=od.OrderID
		group by productid)>1
