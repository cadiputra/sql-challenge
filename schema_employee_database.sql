-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/XfAeDi
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.



--  DROP TABLE departments CASCADE;
--  DROP TABLE dept_emp CASCADE;
--  DROP TABLE dept_manager CASCADE;
--  DROP TABLE employees CASCADE;
--  DROP TABLE salaries CASCADE;
--  DROP TABLE titles CASCADE;


-- Create and check departments table
CREATE TABLE "departments" (
    "dept_no" VARCHAR  NOT NULL,
    "dept_name" VARCHAR  NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

SELECT * FROM departments;

-- Create and check dept_emp table
CREATE TABLE "dept_emp" (
    "emp_no" VARCHAR   NOT NULL,
    "dept_no" VARCHAR NOT NULL
);

SELECT * FROM dept_emp;

-- Create and check dept_manager table
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR  NOT NULL,
    "emp_no" VARCHAR   NOT NULL
);

SELECT * FROM dept_manager;

-- Create and check employees table
CREATE TABLE "employees" (
    "emp_no" VARCHAR   NOT NULL,
    "title_id" VARCHAR NOT NULL,
    "birth_date" VARCHAR (10)  NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR  NOT NULL,
    "hire_date" VARCHAR (10)  NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

SELECT * FROM employees;

-- Create and check salaries table
CREATE TABLE "salaries" (
    "emp_no" VARCHAR   NOT NULL,
    "salary" INT   NOT NULL
);

SELECT * FROM salaries;

-- Create and check titles table
CREATE TABLE "titles" (
    "title_id" VARCHAR NOT NULL,
    "title" VARCHAR NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

SELECT * FROM titles;


-- Assign relationships between tables
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

