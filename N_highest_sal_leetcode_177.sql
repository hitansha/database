
/* 

Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+

*/

CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    
    RETURN (
        /* Write your T-SQL query statement below. */
select  salary as SecondHighestSalary from employee e where @N-1 =(select count(distinct salary) from employee n where n.salary>e.salary )

    );
END

-- the above solution doesnt get accepted but gives proper results in db 

-- below is My sql query and is accepted solution

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT; SET M = N - 1;


  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT M, 1


  );
END

