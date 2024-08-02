USE library

-- 1 Tytuły alfabetycznie
SELECT title
FROM title
ORDER BY title

-- 2 
SELECT member_no, isbn, SUM(fine_assessed) AS fine_assessed, SUM(2*fine_assessed) AS double_fine
FROM loanhist
WHERE ISNULL(fine_assessed,0)>0
GROUP BY member_no, isbn

-- 3
SELECT LOWER(firstname + middleinitial + SUBSTRING(lastname, 1, 2)) 
AS email_name
FROM member 
WHERE lastname='Anderson'

-- 4
SELECT 'The title is: ' + title + ', title number ' + TRIM(STR(title_no))
FROM title 