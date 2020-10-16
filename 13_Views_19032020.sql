View (_vw)
 
	-- logical representation of subset of records.
	-- view won't contain any data (fetch data from database)
	-- it's a schema object.
	
	Data dict view : SELECT * FROM user_views; 

Types of view :
	Simple view  : Selecting data from a single table.
	
	Complex view : Selecting data from multiple table.
	
-- Simple view :
	
	CREATE VIEW emp90_id_vw
    AS
    SELECT employee_id,first_name,hire_date,salary,department_id FROM employees
    WHERE department_id = 90;
	
	SELECT * FROM emp90_id_vw; -- to view the created view.
	
	COLUMN first_name FORMAT a10; -- to reduce space in between columns.
	
-- Complex view :
  
	CREATE VIEW dep_vw
	AS
	SELECT employee_id,first_name,e.departments_id,d.department_name
	FROM employees e,departments d
	WHERE e.department_id = d.department_id;
	
-- CREATE OR REPLACE :
   
	CREATE OR REPLACE VIEW dep_vw 
	AS
	SELECT employee_id,first_name,hire_date,job_id,salary,commission_pct,department_id
	FROM employees 
	WHERE department_id = 90;
	
-- DROP view :

	drop view dep_vw;  -- we won't use it often, we prefer create or replace 
	
-- ALIAS for expressions in view :

	CREATE OR REPLACE VIEW dept_vew
	AS
	SELECT employee_id,first_name,hire_date,salary * 12 "ann_sal"
	FROM employees
	WHERE department_id = 60;
	
	SELECT employee_id,first_name,ann_sal FROM dept_vew;
	
	--!-- other format 
	
	CREATE OR REPLACE VIEW dep_vw(emp_id,fname,hdate,ann_sal)
	AS
	SELECT employee_id,first_name,hire_date,salary * 12
	FROM employees
	WHERE department_id = 60;
	
	SELECT * FROM dep_vw;
	
-- Advantage of creating view (+ve | -ve)
 
	* we can provide the data they want
	* Restrict data access 
	* We can make complex query simple
	* we can represent data in different form.
	
-- we can make complex query simple by using 	
	CREATE OR REPLACE VIEW sal_details_vw
	AS 
	SELECT d.department_name,MAX(e.salary) min_sal,MIN(e.salary) max_sal,SUM(e.salary) sum_sal
	FROM employees e,departments d
	WHERE e.department_id = d.department_id
	GROUP BY d.department_name
	ORDER BY 1;
	
	Note : it is possible to perform DML operations on views.
	
	Simple view - Possible 
	in simple view these following operations are not possible
	-- DELETE
	-- DISTINCT
	-- COLUMN defined expression
	-- Group function
	-- Group BY
	-- Pseudocolumns.
	Complex view - it is not possible to perform these operations.
	-- INSERT
	-- DISTINCT
	-- COLUMN defined expression
	-- Group function
	-- Group by
	-- Pseudocolumns
	
	
	C1    C2    C3    C4    C5
	            C3    C4    C5     INSERT --> C1 and C2 will be inserted with NULL.
				
	The column not selected by the view contains NOT NULL constraint means Insert is not possible 
	
	Complex view is not possible.
	
	CREATE OR REPLACE VIEW dep90_man_vw
	AS
	SELECT employee_id,first_name,hire_date,salary,department_id
	FROM employees
	WHERE department_id = 90 WITH CHECK OPTION;  -- this check option will check for updatable view to prohibit the changes in view.
	
    CREATE OR REPLACE VIEW dep90_man_vw
	AS
	SELECT employee_id,first_name,hire_date,salary,department_id
	FROM employees
	WHERE department_id = 90 WITH READ ONLY;  -- this option will allow you to only read and cannot make changes through view.
	
	--!-- we can create view from table 
	--!-- we can create view from view 
	
	--!-- we cannot use index to create views.
	
	CREATE OR REPLACE FORCE VIEW all_details_vw
	AS
	SELECT employee_id,first_name,email_id,contact_num,aadhar_num
	FROM employees;
	
	View status : Invalid.
	
	-- here the view is created due to force keyword but status will be invalid.
	
	it is possible to create a view without base table ?
	Yes, by using force operation,but the status will be invalid.
	
	view :
	
	* what is view ?
	* what are all the types of views available.
	* create | create or replace
    * ALIAS
    * WITH CHECK option | with READ only.
    * advantage of creating view 
    * DML operation on view - possible or not ?
    * FORCE operation
    * creating view based on table/view/table join view
		
	important key points in views:
	
				View(_vw)                                               Materialized view (_mvw)
			
		1--> it has no data                                             it contains physical data 
		
		2--> if this has 27 records                                     if it is update with 127 data
		     if it is updated with 100 records                          it shows only 27 old datas 
		     it will shoe 127 updated.                                  it is outdated 
			 
		3-->                                                            to update that we use refresh i,e.
		                                                                complete and fast 
																		complete will give exactly 127 datas.
																		fast will give only new datas updated.
																		
		4--> create materialized view log on employees
		     create materilized view with rowid;
			 create materialized view with primary key;
			 
		5--> CREATE materialized view abc_mvw
             
             * Refresh fast 
             * next sysdate + 7 -- this is the way that materialized view will update from remote database.
             * As 
               SELECT  ......
               ..............;			   
		
		6--> SYNTAX 
		    dbms_Mview.refresh('view name','F'); -- synatx for fast refresh in materilaized view.

        7--> index will not be in views                                  index will be there in materialized view

        8--> to improve performance we use materialized view and to access remote db.

        9--> Diff b/w vw and mvw
         
                   vw                            mvw	
			data will not be there       data will be available in physical form
			
			up to date                   outdated
			
			index will not br in views   index will be there in materialized view.
	
	
	
	
	