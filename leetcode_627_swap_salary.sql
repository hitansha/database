/**
627. Swap Salary

Salary table:
+----+------+-----+--------+
| id | name | sex | salary |
+----+------+-----+--------+
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |
+----+------+-----+--------+

Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temp table(s).
**/
update salary set sex= case when sex='m' then 'f' when sex='f' then 'm' end where sex in ('m','f') --faster
update salary set sex= case when sex='m' then 'f' else 'm' end where sex in ('m','f') --slower
