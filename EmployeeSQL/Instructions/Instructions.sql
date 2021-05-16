drop table employees;
drop table departments;
drop table salaries;
drop table titles;
drop table dept_manager;
drop table dept_emp;


CREATE TABLE employees (
emp_no int PRIMARY KEY,
birth_date date,
first_name varchar(25) NOT NULL,
last_name varchar(25) NOT NULL,
gender varchar(2),
hire_date date NOT NULL
);
select * from employees;

CREATE TABLE salaries (
emp_no int PRIMARY KEY,
salary int NOT NULL,
from_date date NOT NULL,
to_date date NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
select * from salaries;

CREATE TABLE titles (
emp_no int,
title varchar(30) NOT NULL,
from_date date,
to_date date NOT NULL,
PRIMARY KEY (emp_no, from_date),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
select * from titles;

CREATE TABLE departments (
dept_no varchar(5) PRIMARY KEY,
dept_name varchar(25) NOT NULL	
);
select * from departments;

CREATE TABLE dept_manager (
dept_no varchar(5),
emp_no int PRIMARY KEY,
from_date date NOT NULL,
to_date date NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
select * from dept_manager;

CREATE TABLE dept_emp (
emp_no int,
dept_no varchar(5),
from_date date NOT NULL,
to_date date NOT NULL,
PRIMARY KEY(emp_no, dept_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
select * from dept_emp;

-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary 
from employees
join salaries on employees.emp_no=salaries.emp_no;
-- 2.List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, extract(year from hire_date) as hire_year
from employees
where extract(year from hire_date) = 1986;
-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.last_name
from departments
inner join dept_manager
	on departments.dept_no=dept_manager.dept_no
inner join employees
	on employees.emp_no=dept_manager.emp_no; 
-- 4.List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from departments
inner join dept_emp
	on dept_emp.dept_no=departments.dept_no
inner join employees
	on employees.emp_no=dept_emp.emp_no;
-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, gender
from employees
where first_name = 'Hercules' and last_name like 'B%'; --"B." or "B". ?
-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from departments
inner join dept_emp
	on dept_emp.dept_no=departments.dept_no
inner join employees
	on employees.emp_no=dept_emp.emp_no
where departments.dept_name = 'Sales';
-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from departments
inner join dept_emp
	on dept_emp.dept_no=departments.dept_no
inner join employees
	on employees.emp_no=dept_emp.emp_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';
-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by last_name desc;
