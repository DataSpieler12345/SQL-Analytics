select f.actor_id from sakila.film_actor f where f.film_id IN (select f1.film_id from sakila.film f1 where f1.film_id = 5)
