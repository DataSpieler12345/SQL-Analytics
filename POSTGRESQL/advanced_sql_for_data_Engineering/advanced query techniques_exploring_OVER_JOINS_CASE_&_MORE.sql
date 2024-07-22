-- create orders table 
create table tutorial1.orders(
	order_id SERIAL primary key,
	customer_id INTEGER not null,
	order_date DATE not null, 
	order_total DECIMAL(10, 2) not null
);

-- insert values
insert into tutorial1.orders(customer_id, order_date, order_total)
values
	(1, '2022-01-01', 100.00),
	(1, '2022-02-01', 50.00),
	(1, '2022-03-01', 75.00),
	(2, '2022-01-15', 200.00),
	(2, '2022-02-01', 150.00),
	(3, '2022-01-31', 75.00),
	(3, '2022-02-28', 100.00),
	(3, '2022-03-31', 50.00);
	
-- check the values 
select *
from tutorial1.orders

-- windows function
select order_id, customer_id, order_date, order_total,
sum(order_total) over (order by order_date) running_sum,
from tutorial1.orders o;

-- windows function / running sums in groups of people per customers
select order_id, customer_id, order_date, order_total,
sum(order_total) over (order by order_date) running_sum,
sum(order_total) over (partition by customer_id order by order_date) running_per_customer_sum
from tutorial1.orders o
order by customer_id, order_date;

-- filter a column based on the result of another column
-- max orders total by customer id 
select customer_id, max(order_total)
from tutorial1.orders o
group by customer_id;

-- best practices in that case with cte
with temp as (
select order_id, customer_id, order_date, order_total,
max(order_total) over (partition by customer_id) max_order_per_cust
from tutorial1.orders o
)
select * from temp
where order_total = max_order_per_cust;

-- CROSS JOIN
-- create two tables

create table tutorial1.class_unnormalized(
	student_id serial,
	advisor varchar,
	room varchar,
	class1 varchar,
	class2 varchar,
	class3 varchar
);

-- insert values 
insert into tutorial1.class_unnormalized(
	advisor,
	room,
	class1,
	class2,
	class3
)
values
('Jones', 123, 'Biology', 'Chemistry', 'Phisics'),
('Smith', 131, 'English', 'Math', 'Library Science');

-- create table buildings
create table tutorial1.buildings(
	building_id serial,
	building_name varchar
);

-- insert values
insert into tutorial1.buildings (building_name)
values ('Rathskeller'), ('Amundsen'), ('JRC');

-- check all from class_unnormalized
select * from class_unnormalized cu 

-- check all from buildings table 
select * from tutorial1.buildings


-- cross join to see all over combination
select 
	student_id,
	advisor,
	building_name
from tutorial1.class_unnormalized cu 
cross join tutorial1.buildings b;

-- LATERAL JOIN 
-- user table
create table tutorial1.users(
	user_id SERIAL primary key,
	username varchar(50) not null,
	email varchar(100) not null
);

-- orders2 table 
create table orders2(
	order_id SERIAL primary key, 
	user_id INTEGER not null references users(user_id),
	order_date DATE not null, 
	total_amount NUMERIC(10,2) not null
);

-- insert value / each created table 

insert into tutorial1.users(username, email) 
values
	('alice', 'alice@example.com'),
	('bob', 'bob@example.com'),
	('charlie', 'charlie@example.com');

insert into tutorial1.orders2(user_id, order_date, total_amount)
values
	(1, '2022-04-01', 50.00),
	(1, '2022-03-15', 25.00),
	(2, '2022-04-02', 100.00),
	(3, '2022-04-01', 75.00),
	(3, '2022-03-20', 30.00),
	(3, '2022-03-01', 20.00);

-- check all values of both created tables 
select * from tutorial1.orders2 o; 
select * from tutorial1.users u; 

-- LATERAL JOIN IN ACTION
-- check out the most recents user name orders
select 
	u.username
from tutorial1.users u 
left join lateral(
	select
		order_id,
		order_date
	from
		tutorial1.orders2 o
	where 
		user_id = u.user_id
	order by
		order_date desc 
	limit 1
) o on 
	true;

-- same but with windows function
select distinct 
	u.username,
	first_value(o.order_id) over (partition by u.user_id order by o.order_date desc) as order_id, 
	first_value(o.order_date) over (partition by u.user_id order by o.order_date desc) as order_date
from 
	users u 
left join orders2 o on u.user_id = o.user_id 

-- SPECIALLY USE CASE
-- CROSS JOIN LATERAL 

select  * from class_unnormalized cu 

select c.student_id, c.advisor, t.*
from class_unnormalized c
	cross join lateral(
		values
			(c.class1, 'class1'),
			(c.class2, 'class2'),
			(c.class3, 'class3')
	) as t (subject, class_num)
  order by student_id;
 
 -- COALESCE
 create table tutorial1.employees(
 	id SERIAL primary key,
 	name varchar(255),
 	salary numeric(10, 2),
 	department varchar(255)
 );

-- insert values
 insert into tutorial1.employees("name", salary, department)
 values
 	('John Doe', 50000.00, 'IT'),
 	('Jane Doe', NULL, 'SAles'),
 	('Bob Smith', 55000.00, NULL);
 
 -- check the values
 select *
 from employees e 
 
 -- CASE Statement / if + condition, then do that / if then els
 create table empleado(
 	 id SERIAL primary key,
	 name varchar(255),
	 salary numeric,
	 department varchar(255),
	 bonus numeric
);

-- insert values
insert into empleado(name, salary, department, bonus)
values
	('John Doe', 50000.00, 'IT', 5000),
 	('Jane Doe', NULL, 'SAles', 5000),
 	('Bob Smith', 750000.00, null, 5000),
 	('Rob Smith', 155000.00, null, 5000);
 
-- check the values
 select * 
 from empleado e 
 
 -- case statement
select 
	name, 
	salary,
	case 	
		when salary < 60000 then 'entry level'
		when salary < 100000 then 'mid'
		when salary < 200000 and bonus> 0 then 'really big baller'
		when salary < 200000 then 'big baller'
		else 'uncaught exception'
	end as salary_classification
from
empleado e 

-- CONCAT	
 create table tutorial1.empleado2(
 	 id SERIAL primary key,
	 f_name varchar(255),
	 l_name varchar(255),
	 salary numeric,
	 department varchar(255),
	 bonus numeric
);
	
-- insert values
insert into tutorial1.empleado2(f_name, l_name, salary, department, bonus)
values
	('John', 'Doe', 50000.00, 'IT', 5000),
 	('Jane', 'Doe', NULL, 'Sales', 5000),
 	('Bob', 'Smith', 750000.00, null, 5000),
 	('Rob', 'Smith', 155000.00, null, 5000);

-- check the values
 select *
 from tutorial1.empleado2 e 
 
 -- concat statement
 select 
 	f_name,
 	l_name,
 	concat(f_name, ' ', l_name) as full_name
 from 
 	empleado2 e 
 
  -- concat statement
 select 
 	f_name,
 	l_name,
 	concat(f_name, ' ', l_name) as full_name,
 	concat(f_name, ' ', l_name, ' - ', coalesce(department, 'No Dept')) as full_name_dept
 from 
 	empleado2 e 
 	
 -- recursive CTE 
 with recursive date_table as (
 	 select
 	 	'2023-01-01'::date da_date
 	 union all
 	 select
 	 	da_date + 1
 	 from
 	 	date_table < '2023-02-01'::date
)
select
	*
from 
	date_table;
 	

 
 
 
 
 
 
