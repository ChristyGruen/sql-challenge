-- DATA ENGINEERING

--https://stackoverflow.com/questions/435424/postgresql-how-to-create-table-only-if-it-does-not-already-exist
-- create departments with dept_no primary key
create table if not exists departments (dept_no varchar(20) not null primary key, dept_name varchar(100));
select * from departments

-- create titles table with title_id primary key
create table if not exists titles (title_id varchar(20) not null primary key, title varchar(100));
select * from titles

-- create employees table with emp_no primary key
create table if not exists employees (emp_no integer not null primary key,  
									  title_id varchar(20), 
									  birth_date date, 
									  first_name varchar(50), 
									  last_name varchar(50), 
									  sex varchar(5), 
									  hire_date date );
select * from employees


--https://kb.objectrocket.com/postgresql/postgresql-composite-primary-keys-629
-- create dept_emp table with composite key emp_no and dept_no
create table if not exists dept_emp (emp_no integer not null , dept_no varchar(20) not null, primary key (emp_no, dept_no));
select * from dept_emp

-- create dept_manager table with composite key emp_no and dept_no  (emp_no is not repeated, but if addl info added, may not be unique)
create table if not exists  dept_manager (dept_no varchar(20) not null, emp_no integer not null, primary key (emp_no, dept_no));
select * from dept_manager


-- create salaries table with emp_no primary key
create table if not exists salaries (emp_no integer not null primary key, salary integer);
select * from salaries


