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

# Load the data from SQL
query = "SELECT * FROM Staging_Customers"
df = pd.read_sql(query, conn)


df['DOB'] = pd.to_datetime(df['DOB'], format='%Y-%m-%d')

# Calculate age 
df['Calculated_Age'] = (pd.to_datetime('today') - df['DOB']).dt.days // 365

df['Age_Validation'] = df['Age'] == df['Calculated_Age']
print(df[['Cust_Name', 'Age', 'Calculated_Age', 'Age_Validation']])

# Close the connection
conn.close()
