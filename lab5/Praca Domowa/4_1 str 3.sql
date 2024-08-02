/*
1. Dla każdego produktu podaj jego nazwę, cenę, średnią cenę 
wszystkich produktów oraz różnicę między ceną produktu a średnią 
ceną wszystkich produktów.
*/
use northwind
select productid, productname, unitprice, 
(select avg(unitprice) from products) as 'AVG', 
unitprice -(select avg(unitprice) from products) as diff
from products p

/*
2. Dla każdego produktu podaj jego nazwę kategorii, nazwę produktu, cenę, 
średnią cenę wszystkich produktów danej kategorii oraz różnicę między ceną produktu 
a średnią ceną wszystkich produktów danej kategorii.
*/
use northwind
select productid, productname, 
(select c.categoryname from Categories c where c.CategoryID=p.CategoryID) as 'Category name',
unitprice, 
(select avg(unitprice) from products where categoryid=p.CategoryID) as 'AVG', 
unitprice -(select avg(unitprice) from products where categoryid=p.CategoryID) as diff
from products p
