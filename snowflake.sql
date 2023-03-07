#To list row-level data from a Snowflake table where the row was created more than 180 days ago, you can use the following SQL query:
SELECT *
FROM table_name
WHERE CREATED_ON < DATEADD(day, -180, CURRENT_TIMESTAMP);

#To delete row-level data from a Snowflake table where the row was created more than 180 days ago, you can use the following SQL query:

DELETE FROM table_name
WHERE CREATED_ON < DATEADD(day, -180, CURRENT_TIMESTAMP);



#To delete row-level data from a Snowflake table where the row was created more than 180 days ago and add filters to query the data, you can use the following SQL query:

DELETE FROM table_name
WHERE CREATED_ON < DATEADD(day, -180, CURRENT_TIMESTAMP)
AND column1 = 'value1'
AND column2 = 'value2';


For the Feature Reference Data Retention on Newly Created Tables while creatiing the DB
CREATE OR REPLACE RETENTION POLICY retention_policy_name
    ON table_name
    DELETE AFTER INTERVAL '180' DAY;
Here, retention_policy_name is the name of the retention policy you want to create, and table_name is the name of the table to which the retention policy will be applied. The DELETE AFTER INTERVAL clause specifies that any rows in the table that are older than 180 days will be deleted automatically.



import snowflake.connector

# Set up Snowflake connection parameters
account = 'your_account_name'
user = 'your_user_name'
password = 'your_password'
database = 'your_database_name'
schema = 'your_schema_name'
warehouse = 'your_warehouse_name'
table = 'your_table_name'

# Connect to Snowflake
conn = snowflake.connector.connect(
    user=user,
    password=password,
    account=account,
    warehouse=warehouse,
    database=database,
    schema=schema
)

# Create a cursor object
cur = conn.cursor()

# Define the SQL query to delete rows that were created more than 180 days ago
query = f"DELETE FROM {table} WHERE CREATED_ON < DATEADD(day, -180, CURRENT_TIMESTAMP)"

# Execute the SQL query
cur.execute(query)

# Commit the changes
conn.commit()

# Close the cursor and connection
cur.close()
conn.close()
#########

import snowflake.connector
import argparse
from datetime import datetime

# Set up argument parser to receive the date or year, month, day as arguments
parser = argparse.ArgumentParser()
parser.add_argument('-y', '--year', type=int, help='Year for retention policy')
parser.add_argument('-m', '--month', type=int, help='Month for retention policy')
parser.add_argument('-d', '--day', type=int, help='Day for retention policy')
args = parser.parse_args()

# Validate that all arguments are provided
if not all([args.year, args.month, args.day]):
    parser.error('Please provide year, month, and day arguments')

# Validate that the provided date is a valid date
try:
    retention_date = datetime(args.year, args.month, args.day)
except ValueError:
    parser.error('Invalid date provided')

# Set up Snowflake connection parameters
account = 'your_account_name'
user = 'your_user_name'
password = 'your_password'
database = 'your_database_name'
schema = 'your_schema_name'
warehouse = 'your_warehouse_name'
table = 'your_table_name'

# Connect to Snowflake
conn = snowflake.connector.connect(
    user=user,
    password=password,
    account=account,
    warehouse=warehouse,
    database=database,
    schema=schema
)

# Create a cursor object
cur = conn.cursor()

# Define the SQL query to delete rows that were created before the retention date
query = f"DELETE FROM {table} WHERE CREATED_ON < '{retention_date}'"

# Execute the SQL query
cur.execute(query)

# Commit the changes
conn.commit()

# Close the cursor and connection
cur.close()
conn.close()


#######
execution 
python delete_rows.py -y 2022 -m 1 -d 1
##

This command will execute the Python script and delete rows from the Snowflake table where the CREATED_ON column is older than January 1, 2022.
