SELECT * FROM sakila.film;

Begin;
update film f
set f.release_year =  '2007' where f.title = 'ACADEMY DINOSAUR';
commit;