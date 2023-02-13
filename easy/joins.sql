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

-- --------------------------------------------------------------------------------------------------------------------

'''Find all posts which were reacted to with a heart

https://platform.stratascratch.com/coding/10087-find-all-posts-which-were-reacted-to-with-a-heart?code_type=1

Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.
Heart reactions have the value of "heart" for the reaction column of the facebook_reactions dataset.
A post can be liked by one of more users.

facebook_reactions

poster:   int
friend:   int
reaction: varchar
date_day: int
post_id:  int

facebook_posts

post_id:        int
poster:         int
post_text:      varchar
post_keywords:  varchar
post_date:      datetime
'''

select distinct p.*
  from facebook_posts as p
 inner join facebook_reactions as r
    on p.post_id = r.post_id
 where r.reaction = 'heart'

-- --------------------------------------------------------------------------------------------------------------------