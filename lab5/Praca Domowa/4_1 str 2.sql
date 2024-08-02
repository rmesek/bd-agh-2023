/*
1. Dla każdego produktu podaj maksymalną liczbę zamówionych jednostek.
*/
use northwind
select productid, productname, 
(select max(quantity) from [Order Details] od where od.ProductID=p.ProductID group by ProductID ) 
from products p

/*
2. Podaj wszystkie produkty których cena jest mniejsza niż średnia cena produktu.
*/
use northwind
select productid, productname from products p
where unitprice<(select avg(unitprice) from products)

/*
3. Podaj wszystkie produkty których cena jest mniejsza niż średnia cena produktu danej kategorii.
*/
use northwind
select productid, productname from products p
where unitprice<(select avg(unitprice) from products where CategoryID=p.CategoryID)
