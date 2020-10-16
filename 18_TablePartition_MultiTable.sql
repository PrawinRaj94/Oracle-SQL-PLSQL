Table Partition :
     Partition_01        TABLESPACE (USERS | SYNTAX | SYSTEM)
	 Partition_02
	 Partition_03
	 Partition_04
	 Partition_05
     Partition_06  -- Transefering single table to multiple partitions
	 
	 it has three types in it 
	 * List Partition
	 * Range Partition
     * Hash Partition
	 
	 List partition : - List Partitioning is used to list together unrelated data into partitions.
	 
	 eg.
	 CREATE TABLE sales (
	        Product_id  NUMBER,
			trans_amt   NUMBER,
			sales_dt    DATE,
			state_code  VARCHAR2(2)
	 )
	 partition by list(state_code)
	 (
	 partition ct  VALUES ('CT','TN') TABLESPACE USERS,
	 partition ca  VALUES ('CA','KA') TABLESPACE USERS,
	 partition def VALUES (DEFAULT)
	 );
	 
	 Range Partition : - it might be date or number i,e:   less than 1 lakh means low limit 
	                                                    ,2 lakhs means middle level customers
														,3 lakhs means high level customers.
														   First 3 months in first quadrant and so on ....
												
     eg.
	 CREATE TABLE advertising (
				ad_id   number,
				ad_dt   date,
				product_code number,
				ad_cost number,
				channel VARCHAR2(10)
	)
	Partition by range(ad_dt)
	(
	  Partition year05q1 values less than (to_date('04/01/2020','mm,dd,yyyy'))tablespace year05q1,
	  Partition year05q2 values less than (to_date('05/01/2020','mm,dd,yyyy'))tablespace year05q2,
	  Partition year05q3 values less than (to_date('06/01/2020','mm,dd,yyyy'))tablespace year05q3,
	  Partition year05q4 values less than (to_date('07/01/2020','mm,dd,yyyy'))tablespace year05q4,
	  Partition pmax values less than (maxvalue) tablespace year05q4
	 );
     Hash partition :
	 Hash partitioning is a partitioning technique where a hash key is used to distribute rows evenly across the different partitions.
	
	 eg.
	 CREATE TABLE departments_hash (department_id NUMBER(4) NOT NULL, 
             department_name VARCHAR2(30))
     PARTITION BY HASH(department_id) PARTITIONS 16; -- number of partitions are specified when creating a table.
	 
	 for more details refer : https://docs.oracle.com/database/121/VLDBG/GUID-04E6C6EF-CE27-4DE9-B5B1-D23010E4A356.htm
	 
	 Composite partition :- it is a partitioning technique that combines some of other partitioning methods.
	                        Initially the table is partioned by first data and then each partition is sub-partioned by second data distribution. 
							
							for more details refer : https://docs.oracle.com/database/121/VLDBG/GUID-BE424ACC-F746-4CA8-973C-F578CF98FF10.htm#VLDBG00225
							
	
	
	Data dict table of partition is - user_tab_partitions;
	
	-- how to add partition after creating table --!-- very important .
	
	ALTER TABLE mytablename ADD PARTITION mypartitionname VALUES('MyValues');
	
	-- how to add sub partition
    
    ALTER TABLE mytablename 
    ADD PARTITION BY mypartitionname VALUES ('MyValues')
    (SUBPARTITION mysubpartitionname VALUES ('MyValueList'));

    SELECT * FROM SALES;
    SELECT * FROM SALES PARTITION BY east_sal;  -- this query will give the partition and the details only from east_sal.

    12c new feature
	  to move partition from one tablespace  to another 
	  before 12c it will be offline mode
	  after 12c it will be online mode.
	  
	  We can create index on table partition | we can have index on p1,p4 and p7)
	  
	  if the datas are in recent i,e tablespace then it will be more faster.4
	  if the datas are in historical then it will be slower.
	  
	-- multi table insert 
	   if you want to insert some in table we have to type insert statement here we need one set of code insert multiple datas in table.
	   
	   Table creation :
	   CREATE TABLE tb1(id NUMBER);
	   CREATE TABLE tb2(id NUMBER);
	   CREATE TABLE tb3(id NUMBER);
	   
	   Insert values :
	   INSERT ALL -- it is the keyword for multitable insert 
	   
	   INSERT ALL 
	          INTO tb1
			  INTO tb2
			  INTO tb3
	   SELECT LEVEL FROM DUAL CONNECT BY LEVEL <= 10; -- this query will insert 10 records into table .
	   
	   to check this 
	   SELECT COUNT(*) FROM tb1; -- the value will be 10.
	   
	   Single stretch we can insert multiple values inside table by using multitable insert the keyword is INSERT ALL.
	   
	   Next eg.
	   
	   CREATE TABLE dept1 AS SELECT * FROM departments WHERE 1 = 2;
	   CREATE TABLE dept2 AS SELECT * FROM departments WHERE 1 = 2;
	   
	   SELECT * FROM dept1; -- no data will be there 
	   
	   INSERT ALL 
	          WHEN department_id  <= 150 THEN
			       INTO dept1
			  WHEN department_id  >  150 THEN
			       INTO dept2
	   SELECT * FROM departments; -- conditional based insertion.
	   
	   we cant mix conditional and unconditional based insertion on same query for that we can do the following
	   
	   INSERT ALL 
	          WHEN = THEN  -- this is dummy condition.
	               INTO dept3 -- all the records will be inserted into dept3.
	          WHEN department_id  <= 150 THEN
			       INTO dept1
			  WHEN department_id  >  150 THEN
			       INTO dept2
	   SELECT * FROM departments;