USE library

-- 1 Tytuł i numer
SELECT title, author
FROM title

-- 2 Tytuł numer 10
SELECT title, author
FROM title
WHERE title_no=10

-- 3 Numer czytelnika i jego obecna kara jeśli pomiędzy 8 i 9
SELECT member_no, ISNULL(fine_assessed,0)-ISNULL(fine_paid,0)-ISNULL(fine_waived,0) AS current_fine
FROM loanhist
WHERE ISNULL(fine_assessed,0)-ISNULL(fine_paid,0)-ISNULL(fine_waived,0) BETWEEN 8 AND 9

-- 4 Numery książek Charles Dickens lub Jane Austen
SELECT title_no, author
FROM title
WHERE author IN ('Charles Dickens', 'Jane Austen')

-- 5 Numer tytułu i tytuł dla zawierających „adventures”
SELECT title_no, title
FROM title
WHERE title LIKE '%adventures%'

-- 6 Numer czytelnika, karę oraz zapłaconą karę, którzy jeszcze nie zapłacili
SELECT member_no, SUM(ISNULL(fine_assessed,0)) AS fine_assessed, SUM(ISNULL(fine_paid,0)) AS fine_paid
FROM loanhist
WHERE ISNULL(fine_paid,0)=0 AND ISNULL(fine_assessed,0)>0
GROUP BY member_no

-- 7 Unikalne pary miast i stanów
SELECT DISTINCT city, state
FROM adult
