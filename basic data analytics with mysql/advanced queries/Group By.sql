SELECT * FROM sakila.film;

select f.rating, f.special_features, avg(f.rental_rate) as 'avg_rental', avg(f.length) from sakila.film f group by f.rating, f.special_features