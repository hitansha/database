/*The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.

+----------+
| Employee |
+----------+
| Joe      |
+----------+
*/


--solution 1 correlated query


select e1.name as Employee  from employee e1 where e1.ManagerId  in (select e2.id  from employee e2  where e1.salary>e2.salary)

--cross join solution 2  

/* Write your T-SQL query statement below */

select e1.name as Employee   from employee e1,employee e2 where e1.id <>e2.id and e1.ManagerId  =e2.id and e1.salary>e2.salary

--solution 3 left join 
select e1.Name as Employee  from employee e1 left join employee e2 on e1.id<>e2.id and e1.ManagerId  =e2.id where e1.salary>e2.salary