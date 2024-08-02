/*
1. Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień obsłużonych 
przez tego pracownika (przy obliczaniu wartości zamówień uwzględnij cenę za przesyłkę.
*/
use northwind
select firstname, lastname, (select sum(quantity*unitprice*(1-discount)) from [Order Details] od 
	inner join orders o on o.orderid=od.orderid and o.EmployeeID=e.employeeid) +
	(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID) from Employees e

/*
2. Który z pracowników obsłużył najaktywniejszy (obsłużył zamówienia o największej wartości) w 1997r, 
podaj imię i nazwisko takiego pracownika.
*/
use northwind
select top 1 firstname, lastname from employees e
order by (select sum(quantity*unitprice*(1-discount)) from [Order Details] od 
	inner join orders o on o.orderid=od.orderid and year(o.ShippedDate)=1997 and o.EmployeeID=e.employeeid) +
	(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID) desc

/*
3a. Ogranicz wynik z pkt 1 tylko do pracowników którzy mają podwładnych.
*/
use northwind
select firstname, lastname, (select sum(quantity*unitprice*(1-discount)) from [Order Details] od 
	inner join orders o on o.orderid=od.orderid and o.EmployeeID=e.employeeid) +
	(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID) from Employees e
	where exists (select * from employees ee where ee.ReportsTo=e.EmployeeID)

/*
3b. Ogranicz wynik z pkt 1 tylko do pracowników którzy nie mają podwładnych.
*/
use northwind
select firstname, lastname, (select sum(quantity*unitprice*(1-discount)) from [Order Details] od 
	inner join orders o on o.orderid=od.orderid and o.EmployeeID=e.employeeid) +
	(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID) from Employees e
	where not exists (select * from employees ee where ee.ReportsTo=e.EmployeeID)

/*
4a. Zmodyfikuj rozwiązania z pkt 3 tak aby dla pracowników pokazać jeszcze 
datę ostatnio obsłużonego zamówienia.
*/
use northwind
select firstname, lastname, (select sum(quantity*unitprice*(1-discount)) from [Order Details] od 
	inner join orders o on o.orderid=od.orderid and o.EmployeeID=e.employeeid) +
	(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID),
	(select top 1 shippeddate from orders o where o.EmployeeID=e.EmployeeID order by ShippedDate desc) 
	from Employees e
	where exists (select * from employees ee where ee.ReportsTo=e.EmployeeID)

/*
4b. Zmodyfikuj rozwiązania z pkt 3 tak aby dla pracowników pokazać jeszcze 
datę ostatnio obsłużonego zamówienia.
*/
use northwind
select firstname, lastname, (select sum(quantity*unitprice*(1-discount)) from [Order Details] od 
	inner join orders o on o.orderid=od.orderid and o.EmployeeID=e.employeeid) +
	(select sum(freight) from orders o where o.EmployeeID=e.EmployeeID),
	(select top 1 shippeddate from orders o where o.EmployeeID=e.EmployeeID order by ShippedDate desc) 
	from Employees e
	where not exists (select * from employees ee where ee.ReportsTo=e.EmployeeID)
