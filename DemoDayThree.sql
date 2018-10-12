/*
Topic to be covered
1. Filtering data
	-Fetch
	--OFFSET
	
2.Joining multiple tables
	Inner Join – selects rows from one table that have the corresponding rows in other tables.
	Left Join – selects rows from one table that may or may not have the corresponding rows in other tables.
	Self-join – joins a table to itself by comparing a table to itself.
	Full Outer Join – uses the full join to find a row in a table that does not have a matching row in another table.
	Cross Join – produces a Cartesian product of the rows in two or more tables.
	Natural Join – joins two or more tables using implicit join condition based on the common column names in the joined tables.
	
3.Performing set operations
	-Union 
	-Intersect 
	-Except 
	
4. Grouping Sets
	Grouping Sets 
	Cube 
	Rollup

5. Subquery
	Subquery 
	ANY 
	ALL 
	EXISTS
	
6. Modifying data
	Insert – inserts data into a table.
	Update – updates existing data in a table.
	Update join – updates values in a table based on values in another table.
	Delete – deletes data in a table.
	Upsert – inserts or update data if the new row already exists in the table.

*/


/* ============================================*/

-- 1. Fetch , Offset

Select * from film limit 5;

Select film_id,title
from film
Order by title 
FETCH first 5 Row ONLY;

Select film_id,title
from film
order by title
offset 5 rows
fetch first 5 row only;

-- find the cutomer who paid highest with us offset by 5 ..print only 3 customer id.
Select customer_id,SUM(amount)
from payment
group by customer_id
order by SUM(amount)DESC
offset 5 rows
fetch first 3 row only;


-- 2. Joins by multiple tables

Select * from customer limit 5;
Select * from payment limit 5;

Select 
customer.customer_id,customer.first_name,customer.last_name,
customer.email,
payment.amount,payment.staff_id
from payment
Inner join customer ON customer.customer_id = payment.customer_id
where customer.customer_id = 2;

Select 
customer.customer_id,customer.first_name,customer.last_name,customer.email,
payment.amount,payment.staff_id
From customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
Order by customer.first_name;

Select 
customer.customer_id,customer.first_name,customer.last_name,customer.email,
payment.amount,payment.staff_id
From customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
Where first_name LIKE 'M%';

--Example of three tables in inner join
SELECT
 customer.customer_id,
 customer.first_name AS customer_first_name,
 customer.last_name AS  customer_last_name,
 customer.email,
 staff.first_name AS staff_first_name,
 staff.last_name AS staff_last_name,
 amount,
 payment_date
FROM
 customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
INNER JOIN staff ON payment.staff_id = staff.staff_id;
--find out the total inventory on store 1.. count.

Select store_id,title
From inventory 
Inner join film ON inventory.film_id = film.film_id
Where store_id = 1;

Select store_id,count(distinct title)
From inventory 
Inner join film ON inventory.film_id = film.film_id
Where store_id = 1
group by store_id;



--Left Outer Join
-- left table in compare to right table

Select film.film_id,film.title,inventory_id
from film
LEFT JOIN inventory ON inventory.film_id = film.film_id
Where inventory.film_id IS NULL;

--self JOIN 
Select * from customer limit 10;


Select a.first_name,a.last_name,b.first_name,b.last_name
From customer AS a
JOIN customer AS b
ON a.first_name = b.last_name;

--Full Outer Join

/*
SELECT * FROM A
FULL [OUTER] JOIN B on A.id = B.id;

*/

-- Create table 

-- Create table
-- if not exists departments(
-- 	departments_id serial Primary KEY,
-- 	departments_name varchar(255) Not NULL
	
-- );

-- Create table
-- if not exists employees(
-- 	employees_id serial Primary Key,
-- 	employees_name varchar (255),
-- 	departments_id Integer 
-- );

-- INSERT INTO departments (departments_name)
-- VALUES
--  ('Sales'),
--  ('Marketing'),
--  ('HR'),
--  ('IT'),
--  ('Production');

Select * from departments;

-- INSERT INTO employees (
--  employees_name,
--  departments_id
-- )
-- VALUES
--  ('Bette Nicholson', 1),
--  ('Christian Gable', 1),
--  ('Joe Swank', 2),
--  ('Fred Costner', 3),
--  ('Sandra Kilmer', 4),
--  ('Julia Mcqueen', NULL);

Select * from employees;

Select 
employees_name,
departments_name
from employees As e
Full Outer Join departments As d 
ON d.departments_id = e.departments_id
where departments_name IS NULL;

--Cross Join
-- Cress join will allow you to find the result using cartesian

-- SELECT * 
-- FROM T1
-- CROSS JOIN T2;

-- SELECT *
-- FROM T1
-- INNER JOIN T2 ON TRUE;

-- CREATE TABLE T1 (label CHAR(1) PRIMARY KEY);
-- CREATE TABLE T2 (score INT PRIMARY KEY);

-- INSERT INTO T1 (label)
-- VALUES
--  ('A'),
--  ('B');
 
