SELECT * from sakila.film

DELIMITER $$

CREATE PROCEDURE getfilm()
BEGIN
    SELECT f.title, f.description, f.release_year, f.rental_duration, f.length FROM sakila.film f ORDER BY f.length;
END $$

DELIMITER ;

CALL getfilm();