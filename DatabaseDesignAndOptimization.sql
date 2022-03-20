-- IT table. 
-- The script drops table if it exists and recreates it as well as insert values where applicable

DROP TABLE IF EXISTS IT;
CREATE TABLE IT (
	user_id serial PRIMARY KEY,
	name VARCHAR ( 50 ) UNIQUE,
	room VARCHAR ( 50 ),
	grpname VARCHAR ( 50 )
);

-- insert values into IT table
INSERT INTO 
    IT (name, room, grpname)
VALUES
    ('Modesto', 101, 'IT'),
    ('Ayine', 102, 'IT')


-- select * from IT

-- Sales table. 
-- The script drops table if it exists and recreates it as well as insert values where applicable

DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales (
	user_id serial PRIMARY KEY,
	name VARCHAR ( 50 ) UNIQUE,
	room VARCHAR ( 50 ),
	grpname VARCHAR ( 50 )
);

-- insert values into Sales table    

INSERT INTO 
    Sales (name, room, grpname)
VALUES
    ('Christopher', 102, 'Sales'),
    ('Cheong Woo', 'Auditorium A', 'Sales')
	
	
-- Adminstration table. 
-- The script drops table if it exists and recreates it as well as insert values where applicable	
	
DROP TABLE IF EXISTS Adminstration;
CREATE TABLE Adminstration (
	user_id serial PRIMARY KEY,
	name VARCHAR ( 50 ) UNIQUE,
	room VARCHAR ( 50 ),
	grpname VARCHAR ( 50 )
);


-- insert values into Adminstration table

INSERT INTO 
    Adminstration (name, room, grpname)
VALUES
    ('Saulst', NULL, 'Adminstration')
	
-- select * from Adminstration	
	
	

-- Operations table. 
-- The script drops table if it exists and recreates it as well as insert values where applicable	

DROP TABLE IF EXISTS Operations;
CREATE TABLE Operations (
	user_id serial PRIMARY KEY,
	name VARCHAR ( 50 ) UNIQUE,
	room VARCHAR ( 50 ),
	grpname VARCHAR ( 50 )
);


-- insert values into Operations table

INSERT INTO 
   Operations (name, room, grpname)
VALUES
    (NULL, NULL, 'Operations')
	
	
-- select * from Operations

-- Combined table. 
-- The script drops table if it exists and recreates it from a selection of all the four group tables

DROP TABLE IF EXISTS combo_table;
CREATE TABLE combo_table AS
select * from IT
UNION ALL
select * from Sales
UNION ALL
select * from Adminstration
UNION ALL
select * from Operations
ORDER BY name, grpname, room

-- select * from combo_table
