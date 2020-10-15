BOOK BACK PRACTICE 
exe 6 : 
DESC departments;
SELECT * FROM departments;

exe 7 :
DESC employees;

exe 8 :
SELECT employee_id,last_name,job_id,hire_date STARTDATE FROM employees;

exe 9 :
SELECT DISTINCT job_id from employees;
SELECT UNIQUE job_id FROM employees;

exe 10 :
SELECT employee_id EMP#,first_name Employee,job_id Job, hire_date Hiredate FROM employees;

exe 11 :
SELECT last_name||' '||job_id AS "Employee and Title" FROM employees;

exe 12 :
SELECT first_name||','||last_name||','||employee_id||','||job_id||','||hire_date||','||salary AS OUTPUT_TABLE FROM employees;
