# A Mystery in Two Parts
Create a data model using an Entity Relationship Diagram and do an analysis using SQL Queries.

# Tools Used

- SQL
- Python
- Pandas

# Data Modelling

Using 6 CSVs provided, the 6 tables were created. As seen below, we have Primay Keys and Foriegn Keys with some tables having a composite key. We see that tables such as dept_manager and dept_emp have multiple unit ids.

<img src="https://raw.githubusercontent.com/Bandelero/Employee-Database-ERD-and-Queries/main/EmployeeSQL/Instructions/Screenshots/ERD2.png" alt="drawing" width="600"/>

# Data Analysis

The queries were written in PostgresSQL. Here are some exmaples of questions that were asked. 

List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

# Jupyter Notebook

Imported  the SQL database into Pandas and created a histogram and bar chart. To do this I used Pandas dataframes.

<img src="https://raw.githubusercontent.com/Bandelero/Employee-Database-ERD-and-Queries/main/EmployeeSQL/Instructions/Screenshots/Bonus%20Jupyter%20NB.png" alt="drawing" width="600"/>

<img src="https://raw.githubusercontent.com/Bandelero/Employee-Database-ERD-and-Queries/main/EmployeeSQL/Instructions/Screenshots/Bonus%20Jupyter%20NB(2).png" alt="drawing" width="600"/>
