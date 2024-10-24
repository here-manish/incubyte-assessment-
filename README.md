🔹Overview:
This repository contains the implementation of the hospital data pipeline assessment. The project demonstrates an end-to-end ETL process for partitioning global hospital customer data based on country. The pipeline ensures scalability, efficiency, and accurate handling of billions of data rows by splitting the data into country-specific tables, adding derived columns for further analysis, and validating the data.

🔸Concepts:
Data Processing
ETL (Extract, Transform, Load)
Partitioning
Data Validation

🔸Tools & Technologies:
SQL Server (SSMS)
Python (for additional validation)
T-SQL Queries
Pandas (Python)

🔹Working:
Data Ingestion: The customer data is loaded into a staging table.
Data Partitioning: Data is split by country into partitioned tables to manage scalability.
Derived Columns:
Age: Calculated based on the date of birth (DOB).
Days_Since_Last_Consulted: Calculated based on the last consultation date.
Data Validation: Ensure no duplicates exist, only active customers are processed, and data accuracy is maintained.
Partitioning by Consultation Date: Allows for more efficient querying and scalability.

🔸Steps Involved:
Create Staging and Country Tables: Tables were created in SQL Server for each country to store partitioned data.
Data Insertion: Customer data from the staging table is inserted into country-specific tables based on country and consultation date.
Derived Columns: Additional columns Age and Days_Since_Last_Consulted were created for better analysis.
Data Partitioning: Data was partitioned to optimize performance for future queries.

🔸How to use:
Run SQL Scripts:
Open .sql files in SQL Server Management Studio (SSMS).
Execute the scripts to create the tables, insert data, and partition it based on the schema.
Run Python Scripts for Validation:
Use the provided Python scripts to validate data such as age calculation and days since last consultation.
Export filtered data to files for further use.
🔸Python Integration:
Use Python to further validate data or perform additional transformations.

Connect Python to SQL Server:
Use pyodbc or mysql-connector-python to establish a connection.

Install packages:
pip install pandas
pip install pyodbc

Run validation scripts:
python validation_script.py

This script will verify the accuracy of derived columns (Age and Days_Since_Last_Consulted) and handle any additional processing.

🔸Installation Guide:

For SQL Server (SSMS):
Ensure that SQL Server Management Studio (SSMS) is installed.
Open and run the SQL scripts to create and manipulate tables.

For Python :
Install the required Python packages:
pip install pandas
pip install pyodbc

🔹References:
SQL Server Documentation : 
Pandas Documentation : https://pandas.pydata.org/docs/



🔹Screenshots:
🔸VS CODE Python:
![image](https://github.com/user-attachments/assets/b587c43e-eeb3-42d6-bbd4-1aa095460f63)



🔸MySQL Workbench:
![image](https://github.com/user-attachments/assets/7525d8d2-0aed-4603-9006-1abe0aefc60f)
![image](https://github.com/user-attachments/assets/c8f24c24-a1d5-4385-916f-3409016d67b5)
![image](https://github.com/user-attachments/assets/7c4eaf1d-2719-45db-9e63-d13343fde381)



