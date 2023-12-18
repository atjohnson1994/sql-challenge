DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Titles;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Dept_emp;
DROP TABLE IF EXISTS Dept_manager;

CREATE TABLE Employee(
	emp_no VARCHAR(30) NOT NULL,
	emp_title VARCHAR(30) NOT NULL,
	birth_date date,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30) NOT NULL,
	hire_date date,
	PRIMARY KEY (emp_no)
);

CREATE TABLE Salaries(
	emp_no VARCHAR(30) NOT NULL,
	salary VARCHAR(30) NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);
CREATE TABLE Titles(
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id),
	FOREIGN KEY (title_id) REFERENCES Employee(emp_title)
);
CREATE TABLE Departments(
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no),
	FOREIGN KEY (dept_no) REFERENCES dept_emp(dept_no)
);
CREATE TABLE Dept_emp(
	emp_no VARCHAR(30) NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);
CREATE TABLE Dept_manager(
	dept_no VARCHAR(30) NOT NULL,
	emp_no VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);