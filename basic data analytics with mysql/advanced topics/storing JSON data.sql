DROP TABLE IF EXISTS sakila.awards;

CREATE TABLE sakila.awards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    award_name VARCHAR(255),
    place VARCHAR(255),
    nomination JSON
);

INSERT INTO sakila.awards (award_name, place, nomination)
VALUES
    ('Oscar', 'Hollywood', '{ "Nom": "Bradd","Movie":"New World"}'),
    ('Oscar', 'Hollywood', '{ "Nom": "Stuart","Movie":"Insane" }'),
    ('Oscar', 'Hollywood', '{ "Nom": "Blake","Movie":"Inter" }');
    
SELECT * FROM sakila.awards

SELECT id, nomination->'$.Nom' nomination FROM awards;
SELECT id, nomination->'$.Movie' nomination FROM awards;
