SELECT * FROM sakila.film;

select avg(rental_rate) from film;
select rating, rental_duration, avg(rental_rate) as 'avg_rental' from film group by rating, rental_duration;
select rating, rental_duration, avg(rental_rate) as 'avg_rental', avg(length) as 'avg_length' from film group by rating, rental_duration;
