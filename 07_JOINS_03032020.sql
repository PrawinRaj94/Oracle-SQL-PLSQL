JOINS : Selecting Data From Multiple Table:
SELECT * FROM employees;
SELECT * FROM departments; -- department_id (common in both tables)
SELECT * FROM locations; --location_id(common in both tables)

Types of join:

Equi Join    -- Match records from both tables
outer join   -- match records + Unmatched records 
             -- Right outer join.(matched + unmatched records from right side table)
             -- Left outer join.(matched + unmatched records from left side table)
             -- Full outer join.(matched + unmatched records from both sides of the table)
Self join    --(selecting the data within the table,(more than a process can do within a table))
Cross join   --(it will match with first column of first table to first column of second table)
Natural join -- 

Students_tb             course_tb
------------            ---------------
s_name  c_id            c_id    c_name
------------            ---------------
name_01   20            10     big data
name_02   40            20     oracle
name_03   10            30     Selenium
name_04   30            40     AWS
name_05   60            50     Testing
------------            ---------------
--------------------------------------------------------------------------------
Equi join          |Right Outer join   |Left Outer join    |Full Outer join    |                        
---------------    |-----------------  |-----------------  |-----------------  |
s.c_id = c.c_id    |s.c_id(+) = c.c_id |s.c_id = c.c_id(+) |-----------------  |
---------------    |-----------------  |-----------------  |-----------------  |
S_name   C_name    |S_name     C_name  |S_name     C_name  |S_name     C_name  |
---------------    |-----------------  |-----------------  |-----------------  |
name_01  oracle    |name_01   oracle   |name_01   oracle   |name_01   oracle   |
name_02  AWS       |name_02   AWS      |name_02   AWS      |name_02   AWS      |
name_03  bigdata   |name_03   bigdata  |name_03   bigdata  |name_03   bigdata  |
name_04  selenium  |name_04   selenium |name_04   selenium |name_04   selenium |
                   |   -       Testing |name_05            |name_05     -      |
                   |   				   |				   |    -     Testing  |
--------------------------------------------------------------------------------
-- EQUI JOINT(to get matched records)
SELECT employees.employee_id
      ,employees.first_name
      ,employees.hire_date
      ,employees.salary
      ,employees.department_id
      ,departments.department_name
 FROM employees,departments
WHERE employees.department_id = departments.department_id;
-- instead of using full name we can use the following
SELECT e.employee_id
      ,e.first_name
      ,e.hire_date
      ,e.salary
      ,e.department_id
      ,d.department_name
  FROM employees e,departments d
WHERE e.department_id = d.department_id;

Outer join (matched + unmatched records)
-- Right Outer Join(matched records + unmatched records FROM right side table)
SELECT e.employee_id
      ,e.first_name
      ,e.hire_date
      ,e.salary
      ,e.department_id
      ,d.department_name
  FROM employees e,departments d
WHERE d.department_id(+) = e.department_id;

Left join (matched + unmatched records)
-- Left Outer Join(matched records + unmatched records FROM Left side table)
SELECT e.employee_id
      ,e.first_name
      ,e.hire_date
      ,e.salary
      ,e.department_id
      ,d.department_name
  FROM employees e,departments d
WHERE d.department_id = e.department_id(+);

-- Self Join (Select data within a table)
SELECT e.employee_id
      ,e.first_name
      ,e.hire_date
      ,e.salary
      ,e.manager_id
      ,m.first_name "Manager_name"
      ,m.hire_date"MHDT"
      ,m.salary"Man_Sal"
 FROM employees e,employees m
WHERE e.manager_id = m.employee_id;

-- Who are all getting salary more than their manager salary
SELECT e.first_name
      ,e.hire_date
      ,e.salary
      ,e.department_id
      ,e.manager_id
      ,m.first_name
      ,m.salary
 FROM employees e,employees m
WHERE e.manager_id = m.employee_id
AND m.salary < e.salary

-- Who are all hired before their manager.
SELECT e.employee_id
      ,e.first_name
      ,e.hire_date
      ,e.salary
      ,e.manager_id
      ,m.first_name "Manager_name"
      ,m.hire_date"MHDT"
      ,m.salary"Man_Sal"
 FROM employees e,employees m
WHERE e.manager_id = m.employee_id
AND m.hire_date < e.hire_date;

-- Keywords for 
WHERE            --------------> ON
EQUI             --------------> JOIN
OUTER JOIN 
Right outer join ---------------> RIGHT(OUTER)JOIN
Left outer join  ---------------> LEFT (OUTER)JOIN
FULL outer join  ---------------> FULL (OUTER)JOIN
SELF JOIN        ---------------> INNER JOIN
CROSS JOIN       ---------------> CROSS JOIN
NATURAL JOIN     ---------------> NATURAL JOIN

--> instead of using normal ways,Using keywords
SELECT e.employee_id
      ,e.first_name
      ,e.hire_date
      ,e.department_id
      ,d.department_name
FROM employees e FULL JOIN departments d
ON e.department_id = d.department_id;

--> To get unmatched FROM both tables:
<FULL JOIN> MINUS <JOIN> CROSS JOIN

SELECT e.employee_id
      ,e.first_name
      ,e.hire_date
      ,e.department_id
      ,d.department_name
FROM employees e FULL JOIN departments d
ON d.department_id = e.department_id 
MINUS --- > using this keyword to subtract both full join and equi join 
SELECT e.employee_id
      ,e.first_name
      ,e.hire_date
      ,e.department_id
      ,d.department_name
FROM employees e JOIN departments d
ON d.department_id = e.department_id;

Wrong join ~ it will happen if you ignore the join condition/invalid join condition

Result: M X N.

To ignore this we have to put valid join condition 
SELECT e.employee_id
      ,e.first_name
      ,e.hire_date
      ,e.salary
      ,e.manager_id
      ,m.first_name"Manager_Name"
      ,m.hire_date"MHDT"
      ,m.salary "MAN_SAL"
FROM employees e CROSS JOIN employees m;

SELECT 107*107 FROM dual;

SELECT * FROM employees,departments -- cross join

--Selecting data from 3 different table.
SELECT e.employee_id
      ,e.first_name
      ,e.hire_date
      ,e.salary
      ,e.department_id
      ,d.department_name
      ,l.street_address
FROM employees e,departments d,locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id;

 N    N-1 conditon required
100   99

-- Selecting the data from 3 different table using keywords 
-- Selecting data from 3 different table.
SELECT e.employee_id
      ,e.first_name
      ,e.hire_date
      ,e.salary
      ,e.department_id
      ,d.department_name
      ,l.street_address
FROM employees e JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

----> faster results --> L-->R
Keep the table which contains less no of records on left side.

Display department_name with its minimum salary,maximum salary and sum of salary
SELECT d.department_name
      ,e.department_id
      ,MIN(salary)
      ,MAX(salary)
      ,SUM(salary) 
FROM employees e,departments d
GROUP BY d.department_name,e.department_id
ORDER BY department_name ASC;