-- Store Procedures

/*
CREATE FUNCTION function_name(p1 type, p2 type)
 RETURNS type AS
BEGIN
 -- logic
END;
LANGUAGE language_name;
*/

Create Or replace Function SumOfNum(a numeric, b numeric)
Returns numeric as $$

Begin
 return  a + b;
 end; $$
LANGUAGE plpgsql; 


select SumOfNum(20,40);

create or replace function hi_lo(
	a numeric,
	b numeric,
	c numeric,
		out hi numeric, out lo numeric)

As $$
Begin
hi := GREATEST (a,b,c);
lo := LEAST (a,b,c);
end;
$$ language plpgsql;


Select hi_lo(2,5,8);

Select hi_lo(20,51,8);

Create or replace function square (inout a numeric)
As $$
begin
a := a * a;
end; $$
language plpgsql;

Select square(5);

Create or replace function total()
returns integer as $total$

declare
total integer;
begin
Select count(amount) into total from payment;
return total;
end; $total$ 
language plpgsql;


select total();


Create or replace function sum_avg(
 variadic list numeric [],
	out total numeric , out average numeric (5,2))
	As $$
 begin
 Select into total SUM(list[i])
 from generate_subscripts(list,1)g(i);
	
 Select into average AVG(list[i])
 from generate_subscripts(list,1)g(i);
							
 end; $$
 language plpgsql;
										
Select * from sum_avg(2,5,7,8);
							  
							  
Create or replace function get_film(p_pattern varchar)
returns table(film_title varchar,film_release_year integer)
AS $$
BEGIN
RETURN QUERY 
	Select title, cast(release_year as integer)
	from film
	where title ILIKE p_pattern;
	end;
	$$ language plpgsql;							  
							  
Select * from get_film('m%');










