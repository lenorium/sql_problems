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

'''Order Details

https://platform.stratascratch.com/coding/9913-order-details?code_type=1

Find order details made by Jill and Eva.
Consider the Jill and Eva as first names of customers.
Output the order date, details and cost along with the first name.
Order records based on the customer id in ascending order.

customers

id:           int
first_name:   varchar
last_name:    varchar
city:         varchar
address:      varchar
phone_number: varchar

orders

id:               int
cust_id:          int
order_date:       datetime
order_details:    varchar
total_order_cost: int
'''

select c.first_name,
       o.order_date,
       o.order_details,
       o.total_order_cost
  from customers as c
 inner join orders as o
    on c.id = o.cust_id
 where c.first_name in ('Eva', 'Jill')
 order by c.id

-- --------------------------------------------------------------------------------------------------------------------

'''Customer Details

https://platform.stratascratch.com/coding/9891-customer-details?code_type=1

Find the details of each customer regardless of whether the customer made an order.
Output the customer"s first name, last name, and the city along with the order details.
You may have duplicate rows in your results due to a customer ordering several of the same items.
Sort records based on the customer"s first name and the order details in ascending order.

customers

id:           int
first_name:   varchar
last_name:    varchar
city:         varchar
address:      varchar
phone_number: varchar

orders

id:               int
cust_id:          int
order_date:       datetime
order_details:    varchar
total_order_cost: int
'''

select c.first_name,
       c.last_name,
       c.city,
       o.order_details
  from customers as c
  left join orders as o
    on c.id = o.cust_id
 order by c.first_name, o.order_details

-- --------------------------------------------------------------------------------------------------------------------