SELECT * FROM sakila.film;

CREATE TABLE t1(
id INT AUTO_INCREMENT PRIMARY KEY,
act_id INT NOT NULL,
lastname VARCHAR(50) NOT NULL,
changedate DATETIME DEFAULT NULL,
action VARCHAR(50) DEFAULT NULL
);

DROP TRIGGER IF EXISTS trig1;

CREATE trigger trig1 BEFORE UPDATE ON actor FOR EACH ROW
INSERT INTO t1 SET ACTION = 'UPDATE', act_id = OLD.actor_id, lastname = OLD.last_name, changedate = now();

UPDATE actor
SET last_name = 'GUNIESSSS' WHERE actor_id = 1;

SELECT * FROM actor

SELECT * FROM t1