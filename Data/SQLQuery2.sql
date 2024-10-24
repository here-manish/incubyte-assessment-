USE HospitalDB;  -- Select your database

CREATE TABLE Table_India (
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
    Age INT,
    Days_Since_Last_Consulted INT,
    PRIMARY KEY (Cust_ID)
);


SELECT * FROM Table_India;
GO

INSERT INTO Table_India (Cust_Name, Cust_ID, Open_Dt, Consul_Dt, VAC_ID, DR_Name, State, Country, DOB, FLAG, Age, Days_Since_Last_Consulted)
SELECT 
    Cust_Name, Cust_ID, Open_Dt, Consul_Dt, VAC_ID, DR_Name, State, Country, DOB, FLAG,
    DATEDIFF(YEAR, DOB, GETDATE()) AS Age,
    DATEDIFF(DAY, Consul_Dt, GETDATE()) AS Days_Since_Last_Consulted
FROM Staging_Customers
WHERE Country = 'IND'
AND DATEDIFF(DAY, Consul_Dt, GETDATE()) > 30; -- Fetch only customers who were consulted more than 30 days ago
GO

CREATE PARTITION FUNCTION OpenDatePartition_INDIA (DATE)
AS RANGE LEFT FOR VALUES ('2020-01-01', '2021-01-01', '2022-01-01');

CREATE PARTITION SCHEME OpenDateScheme_INDIA
AS PARTITION OpenDatePartition_INDIA TO ([PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY]);



SELECT Cust_Name, DOB, Age, 
CASE 
    WHEN Age = DATEDIFF(YEAR, DOB, GETDATE()) THEN 'Correct' 
    ELSE 'Incorrect' 
END AS Age_Check
FROM Table_India;

ALTER TABLE Table_india
ADD AGE INT,
    DAYS_SINCE_LAST_CONSULTED INT;



/*validating*/
SELECT * FROM Table_India WHERE Cust_Name IS NULL OR Cust_ID IS NULL;

SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Table_India';

ALTER TABLE Table_India
DROP COLUMN AGE;

ALTER TABLE Table_India
DROP COLUMN DAYS_SINCE_LAST_CONSULTED;