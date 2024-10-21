🔹Overview:
This repository contains implementation of given assessment. The working of data pipeline is demonstarted using tools listed below. Also, a dummy database has been created to demonstarte a simple data flow in different formats from server to the local system, using country-based row filteration.

🔸Concepts:

Data processing
Data visualization
ETL
🔸Tools & Technologies:

Python
MySQL Workbench
XAMPP Server
Pandas
Conda Environment
MySQL connector
🔹Working:
Firstly MySQL database has been created with specified schema.
connector.py python script, fetches database by establishing connection with MySQL server. (Note: Make sure the XAMMP server is running while executing the script)
The retrieved data is fitted into pandas dataframe for further table manipulation.
show_data() & getfile() functions are called to fetch the desired data rows and generating .csv and string file formats to specified path, accepting country names as parameters for filtering rows.
For example: get_file("IND") generates IND.csv to the specified local path. CLick here to see sample output files.
📌Note: This submission is sujected to further improvements.
🔸Installation Guide:

To install mysql.connector:
pip install mysql.connector
To install pandas:
pip install pandas
🔹References:
MySQL Connector Python
Pandas docs
🔹Contribution:
Contributions are always welcomed. Make sure you read the Contribution info

🔹Screenshots:
🔸PyCharm console:


🔸MySQL Workbench:
alt tag

