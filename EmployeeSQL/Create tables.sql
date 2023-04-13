CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR
);


CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR(1),
	hire_date DATE NOT NULL
);


CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dep_name VARCHAR NOT NULL
);


CREATE TABLE salaries(
	emp_no INT REFERENCES employees(emp_no),
	salary INT
);


CREATE TABLE dept_emp(
	emp_no INT REFERENCES employees(emp_no),
	dept_no VARCHAR(4) REFERENCES departments(dept_no)
);


CREATE TABLE dept_manager(
	dept_no VARCHAR(4) REFERENCES departments(dept_no),
	emp_no INT REFERENCES employees(emp_no)
);



