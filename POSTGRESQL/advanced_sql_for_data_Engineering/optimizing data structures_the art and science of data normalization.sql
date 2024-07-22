-- Data Normalization

create table tutorial1.class_unnormalized2(
	student_id serial,
	advisor varchar,
	room varchar,
	class1 varchar,
	class2 varchar,
	class3 varchar
);

-- insert values 
insert into tutorial1.class_unnormalized2 (
	advisor,
	room,
	class1,
	class2,
	class3
)
values
('Jones', 123, 'Biology', 'Chemistry', 'Phisics'),
('Smith', 131, 'English', 'Math', 'Library Science');

-- Unnormalized Form
select * from tutorial1.class_unnormalized2 c 

-- First normalized form (1NF) - unpivot data

select c.student_id, c.advisor, c.room,  t.*
from class_unnormalized2 c
	cross join lateral (
		values
		(c.class1, 'class1'),
		(c.class2, 'class2'),
		(c.class3, 'class3')
	) as t (subject, class_num)
order by student_id;

-- Second Normal Form (2NF) - like grouping - temp_ table (fnf)  need it in order to run the queries on each table
--students
select distinct  student_id, advisor, room 
from fnf;

-- Classes
select distinct student_id, class_num
from fnf;

-- Third Normak Form (3NF)
select distinct student_id, advisor
from fnf;
--Faculty
select distinct advisor, room, 342 as dept
from fnf;













