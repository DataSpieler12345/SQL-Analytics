SELECT * FROM sakila.film;

create view sakila.actor_film as
select f.title, f.description, a.first_name, a.last_name from sakila.film f inner join sakila.film_actor fa using (film_id) inner join sakila.actor as a using (actor_id) 