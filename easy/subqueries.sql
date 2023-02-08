'''Salaries Differences

https://platform.stratascratch.com/coding/10308-salaries-differences?code_type=1

Write a query that calculates the difference between the highest salaries found in
the marketing and engineering departments. Output just the absolute difference in salaries.

Tables: db_employee, db_dept

db_employee

id:            int
first_name:    varchar
last_name:     varchar
salary:        int
department_id: int

db_dept

id:         int
department: varchar
'''

select max(salary) - min(salary)
  from (
       select max(salary) as salary,
              e.department_id as dept
         from db_employee as e
        where e.department_id in (
              select id
                from db_dept
               where department in ('marketing', 'engineering'))
 group by e.department_id) as salaries

--solution of another user
select abs(max(salary) filter (where department = 'marketing') - max(salary) filter (where department = 'engineering'))
  from db_employee emp
  left join db_dept dept
       on emp.department_id = dept.id

-- --------------------------------------------------------------------------------------------------------------------