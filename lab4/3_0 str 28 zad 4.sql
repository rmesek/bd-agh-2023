USE library

SELECT A.firstname, A.lastname, COUNT(*)
FROM adult AS A JOIN juvenile AS J ON A.member_no=J.adult_member_no
JOIN member AS M ON A.member_no=M.member_no
WHERE A.state = 'AZ'
GROUP BY A.member_no, A.state, M.firstname, M.lastname
HAVING COUNT(*) > 2