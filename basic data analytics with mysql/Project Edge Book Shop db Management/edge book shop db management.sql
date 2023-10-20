use edgebookshop_db

-- Create the Publisher table

CREATE TABLE Publisher (
    publisherid INT PRIMARY KEY,
    publishername VARCHAR(255),
    publishertitle VARCHAR(255),
    year INT
);

-- Insert values into the Publisher table

INSERT INTO Publisher (publisherid, publishername, publishertitle, year)
VALUES
    (1, 'The Crown Publishing group', 'CPG', 2002),
    (2, 'War & Peace Publisher', 'WPP', 2014),
    (3, 'Dream Publication', 'DTP', 2002),
    (4, 'Quirk Books', 'QKB', 2014),
    (5, 'McGraw Publication', 'MGP', 2012),
    (6, 'Nootan Publication', 'NPC', 2006),
    (7, 'Harper Perennial', 'HPN', 2002),
    (8, 'William Morrow Paperbacks', 'WMP', 2009);
    
-- Create the Catalogue table with a foreign key reference to the Publisher table

CREATE TABLE Catalogue (
    bookid INT PRIMARY KEY,
    booktitle VARCHAR(255),
    publisherid INT,
    price DECIMAL(8, 2),
    quantity INT,
    FOREIGN KEY (publisherid) REFERENCES Publisher(publisherid)
);
    
-- Insert values into the Catalogue table

INSERT INTO Catalogue (bookid, booktitle, publisherid, price, quantity)
VALUES
    (1, 'The Crown Publishing group', 7, 10.99, 10),
    (2, 'War & Peace Publisher', 4, 15.99, 20),
    (3, 'Dream Publication', 7, 9.99, 15),
    (4, 'Quirk Books', 2, 12.99, 30),
    (5, 'McGraw Publication', 1, 8.99, 25),
    (6, 'Nootan Publication', 5, 14.99, 18),
    (7, 'Harper Perennial', 3, 11.99, 12),
    (8, 'William Morrow Paperbacks', 8, 13.99, 8);

-- Create the Author table

CREATE TABLE Author (
    authorid INT PRIMARY KEY,
    authorname VARCHAR(255)
);

-- Insert values into the Author table

INSERT INTO Author (authorid, authorname)
VALUES
    (1, 'Franz'),
    (2, 'Marlyn'),
    (3, 'MrBenn'),
    (4, 'Ganja'),
    (5, 'Bjorn'),
    (6, 'Pepelupoo'),
    (7, 'Cassandra'),
    (8, 'Yolis');

-- Now let's proceed to answer your questions
-- Display the names of all books that are with the Harper Perennial Publication

SELECT booktitle FROM Catalogue
WHERE publisherid = 7;

-- Find out which authored book got the maximum quantities sold

SELECT booktitle, MAX(quantity) AS max_quantity
FROM Catalogue
GROUP BY booktitle;

-- Get the names of authors in lower case

SELECT LOWER(authorname) AS lowercase_authorname FROM Author;

-- Display the publisher ids of books published post 2005

SELECT publisherid FROM Publisher

-- Show the distinct titles available in the catalogue

SELECT DISTINCT booktitle FROM Catalogue;
WHERE year > 2005;

-- Increase the price of all books either of Children type or of Quirk Books Publisher by 15%

UPDATE Catalogue
SET price = price * 1.15
WHERE booktitle LIKE '%&%' OR publisherid IN (
    SELECT publisherid FROM Publisher WHERE publishertitle = 'Quirk Books'
);

-- Display the max price of the books enlisted

SELECT MAX(price) AS max_price FROM Catalogue;

-- Display the information of the second highest price of the book

SELECT *
FROM Catalogue
WHERE price = (
    SELECT MAX(price)
    FROM Catalogue
    WHERE price < (SELECT MAX(price) FROM Catalogue)
);

-- Get the publisher id and publisher name of all the books where quantity > 20

SELECT p.publisherid, p.publishername
FROM Catalogue c
JOIN Publisher p ON c.publisherid = p.publisherid
WHERE c.quantity > 20;


-- Get the total price of all the books published in the year 2014

SELECT SUM(price) AS total_price
FROM Catalogue
WHERE publisherid IN (
    SELECT publisherid FROM Publisher WHERE year = 2014
);

-- Get the publisher name & author of all the books

SELECT p.publishername, a.authorname
FROM Catalogue c
JOIN Publisher p ON c.publisherid = p.publisherid
JOIN Author a ON c.bookid = a.authorid;

-- Find the name of all the authors whose second character is 'a'

SELECT authorname
FROM Author
WHERE authorname LIKE '_a%';

-- Change the year of publishing all the books from 2002 to 2008 when quantity > 5

UPDATE Publisher
SET year = 2008
WHERE publisherid IN (
    SELECT publisherid
    FROM Catalogue
    WHERE quantity > 5
) AND year = 2002;
