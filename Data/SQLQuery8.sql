CREATE TABLE Partitioned_Table_NYC (
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
ON OpenDateScheme(Open_Dt);


INSERT INTO Partitioned_Table_NYC
SELECT * FROM Table_NYC;


SELECT COUNT(*) AS OriginalTableCount
FROM Table_NYC;

-- Count rows in the partitioned table
SELECT COUNT(*) AS PartitionedTableCount
FROM Partitioned_Table_NYC;

SELECT TOP 10 *
FROM Table_NYC;

SELECT TOP 10 *
FROM Partitioned_Table_NYC;

WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Cust_ID ORDER BY (SELECT NULL)) AS rn
    FROM Partitioned_Table_NYC
)
DELETE FROM CTE
WHERE rn > 1;