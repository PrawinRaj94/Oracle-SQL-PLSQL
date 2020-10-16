using WHERE clause
SELECT * FROM employees WHERE department_id = 10;
SELECT * FROM employees WHERE first_name = 'Steven';
SELECT * FROM employees WHERE hire_date = '17-DEC-94';

Examples of WHERE Clause
SELECT employee_id ,first_name,hire_date,salary,department_id
FROM employees
WHERE department_id = 90;

SELECT employee_id ,first_name,hire_date,salary,department_id
FROM employees
WHERE salary >= 17000;

SELECT employee_id ,first_name,hire_date,salary,department_id
FROM employees
WHERE first_name = 'Steven';

SELECT employee_id ,first_name,hire_date,salary,department_id
FROM employees
WHERE hire_date = '17-DEC-94';

Numerical operators 
 < > <= >= <> != ^=
 
Oracle operators
 IN, BETWEEN..AND.. , LIKE , IS NULL 
 NOT IN , NOT BETWEEN..AND.. , NOT LIKE , IS NOT NULL.
 
Logical operators
 AND, OR, NOT.
 
Examples
SELECT employee_id,first_name,hire_date,salary,department_id 
FROM employees
WHERE department_id IN (10,60,90);

SELECT employee_id,first_name,hire_date,salary 
FROM employees
WHERE first_name IN ('Steven','Adam','Bruce');

SELECT employee_id,first_name,hire_date,salary,department_id
FROM employees
WHERE department_id NOT IN (10,60,90);

Note: 
--!-- WHERE department_id IN (10,60,90);
--!-- WHERE first_name IN ('Steven','Adam','Praveen');

SELECT employee_id,first_name,hire_date,salary,department_id FROM employees
WHERE salary BETWEEN 10000 AND 19000;

SELECT employee_id,first_name,hire_date,salary,department_id FROM employees
WHERE hire_date BETWEEN '01-JAN-94' AND '31-DEC-94';

SELECT * FROM COUNTRIES WHERE
REGION_ID BETWEEN '2' AND '4';

SELECT employee_id,first_name,hire_date,salary,department_id FROM employees
WHERE salary  NOT BETWEEN 10000 AND 17000;

LIKE operators / pattern matching / wildcard search
  %: something / NOTHING
  _: one charecter 
  
SELECT first_name FROM employees WHERE first_name LIKE 'S%';

SELECT first_name FROM employees WHERE first_name LIKE '%n';

SELECT first_name FROM employees WHERE first_name LIKE 'S%n';

SELECT first_name FROM employees WHERE first_name LIKE 'Steven%';

SELECT first_name FROM employees WHERE first_name LIKE '%man%';

SELECT first_name FROM employees WHERE first_name LIKE '_t%';

SELECT first_name FROM employees WHERE first_name LIKE '__V%';

SELECT first_name FROM employees WHERE first_name LIKE '_t_v%';

SELECT first_name FROM employees WHERE first_name LIKE '____';

SELECT * FROM user_tables WHERE table_name LIKE'%COUNTRIES%';

SELECT * FROM COUNTRIES WHERE country_name LIKE '%an%';

SELECT * FROM COUNTRIES WHERE country_name LIKE '____a%';

SELECT * FROM COUNTRIES WHERE email_id LIKE '___$_%' ESCAPE '$';

SELECT * FROM COUNTRIES WHERE email_id NOT LIKE '%/%' ESCAPE '/';

SELECT employee_id,first_name,hire_date,salary,department_id,commission_pct
FROM employees 
WHERE commission_pct NOT NULL;

SELECT employee_id,first_name,hire_date,salary,department_id,commission_pct
FROM employees 
WHERE commission_pct NULL;

SELECT employee_id,first_name,hire_date,salary,department_id
FROM employees
WHERE department_id = 50 AND first_name ='Steven';

SELECT employee_id,first_name,hire_date,salary,department_id
FROM employees
WHERE department_id = 50 OR first_name = 'Steven';

SELECT employee_id,first_name,hire_date,salary,department_id
FROM employees
WHERE (department_id = 90 OR department_id = 50) AND first_name = 'Steven';

Assending and Desending 

SELECT employee_id,first_name,hire_date,department_id
FROM employees 
ORDER BY first_name ASC;

SELECT employee_id,first_name,hire_date,department_id 
FROM employees
ORDER BY first_name DESC;

SELECT employee_id,first_name,hire_date,department_id
FROM employees
ORDER BY first_name;(default)

SELECT employee_id,first_name,hire_date,department_id 
FROM employees
ORDER BY 5 DESC;

SELECT employee_id,first_name,hire_date,department_id,salary,12*salary sal
FROM employees
ORDER BY sal DESC;

SELECT employee_id,first_name,hire_date,department_id,salary
FROM employees
ORDER BY department_id ASC,salary  ASC;

SELECT employee_id,first_name,hire_date,department_id,salary
FROM employees
ORDER BY 4,5;

SELECT employee_id,first_name,hire_date,department_id,salary
FROM employees
ORDER BY department_id DESC NULLS LAST;

SELECT employee_id,first_name,hire_date,department_id,salary
FROM employees
ORDER BY department_id ASC NULLS FIRST;





















