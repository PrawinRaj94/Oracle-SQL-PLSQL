FUNCTION: Relation B/W input and outputs
	Single Row Function (n no.of inputs and n no. of outputs)
		case Function
			case Manipulation
				UPPER()			LOWER()			INITCAP()
			Character Manipulation 
				LENGTH() 		CONCAT() 		REVERSE()
				SUBSTR()		INSTR()
				LPAD()			RPAD()
				LTRIM()			RTRIM() 		TRIM()
				REPLACE()		TRANSLATE()
			Number Function
				ROUND()			TRUNC()			MOD()		POWER()
				ABS()			SIGN()			CEIL()		FLOOR()
			Date Function
				MONTHS_BETWEEN() 	ADD_MONTHS()	NEXT_DAY()		LAST_DAY()
			Type Conversion 
				TO_NUMBER()		TO_CHAR()		TO_DATE()
			General Function | Null function
				NVL()			NVL2()			NULLIF()	COALESCE()
			Multiple Row Function (n -> 1)
				Group Function / Aggregate Function
						MIN()
						MAX()
						SUM()
						AVG()
						COUNT()
				
				GROUP BY & HAVING
				
				DECODE & CASE
	Single Row Function (n -> n)
			case Function
			
	Case Manipulation Function
	SELECT first_name,UPPER(first_name),LOWER(first_name),INITCAP(first_name)
	FROM employees;
	
	SELECT INITCAP ('i love to work on monday') "Quote" FROM DUAL;
	
	SELECT employee_id,first_name,hire_date,salary 
	FROM employees
	WHERE LOWER (first_name) = LOWER('STEven');
	
	Character Manipulation Function
	SELECT first_name,LENGTH(first_name) name_len,INITCAP(REVERSE(first_name)) rev_name,CONCAT(first_name,last_name) name 
	FROM employees 
	WHERE LENGTH(first_name) = 5;
	
	--!--
	WHERE department_id IN (10,20,30)			WHERE department_id = 10 OR department_id = 20;
	WHERE salary BETWEEN 5000 AND 8000 			WHERE salary >= 5000 AND salary <= 8000
	WHERE LENGTH (first_name) = 5;				WHERE first_name LIKE '_____';
	
	--!-- SUBSTR() is used to get part of the string
	--!-- DIFF B/W SUBSTR() AND INSTR()
	
	arg_1 Input String
	arg_2 Starting Position
	arg_3 no of charecters to print -- Not ending position
	
	SELECT first_name,SUBSTR(first_name, 1 , 3) "SUB_01",SUBSTR(first_name, 2 , 3) "SUB_02",
	SUBSTR(first_name, 2 ) "SUB_03",SUBSTR(first_name, 7 , 3) "SUB_04",SUBSTR(first_name , -2 , 2) "SUB_05"
	FROM employees;

	SELECT SUBSTR (2000 - 1 , -2 , 2) "SUB1"
		  ,SUBSTR('2000 - 1', -2 , 2) "SUB2"
		   FROM DUAL;
	
	--!--INSTR() is used to find the position of the particular character.
	Need name with 2 no of a or more
	SELECT first_name,INSTR(LOWER(first_name),'a') 		  "INSTR_01"
	                 ,INSTR(LOWER(first_name),'a', 1 , 2) "INSTR_02"
					 ,INSTR(LOWER(first_name),'a', 1 , 3) "INSTR_03"
	FROM employees
	WHERE INSTR(LOWER(first_name),'a') <> 0;
	
	Need name with exactly 2 a 
	SELECT first_name,INSTR(LOWER(first_name),'a') "INSTR_01",INSTR(LOWER(first_name),'a', 1 , 2) "INSTR_02",INSTR(LOWER(first_name), 'a', 1 , 3) "INSTR_03"
	FROM employees
	WHERE INSTR(LOWER(first_name),'a') <> 0 AND INSTR(LOWER(first_name), 'a', 1 , 3) "INSTR_03"
	
	Need name with 3 no of a / exactly 3 a
	
    SELECT first_name
       ,INSTR(LOWER(first_name),'a') "INSTR_01"
       ,INSTR(LOWER(first_name),'a', 1 , 2) "INSTR_02"
       ,INSTR(LOWER(first_name),'a', 1 , 3) "INSTR_03"
	FROM employees
	WHERE INSTR(LOWER(first_name), 'a', 1 , 3) <> 0 ;
	
	Left Pad And Right pad
	SELECT first_name,salary,LPAD(salary, 8 , 0) "LPAD",RPAD(salary, 8 , ' ')"RPAD"
	FROM employees;
	
	-- REPORTING
	SELECT employee_id ||' '|| RPAD(first_name, 13 ,' ')|| '  ' || LPAD(salary , 5 , ' ') sal_details  
	FROM employees
	WHERE department_id IN (10,60,90);
	
	TRIM()
	SELECT '00000001235464214600000' "DATA"
		   ,LTRIM ('0000000120908970000','0') "LTRIM"
		   ,RTRIM ('0000000120908970000','0') "RTRIM"
		   ,RTRIM(LTRIM('0000000120908970000','0'),'0')"TRIM"
		   ,TRIM ('0' FROM '00000001235464214600000') "TRIM"
		   FROM DUAL
		   
	SELECT LENGTH (TRIM('Stevan')) FROM DUAL;
	
	REPLACE AND TRANSLATE	
	SELECT 'welcome to oracle session ' "DATA",REPLACE ('welcome to oracle seesion','cl','xy') "REPLACE",TRANSLATE('welcome to oracle session','LC','XY')"TRANSLATE"
	FROM DUAL;
	
	SELECT REPLACE ('a101r101u101n',101,'') "name" FROM dual
	
	SELECT REPLACE(TRANSLATE('A101r168760u26544131n','0123456789',''),'','')"name"
	FROM DUAL;	