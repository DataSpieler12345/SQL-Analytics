-- create a db called advanced_tutorialdb

create database advanced_tutorial;

-- create a schema tutorial
create schema tutorial;

-- create a table on tutorial schema of the db called advanced_tutorialdb

create table tutorial.employess (
	 id numeric primary key,
	 first_name varchar not null,
	 last_name varchar not null, 
	 email varchar, 
	 hire_date date default current_date,
	 department varchar default 'Unassigned'
);

select * from tutorial.employess; 

-- We can add a column
alter table tutorial.employess add column age INT;

-- We can drop a column 
alter table tutorial.employess drop column age;

-- We can also set a defaul value 
alter table tutorial.employess alter column department set default 'Reassigned';

-- Inset 1 value into the created db
insert into tutorial.employess (id, first_name, last_name, email)
values (1, 'John', 'Doe', 'johndoe@example.com');

insert into tutorial.employess (id, first_name, last_name, email) values 
(2, 'Jane', 'Smith', 'janesmith@example.com'),
(3, 'Thai', 'Chi', 'thaichi@example.com'),
(4, 'Marget', 'Muss', 'margetmuss@example.com'),
(5, 'Gihana', 'Alfaro', 'gihanaalfaro@example.com');

select * from tutorial.employess; 

-- update 1 value
update tutorial.employess 
set first_name = 'Marget', last_name = 'Soza', email = 'margetsoza@example.com' 
where id = 4;

-- Delete a row on the table 
delete from tutorial.employess where id = 3; 

-- Delete 1 and 4 rows
delete from tutorial.employess where id in (1, 4);

-- Truncate de tale 

insert into tutorial.employess (id, first_name, last_name, email) values 
(6, 'James', 'madrid', 'jamadriz@example.com'),
(7, 'Tato', 'Chi', 'tatochi@example.com');

-- Drop Table 
drop table tutorial.employess;

