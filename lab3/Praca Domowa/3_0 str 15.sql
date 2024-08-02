USE library

-- 1
SELECT member.firstname, member.lastname, juvenile.birth_date
FROM member JOIN juvenile
ON member.member_no=juvenile.member_no

-- 2
SELECT title.title
FROM loan JOIN title
ON loan.title_no=title.title_no
GROUP BY title.title

-- 3
SELECT loanhist.in_date,loanhist.due_date, DATEDIFF(DAY, loanhist.due_date, loanhist.in_date) AS days_passed, ISNULL(loanhist.fine_paid, 0) AS fine_paid, loanhist.fine_assessed
FROM loanhist JOIN title
ON loanhist.title_no=title.title_no 
WHERE loanhist.in_date > loanhist.due_date AND title.title='Tao Teh King'
ORDER BY loanhist.fine_paid DESC

-- 4
SELECT reservation.isbn
FROM member JOIN reservation
ON member.member_no=reservation.member_no AND member.firstname='Stephen' AND member.middleinitial='A' AND member.lastname='Graff'