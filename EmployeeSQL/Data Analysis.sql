--1) List the employee number, last name, first name, sex,
--and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no


--2) List the first name, last name, and hire date for the employees
--who were hired in 1986
SELECT first_name, last_name, hire_date, EXTRACT(YEAR FROM hire_date) as YEAR
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = '1986'


--3) List the manager of each dept along with their dept number, dept name,
--employee number, last name, and first name
SELECT dm.dept_no, d.dep_name as dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager dm
LEFT JOIN employees e on e.emp_no = dm.emp_no
LEFT JOIN departments d on d.dept_no = dm.dept_no


--4) List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dep_name as dept_name
FROM employees e
LEFT JOIN dept_emp de on e.emp_no = de.emp_no
LEFT JOIN departments d on d.dept_no = de.dept_no


--5) List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'


--6) List each employee in the Sales department, 
--including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dep_name as dept_name
FROM employees e
LEFT JOIN dept_emp de on e.emp_no = de.emp_no
LEFT JOIN departments d on d.dept_no = de.dept_no
WHERE d.dep_name = 'Sales'


--7) List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dep_name as dept_name
FROM employees e
LEFT JOIN dept_emp de on e.emp_no = de.emp_no
LEFT JOIN departments d on d.dept_no = de.dept_no
WHERE d.dep_name in ('Sales', 'Development')


--8) List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name, count(emp_no) AS frequency_count
FROM employees
GROUP BY last_name 
ORDER BY count(emp_no) DESC
