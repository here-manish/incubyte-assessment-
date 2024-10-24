CREATE TABLE Partitioned_Table_AU (
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
ON OpenDateScheme_AU(Open_Dt);

INSERT INTO Partitioned_Table_AU
SELECT * FROM Table_AUS;

SELECT COUNT(*) AS PartitionedTableCount
FROM Partitioned_Table_AU;

