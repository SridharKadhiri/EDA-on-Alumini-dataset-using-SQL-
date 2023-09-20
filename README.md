# EDA-on-Alumini-dataset-using-SQL-

This project involves various tasks related to managing an alumni database using MySQL for data storage and Python for data manipulation. Below are the tasks performed and corresponding code snippets.

## Task 1: Database Setup

- **Purpose**: Create a new schema named `alumni`.
- **SQL Query**:

```sql
CREATE SCHEMA alumni;
USE alumni;
```

## Task 2: Import CSV Data

- **Purpose**: Import data from CSV files into MySQL tables.
- **SQL Query**: (Import data from CSV files not provided in the code)

## Task 3: Display Table Structure

- **Purpose**: View the structure of six tables.
- **SQL Query**:

```sql
DESC College_A_HS;
DESC College_A_SE;
DESC College_A_SJ;
DESC College_B_HS;
DESC College_B_SE;
DESC College_B_SJ;
```

## Task 4: Display First 1000 Rows with Python

- **Purpose**: Display the first 1000 rows of various tables using Python.
- **Python Code**:

```python
import mysql.connector 
testdb = mysql.connector.connect(host="localhost",
                                user="root",
                                password="2337",
                                database="alumni")
test_cursor = testdb.cursor()
test_cursor.execute("SELECT * FROM College_B_SJ LIMIT 1000")
for i in test_cursor:
    print(i)
```

## Task 5: Import Data into MS Excel

- **Purpose**: Import the first 1500 rows of specified tables into MS Excel.
- **Python Code**: (Code for this task not provided)

## Task 6 to 11: Data Cleaning and View Creation

- **Purpose**: Clean data and create views with no null values for specified tables.
- **SQL Queries** (Sample for College_A_HS):

```sql
-- Task 6
CREATE OR REPLACE VIEW College_A_HS_V AS 
    SELECT * FROM College_A_HS WHERE ...
-- Task 7
CREATE OR REPLACE VIEW College_A_SE_V AS 
    SELECT * FROM College_A_SE WHERE ...
-- Repeat similar queries for Task 8 to Task 11
```

## Task 12: Convert Names to Lowercase

- **Purpose**: Create a procedure to convert names to lowercase for specified views.
- **SQL Query**:

```sql
DELIMITER $$
CREATE PROCEDURE ConvertToLower()
BEGIN
    -- Update views to convert names to lowercase
END $$
DELIMITER ;

-- Call the procedure to perform the conversion
```

## Task 13: Import Views into MS Excel and Create Pivot Charts

- **Purpose**: Import views into MS Excel and create pivot charts based on location.
- **SQL Query**: (Code for Excel integration and chart creation not provided)

## Task 14 and 15: Fetch Names of Students

- **Purpose**: Create procedures to fetch names of students from College A and College B using cursors.
- **SQL Queries** (Sample for College A):

```sql
-- Task 14
DELIMITER $$
CREATE PROCEDURE get_name_A (INOUT name_ LONGTEXT) 
BEGIN
    -- Fetch names from College A and append to the name variable
END $$
DELIMITER ;

-- Call the procedure to get names
```

## Task 16: Calculate Career Choice Percentages

- **Purpose**: Calculate the percentage of career choices for College A and College B alumni.
- **SQL Query**:

```sql
-- Calculate and display career choice percentages
```

This README provides an overview of the tasks performed in this project, including SQL queries and Python code snippets. Additional details, such as Excel integration and chart creation, can be implemented based on specific requirements.
```

Please note that for Task 5 (Import Data into MS Excel) and Task 13 (Import Views into MS Excel and Create Pivot Charts), the solutions are provided in the excel files
