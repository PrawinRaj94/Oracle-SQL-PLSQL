Multiple Row Function (n ---> 1)
    List out some aggregate function/group function
    -- never process null values.
    MIN()
    MAX()
    SUM()
    COUNT() |*| 1

SELECT MIN(salary)
      ,MAX(salary)
      ,SUM(salary)
      ,ROUND(AVG(salary))
      ,COUNT(employee_id) FROM employees;
-- We can use * and 1 only for count.

SELECT count(*) FROM employees;--107
SELECT count(1) FROM employees;--107

Both are same.

SELECT COUNT(commission_pct) FROM employees;--35

--Here we get values which is of not NULL.

--In order to process NULL value.

SELECT COUNT (NVL(commission_pct,0)) FROM employees;--107

To sort department_id = 90.

SELECT COUNT(*) FROM employees WHERE department_id = 90;

--5 Questions
-- Maximum salary in each department.
SELECT department_id,MAX(salary) FROM employees;

Error:ORA-00937: not a single-group group function

-- Maximum salary in each department.(correct form)
SELECT department_id,MAX(salary) FROM employees
GROUP BY department_id
ORDER BY 1;

--Minimum salary from each department
SELECT department_id,MIN(salary) FROM employees
GROUP BY department_id
ORDER BY 1;

--Salary allocated for each department
SELECT department_id,SUM(salary) FROM employees
GROUP BY department_id
ORDER BY 1;

--No of employees working in each department.
SELECT department_id,COUNT(*) FROM employees
GROUP BY department_id
ORDER BY 1;

--AVG salary for each department
SELECT department_id,COUNT(*) FROM employees
GROUP BY department_id
HAVING COUNT(*) > 30
ORDER BY 1;

--Total salary of employee greater than 100000.
SELECT department_id,SUM(salary) FROM employees
WHERE department_id IN (40,50)
GROUP BY department_id
HAVING SUM(salary) > 100000
ORDER BY 1;

ORDER OF WRITING              ORDER OF EXECUTION
SELECT                        FROM
FROM                          WHERE
WHERE                         GROUP BY
GROUP BY                      HAVING
HAVING                        SELECT
ORDER BY                      ORDER BY

-- Query to get DISTINCT value FROM first name column.
SELECT DISTINCT first_name FROM employees;-- to remove duplicate

SELECT UNIQUE first_name FROM employees;-- to remove duplicate

SELECT first_name,COUNT(*) FROM employees
GROUP BY first_name;-- to remove duplicate.

SELECT first_name,COUNT(*) FROM employees
GROUP BY first_name
HAVING COUNT(*) >= 1;-- to remove duplicate.

all the above queries will remove duplicate  values.

-- Query to get duplicate records 
SELECT first_name,COUNT(*) FROM employees
GROUP BY first_name
Having COUNT(*) > 1;

--Query for getting std,sec,gender in desc,and their count.
SELECT standard,section,gender,COUNT(*)
FROM students_detail_tb
GROUP BY standard,section,gender
ORDER BY 1,2,3 DESC;

--How many no.of employees working working under each manager
SELECT manager_id,COUNT(*) FROM employees
GROUP BY manager_id 
HAVING COUNT(*) > 10;

WHERE CLAUSE                     HAVING CLAUSE
follows from clause              follows group by

follows FROM clause              condition depend on group 
                                 function.

Normal function                  After grouping.

-- write a query to get maximum salary above 20000.
SELECT COUNT(*) FROM employees 
HAVING MAX (salary) > 20000;

--write a query to get red color t-shirt
SELECT COUNT(*) FROM orders_tb WHERE tshirt_color = 'Red';

--write a query to status of shipping.
SELECT COUNT(*) FROM orders_tb WHERE status = 'Shipped';

SELECT * FROM orders_tb;

--write a query to get no of orders in each color and size.
SELECT tshirt_color,tshirt_size,status,COUNT(*)
FROM orders_tb
GROUP BY tshirt_color,tshirt_size,status
ORDER BY 1,2,3,4; 

example :SELECT status,COUNT(*) FROM orders_tb
GROUP BY status
ORDER BY 1,2;



    