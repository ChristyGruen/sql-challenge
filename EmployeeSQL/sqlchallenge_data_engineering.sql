-- DATA ENGINEERING



--https://stackoverflow.com/questions/435424/postgresql-how-to-create-table-only-if-it-does-not-already-exist
-- create departments with dept_no primary key

create table if not exists departments (dept_no varchar(20) not null primary key, dept_name varchar(100));
select * from departments;

-- doesn't work in c drive due to permissions
-- copy departments(dept_no, dept_name)
-- from 'C:\Users\chrisgru\UofM-VIRT_Class_Assignments\sql-challenge\EmployeeSQL\data\departments.csv'
-- delimiter ','
-- csv header;
-- select * from departments


-- create titles table with title_id primary key

create table if not exists titles (title_id varchar(20) not null primary key, title varchar(100));
select * from titles;

-- copy titles (title_id, title)
-- from 'C:\Users\chrisgru\UofM-VIRT_Class_Assignments\sql-challenge\EmployeeSQL\data\titles.csv'
-- delimiter ','
-- csv header;
-- select * from titles

-- create employees table with emp_no primary key

create table if not exists employees (emp_no integer not null primary key,  
									  title_id varchar(20), 
									  birth_date date, 
									  first_name varchar(50), 
									  last_name varchar(50), 
									  sex varchar(5), 
									  hire_date date );
select * from employees;

-- copy employees (emp_no, title_id, birth_date, first_name, last_name, sex, hire_date)
-- from 'C:\Users\chrisgru\UofM-VIRT_Class_Assignments\sql-challenge\EmployeeSQL\data\employees.csv'
-- delimiter ','
-- csv header;
-- select * from employees

--https://kb.objectrocket.com/postgresql/postgresql-composite-primary-keys-629
-- create dept_emp table with composite key emp_no and dept_no

create table if not exists dept_emp (emp_no integer not null , dept_no varchar(20) not null, primary key (emp_no, dept_no));
select * from dept_emp;

-- copy dept_emp(emp_no, dept_no)
-- from 'C:\Users\chrisgru\UofM-VIRT_Class_Assignments\sql-challenge\EmployeeSQL\data\dept_emp.csv'
-- delimiter ','
-- csv header;
-- select * from dept_emp

-- create dept_manager table with composite key emp_no and dept_no  (emp_no is not repeated, but if addl info added, may not be unique)

create table if not exists  dept_manager (dept_no varchar(20) not null, emp_no integer not null, primary key (emp_no, dept_no));
select * from dept_manager;

-- copy dept_manager(dept_no, emp_no)
-- from 'C:\Users\chrisgru\UofM-VIRT_Class_Assignments\sql-challenge\EmployeeSQL\data\dept_manager.csv'
-- delimiter ','
-- csv header;
-- select * from dept_manager

-- create salaries table emp_no primary key

create table if not exists salaries (emp_no integer not null primary key, salary integer);
select * from salaries;

-- copy salaries(emp_no, salary)
-- from 'C:\Users\chrisgru\UofM-VIRT_Class_Assignments\sql-challenge\EmployeeSQL\data\salaries.csv'
-- delimiter ','
-- csv header;
-- select * from salaries

-- add foreign keys to tables
--https://tableplus.com/blog/2018/08/postgresql-how-to-add-a-foreign-key.html

ALTER TABLE employees
add constraint employees_title_id_fkey FOREIGN KEY (title_id) references titles (title_id);

ALTER TABLE dept_emp
add constraint dept_emp_dept_no_fkey FOREIGN KEY (dept_no) references departments (dept_no);

ALTER TABLE dept_emp
add constraint dept_emp_emp_no_fkey FOREIGN KEY (emp_no) references employees (emp_no);

ALTER TABLE dept_manager
add constraint dept_manager_dept_no_fkey FOREIGN KEY (dept_no) references departments (dept_no);

ALTER TABLE dept_manager
add constraint dept_manager_emp_no_fkey FOREIGN KEY (emp_no) references employees (emp_no);

ALTER TABLE salaries
add constraint salaries_emp_no_fkey FOREIGN KEY (emp_no) references employees (emp_no);