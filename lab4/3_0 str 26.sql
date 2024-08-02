USE Northwind

-- 1
SELECT (A.FirstName + ' ' + A.LastName) AS Szef, (B.FirstName + ' ' + B.LastName) AS Podwładny
FROM Employees AS A
JOIN Employees AS B
ON A.EmployeeID=B.ReportsTo

-- 2
SELECT A.EmployeeID, (A.FirstName + ' ' + A.LastName) AS Pracownik, (B.FirstName + ' ' + B.LastName) AS Podwładny
FROM Employees AS A
LEFT OUTER JOIN Employees AS B
ON B.ReportsTo=A.EmployeeID
WHERE B.ReportsTo IS NULL


USE library

-- 3
SELECT DISTINCT Parent.member_no AS Parent_member_no, Parent.firstname, Parent.lastname, adult.street, adult.city, adult.state, adult.zip
FROM member AS Parent
JOIN adult
ON Parent.member_no=adult.member_no
JOIN juvenile AS Kid
ON Kid.adult_member_no=Parent.member_no
WHERE Kid.birth_date < '1996/01/01'

-- 4
SELECT DISTINCT A.member_no AS Parent_member_no, A.firstname, A.lastname, adult.street, adult.city, adult.state, adult.zip
FROM member AS A
JOIN adult
ON A.member_no=adult.member_no
JOIN juvenile AS J
ON J.adult_member_no=A.member_no
LEFT OUTER JOIN loan
ON loan.member_no=A.member_no
WHERE J.birth_date < '1996/01/01' AND loan.member_no IS NULL