--CREATE TABLES
DROP TABLE departments
CREATE TABLE departments (
dept_no VARCHAR(30) PRIMARY KEY,
dept_name VARCHAR(30)
);

select * FROM departments 

DROP TABLE employees
CREATE TABLE employees (
emp_no INT,
emp_title_id VARCHAR(30),
birth_date DATE NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
sex VARCHAR(1) NOT NULL,
hire_date DATE NOT NULL,
PRIMARY KEY (emp_no, emp_title_id)
);

select * FROM employees

DROP TABLE dept_emp
CREATE table dept_emp (
emp_no INT,
dept_no VARCHAR(30) NOT NULL references departments(dept_no),
emp_title_id VARCHAR(30) NOT NULL,
FOREIGN KEY (emp_no, emp_title_id) references employees(emp_no, emp_title_id),
PRIMARY KEY (emp_no, dept_no)
);

ALTER TABLE dept_emp DROP COLUMN emp_title_id;

select * FROM dept_emp

DROP TABLE dept_manager
CREATE TABLE dept_manager (
dept_no VARCHAR(30),
emp_no INT,
emp_title_id VARCHAR(30) NOT NULL,
FOREIGN KEY (emp_no, emp_title_id) references employees (emp_no, emp_title_id),
PRIMARY KEY (dept_no, emp_no)
);

ALTER TABLE dept_manager DROP COLUMN emp_title_id;
select * FROM dept_manager

DROP TABLE salaries
CREATE TABLE salaries (
emp_no INT,
salary INT,
emp_title_id VARCHAR(30) NOT NULL,
FOREIGN KEY (emp_no, emp_title_id) references employees (emp_no, emp_title_id)
);

ALTER TABLE salaries DROP COLUMN emp_title_id;
select * FROM salaries

DROP TABLE titles
CREATE TABLE titles(
	emp_title_id VARCHAR(10) NOT NULL,
	title VARCHAR(40) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no,emp_title_id) REFERENCES Employees(emp_no,emp_title_id),
	PRIMARY KEY (emp_title_id, title)
);
ALTER TABLE titles DROP COLUMN emp_no;
select * FROM titles