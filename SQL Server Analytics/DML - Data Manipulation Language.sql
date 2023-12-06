---- DML Data Manipulation Language

-- create again the same table CitizenInfo
CREATE TABLE CitizenInfo(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	Name VARCHAR(200) NOT NULL,
	Age INT,
	City VARCHAR(200) NOT NULL,
	Phone INT NOT NULL 
);

-- insert values
INSERT INTO CitizenInfo(Name, City, Phone)
VALUES ('Adrian', 'SLP', 123);

-- query / age = NULL 
SELECT * FROM CitizenInfo;

-- insert values
INSERT INTO CitizenInfo(Name, Age, City, Phone)
VALUES ('Luis', 11, 'SLP', 123);

-- insert values
INSERT INTO CitizenInfo(Name, Age, City, Phone)
VALUES ('Luisa', 12, 'Nuevo Leon', 124);

-- insert values
INSERT INTO CitizenInfo(Name, Age, City, Phone)
VALUES ('Juanjo', 1, 'DF', 125);

-- insert values
INSERT INTO CitizenInfo(Name, Age, City, Phone)
VALUES ('Coco', 55, 'Sonora', 126);

-- query Name, Age
SELECT Name, Age FROM CitizenInfo;

-- query Name, Age where ID = 4
SELECT Name, Age FROM CitizenInfo Where ID = 4;

-- query Name, Age where Name = Luisa
SELECT Name, Age FROM CitizenInfo Where Name = 'Luisa';

-- delete a row of the table 
DELETE FROM CitizenInfo WHERE Name = 'Juanjo';

-- query
SELECT * FROM CitizenInfo;

-- delete all rows of the table 
DELETE FROM CitizenInfo;

-- update some data of the table . Name Juanjo to Wibke, Age 1 to 100 
UPDATE CitizenInfo SET Name = 'Wibke', Age = 100 WHERE Name = 'Juanjo';

-- visualize the first 2 records of the table
SELECT TOP 2 * FROM CitizenInfo;

-- query distinct cities
SELECT DISTINCT City FROM CitizenInfo;

-- query
SELECT * FROM CitizenInfo;

-- count the ID as namesamount & groupby them by city
SELECT COUNT(ID) as namesamount, City FROM CitizenInfo GROUP BY City;

-- query
SELECT * FROM CitizenInfo;

-- count the ID as namesamount & groupby them by city and ORDER BY namesamount DESC
SELECT COUNT(ID) as namesamount, City FROM CitizenInfo GROUP BY City ORDER BY namesamount DESC;

-- query
SELECT * FROM CitizenInfo;

-- count the ID as namesamount & groupby them by city
SELECT COUNT(ID) as namesamount, City FROM CitizenInfo GROUP BY City
HAVING COUNT(ID) > 1;

-- count the ID as namesamount & groupby them by city
SELECT COUNT(ID) as namesamount, City FROM CitizenInfo GROUP BY City

-- ignore the first two rows and get the next 2
SELECT * FROM CitizenInfo
ORDER BY Age OFFSET 2 ROWS FETCH NEXT 2 ROWS ONLY;

-- query
SELECT * FROM CitizenInfo ORDER BY Age;

-- query SELECT + AND
SELECT * FROM CitizenInfo WHERE Age > 10 AND Age < 30;

-- query SELECT + BETWEEN
SELECT * FROM CitizenInfo WHERE Age BETWEEN 10 AND 30;

-- query SELECT + LIKE
SELECT * FROM CitizenInfo WHERE Name LIKE 'L%';

-- query
SELECT * FROM CitizenInfo;

-- query SELECT + LIKE
SELECT * FROM CitizenInfo WHERE Name LIKE '%e';

-- query
SELECT * FROM CitizenInfo;

-- query SELECT Name, City as NameCity FROM CitizenInfo
SELECT (Name + ',' + City) AS NameCity FROM CitizenInfo

-- query
SELECT * FROM CitizenInfo;

-- query combined filtered info from another table 
CREATE TABLE CitiesInfo(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	Name VARCHAR(200) NOT NULL,
	Capital VARCHAR(200) NOT NULL,
);

-- query
SELECT * FROM CitiesInfo;

-- insert values
INSERT INTO CitiesInfo VALUES('SLP','SLP');
INSERT INTO CitiesInfo VALUES('Nuevo Leon','Monterrey');

-- query Cities and Citizen Tables
SELECT * FROM CitiesInfo;
SELECT * FROM CitizenInfo;

-- query call the data from CitizenInfo table based on the CitiesInfo table values. 
SELECT * 
FROM CitizenInfo 
WHERE City IN (SELECT Name FROM CitiesInfo WHERE Capital = 'Monterrey');