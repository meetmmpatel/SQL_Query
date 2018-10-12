-- Create Table
-- Update the tables onces it is created
-- SQL Constraints
-- Update query
-- Delect query
-- Other user full topic



-- Create table link(
-- link_id serial Primary Key,
-- 	title varchar(500) not null,
-- 	url varchar (1000)not null Unique

-- );

-- how to add one more column?
--Alter table link add column active boolean;


-- how to drop/delete column from table?
-- Alter table link drop column active;

--How to rename the column name?
-- Alter table link RENAME column title TO link_title;


-- Select * from link;
-- Set the default value of any column?
-- Alter table new_link alter column target 
-- set default 'Test';

-- How to rename the table ?
-- Alter table link
-- rename to new_link;


--How to change the data type of column?
-- Alter table new_link
-- alter column target Type boolean;



--3.  SQL Constraints

-- -- Create table headers (
-- -- header_id integer Primary key,
--  description varchar(255)
--  );

-- Alter table headers drop column link_id ;

-- Alter table headers add column link_id int REFERENCES new_link(link_id);

-- Alter table new_link add column some_num int;

--check Constraints
-- Alter table new_link add column num int check (num > 5);


--1. Primary Key
--2. forenign key
--3. check 
--4. Unique
--5. not null

-- create two new tables and assign all the contsraint in both the table.
-- Each table PK is FK to another table
-- atleast one column should have check with with date 
-- one colunm shoud unique 
-- all clunm on both tables should be not null.

--1. add five or more lines of entry in both the tables
--2. Update the values
/*
UPDATE table
SET column1 = value1,
    column2 = value2 ,...
WHERE
 condition;
*/

Select * from employee

-- Update employee
-- set employee_name = 'test';

delete from employee
where employee_name = 'test';
