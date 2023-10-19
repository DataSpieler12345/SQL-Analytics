CREATE temporary table film_temporary
select title, description, rental_rate from sakila.film where rental_rate >2;

select * from film_temporary