-- DATA ANALYSIS

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e, salaries s
where e.emp_no = s.emp_no
order by e.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees 
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from departments d, dept_manager dm, employees e
where d.dept_no = dm.dept_no
and dm.emp_no = e.emp_no
order by d.dept_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e, dept_emp de, departments d
where e.emp_no = de.emp_no
and de.dept_no = d.dept_no
order by e.emp_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select first_name, last_name, sex
from employees
where first_name in ('Hercules')
and last_name like ('B%')
order by last_name

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e, dept_emp de, departments d
where e.emp_no = de.emp_no
and de.dept_no = d.dept_no
and d.dept_name = 'Sales'
order by e.emp_no

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e, dept_emp de, departments d
where e.emp_no = de.emp_no
and de.dept_no = d.dept_no
and d.dept_name in ('Sales','Development')
order by e.emp_no

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
select last_name, count(last_name) as "count_by_last_name" from employees
group by last_name
order by "count_by_last_name"
