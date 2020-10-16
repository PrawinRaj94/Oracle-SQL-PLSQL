-- DECODE
        decode is a function.
		deocde produce the output based on IF the next.. next values satisfy the conditions else it print the final value. -- exact match.

SELECT DECODE ('Superman','Superman','option 1','No_option') FROM DUAL;-- it checks 1 arg and if it matches it goes to 3 arg or else goes to 4 arg.

SELECT DECODE ('Spiderman','Superman','option 1','No_option') FROM DUAL;

SELECT DECODE ('Normalman','Superman' ,'option1'
                          ,'Spiderman','option2'
                          ,'Normalman','option3'
                                      ,'No option')"option" -- it will check 1 arg and once it matches it will go to 3 arg or else goes to 4 arg.
			   FROM DUAL;
			   
SELECT DECODE (NULL,NULL,'Same','Diff') FROM DUAL; -- NULL values in arg1 and arg2 are considered same.

SELECT * FROM Course_tb; -- table

SELECT * FROM course_tb 
   ORDER BY DECODE (C name,'oracle',1
                          ,'python',2
						  ,'AWS'   ,3
						           ,4) ASC; -- it will arrange the values in asc order.
								   
UPDATE Table_name SET gender = DECODE (gender,'M','F','M');

SELECT employee_id, First_name, hire_date, department_id, DECODE(department_id,10,'Admin'
                                                                              ,20,'Market'
																			  ,30,'Purchase'
																		      ,40,'HR'
																	    	  ,50,'Shipping'
																		         ,'Other department') "Department_name"
  FROM employees
 WHERE department_id IN (10,20,30,40,50,60)  
ORDER BY 4;

CASE : it is an expression.In case we can use oracle operators such as "LIKE,BETWEEN AND,=,<,>,<>"
Compared to DECODE, CASE is faster because it follows ANSI stds.
DEOCDE is a sql std but case is sql and plsql std.
DECODE is an oracle std and case is an ansi std.

SELECT employee_id
      ,first_name
	  ,hire_date
	  ,department_id
	  ,CASE 
	       WHEN department_id = 10 THEN 'ADMIN'
		   WHEN department_id = 20 THEN 'MARK'
		   WHEN department_id = 30 THEN 'PURC'
		   WHEN department_id = 40 THEN 'HR'
		   WHEN department_id = 50 THEN 'SHIP'
		   ELSE 'other_department'
	   END "Department_name"
  FROM employees
  WHERE department_id IN (10,20,30,40,50)
  ORDER BY 4;
  
  -----XXXXXX------
  SELECT employee_id
      ,first_name
	  ,hire_date
	  ,department_id
	  ,CASE department_id
	       WHEN 10 THEN 'ADMIN'
		   WHEN 20 THEN 'MARK'
		   WHEN 30 THEN 'PURC'
		   WHEN 40 THEN 'HR'
		   WHEN 50 THEN 'SHIP'
		   ELSE 'other_department'
	   END "Department_name"
  FROM employees
  WHERE department_id IN (10,20,30,40,50)
  ORDER BY 4;
  
  Diff B/W DECODE AND CASE 
  
  DECODE 							CASE
  Function                          Expression
  Exact match                       Operators
  Orale                             ANSI
  Sql std                           Sql & PLSQL
  SLOW                              Faster.
  
  -----------------------------------------------
  SQL --> END         | PLSQL --> ENDCASE
  What ? operator|standard|statement|performance.
  -----------------------------------------------