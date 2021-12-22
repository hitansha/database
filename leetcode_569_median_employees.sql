
/* Write your T-SQL query statement below */


select id, company , salary
from 
    (select * ,count(1) over (partition by company ) as total,
     row_number() over (partition by company order by salary asc) as sal_ord 
    from employee) a
where sal_ord in ( (total + 1 )/2 ,(total+2)/2 )