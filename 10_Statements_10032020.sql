Statements : summary.
Structure --> DDL (Data Definiton language) --> CARDT
     -- CREATE
     -- ALTER  
	     -- ADD    - (Column based) 
		 -- RENAME - (Column based) 
		 -- MODIFY - (Column based) 
		 -- DROP   - (Column based) 
     -- RENAME 
     -- DROP
     -- TRUNCATE	 
	 
Data --> DML (Data Manipulation Language)
     -- INSERT
	 -- UPDATE
	 -- DELETE
	 -- MERGE (INSERT + UPDATE)
	 
ADMIN --> DCL (Data Control Language)
     -- GRANT 
	 -- REVOKE
	 
SESSION --> TCL (Transaction Control Language)
     -- COMMIT
	 -- ROLLBACK
	 -- SAVE POINT 
	 
Data types:
 
    NUMBER(Position,Size)               (0 - 9)         eg.employee_id  NUMBER(4) | 359.24   --> (5,2)  
	Size --> optional                                      salary       NUMBER    | 34895.24 --> (7,2)
	Max  --> 38 (i,e) (9999...9)
	
	VARCHAR2
	Size --> optional                  (a - z) | (A - Z)|         eg. first_name VARCHAR2(30)
    Max  --> 4000 --> 32767 	       (0 - 9) | Spl char             email_id   VARCHAR2(50)
	     
		 ALTER SYSTEM 
		      set max - string - size = default
              -----------------------   -------	     (Variable character size)
              NLS- DATE - FORMAT        Extended   			  
			  
	CHAR 
	Size --> optional       (0 - 9) | (a - z) | (A - Z)  (Fixed in size)
	Default --> 1            Special Character 
	max --> 2000
	
	Diff B/w VARCHAR2 And CHAR
	VARCHAR2 --> - variable character size.
	             - if the character is like |C|A|T| - 3 words,but it is allocated with 5 bits of memory it consumes only 3 bits from the allocated memory.
	CHAR     --> Fixed in size .
	             - if the memeory is allocated with 5 bits of and the char is |C|A|T| | | then this will consume totally 5 bits from allocated memory.
				 note: storing is the major difference in B/w varchar2 and char.
				 
				 eg --> v - a     VARCHAR2 (5)  CAT 
				        v - b     CHAR     (5)  CAT
                        v - a     |C|A|T| | | --> 3	
                        v - b     |C|A|T| | | --> 5  | | --> it is not null it is just a space.
                        v - a != v - b
                        length(v - a) != length (v - b)
                        v - a = TRIM (v - b)
                        length (v - a) = length (trim (v - b))						
				 
	Date:                DOB
	default  --> 7       hire_date | hire_dt  (i,e) --> 17-Jun-19 --> 7 
	
	TIMESTAMP      login - date with time (dttm) 
	
	LONG  --> 2GB ---------------------------> per table we can have only on long column.
	CLOB  --> 4GB ---------------------------> we cant use it in group by / order by | copying table is not possible
	BLOB  --> Binary (image / video)
	RAW
	ROWID
	XML-TYPE
	
	
	--- important --- Table_Design_Document (Excel)
	
	    CREATE Table students_id
   (  
	 Student_id    Number
	,student_name  VARCHAR2(30)
	,gender        CHAR
	,DOB           DATE
	,department_id NUMBER
   ); 
   
   -- Feedback : table created 
   DESC students_id; -- to check the structure.
   
   to alter the table.
   using ADD keyword --> ALTER table students_id ADD feedback LONG;
   using RENAME keyword --> ALTER table students_id RENAME COLUMN department_id TO dept_id; --> Feedback -- Table altered.
   using MODIFY keyword --> ALTER table students_id MODIFY feedback VARCHAR2(30); --> Feedback -- Table altered.
   using DROP keyword --> ALTER table students_id DROP COLUMN feedback; --> feedback -- table dropped.
   
   using RENAME keyword --> RENAME students_id TO stud_id; --> feedback --> Statement processed.
   DROP table stud_id;  --> drops/deletes the entire table.
   TRUNCATE table stud_id; --> keeps the structure and deletes the data.
   
   -- Creating the table by using Subquery with data 
   CREATE table dept1 AS(SELECT * FROM departments WHERE 1 = 1);
   
   -- Creating table by using sub query without data 
   CREATE table dept2 AS(SELECT * FROM departments WHERE 1 = 2);
   
   Adding more than columns at a time.
   ALTER table stud_id
   ADD( column_1 NUMBER
       ,column_2 NUMBER
       ,column_3 NUMBER
      );
	 
    DML ---> DATA MANIPULATION LANGUAGE 
	INSERT || UPDATE || DELETE || MERGE(Insert + update)
	
	CREATE table emp_tb
   (
     employee_id   NUMBER
    ,first_name    VARCHAR(30)
    ,hire_date     DATE
    ,job_id        VARCHAR(10) DEFAULT'SAL_REP'
    ,department_id NUMBER
   );
    
	INSERT INTO emp_tb(employee_id,first_name,hire_date,job_id,department_id)
            VALUES(10001,'Prav',SYSDATE - 150,'SR-MGR',100);
	INSERT INTO emp_tb
            VALUES(10002,'Bala',SYSDATE - 149,'JR-MGR',101);
	INSERT INTO emp_tb
            VALUES(10003,'Suchi',SYSDATE - 148,'MGR' ,102);
	INSERT INTO emp_tb(employee_id,first_name,hire_date,department_id)
            VALUES(10004,'susa',SYSDATE - 147,104);
			
    -- we can ignore the column -- NULL or '' 
	Subquery in INSERT statement (VALUES) --> Keyword does not or wont work.
    
    using insert keyword 
    INSERT INTO dept2(SELECT * FROM departments); -- Inserting the departments table datas into dept2. 
	SELECT * FROM dept1;
	
	using UPDATE keyword
	UPDATE dept1 
    SET department_name = 'Department of Admin'
       ,manager_id = 201
       ,location_id = 1801
    WHERE department_id = 10;
	
	using DELETE keyword 
	DELETE FROM dept1 WHERE department_id IN(10,20,50); -- three rows deleted
	
	-- DELETE FROM dept1 -- this means all the data will be deleted from table.
	-- TRUNCATE table dept1;
	
	Diff B/W truncate and delete.

	Truncate --> |DDL|we cant use WHERE clause |ROLLBACK is not possible| faster than delete | table truncated|
	
	DELETE --> |DML|we can use where clause |we can rollback|slower than truncate|
	
	statement|WHERE|DATA|Performance|feedback 20 row(S) deleted.
	
	MERGE statement = INSERT + UPDATE 
	
	      table_01 t1                     table_02 t2
	--------------------------------------------------------
    c_id    c_name   c_amt	        c_id     c_name    c_amt
	10       prav     450           10        prav       450
	 
	20       bala    1400           20        bala      1400
	
	30       suchi    900
	--------------------------------------------------------
	MERGE INTO table_02 t2
	USING table_01 t1 
	ON(t1.c_id = t2.c_id) -----------------------------> join condition to match two tables 
	WHEN MATCHED THEN 
	UPDATE 
	   SET(t2.c_name = t1.c_name ----------------------> condition if the datas are matched .it will updated.
	      ,t2.c_amt = t1.c_amt)
	WHEN NOT MATCHED THEN 
	INSERT VALUES (t1.c_id,c_name,c_amt); ---------------> conditon to fill when datas are unmatched .
	
	
	
	
	
	