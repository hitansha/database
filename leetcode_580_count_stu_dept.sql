
select dept_name, isnull(a.student_number,0) as student_number
from 
department d
left join 
    (select count(*) as student_number, dept_id 
    from student
    group by dept_id ) as a
on d.dept_id = a.dept_id
order by student_number desc, dept_name asc

