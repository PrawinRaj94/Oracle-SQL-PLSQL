SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM regions;
SELECT * FROM jobs;

To view all tables in schema
SELECT * FROM user_tables;

To view all table objects
SELECT * FROM all_objects;

To Retrieve particular details
SELECT employee_id,first_name,hire_date,salary,department_id FROM employees;

To view the details from all_objects
SELECT owner,object_name,object_type,status FROM all_objects;

Using Operators
SELECT employee_id,first_name,hire_date,salary,salary+5000 FROM employees;
SELECT employee_id,first_name,hire_date,salary,salary*12 FROM employees;

Using Alias
SELECT employee_id,first_name,hire_date,salary,salary+5000 AS "Annual_salary" FROM employees;
SELECT employee_id,first_name,hire_date,salary,salary+5000 	  "Annual_salary" FROM employees;
SELECT employee_id,first_name,hire_date,salary,salary+5000 	   Annual_salary FROM employees;
SELECT employee_id,first_name,hire_date,salary,salary+5000 	  "Annual salary" FROM employees;

Using pipe || concatenation
SELECT first_name||' salary is '||salary salary_details FROM employees;
SELECT first_name||q'['s salary is ]'|| salary salary_details FROM employees;
SELECT ''''''||first_name||'''s salary is '|| salary ||'''''' salary_details FROM employees;

Null
SELECT employee_id,first_name,salary,commission_pct,commission_pct + 10 FROM employees; 

DESCRIBE
DESCRIBE employees;
DESC departments;

Unique and distinct

SELECT DISTINCT job_id FROM employees;
SELECT UNIQUE department_id FROM employees;

DUAL table
SELECT 12*1000 + 100 FROM DUAL;
SELECT 'PRAVEEN RENGARAJ' "NAME",25000 salary FROM dual;




