CONSTRAINT 
         it is nothing but to enforce rule on table.
		 
eg ----> 		 emp_id   Gender    salary
				  1000      M        17000
				  1001      M        35000
				  1002      F         7000 --- > minimum salary is 10000.
Duplicate 	 <--  1002      S -----------------> only male and female.

We can create constrain in two diff level .
  --> At the time of table creation 
          --> column level (default : SYS_Cn   SYS_C40189)
		  --> Table level.
		  
  --> After the table has been created
          --> Alter table table_name.
		  --> ADD table table_name.
		  
	ADD   -->  CONSTRAINT TYPES -->  DROP  
	DISABLE --->               <-- ENABLE
	
	Primary key ---> parent_tb.
	foreign key ---> child_tb. 
	
	                      DUPLICATE         NULL 
	PRIMARY KEY - PK         NO				 NO
	-----------
	i,e emp_id,
	stud_id,odr_id
	
	UNIQUE KEY  - UK         NO             YES
	-----------
	i,e: email_id,
	PAN,CONTACT
	
	FOREIGN KEY - FK/RK      YES            YES
	------------
	i,e: department_id   [ON DELETE CASCADE]
	in employees table   [ON DELETE SET NULL]
	i,e: child table 
	RK - reference key 
	
	CHECK       - CK   You can check your own condition 
    -----                +ve check(salary >= 10000)
                         check(gender IN ('M','m','F','f'))
					
	NOT NULL    - NN   mandatory field             ---------------------------> 100% column level.
	--------           you must enter some value|null value not allowed.
	
	
	SOME important key features 
	
	* Per table only one primary key is allowed.
	
	* we can have more than one constraint on one particular column.   -->cons2    COLUMN -->con 1
	
    * primary key = unique key + not null.
	
	* But we can have primary key with multiple columns 
	     Composite primary key 
	PK                                              STATUS   info_cng_num	 
	---------------------------------------------------------------------
	1000     Steven           SR_MGR         25000	  A         1
	1000     Raj              SR_MGR         32000   PFA        2 
	
	* if you copy one table data to another table only not null constrain will be copied.
	
	* if you drop a table all the constraint containing will get dropped.
	
	* NOT NULL --> it is a column level constraint.
	
	* After creating table if you want to add NN you have to use MODIFY clause.
	  eg : ALTER TABLE table_name MODIFY first)name VARCHAR2(20) NOT NULL;
	
	* If you create PK/UK automatically UNIQUE INDEX wiil get created 
	
	* after the constraint created we cannot edit the constraint so we need drop table and recreate constrain. 
	----------------------------------------------------------------------------------------------------------
	DATA DICT TABLE 
	we have two tables - 
	             user_constriants  -- it will show the entire details table wise.
				 user_cons_columns -- it will show the entire details column wise.
				 
				 
            	CREATE TABLE Students_tb
            (  
               Stud_id         NUMBER(4)
            ,  first_name      VARCHAR2(20) NOT NULL
            ,  Gender          CHAR
            ,  Email           VARCHAR2(30)
            ,  department_id   NUMBER
            ,  CONSTRAINT stud_id_pk PRIMARY KEY (department_id)
            ,  CONSTRAINT stud_mail_UK UNIQUE (email)
            ,  CONSTRAINT stud_gender_ck CHECK(Gender IN ('M','F','m','f'))
            ,  CONSTRAINT stud_id_FR FOREIGN KEY (department_id)
               REFERENCES departments(department_id)
            );
            DROP table Students_tb;
            
            ALTER TABLE Students_tb
            ADD CONSTRAINT stud_did_FR FOREIGN KEY (department_id)
                     REFERENCES dept(department_id) ON DELETE CASCADE; --> it will delete the entire data i,e who are working in dept id 90 will be completly deleted. 
            ALTER TABLE emp DROP CONSTRAINTS emp_did_FR ;
            
            ALTER TABLE Students_tb
            ADD CONSTRAINT stud_id_fr FOREIGN KEY (department_id)
                     REFERENCES dept(department_id) ON DELETE SET NULL; --> it will make null for the department id = 90 and keep other records as it is.
            
            ALTER TABLE Students_tb MODIFY first_name VARCHAR2(20) NOT NULL; ---> TO add not null constraint.
            
            ALTER TABLE Students_tb DISABLE CONSTRAINT stud_mail_UK; --> to disable constraint.
            
            ALTER TABLE Students_tb ENABLE CONSTRAINT stud_gender_ck ; --> to enable constraint.
            
            ALTER TABLE Students_tb DROP CONSTRAINT stud_id_pk ; --> to drop constraint.
            
            SELECT * FROM Students_tb;
            
            SELECT * FROM user_constraints 
            WHERE table_name = UPPER('Students_tb'); --> to check table wise.
            
            SELECT * FROM user_cons_columns 
            WHERE table_name = UPPER('Students_tb'); --> to check column wise.
            
            SELECT * FROM dict 
            WHERE table_name LIKE '%USER_CONS_%'; --> used to show naming statement.
         
            INSERT INTO Students_tb
                        VALUES(05,'prav','M','prav@gmail.com',60);
            CREATE TABLE dept AS (SELECT * FROM departments);
                      
            ALTER TABLE dept
            ADD CONSTRAINT dept_did_pk PRIMARY KEY (department_id); --> to add a constriant.
            
            CREATE TABLE emp AS (select * from employees);
            
            SELECT * FROM EMP;
            select * from dept;
            DELETE  FROM dept WHERE department_id = 90;
                   
	
	
					   

						 
