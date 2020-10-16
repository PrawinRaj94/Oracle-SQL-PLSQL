Global Temporary Table : it is a table in oracle which, it will contains data temporarily.

We can create this Global Temporary table in two forms i,e:

-- ON COMMIT DELETE ROWS 
-- ON COMMIT PRESERVE ROWS 

SYNTAX : 
  CREATE GLOBAL TEMPORARY TABLE my_temp_table (
  id       NUMBER ,
  descript VARCHAR2(20)
  )
  ON COMMIT DELETE ROWS;   -- once you commit the session the entire data will be deleted.
  
  CREATE GLOBAL TEMPORARY TABLE my_temp_table (
  id       NUMBER ,
  descript VARCHAR2(20)
  )
  ON COMMIT PRESERVE ROWS; -- once you commit the session the entire data will be there,but when you exit there will be no data.
  
-- example for ON COMMIT DELETE ROWS.  
  AFTER creating table insert values 
  
  INSERT into my_temp_table VALUES (1,'ONE');
  --insert,but don't commit 
  
  SELECT * FROM my_temp_table;
  
  o/p
  
  COUNT(*)
  -------
        1
		
  Commit an check the details 
  
  o/p
  
  COUNT(*)
  --------
        0
-- example for ON COMMIT PRESERVE ROWS.
   AFTER creating table insert values
   
   INSERT INTO my_temp_table VALUES (1,'ONE');
   --insert and commit and check for GTT contents.
   COMMIT;
   
   SELECT COUNT(*) FROM my_temp_table;
   
   o/p
   
   COUNT(*)
   --------
          1
		  
   -- Reconnect and check the contents of GTT.
   
   After reconnecting the data wont be there 
   
   COUNT(*)
   --------
          0
		  
    why we go to these kinds of global temporary tables ?
	using this as STAGING TABLE,(i,e) to store the data temporarily to perform some action.
	
	for eg. we have 4 slots in a day first slot data will get loaded into source table.
            when second slot data will loaded,first slot data gets deleted from source table.
            at the end of the day the 4 slot data needed to be in a single table for that 
            we can use Global temporary table to get the data rather from source table. -- this is done for fast retreival.
			
		why we are using Global temporary table is ?
		TEMP tablespace -- because the data stored in temp - it will more faster than normal.
		
		if truncate statement is issued against a temporary table, only the session temporary data
		will be truncated.there will be no affect on the data in other session.
		Data in the temporary tables will be stored in the temp tablespaces.
		Data in the temporary table will be automatically deleted at the end of the session.
		index can be created in global temporary table.The content of the index 
		and the scope of the index is same as the database session.
        views can be created against temporary tables and combinations of temporary and permanent tables.
        temporary tables can have triggers associated with them.

        Have you used it in your project ? 
        it is almost like a normal table but there the data will be permanent for all the sessions,
        but we can keep the data session wise if the table created with ON COMMIT DELETE ROWS -- until you commit the session the data will be there.
        if the table is created with ON COMMIT PRESERVE ROWS -- until you come out you can acess the data. 		
		Compared to normal table, this table will be faster because the data will be in temp tablespace.
		
		Temp tablespace -->  is maily used for sorting like asc and desc,
		this requires some memory and expressions like (salary * 12) ,groupby option this temp tablespaces are used.
		
		finally data will get deleted automatically,if you abort/session expire.
	
-----------------------------------------------------------------------------------------------------------------------------------------------------
HINTS : 
       it willgive some instructions to optimizer/compiler. (CBO/RBO) CBO - cost based optimizer,RBO - Rule based optimizer.
	    
	   Types of Hints :
	   INDEX_ASC           -- eg.first week transaction means use INDEX_ASC
	   INDEX_DESC          -- eg.Last week transaction means INDEX_DESC
	   NO_INDEX            -- eg.if the data fetched is 60 % from the table you can use NO_INDEX to increase performance.
	   INDEX               -- eg.if the index is disabled you can force the compiler to use index.
	   first_rows(100)     -- eg.one word document for 2000 page and another word document for 10000 page 
	                             which one will open first,both will open first page and it will load 
								 the next pages like (100 records * 9 times) at a time.
	   APPEND very important 
	   1
	   2
	   3 -- if 3 is deleted -- if you insert next data 11 -- oracle will keep on searching free spaces 
	   4
	   5 -- if 5 is deleted -- 12 will be inserted here
	   6
	   7 -- if 7 is deleted -- 13 will be inserted here
	   8
	   9 -- if 9 is deleted -- 14 will be inserted here 
	   10
	   I dont want this means -- in order to generate explain plan it takes more time 
	   before that it will check 
	   1.Syntax CHECK
	   2.Symantic CHECK
	   3.Explain PLAN.
	   
	    SELECT * FROM employees --> hard parsing
		Data file --> Memory --> Explain plan
		
		Second time when you fetch the record 
	    SELECT * FROM employees --> Soft parsing.(uses old explain plan).
		
		TO retrieve data from database fastly means you should use Stacs Gathering.
		
		SELECT * FROM user_tables;
		Here we have a column called last analyzed 
 
        we are taking selective column to understand the concept 
        SELECT table_name,status,last_analyzed FROM user_tables; -- selective columns in user_tables.	

        After this check DESC user_tables;
        
        check for last_analyzed table -- if the date is not up to date,to generate explain plan it takes more time.
        In this way we need to gather stacs.
		
        stats gathering works based on existing statistics.
		
        How to gather stacs ?
		SELECT table_name,status,last_analyzed FROM user_tables WHERE table_name = 'EMPLOYEES'; 
		
        BEGIN
        DBMS_STATS.gather_table_stats('HR','EMPLOYEES'); 
		END; -- now the employees table is up to date.  -- this is one of the way to improve performance.
		
----------------------------------------------------------------------------------------------------------------------------------------
SHRINK SPACE :

        If the data is like this, it will remove all the spaces and put the data together.
		1      1     1
		2            3
		3      3     5
		4            7
		5      5     9
		6
		7      7
		8
		9      9
		10
	    
		if you have 10000 records deleted means the shrink will compress the space and put data together.
		
		the compiler will search for empty space to fill data this could take time -- low performance 
		
		inorder to overcome this we use SHRINK spaces.
		
		SYNTAX : ALTER TABLE table_name SHRINK SPACE;
		
---------------------------------------------------------------------------------------------------------------------------------------------
APPEND :
        1      1   if the value we inserting is 11 means it will get inserted in space of 2.
		2            
		3      3     
		4            
		5      5     
		6
		7      7
		8
		9      9
		10
		
		to avoid this we use bulk collect which is in oracle plsql,
		here we insert 1 million record if it searches space for inserting means it takes more time 
		
		in this time we use this HINT called APPEND.
		to avoid searching for spaces we use append hint.
		
		INSERT /*+ APPEND*/ INTO table_name (SELECT * FROM employees);
----------------------------------------------------------------------------------------------------------------------------------------------
What is parallel hints :
refer https://docs.oracle.com/cd/E11882_01/server.112/e41573/hintsref.htm#PFGRF005 --FOR PARALLEL hints.
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			