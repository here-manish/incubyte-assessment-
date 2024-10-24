import pyodbc
import pandas as pd


server = 'KIRAN\SQLEXPRESS' 
database = 'HospitalDB'
username = ''  
password = ''  


connection_string = f"""
    DRIVER={{SQL Server}};
    SERVER={server};
    DATABASE={database};
    Trusted_Connection=yes;
"""

# Establish the connection
conn = pyodbc.connect(connection_string)

# Testing the connection
query = "SELECT * FROM Staging_Customers"

# Fetch the data into a pandas DataFrame
df = pd.read_sql(query, conn)

# Display the result
print(df)

conn.close()