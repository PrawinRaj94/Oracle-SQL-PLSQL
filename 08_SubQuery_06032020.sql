Sub Query.
         Query with in another query.
		    --> Included within ().
			--> Placed on the right side of the operator.
			--> Inner query will execute first and then outer query will be executed(Nested Sub query).
  Nested Sub Query 
    -- Single row sub query.
	-- Multiple row sub query.
	-- Scalar sub query.
	-- In-line view.
	-- multiple column sub query.

-- Single row sub query.
     if your sub query returns exactly one row then it is called as single row sub query.
	 -- < > = <= >= <>.
SELECT employee_id,first_name,hire_date,Salary,department_id
  FROM employees 
  WHERE salary > (SELECT ROUND(AVG(salary))FROM employees); -- Inner query will execute first,based on the output of inner query outer query will be executed.
  
SELECT employee_id,first_name,hire_date,Salary,department_id
  FROM employees 
  WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Neena'); -- Inner query will execute first,based on the output of inner query outer query will be executed.
                                                                            -- This kind of query is Single Row Sub Query also called as Nested sub query.

-- Multiple row sub query
       If your query returns more than it is called as Multiple row sub query
         IN , ALL , ANY.

SELECT employee_id,first_name,hire_date,Salary,department_id
  FROM employees 
  WHERE salary IN (SELECT salary FROM employees WHERE first_name = 'Alexander');if the i/p data is more than one IN function we get both the data and executes outer query.

SELECT employee_id,first_name,hire_date,Salary,department_id
  FROM employees 
  WHERE salary > ALL (SELECT salary FROM employees WHERE first_name = 'Alexander'); if the i/p data is more than one,ALL function will get higher value as input and executes outer query.  

SELECT employee_id,first_name,hire_date,Salary,department_id
  FROM employees 
  WHERE salary > ANY (SELECT salary FROM employees WHERE first_name = 'Alexander'); if the i/p data is more than one,ALL function will get lower value as input and executes.

SELECT 
FROM 
WHERE
--GROUP BY
HAVING
--ORDER BY

-- Scalar sub query
SELECT department_id,COUNT(*) FROM employees
WHERE department_id IN(10,20,30,40,50)
GROUP BY department_id
ORDER BY 1;

-- Adding one more column with the above.

SELECT e.department_id,count(*),d.department_name
FROM employees e,departments d
WHERE e.department_id = d.department_id
AND e.department_id IN(10,20,30,40,50)
GROUP BY e.department_id,d.department_name
ORDER BY 1;

-- Instead we can use Sub Query.
SELECT 
   (SELECT COUNT(*) FROM employees WHERE department_id = 10)"ADMIN"
  ,(SELECT COUNT(*) FROM employees WHERE department_id = 20)"MARKETING"
  ,(SELECT COUNT(*) FROM employees WHERE department_id = 30)"PURCHASING" -- Here we should use dummy table to calculate because it keeps on counting same data.
  ,(SELECT COUNT(*) FROM employees WHERE department_id = 40)"HR"
  ,(SELECT COUNT(*) FROM employees WHERE department_id IN(10,20,30,40))"Total"
FROM DUAL;  


SELECT e.employee_id
      ,e.first_date
      ,e.hire_date
      ,e.department_id
      ,d.department_name
FROM employees e,departments d
WHERE d.department_id = e.department_id; -- Here we join condition.

Instead of this we can use sub query ,we use sub query in between joins also.

SELECT e.employee_id
      ,e.first_name
      ,e.hire_date
      ,e.department_id
      ,(SELECT d.department_name FROM departments d WHERE d.department_id = e.department_id)"dept_name"
FROM employees e;  

Sub query in FROM clause (Inline view)

-- Fetching data from intermediate result set.

SELECT * FROM(SELECT * FROM employees); -- FROM clause will fetch the data from result set(o/p).

-- to find count in department and max count of department
SELECT x.*
   FROM(SELECT department_id,COUNT(*) Dep_ID_CON FROM employees GROUP BY department_id)x
      ,(SELECT MAX(COUNT(*)) Max_Dep_ID_CON FROM employees GROUP BY department_id)y
WHERE x.Dep_ID_CON = y.Max_Dep_ID_CON;

-- For sum of salary and and max sum of salary 
SELECT x.*
   FROM(SELECT department_id,SUM(salary) SUM FROM employees GROUP BY department_id)x
      ,(SELECT MAX(SUM(Salary)) MSUM FROM employees GROUP BY department_id)y
WHERE x.SUM = y.MSUM;

-- For sum of manager_id and a manager who have max employees from department.
SELECT x.*
   FROM(SELECT manager_id,SUM(salary) Man_id FROM employees GROUP BY manager_id)x
      ,(SELECT MAX(SUM(Salary)) MMan_id FROM employees GROUP BY manager_id)y
WHERE x.Man_id = y.MMan_id;

-- By using HAVING clause to write a sub query. 
SELECT department_id,ROUND(AVG(salary)) FROM employees GROUP BY department_id
HAVING AVG(salary) > (SELECT salary FROM employees WHERE first_name = 'Neena');

-- Multiple column sub query 
SELECT * FROM employees 
  WHERE (manager_id,department_id)= (SELECT manager_id,department_id FROM employees WHERE first_name = 'Neena')
  AND first_name <> 'Neena'; 

-- example of WHERE clause.
SELECT e.employee_id,e.first_name,e.hire_date,e.salary,e.department_id FROM employees e
WHERE e.salary > (SELECT ROUND(AVG(salary)) FROM employees); 

SELECT e.employee_id,e.first_name,e.hire_date,e.salary,e.department_id FROM employees e
WHERE e.salary > (SELECT ROUND(AVG(salary)) FROM employees WHERE department_id = 90); 

-- Correlated Sub query.

-- Who are all getting salary more than their department AVG salary
SELECT e.employee_id,e.first_name,e.hire_date,e.salary,e.department_id
FROM employees e
WHERE e.salary > (SELECT ROUND(AVG(salary)) FROM employees 
WHERE department_id = e.department_id);

-- Who are all getting salary more than their manager salary.
SELECT e.employee_id,e.first_name,e.hire_date,e.salary,e.department_id,e.manager_id
FROM employees e
WHERE e.hire_date <(SELECT hire_date FROM employees 
WHERE employee_id = e.manager_id);

IN and EXISTS
--Exists work very fast compared to NOT exist anD IN

SELECT * FROM employees 
WHERE EXISTS(SELECT 1 FROM employees WHERE department_id = 90);

SELECT * FROM employees
WHERE NOT EXISTS (SELECT 1 FROM employees WHERE department_id = 280);

IN <EXISTS> NOT EXISTS.							
