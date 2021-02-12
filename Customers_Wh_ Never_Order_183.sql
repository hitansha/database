-- customer who never orders 
/*

Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

Table: Customers.

+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Table: Orders.

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Using the above tables as example, return the following:

+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+

*/

-- sol1 

select Name as Customers from Customers c left join Orders o on c.id=o.CustomerId where o.CustomerId is null 

-- sol 2  -- slow --subquery not efficient , will work for smaller datasets

select Name as Customers from Customers where c.Id not in (select CustomerId from orders o )

--sol 3 faster than above 


select Name as Customers from Customers c left join Orders o on c.id=o.CustomerId 
where o.id is null 



--