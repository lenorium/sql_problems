'''Popularity of Hack

https://platform.stratascratch.com/coding/10061-popularity-of-hack?code_type=1

Meta/Facebook has developed a new programing language called Hack.
To measure the popularity of Hack they ran a survey with their employees.
The survey included data on previous programing familiarity as well as the number of years of experience,
age, gender and most importantly satisfaction with Hack. Due to an error location data was not collected,
but your supervisor demands a report showing average popularity of Hack by office location.
Luckily the user IDs of employees completing the surveys were stored.
Based on the above, find the average popularity of the Hack per office location.
Output the location along with the average popularity.

Tables: facebook_employees, facebook_hack_survey

facebook_employees

id:        int
location:  varchar
age:       int
gender:    varchar
is_senior: bool

facebook_hack_survey

employee_id: int
age:         int
gender:      varchar
popularity:  int'''

select e.location,
       avg(s.popularity)
  from facebook_hack_survey as s
 inner join facebook_employees as e
    on s.employee_id = e.id
 group by location;

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

'''Finding Updated Records

https://platform.stratascratch.com/coding/10299-finding-updated-records?code_type=1

We have a table with employees and their salaries, however, some of the records are old and contain
outdated salary information. Find the current salary of each employee assuming that salaries increase each year.
Output their id, first name, last name, department ID, and current salary.
Order your list by employee ID in ascending order.

ms_employee_salary

id:            int
first_name:    varchar
last_name:     varchar
salary:        int
department_id: int
'''

select id,
       first_name,
       last_name,
       department_id,
       max(salary) as salary
  from ms_employee_salary
 group by last_name, first_name, department_id, id
 order by id
