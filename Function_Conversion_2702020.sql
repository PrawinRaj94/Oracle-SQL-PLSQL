1000 --> number 
Stevan --> character
21-jan-1998 --> character
21-01-98 --> date format
21-01-98 --> DD-MM-YY

TYPE CONVERSION
 TO_NUMBER()
 TO_CHAR()
 TO_DATE()

SELECT 5 + '5' FROM DUAL; --> Here '5' is character and is implicitly converted to number(sometimes it will not)

SELECT 'AK' || 47 FROM DUAL --> CONCAT  

SELECT 5 + TO_NUMBER('5') FROM DUAL ; ---> Explicit conversion 

SELECT employee_id,first_name,hire_date,salary,department_id FROM employees
WHERE hire_date = TO_DATE('17-06-1987','DD-MM-YYYY');

SELECT employee_id,first_name,hire_date,TO_CHAR(hire_date,'YYYY')"Hire_date" FROM employees
WHERE department_id IN(10,60,90);

SELECT TO_CHAR(SYSDATE,'DAY') FROM DUAL;

SELECT employee_id,first_name,hire_date,TO_CHAR(hire_date,'YYYY') "Hire_date" FROM employees
WHERE TO_CHAR(hire_date,'YYYY') = 1994;

SELECT employee_id,first_name,hire_date,TO_CHAR(hire_date,'day') "Hire_date" FROM employees
WHERE TO_CHAR (hire_date,'D') IN (3,4);

SELECT TO_CHAR (SYSDATE,'DAY')"date" FROM DUAL --> monday format

SELECT TO_CHAR (SYSDATE,'Dy') "date" FROM DUAL --> mon

SELECT TO_CHAR (SYSDATE,'DDD') "date" FROM DUAL -->how many days

SELECT TO_CHAR (SYSDATE,'D') "date" FROM DUAL --> sun - sat which day by number

Examples of date format:
DD|DDD|DDth|DDSPth  D|DY|DAY| MM|MON|MONTH  YY|YYYY|YEAR

TIME FORMAT
HH:MI:SS-->12 hrs       HH24:MI:SS --> 24 hours

Quadrant --> Q

RM --> Roman letter

SELECT TO_CHAR(SYSDATE ,'HH:MI:SS')"time" FROM DUAL; --> 12 hours

'21-01-1989' --> 21st jan,1989

SELECT INITCAP (TO_CHAR(TO_DATE('21-01-1989','DD-MM-YYYY'),'DDth MON,YYYY')) "DATE" FROM DUAL;


SELECT INITCAP (TO_CHAR(TO_DATE('21-01-89','DD-MM-YY'),'DDth MON,YY')) "DATE" FROM DUAL


GENERAL FUNCTIONS/NULL FUNCTION -used to process NULL values
   NVL()      --> 2 arg
   NVL2()     --> 3 arg
   NULLIF()
   COALESCE()

NVL():
SELECT employee_id,first_name,hire_date,salary,commission_pct,NVL(commission_pct,0) "NVL" FROM employees;

SELECT employee_id,first_name,hire_date,salary,commission_pct,NVL(TO_CHAR(commission_pct),'NO COMMISSION')"NVL" FROM employees;

NVL2():
SELECT employee_id,first_name,hire_date,salary,commission_pct,NVL2(commission_pct,1,0) "NVL2" FROM employees;

NULL IF():
SELECT NULLIF(1,1),NULLIF(2,1),NULLIF(1,2),NULLIF(2,2) FROM DUAL; --> we wont use this most commonly

COALESCE():
SELECT COALESCE(NULL,NULL,NULL,89,NULL,NULL,NULL,78,NULL)"COAL" FROM DUAL; --> instead of NVL we can use coalesce. --> it will return first not null value.

using coalesce instead of NVL:
SELECT employee_id,first_name,hire_date,salary,commission_pct,COALESCE(commission_pct,0) "COALESCE" FROM employees;
