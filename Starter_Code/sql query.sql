--1 List the employee number, last name, first name, sex, and salary of each employee.
SELECT Employee.emp_no, last_name, first_name, sex, Salaries.salary
    FROM employee
    JOIN Salaries ON Employee.emp_no = Salaries.emp_no;

--2 List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
    FROM employee
    WHERE hire_date >= '1986-01-01'
		AND hire_date <= '1986-12-31';

--3 List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employee.last_name, employee.first_name
    FROM dept_manager 
    JOIN departments ON dept_manager.dept_no = departments.dept_no
	JOIN employee ON dept_manager.emp_no = employee.emp_no;

--4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, employee.emp_no, employee.last_name, employee.first_name, departments.dept_name
	FROM employee
	JOIN dept_emp ON employee.emp_no = dept_emp.emp_no
	JOIN departments ON dept_emp.dept_no = departments.dept_no;

--5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
	FROM employee
	WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

--6 List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employee.emp_no, last_name, first_name
	FROM employee
	JOIN dept_emp ON employee.emp_no = dept_emp.emp_no
	WHERE dept_emp.dept_no = 'd007';

--7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employee.emp_no, last_name, first_name, departments.dept_name
	FROM employee
	JOIN dept_emp ON employee.emp_no = dept_emp.emp_no
	JOIN departments ON dept_emp.dept_no = departments.dept_no
	WHERE dept_emp.dept_no = 'd007'
	OR dept_emp.dept_no = 'd005';

--8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Last Name Frequency"
	FROM employee
	GROUP BY last_name
	ORDER BY "Last Name Frequency" DESC;
