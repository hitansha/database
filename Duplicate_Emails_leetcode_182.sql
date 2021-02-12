--Duplicate Emails
/*
Write a SQL query to find all duplicate emails in a table named Person.

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
For example, your query should return the following for the above table:

+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Note: All emails are in lowercase.
*/

--sol 1 
select a.email from (select Email, count(*) as cnt from Person p group by Email having count(*) >1) a


-- sol 2 faster 
select distinct e1.email from Person e1 join Person e2 on e1.email=e2.email and e1.id<>e2.id 