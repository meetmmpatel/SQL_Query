select * from customer;

-- email address of person name Jared by using frist name;
select email from customer
where first_name = 'Jared';

--I want to see customer whos first name is Mary and last name is Smith

select * from customer
where first_name = 'Mary' and last_name = 'Smith';

--I want to see information of first of name Jared and Mary 
--I only want to see first name as result
Select first_name From customer
Where first_name = 'Jared' OR first_name = 'Mary';

-- I want cutomer with last name smith and store id = 1;
select * from customer
where store_id = 1 And last_name = 'Smith';

--count 
Select count(*) from payment
where amount >= 7 and amount <= 10;

Select * from payment;

Select count(*) from payment
Where not amount <= 1;

-- find the number of entery with has amount between more than zero
-- and less than 4.99 also remove cutomer-id number 346 from the result.
-- find result with query and with count

Select * From payment 
Where amount >= 0.00 AND amount <= 4.99  AND NOT customer_id = 346;

Select count(*) From payment 
Where amount >= 0.00 AND amount <= 4.99  AND NOT customer_id = 346;

--I want to see all the transactions of cutomer number 341 and 346;

Select * from payment
where customer_id = 341 OR  customer_id = 346;

--Using not equals to 
Select * from payment
Where amount != 2.99;

-- I want to see amount,payment_date,staff_id 
--	where amount is less or = than 7.99;
-- what if we only want to see staff 2 and count
Select payment_date,staff_id from payment
Where amount <= 7.99;
Select payment_date,staff_id from payment
Where amount <= 7.99 and staff_id = 2;


--Alias
Select * from rental;

Select customer_id,rental_id from rental;

Select customer_id AS MYID ,rental_id AS RENT from rental;

--Explore the count 

Select * from city;
Select count(*) from city;

Select count(Distinct city) from city;

Select * from payment;
Select count(*) from payment;
Select count(Distinct amount)from payment;
Select count( customer_id)from payment;

-- using LIMIT
Select * from payment 
LIMIT 5;

--Using Order By, ASC and DESC 
Select * from customer;

Select * from customer 
Order by first_name DESC;

Select * from customer
Order by first_name DESC, customer_id DESC;


Select * from film limit 5;

-- find the result from film table with film_id,rental_rate,title by title DESC

Select film_id,rental_rate, title from film
Order by title DESC;

-- get the customer id number from highest payment amount only limit to 10;
Select customer_id,amount from payment
Order by amount DESC 
Limit 10;

Select film_id,title,release_year from film
Order by film_id  limit 5;

Select  title,film_id,rental_rate from film
Order by rental_rate DESC;


-- IN , Between and LIKE

Select * from payment limit 5;

-- Between

Select customer_id,amount
from payment
where amount between 8 and 9;

Select customer_id,amount
From payment
Where amount not between 8 AND 9;

Select amount, payment_date,customer_id
From payment
where customer_id between 341 And 344;

 -- IN 
 
 Select * from customer limit 5;
 Select first_name from customer
 where first_name = 'Mary' Or first_name = 'Linda' or first_name = 'Barbara';
 
 Select * from customer
Where first_name IN  ('Mary','Linda','Barbara');

Select * from rental
limit 10;

-- find customer_id, rentalID and rentalDate for 
-- customerID 1 and 2 desc by rental date from rental table
Select customer_id,rental_id,rental_date
from rental
where customer_id IN (1,2)
Order by rental_date Desc;

Select customer_id,rental_id,rental_date
from rental
where customer_id NOT IN (1,2)
Order by rental_date Desc;

--From payment table find the amount only 7.99 to 2.99 
--where rental id is not 1 and 2;
Select count(*) from payment
where amount IN (7.99, 2.99)
and rental_id NOT IN (1,2);

-- LIKE NOT LIKE and other features

Select * from customer;

--find the result where first_name starts with 'P'
Select first_name, last_name
from customer
where first_name like 'P%';

Select first_name, last_name
from customer
where first_name not like 'P%';

Select first_name,last_name
from customer
where last_name like '%e';

Select first_name,last_name
from customer
where last_name like '%er%';

Select first_name,last_name
from customer
where last_name like '_an%';

Select first_name,last_name
from customer
where last_name like '__an%';

Select first_name,last_name
from customer
where last_name Not like '__an%';

Select first_name,last_name
from customer
where last_name Ilike 'an%';


-- challenge to solve 
/* 1. How many payment transactions are less than 5$
    Answer is 10978
*/

Select count (amount)
from payment
Where amount < 5;

-- 2. How many actors have first name starts with M

Select count (first_name)
From actor
Where first_name Like 'M%';


--3 How many unique disctric our customer from Address;
Select count (distinct (district))
from address;
						
--4. Display the name of unique disctrict in address 

select distinct district
from address;

						
--5 .How many film are rated R and replancement cost 5 and 15;

Select count(*)
From film
Where rating = 'R'
And replacement_cost between 5 and 15;
						
--6. How many film has TruMan tital in ther names;

Select * from film
Where title like '%Truman%';






