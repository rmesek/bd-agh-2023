USE library

-- 1
SELECT member.firstname, member.lastname, juvenile.birth_date, adult.street,  adult.city, adult.state, adult.zip
FROM member 
JOIN juvenile
ON member.member_no=juvenile.member_no
JOIN adult
ON juvenile.adult_member_no=adult.member_no

-- 2
SELECT member.firstname, member.lastname, juvenile.birth_date, member_adult.firstname, member_adult.lastname
FROM member 
JOIN juvenile
ON member.member_no=juvenile.member_no
JOIN adult
ON juvenile.adult_member_no=adult.member_no
JOIN member AS member_adult
ON juvenile.adult_member_no=member_adult.member_no