-- INSERT INTO T2 (score)
-- VALUES
--  (1),
--  (2),
--  (3);


select * from t2;

SELECT
 *
FROM
 T1
CROSS JOIN T2;

-- CREATE TABLE categories (
--  category_id serial PRIMARY KEY,
--  category_name VARCHAR (255) NOT NULL
-- );
 
-- CREATE TABLE products (
--  product_id serial PRIMARY KEY,
--  product_name VARCHAR (255) NOT NULL,
--  category_id INT NOT NULL,
--  FOREIGN KEY (category_id) REFERENCES categories (category_id)
-- );


-- INSERT INTO categories (category_name)
-- VALUES
--  ('Smart Phone'),
--  ('Laptop'),
--  ('Tablet');
 
-- INSERT INTO products (product_name, category_id)
-- VALUES
--  ('iPhone', 1),
--  ('Samsung Galaxy', 1),
--  ('HP Elite', 2),
--  ('Lenovo Thinkpad', 2),
--  ('iPad', 3),
--  ('Kindle Fire', 3);

SELECT
* FROM
products
NATURAL JOIN categories;



-- 3.Performing set operations
-- 	-Union 
-- 	-Intersect 
-- 	-Except 

-- Union will find result between two tables
/*
SELECT
 column_1,
 column_2
FROM
 tbl_name_1
UNION
SELECT
 column_1,
 column_2
FROM
 tbl_name_2
*/

Select first_name,last_name,last_update as TimeStamp
from actor
UNION
Select first_name,email,last_update
from customer;

-- Intersect will return single result from two tables, any row that is
-- available in any the table

-- CREATE TABLE employee (
--  employee_id serial PRIMARY KEY,
--  employee_name VARCHAR (255) NOT NULL
-- );
 
-- CREATE TABLE keys (
--  employee_id INT PRIMARY KEY,
--  effective_date DATE NOT NULL,
--  FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
-- );
 
-- CREATE TABLE hipos (
--  employee_id INT PRIMARY KEY,
--  effective_date DATE NOT NULL,
--  FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
-- );

-- INSERT INTO employee (employee_name)
-- VALUES
--  ('Joyce Edwards'),
--  ('Diane Collins'),
--  ('Alice Stewart'),
--  ('Julie Sanchez'),
--  ('Heather Morris'),
--  ('Teresa Rogers'),
--  ('Doris Reed'),
--  ('Gloria Cook'),
--  ('Evelyn Morgan'),
--  ('Jean Bell');
 
-- INSERT INTO keys
-- VALUES
--  (1, '2000-02-01'),
--  (2, '2001-06-01'),
--  (5, '2002-01-01'),
--  (7, '2005-06-01');
 
-- INSERT INTO hipos
-- VALUES
--  (9, '2000-01-01'),
--  (2, '2002-06-01'),
--  (5, '2006-06-01'),
--  (10, '2005-06-01');
Select employee_id
from keys;


SELECT
   employee_id
FROM hipos;


SELECT
 employee_id
FROM
 keys
INTERSECT
SELECT
employee_id
FROM
 hipos;
 
 
 --Except 
 -- from two tables it will print the result from left table also will 
 -- remove comman data from right table OPP to inner join
 
 Select film_id,title
 from film
 EXCEPT
 Select distinct inventory.film_id,title
 from inventory
 INNER JOIN film ON film.film_id = inventory.film_id
 order by title;
 
 --Time Stamps using EXTRACT
 Select * from payment limit 5;
 
 Select Extract (month from payment_date)As month,
 Sum (amount)
 from payment
 group by month
 Order by SUM(amount) DESC;
 
 
 Select * from customer limit 5;
Select first_name || '  '||last_name AS Full_name
from customer;
 
 Select first_name,char_length(first_name) AS length
from customer;
 
 Select upper (first_name)
from customer;

Select lower (first_name)
from customer;

-- List of film id that return_date between may-28 and may -30

Select inventory.film_id
from rental
Inner Join inventory ON inventory.inventory_id = rental.inventory_id
where return_date Between '2005-05-28' AND '2005-05-30';



-- 5. Subquery
-- 	Subquery 
-- 	ANY 
-- 	ALL 
-- 	EXISTS

Select AVG(rental_rate)
from film;

Select film_id,title,rental_rate
from film
where rental_rate > 2.98;

Select film_id,title,rental_rate
from film
where rental_rate > (Select AVG(amount)
from payment);

--films that have the returned 
--date between 2005-05-29 and 2005-05-30

Select film_id,title
from film
where film_id IN (
	select inventory.film_id from rental
	inner join inventory ON
	inventory.inventory_id = rental.inventory_id
	where return_date between '2005-05-29' and '2005-05-30');

CREATE TABLE account(
 user_id serial PRIMARY KEY,
 username VARCHAR (50) UNIQUE NOT NULL,
 password VARCHAR (50) NOT NULL,
 email VARCHAR (355) UNIQUE NOT NULL,
 created_on TIMESTAMP NOT NULL,
 last_login TIMESTAMP
);






 