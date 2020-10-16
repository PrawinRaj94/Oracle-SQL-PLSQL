Sequence (_seq)                              i,e: odrid_seq

* used to generate unique numbers.
* it is a schema objects and sharable objects.
* mostly used to generate primary key --> no duplicates
* max value 9999999(27) values.
-- To create a sequence 
CREATE SEQUENCE test_seq
MINVALUE 1
MAXVALUE 20
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
--To drop the sequence 
Drop sequence test_seq;
--To alter / modify the sequence
ALTER SEQUENCE test_seq MAXVALUE 1500;

Another way to create sequence is 
CREATE sequence test_seq1;             -----> but it is not preffered.

Options in sequence
		Create | Alter | Drop 
		
For data dict table user_sequence;

examples: 
CREATE TABLE eee (id NUMBER,name VARCHAR2 (20));
CREATE TABLE ece (id NUMBER,name VARCHAR2 (20));

SELECT * FROM eee;
SELECT * FROM ece;

INSERT INTO eee VALUES(test_seq.NEXTVAL,'Siva'); --> 1.          
INSERT INTO eee VALUES(test_seq.NEXTVAL,'Raja'); --> 2.
INSERT INTO eee VALUES(test_seq.NEXTVAL,'Rani'); --> 3.
INSERT INTO ece VALUES(test_seq.NEXTVAL,'Rakesh'); --> 4.        -- here on both tables the numbers are continuos and so they are called as Sharable objects.

SELECT test_seq.CURRVAL FROM DUAL; -- 4 -- this will allow to check the current value in the sequence.
SELECT test_seq.NEXTVAL FROM DUAL; -- 5 -- this will create next value in the sequence.

INSERT INTO ece values(test_seq.NEXTVAL,'karthik'); --> 6

When gap will occur ?
while ROLL BACK , if the sequence is used in some other table.
INC2303202000897
INC2403202000897

example 
SELECT 'INC' || to_char(SYSDATE,'DDMMYYYY') || LPAD(test_seq.NEXTVAL,5,0)inc_num FROM DUAL; -- bill number.

once the maxvalue is attained we use Script to reset all sequence 

-- Interview Questions related to sequence 
1) Have you sequence in your project.
2) why gap in sequence is happening ?
3) Syntax to create sequence.
4) MAXVALUE OF SEQUENCE.
5) which data dictionary table contains all information about sequence ?

Similar to sequence we have identical column that is avilable in 12c update.

SYNONYM :
* used to provide alternate name to any object.
* it is a schema object.

i,e: employees --> emp
     departments --> dept

CREATE synonym emp for employees;
CREATE SYNONYM dept for departments;

SELECT * FROM emp;
SELECT * FROM dept;

reduce the length of the object name (rps2_blltr_deal_main_txn_tb --> dmain)

CREATE SYNONYM dmain for enh_db.rps2_blltr_deal_main_txn_tb @ dblink;

SELECT * FROM dmain;

There are 2 types of synonym :
1. public  -- this is public and can be accessed by the all.
2. private(Default) -- can acess within the schema only.

CREATE public synonym loc for locations;

SELECT * FROM all_objects; -- this is the data dict for public synonym because the owner is public. 
SELECT * FROM user_synonyms; -- this is the data dict table for private because the owner is system.

SELECT * FROM all_objects WHERE owner = 'public'
AND object_type LIKE 'SYNONY%'
AND object_name LIKE 'LOC%';   ---> 2.

     AXIS_DB                           ICICI_DB

Pendind_payment_dtl            dummy_pending_payment_dtl

                               ppt 
							   
							   create synonym ppt for 
							   dummy_pending_payment_dtl;  -- this will create synonym
							   
							   INSERT INTO t1(SELECT * FROM ppt); -- after recreation of PPT the remote db table will recreates into 70 diif table.
							   INSERT INTO t2(SELECT * FROM ppt);
							   INSERT INTO t3(SELECT * FROM ppt);
							   .....
							   INSERT INTO t70(SELECT * FROM ppt);
							   
							   
employees 
alter procedure dummy_pending_payment_dtl compile;