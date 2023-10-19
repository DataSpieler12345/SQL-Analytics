select count(*) from film;
select count(*) from actor;
select count(*) from film where length >100;
select count(title) from film where length >100;
select length, count(title) from film where length >100 group by length;
select length, rating, count(title) from film where length >100 group by length, rating;