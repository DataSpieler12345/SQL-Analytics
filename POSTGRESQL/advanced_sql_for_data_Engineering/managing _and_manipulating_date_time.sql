select TIMESTAMP '2023-04-01T14:30:00';

-- extract the date
select date '2023-04-01';
select date '04/01/2023';

-- extract the month
select date 'April 1, 2023';
select date '1 April 2023';

-- convert the time
select TIMESTAMP with TIME zone '2023-04-1 14:30:00-05';

-- current date function
select current_date;
-- current time function
select current_time;
-- current timestamp
select current_timestamp;

-- Date trunc function
select date_trunc('month', date '2023-04-15');
select date_trunc('year', date '2023-04-15');
select date_trunc('hour', timestamp '2023-04-15 14:30:00');

-- Age function
select age(date '2024-03-20', date '1983-03-20');
select age(timestamp '2023-04-01 14:30:00', timestamp '2022-03-01 12:00:00');

-- string to date
select '2023-01-01'::date;
select '23-01-01'timestamp;
select '15:30:00'time

--interval
select '15:30:00'::time - '12:30:00'::time as interval_example,
	pg_typeof('15:30:00'::time - '12:30:00'::time);

-- current setting
select current_setting('timezone'); 

-- create a table named demo
create table tutorial.demo(
	tz_demo timestamptz,
	ntz_demo timestamp
	);

-- insert some values
insert into 
	tutorial.demo(tz_demo, ntz_demo)
	values('2023-01-01 15:30:00 -0700',
		   '2023-01-01 15:30:00');

-- select the values
select *
from tutorial.demo d 

-- select statement
select 
	'current_date' as date_function,
	current_date::varchar
union all
select
	'current_time' as date_function,
	current_time::varchar
union all
select 
	'current_timestamp' as date_function,
	current_timestamp::varchar
union all
select
	'now' as date_function,
	now()::varchar 
union all 
select
	'now_timezone_convert' as date_function,
	timezone('UTC', now())::timestamp::varchar
union all
select
	'localtime' as date_function,
	localtime::varchar
union all
select 
	'localtimestamp',
	localtimestamp::varchar
union all
select
	'timeofday' as date_function,
	timeofday()
;

-- Intevals
select interval '1 day 2 hours 30 minutes';
select now() + interval '1 day';
select age(now(), '2022-03-18'); 





























