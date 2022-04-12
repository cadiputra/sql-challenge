--1.list for each employee: employee number, last name, first name, sex, & salary
SELECT employees.emp_no, employees.last_name, employees.first_name,employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--2.List first name, last name, and hire date for employees who were hired in 1986
SELECT employees.first_name, employees.last_name,employees.hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--3. List manager of each department with the following info: dept number, dep name, manager's employee number, last name, first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
ORDER BY dept_manager.dept_no ASC;

--4.List department of each employee with the following info: emp number, last name, first name, dept name
SELECT employees.last_name, employees.first_name,  departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;

--5.List first name, last name, and sex for employees whose first name is "Hercules" and last name begin with "B"
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.List all employees in Sales dept, including employee number, last name, first name, and dept name
SELECT dept_emp.emp_no,employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7.List all employees in the Sales and Development dept, including employee number, last name, first name, and dept name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY departments.dept_name DESC;

--8.List the frequency count of employee last name in descending order
SELECT last_name, COUNT (last_name) AS "Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Last Name" DESC;

SELECT * FROM departments
