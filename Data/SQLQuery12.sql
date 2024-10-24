CREATE TABLE Partitioned_Table_PHIL (
    Cust_Name VARCHAR(255),
    Cust_ID VARCHAR(18),
    Open_Dt DATE,
    Consul_Dt DATE,
    VAC_ID CHAR(5),
    DR_Name VARCHAR(255),
    State CHAR(5),
    Country CHAR(5),
    DOB DATE,
    FLAG CHAR(1),
    Age INT,
    Days_Since_Last_Consulted INT
)
ON OpenDateScheme_PHIL(Open_Dt);


INSERT INTO Partitioned_Table_PHIL
SELECT * FROM Table_PHIL;

SELECT *
FROM Partitioned_Table_PHIL;