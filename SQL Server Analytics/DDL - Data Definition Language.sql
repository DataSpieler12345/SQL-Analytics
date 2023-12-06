-- DDL Data Definition Language comands

-- create db

CREATE DATABASE Citizen;

USE Citizen;
--create table
CREATE TABLE CitizenInfo(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	Name VARCHAR(200),
	Age INT
);
-- add column
ALTER TABLE CitizenInfo ADD Surname VARCHAR(200);
-- change datatype
ALTER TABLE CitizenInfo ALTER COLUMN Age FLOAT;
-- delete column 
ALTER TABLE CitizenInfo DROP COLUMN Surname;
-- add 1 record
INSERT INTO CitizenInfo
VALUES ('Adrian', 29);

-- check the result 
SELECT * FROM CitizenInfo;

-- delete all row of the table CitizenInfo
TRUNCATE TABLE CitizenInfo;

-- rename created table CitizenInfo to InfoCitizen
SP_RENAME 'CitizenInfo', 'InfoCitizen';

-- delete renamed table InfoCitizen
DROP TABLE InfoCitizen;

-- drop db (not conected)
DROP DATABASE Citizen;
------------------------------------------------------

--create table 
CREATE TABLE CitizenInfo(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	Name VARCHAR(200) NOT NULL,
	Age INT,
	Email VARCHAR(200),
	Phone INT NOT NULL, 
	CONSTRAINT C_CitizenInfo UNIQUE(Name, Email)
);

-- insert values
INSERT INTO CitizenInfo
VALUES ('Adrian', 88, 'email@email.com', 12345)

--query
SELECT * FROM CitizenInfo;

-- insert values
INSERT INTO CitizenInfo
VALUES ('Adrian', 88, 'email1@email.com', 12345)

INSERT INTO CitizenInfo
VALUES ('Franz', 58, 'email1@email.com', 12345)

-- delete constraint condition
ALTER TABLE CitizenInfo DROP CONSTRAINT C_CitizenInfo;

-- insert again the same value
INSERT INTO CitizenInfo
VALUES ('Franz', 58, 'email1@email.com', 12345)

-- delete the created table CitizenInfo
DROP TABLE CitizenInfo;

-- create again the same table CitizenInfo + 1 condition in 1 column = CHECK condition
CREATE TABLE CitizenInfo(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	Name VARCHAR(200) NOT NULL CHECK(LEN(Name) > 5),
	Age INT,
	Email VARCHAR(200),
	Phone INT NOT NULL 
);

-- insert values / 
INSERT INTO CitizenInfo
VALUES ('Luis', 88, 'email1@email.com', 1)

-- insert values
INSERT INTO CitizenInfo
VALUES ('Adrian', 88, 'email1@email.com', 12345)

--query
SELECT * FROM CitizenInfo;

-- delete the created table CitizenInfo
DROP TABLE CitizenInfo;

-- create again the same table CitizenInfo + 1 condition in 1 column = UNIQUE Email
CREATE TABLE CitizenInfo(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	Name VARCHAR(200) NOT NULL,
	Age INT,
	Email VARCHAR(200) UNIQUE,
	Phone INT NOT NULL 
);

-- insert values / 
INSERT INTO CitizenInfo
VALUES ('Luis', 88, 'email1@email.com', 1)

--query
SELECT * FROM CitizenInfo;

-- insert values / duplicated email
INSERT INTO CitizenInfo
VALUES ('Luis', 81, 'email1@email.com', 2)

-- insert values 
INSERT INTO CitizenInfo
VALUES ('Luis', 81, 'email5@email.com', 2)

--query
SELECT * FROM CitizenInfo;

-------------------------------------------------

-- DML Data Manipulation Language

-- delete created table 
DROP TABLE CitizenInfo;
