-- Subquery

use  batch924;

create table emp
( emp_id int primary key, 
emp_name varchar(50),
 dept_name varchar(50),
 salary float);
 
 
create table dept
( dept_id int , 
  dept_name varchar(30),
  location varchar(30) );
  
  
  
  -- Que: Find the employee who's salary is more than the average salary earned by
  -- all employee.
  
  -- scalar subquery
  select *
  from emp
  where salary > (select avg(salary)
					from emp);
                    
    
    
-- Multiple row subquery

-- example for multiple column and multiple row subquery

-- find the employee who earn the highest salary in each department

select *
from emp
where (dept_name,salary ) in
                            (select dept_name,max(salary)
							 from emp
							 group by dept_name);
  
  
  -- Single column and multiple rows subquery
  
  -- find department who do not have any employees.
 select * 
 from dept
 where dept_name not in( select distinct dept_name
						 from emp);
  

  select * from dept;
  
  
  -- Correlated subquery
  
  -- find the employees in each department
  -- who earn more than the average salary in that department
  
  select *
  from emp e1
  where salary >(select avg(salary)
				 from emp e2
                 where e2.dept_name=e1.dept_name);
  
  
  -- Find department who do not have any employee
  
SELECT *
FROM dept d
WHERE NOT EXISTS (
    SELECT 1
    FROM emp e 
    WHERE e.dept_name = d.dept_name
);
  
  
  
  
  
  
  
  