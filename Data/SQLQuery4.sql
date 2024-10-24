use HospitalDB
CREATE TABLE Table_AUS (
    Cust_Name VARCHAR(255) NOT NULL,
    Cust_ID VARCHAR(18) NOT NULL PRIMARY KEY,
    Open_Dt DATE NOT NULL,
    Consul_Dt DATE,
    VAC_ID CHAR(5),
    DR_Name VARCHAR(255),
    State CHAR(5),
    Country CHAR(5),
    DOB DATE,
    FLAG CHAR(1),
    Age INT,
    Days_Since_Last_Consulted INT
);
GO

/*Populating data from staging data*/

INSERT INTO Table_AUS (Cust_Name, Cust_ID, Open_Dt, Consul_Dt, VAC_ID, DR_Name, State, Country, DOB, FLAG, Age, Days_Since_Last_Consulted)
SELECT 
    Cust_Name, Cust_ID, Open_Dt, Consul_Dt, VAC_ID, DR_Name, State, Country, DOB, FLAG,
    DATEDIFF(YEAR, DOB, GETDATE()) AS Age,
    DATEDIFF(DAY, Consul_Dt, GETDATE()) AS Days_Since_Last_Consulted
FROM Staging_Customers
WHERE Country = 'AU'
AND DATEDIFF(DAY, Consul_Dt, GETDATE()) > 30;
GO


CREATE PARTITION FUNCTION OpenDatePartition_AU (DATE)
AS RANGE LEFT FOR VALUES ('2020-01-01', '2021-01-01', '2022-01-01');

CREATE PARTITION SCHEME OpenDateScheme_AU
AS PARTITION OpenDatePartition_AU TO ([PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY]);