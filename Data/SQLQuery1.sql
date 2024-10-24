USE HospitalDB;  -- Select your database

CREATE TABLE Staging_Customers (
    Cust_Name VARCHAR(255) NOT NULL,
    Cust_ID VARCHAR(18) NOT NULL,
    Open_Dt DATE NOT NULL,
    Consul_Dt DATE,
    VAC_ID CHAR(5),
    DR_Name CHAR(255),
    State CHAR(5),
    Country CHAR(5),
    DOB DATE,
    FLAG CHAR(1),
    PRIMARY KEY (Cust_ID)
);


INSERT INTO Staging_Customers (Cust_Name, Cust_ID, Open_Dt, Consul_Dt, VAC_ID, DR_Name, State, Country, DOB, FLAG)
VALUES 
('Alex', '123457', '2010-10-12', '2012-10-13', 'MVD', 'Paul', 'SA', 'USA', '1987-03-06', 'A'),
('John', '123458', '2010-10-12', '2012-10-13', 'MVD', 'Paul', 'TN', 'IND', '1987-03-06', 'A'),
('Mathew', '123459', '2010-10-12', '2012-10-13', 'MVD', 'Paul', 'WAS', 'PHIL', '1987-03-06', 'A'),
('Matt','12345','2010-10-12','2012-10-13','MVD', 'Paul','BOS','NYC','1987-03-06','A'),
('Jacob','1256','2010-10-12','2012-10-13','MVD', 'Paul', 'VIC','AU','1987-03-06','A');
GO


SELECT * 
FROM Staging_Customers

SELECT COUNT(*) FROM Staging_Customers;


SELECT COUNT(*) FROM Table_India;

-- Check total records in USA table
SELECT COUNT(*) FROM Table_USA;

-- Repeat for other country tables
SELECT COUNT(*) FROM Table_AUS;
SELECT COUNT(*) FROM Table_PHIL;
SELECT COUNT(*) FROM Table_NYC;

SELECT DISTINCT Country FROM Staging_Customers;

-- Check records for a specific country 
SELECT * FROM Staging_Customers WHERE Country = 'AU';
SELECT * FROM Staging_Customers WHERE Country = 'USA';
SELECT * FROM Staging_Customers WHERE Country = 'IND';
SELECT * FROM Staging_Customers WHERE Country = 'PHIL';
SELECT * FROM Staging_Customers WHERE Country = 'NYC';

-- Validate data for INDIA
SELECT * FROM Table_India WHERE Cust_ID IS NOT NULL;

-- Validate data for USA
SELECT * FROM Table_USA WHERE Cust_ID IS NOT NULL;

SELECT *
FROM Partitioned_Table_NYC  -- Do this for each country
WHERE FLAG != 'A';