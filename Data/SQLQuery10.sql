CREATE TABLE Partitioned_Table_USA (
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
ON OpenDateScheme_USA (Open_Dt);

INSERT INTO Partitioned_Table_USA
SELECT * FROM Table_USA;

SELECT COUNT(*) AS PartitionedTableCount
FROM Partitioned_Table_USA;

SELECT *
FROM Partitioned_Table_PHIL  
WHERE FLAG != 'A';


WITH RankedCustomers AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY Cust_ID ORDER BY Consul_Dt DESC) AS RowNum
    FROM Partitioned_Table_USA  
)
DELETE FROM RankedCustomers
WHERE RowNum > 1;  -- Keeps the most recent record and deletes older ones