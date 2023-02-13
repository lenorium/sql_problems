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

-- --------------------------------------------------------------------------------------------------------------------

'''Bikes Last Used

https://platform.stratascratch.com/coding/10176-bikes-last-used?code_type=1

Find the last time each bike was in use. Output both the bike number and the date-timestamp of the bike"s
last use (i.e., the date-time the bike was returned). Order the results by bikes that were most recently used.

dc_bikeshare_q1_2012

duration:          varchar
duration_seconds:  int
start_time:        datetime
start_station:     varchar
start_terminal:    int
end_time:          datetime
end_station:       varchar
end_terminal:      int
bike_number:       varchar
rider_type:        varchar
id:                int
'''

select bike_number,
       max(end_time) as end_time
  from dc_bikeshare_q1_2012
 group by bike_number
 order by end_time desc

'''Count the number of movies that Abigail Breslin nominated for oscar

https://platform.stratascratch.com/coding/10128-count-the-number-of-movies-that-abigail-breslin-nominated-for-oscar?

Count the number of movies that Abigail Breslin nominated for oscar

oscar_nominees

year:      int
category:  varchar
nominee:   varchar
movie:     varchar
winner:    bool
id:        int
'''

select count(1)
  from oscar_nominees
 where nominee = 'Abigail Breslin'

-- --------------------------------------------------------------------------------------------------------------------

'''Lyft Driver Wages

https://platform.stratascratch.com/coding/10003-lyft-driver-wages?code_type=1

Find all Lyft drivers who earn either equal to or less than 30k USD or equal to or more than 70k USD.
Output all details related to retrieved records.

lyft_drivers

index:          int
start_date:     datetime
end_date:       datetime
yearly_salary:  int
'''

select *
  from lyft_drivers
 where yearly_salary <= 30000
       or yearly_salary >= 70000;

-- --------------------------------------------------------------------------------------------------------------------

'''Find how many times each artist appeared on the Spotify ranking list

https://platform.stratascratch.com/coding/9992-find-artists-that-have-been-on-spotify-the-most-number-of-times?

Find how many times each artist appeared on the Spotify ranking list
Output the artist name along with the corresponding number of occurrences.
Order records by the number of occurrences in descending order.

spotify_worldwide_daily_song_ranking

id:        int
position:  int
trackname: varchar
artist:    varchar
streams:   int
url:       varchar
date:      datetime
region:    varchar
'''

select artist,
       count(1) as n_occurences
  from spotify_worldwide_daily_song_ranking
 group by artist
 order by n_occurences desc

-- --------------------------------------------------------------------------------------------------------------------

'''Find the base pay for Police Captains

https://platform.stratascratch.com/coding/9972-find-the-base-pay-for-police-captains?code_type=1

Find the base pay for Police Captains.
Output the employee name along with the corresponding base pay.
Use ILIKE on the job title for the string pattern "%CAPTAIN%POLICE%" to find desired records.

sf_public_salaries

id:               int
employeename:     varchar
jobtitle:         varchar
basepay:          float
overtimepay:      float
otherpay:         float
benefits:         float
totalpay:         float
totalpaybenefits: float
year:             int
notes:            datetime
agency:           varchar
status:           varchar
'''

select employeename,
       basepay
  from sf_public_salaries
 where jobtitle ilike '%CAPTAIN%POLICE%'

-- --------------------------------------------------------------------------------------------------------------------