/*
Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
id is the primary key for this table.
 

Write an SQL query to find all numbers that appear at least three times consecutively.

Return the result table in any order.

The query result format is in the following example:

 

Logs table:
+----+-----+
| Id | Num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+

Result table:
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
1 is the only number that appears consecutively for at least three times.
*/


--solution 1

select DISTINCT l1.Num AS ConsecutiveNums  from logs l1
where l1.num = (select  l2.num from logs l2  where l2.id>l1.id order by l2.id offset 1 rows FETCH first 1 ROW ONLY  )
and  l1.num = (select  l3.num from logs l3 where l3.id>l1.id order by l3.id offset 2 rows FETCH first 1 ROW ONLY  )

--solution 2 faster 

select DISTINCT l1.Num AS ConsecutiveNums  from logs l1,logs l2,logs l3

where l1.Id = l2.Id-1
and l2.Id = l3.Id-1
and l1.Num=l2.Num
and l2.Num=l3.Num

-- solution 3 
-- using lead and lag

select distinct num as ConsecutiveNums from 
(select num , lead(num,1) over (order by id) as next_value,
    lead(num,2) over (order by id) as next_to_next_value from logs) a where a.num =a.next_value and a.num=a.next_to_next_value
