/*
 Topic to learn
 1. Math Oprators
 2. Group by
 3. Order by
 4. Some Test questions
 5. HAVING 
 6. Some more test with all the topic combine.
 
*/
 
 Select * from payment limit 5;
 
 -- MIN, MAX , AVG, SUM
 
 Select AVG(amount) from payment;
 
 Select Round (AVG(amount),3)
 from payment;
 
 Select Min(amount)from payment;
Select Max(amount)from payment;
Select SUM (amount)from payment;

--find out how many transactions has zero dollers
Select count (amount) From payment
Where amount = 0.00;

-- Group by

/* Group by
Select col1, agg col2
from table
group by col1;
*/

 Select * from payment limit 5;
 
 select staff_id from payment
 group by staff_id;
 
 
Select staff_id, Sum(amount)
from payment
Group by staff_id;

--Find avg amount with staff id and round by 3 decimal
Select staff_id, Round (Avg(amount), 3)
from payment
Group by staff_id;

--Fine the total purchase of each customer ID
Select customer_id , Sum(amount)
From payment
Group by customer_id;

Select customer_id , Sum(amount)
From payment
Group by customer_id
Order by Sum(amount) DESC limit 5;

Select * from film limit 5;
--How many films are in each rating cataroy

Select rating, count (rating)
From film
Group by rating
Order by count(rating);


--1. We want to give bonus to staff memeber who handled highest payment.
Select staff_id , Sum(amount)
From payment
Group by staff_id;

--2. How Many Payment did each staff member handled and 
-- What is the total sum of all the payments.

Select staff_id,count(payment_id),SUM(amount)
from payment
group by staff_id;

--3. Office want's to know avg movie 
-- replacement rate (AVG) and total by rating.

Select * from film;
Select rating, Round (AVG (replacement_cost),4),SUM (replacement_cost)
from film
group by rating;

--4. We want to send the money for top five customer who paid highest with customer IDs
Select customer_id,SUM(amount)
from payment
group by customer_id
order by SUM(amount) DESC
limit 5;

--5. We want to send the money for top five customer who paid lesast with customer IDs
Select customer_id,SUM(amount)
from payment
group by customer_id
order by SUM(amount) ASC
limit 5;

-- Having 
/*
HAVING clause will always applied after GROUP BY and WHERE clause 
always applied before.
*/

Select customer_id,SUM(amount)
from payment
group by customer_id
HAVING sum(amount) > 150;

--Find customer by store id

Select store_id, count(customer_id)
from customer
group by store_id
having count(customer_id) > 250;




--Example of WHERE and HAVING in one command

Select * from film;

Select rating, Round (AVG(rental_rate),2)
From film
Where rating IN ('R','PG','G')
GROUP BY rating
HAVING AVG(rental_rate) > 1;

-- we want provide Platinum membership to customer who has more then 40 transactions

Select customer_id, count (amount)
from payment
group by customer_id
HAVING count(amount) > 40;



