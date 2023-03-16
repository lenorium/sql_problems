'''Workers With The Highest Salaries

https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries?code_type=1

Find the titles of workers that earn the highest salary.
Output the highest-paid title or multiple titles that share the highest salary.

worker

worker_id:    int
first_name:   varchar
last_name:    varchar
salary:       int
joining_date: datetime
department:   varchar

title

worker_ref_id: int
worker_title:  varchar
affected_from: datetime
'''

select worker_title
  from title t
 inner join worker w
    on w.worker_id = t.worker_ref_id
 where w.salary = (select max(salary) from worker)

-- --------------------------------------------------------------------------------------------------------------------

'''Users By Average Session Time

https://platform.stratascratch.com/coding/10352-users-by-avg-session-time?tabname=solutions&code_type=1

Calculate each user"s average session time.
A session is defined as the time difference between a page_load and page_exit.
For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day,
consider only the latest page_load and earliest page_exit.
Output the user_id and their average session time.


facebook_web_log

user_id:   int
timestamp: datetime
action:    varchar
'''

-- в условии не сказано, что делать, если у кого-то не было события окончания сессии (action = page_exit)
-- для таких случаев взяла текущее время. можно было также использовать inner join и не брать в расчет такие случаи
select t1.user_id,
       avg((case
                 when t2.page_exit is not null
                 then t2.page_exit
                 else cast (now() as timestamp)
            end) - t1.page_load)
        as session
from
    (select min(timestamp) as page_load,
            user_id,
            cast(timestamp as date) as day
       from facebook_web_log
      where action = 'page_load'
      group by user_id,
               cast(timestamp as date)) as t1

 left join

      (select max(timestamp) as page_exit,
              user_id,
              cast(timestamp as date) as day
         from facebook_web_log
        where action = 'page_exit'
        group by user_id,
              cast(timestamp as date)) as t2
    on (t1.user_id = t2.user_id and t1.day = t2.day)
 group by t1.user_id

-- --------------------------------------------------------------------------------------------------------------------