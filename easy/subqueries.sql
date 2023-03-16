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

'''Average Salaries

https://platform.stratascratch.com/coding/9917-average-salaries?code_type=1

Compare each employee"s salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.

employee

id:             int
first_name:     varchar
last_name:      varchar
age:            int
sex:            varchar
employee_title: varchar
department:     varchar
salary:         int
target:         int
bonus:          int
email:          varchar
city:           varchar
address:        varchar
manager_id:     int
'''

-- TODO сделать с помощью over()

 select employee.department,
       first_name,
       salary,
       dept.avg_
 from employee
 inner join (
       select avg(salary) as avg_,
              department
         from employee
       group by department) as dept
 on dept.department = employee.department
 order by employee.department

-- --------------------------------------------------------------------------------------------------------------------