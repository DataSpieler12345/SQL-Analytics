-- create a db called advanced_tutorialdb1

create database advanced_tutorial1;

-- create a schema tutorial1
create schema tutorial1;

-- ENUM

create type weekday as enum ('Monday', 'Tuesday', 'Wednesday','Thursday', 'Friday', 'Saturday', 'Sunday');

-- create table next to tutorial1 schema

create table tutorial1.enum_demo(
	 id serial primary key,
	 day_of_week weekday not null,
	 random character varying
);


--insert values 
insert into tutorial1.enum_demo(day_of_week, random)
values('Monday', '4');
insert into tutorial1.enum_demo(day_of_week, random)
values('Tuesday', '47');
insert into tutorial1.enum_demo(day_of_week,random)
values('Wednesday', '7');
insert into tutorial1.enum_demo(day_of_week, random)
values('Monday', '8');
insert into tutorial1.enum_demo(day_of_week, random)
values('Saturday', '5');


-- chec the values 
select * from tutorial1.enum_demo
order by day_of_week;

-- it doesnt work
insert into tutorial1.enum_demo(day_of_week, random)
values('saturday', '5');

-- edit some info in the old one created table)
alter table tutorial1.enum_demo
add column wage float check (wage >= 0),
add column another_day varchar check (another_day in ('Monday', 'Tuesday', 'Wednesday',
			'Thursday', 'Friday', 'Saturday', 'Sunday'));

-- insert again some values 
insert into tutorial1.enum_demo(day_of_week, wage, another_day)
values('Monday', 5, 'Monday');
insert into tutorial1.enum_demo(day_of_week, wage, another_day)
values('Saturday', 5, 'Saturday');
insert into tutorial1.enum_demo(day_of_week, wage, another_day)
values('Wednesday', 5, 'Wednesday');		

-- chec the values 
select * from tutorial1.enum_demo
order by another_day;

-- ARRAYS
-- create an array_table
create table tutorial1.array_table(
	id SERIAL primary key,
	myarray INTEGER[]
);

-- check the created table 
select * from 
tutorial1.array_table ;

-- insert values into the array_table 
insert into tutorial1.array_table (myarray)
values (array[1, 2, 3, 4]);

insert into tutorial1.array_table (myarray)
values (array[9, 27, 43, 64]);

insert into tutorial1.array_table (myarray)
values (array[1, 4, 3, 4]);

-- check the created table 
select * from 
tutorial1.array_table;

select *
from tutorial1.array_table at2 
where 2 = ANY(myarray);

-- inspect all the values
select id, unnest(myarray) as unnested
from tutorial1.array_table;

-- RANGE 
create table tutorial1.job_board(
	id SERIAL primary key,
	job text,
	salary numeric,
	salary_numrange numrange,
	salary_intrange int4range
);

-- insert values into
insert into tutorial1.job_board(job, salary, salary_numrange, salary_intrange)
values
	('Engineer I', 120000, NUMRANGE(95000, 130000), INT4RANGE(95000, 130000)),
	('Engineer II', 150000, NUMRANGE(135000, 170000), INT4RANGE(135000, 170000)),
	('Engineer III', 210000, NUMRANGE(185000, 250000), INT4RANGE(185000, 250000));

-- chek the values 
select * from tutorial1.job_board;

-- how we query?
select * from tutorial1.job_board
where salary_intrange @> 95000; 

select * from tutorial1.job_board
where salary_numrange @> 95000; -- error the value doesnt exist

select * from tutorial1.job_board
where salary_intrange @> 185000;

select * from tutorial1.job_board
where salary_numrange @> 95000::numeric;

-- NESTED Data Type 

-- create a customers table
create table tutorial1.customers(
	id SERIAL primary key,
	name text,
	address JSONB
);

-- insert values
insert into tutorial1.customers (name, address) values ('John Doe', '{"street": "123 Main St", "city": "New York", "state": "NY", "zip": "10001"}');


-- Query the table 
select address->>'street' as street, address->>'city' as city, address->>'state' as state, address->>'zip' as zip
from tutorial1.customers
where name = 'John Doe';

-- check all values
select *
from tutorial1.customers c 

-- create index
create index idx_customers_address_city on tutorial1.customers ((address->>'city'));

-- query again the table
select name
from tutorial1.customers c
where address->>'city' = 'New York';

--update the table
update tutorial1.customers 
set address = jsonb_set(address, '{city}', '"Los Angeles"')
where name = 'John Doe';
select * from tutorial1.customers c 


update tutorial1.customers 
set address = address - 'zip'
where name = 'John Doe';
select * from tutorial1.customers c











