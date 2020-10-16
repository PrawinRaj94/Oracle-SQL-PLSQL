Analytical functions :
					In databases, an analytical function is a function that computes aggregate values over a group of rows.
					
Types of analytical functions:
    LEAD()
    LAG()
    FIRST_VALUE()
    LAST_VALUE()
    RANK() OVER()
    DENSE_RANK() OVER()
    MIN() OVER()
    MAX() OVER()
    SUM() OVER()
    AVG() OVER()
    LIST TAGG() - 11g | 19c (Distinct) 
	
	
	LEAD() - lead function is used to return data from rows further down the result set.
    
	eg.
	
	SELECT empno,
       ename,
       job,
       sal,
       LEAD(sal, 1, 0) OVER (ORDER BY sal) AS sal_next,
       LEAD(sal, 1, 0) OVER (ORDER BY sal) - sal AS sal_diff
    FROM   emp;

     EMPNO ENAME      JOB              SAL   SAL_NEXT   SAL_DIFF
---------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK            800        950        150 -- this is the example for lead here the next salary value will be the lead and the
      7900 JAMES      CLERK            950       1100        150    diff is given 
      7876 ADAMS      CLERK           1100       1250        150
      7521 WARD       SALESMAN        1250       1250          0
      7654 MARTIN     SALESMAN        1250       1300         50
      7934 MILLER     CLERK           1300       1500        200
      7844 TURNER     SALESMAN        1500       1600        100
      7499 ALLEN      SALESMAN        1600       2450        850
      7782 CLARK      MANAGER         2450       2850        400
      7698 BLAKE      MANAGER         2850       2975        125
      7566 JONES      MANAGER         2975       3000         25
      7788 SCOTT      ANALYST         3000       3000          0
      7902 FORD       ANALYST         3000       5000       2000
      7839 KING       PRESIDENT       5000          0      -5000
	  
	  LAG() - LAG function is used to access the data from previous rows.
	  
	  eg.
	  
	  SELECT empno,
       ename,
       job,
       sal,
       LAG(sal, 1, 0) OVER (ORDER BY sal) AS sal_prev,
       sal - LAG(sal, 1, 0) OVER (ORDER BY sal) AS sal_diff
       FROM   emp;

     EMPNO ENAME      JOB              SAL   SAL_PREV   SAL_DIFF
---------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK            800          0        800 -- here the sal prev is 0 as default sal_prev value will be from previous row.
      7900 JAMES      CLERK            950        800        150
      7876 ADAMS      CLERK           1100        950        150
      7521 WARD       SALESMAN        1250       1100        150
      7654 MARTIN     SALESMAN        1250       1250          0
      7934 MILLER     CLERK           1300       1250         50
      7844 TURNER     SALESMAN        1500       1300        200
      7499 ALLEN      SALESMAN        1600       1500        100
      7782 CLARK      MANAGER         2450       1600        850
      7698 BLAKE      MANAGER         2850       2450        400
      7566 JONES      MANAGER         2975       2850        125
      7788 SCOTT      ANALYST         3000       2975         25
      7902 FORD       ANALYST         3000       3000          0
      7839 KING       PRESIDENT       5000       3000       2000
	  
	  
	  another example using lag and partion by
	  
	  SELECT deptno,
       empno,
       ename,
       job,
       sal,
       LAG(sal, 1, 0) OVER (PARTITION BY deptno ORDER BY sal) AS sal_prev
       FROM   emp;

    DEPTNO      EMPNO ENAME      JOB              SAL   SAL_PREV
---------- ---------- ---------- --------- ---------- ----------
        10       7934 MILLER     CLERK           1300          0
        10       7782 CLARK      MANAGER         2450       1300
        10       7839 KING       PRESIDENT       5000       2450
        20       7369 SMITH      CLERK            800          0
        20       7876 ADAMS      CLERK           1100        800
        20       7566 JONES      MANAGER         2975       1100
        20       7788 SCOTT      ANALYST         3000       2975
        20       7902 FORD       ANALYST         3000       3000
        30       7900 JAMES      CLERK            950          0
        30       7654 MARTIN     SALESMAN        1250        950
        30       7521 WARD       SALESMAN        1250       1250
        30       7844 TURNER     SALESMAN        1500       1250
        30       7499 ALLEN      SALESMAN        1600       1500
        30       7698 BLAKE      MANAGER         2850       1600

	  
	  FIRST_VALUE() - FIRST_VALUE analytical funtion is FIRST analytic funtion,which will allow you to return first result from an ordered set. 
	  
	  eg.
	  
	  SELECT empno,
       deptno,
       sal,
       FIRST_VALUE(sal) IGNORE NULLS 
         OVER (PARTITION BY deptno ORDER BY sal) AS lowest_in_dept
       FROM   emp;

     EMPNO     DEPTNO        SAL LOWEST_IN_DEPT
---------- ---------- ---------- --------------
      7934         10       1300           1300 -- in dept 10 1300 is lowest salary like wise for all.
      7782         10       2450           1300
      7839         10       5000           1300
      7369         20        800            800
      7876         20       1100            800
      7566         20       2975            800
      7788         20       3000            800
      7902         20       3000            800
      7900         30        950            950
      7654         30       1250            950
      7521         30       1250            950
      7844         30       1500            950
      7499         30       1600            950
      7698         30       2850            950
	  
	  LAST_VALUE() - LAST_VALUE analytical funtion is LAST analytic function,which will allow you to return last result from an ordered set.
	  
	  eg.
	  
	  SELECT empno,
       deptno,
       sal,
       LAST_VALUE(sal) -- IGNORE NULLS --- if I use ignore null means it shows error 	ORA-30484: missing window specification for this function
       OVER (PARTITION BY deptno ORDER BY sal) AS highest_in_dept   
       FROM   emp;

     EMPNO     DEPTNO        SAL HIGHEST_IN_DEPT
---------- ---------- ---------- ---------------
      7934         10       1300            1300
      7782         10       2450            2450
      7839         10       5000            5000
      7369         20        800             800
      7876         20       1100            1100
      7566         20       2975            2975
      7788         20       3000            3000
      7902         20       3000            3000
      7900         30        950             950
      7654         30       1250            1250
      7521         30       1250            1250
      7844         30       1500            1500
      7499         30       1600            1600
      7698         30       2850            2850
	  
	  RANK() - RANK() OVER ([ query_partition_clause ] order_by_clause).	  
	  
	  eg.
	  
	  SELECT empno,
       deptno,
       sal,
       RANK() OVER (PARTITION BY deptno ORDER BY sal) AS myrank
       FROM   emp;
	   
     EMPNO     DEPTNO        SAL     MYRANK
---------- ---------- ---------- ----------
      7934         10       1300          1 -- continuos ranks for all departments.
      7782         10       2450          2
      7839         10       5000          3
      7369         20        800          1
      7876         20       1100          2
      7566         20       2975          3
      7788         20       3000          4
      7902         20       3000          4
      7900         30        950          1
      7654         30       1250          2
      7521         30       1250          2
      7844         30       1500          4
      7499         30       1600          5
      7698         30       2850          6
	  
	  DENSE_RANK () - DENSE_RANK() OVER([ query_partition_clause ] order_by_clause)
	  
	  eg.
	  
	  SELECT empno,
       deptno,
       sal,
       DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal) AS myrank
       FROM emp;
	   
	   
     EMPNO     DEPTNO        SAL     MYRANK
---------- ---------- ---------- ----------
      7934         10       1300          1 -- seperate rankings for all departments
      7782         10       2450          2
      7839         10       5000          3
      7369         20        800          1
      7876         20       1100          2
      7566         20       2975          3
      7788         20       3000          4
      7902         20       3000          4
      7900         30        950          1
      7654         30       1250          2
      7521         30       1250          2
      7844         30       1500          3
      7499         30       1600          4
      7698         30       2850          5
	  
	  MIN() - MIN([ DISTINCT | ALL ] expr) [ OVER (analytic_clause) ]
	  
	  eg.
	  
	  SELECT empno,
       ename,
       deptno,
       sal,
       MIN(sal) OVER () AS min_sal
       FROM   emp
       ORDER BY deptno;

     EMPNO ENAME          DEPTNO        SAL    MIN_SAL
---------- ---------- ---------- ---------- ----------
      7782 CLARK              10       2450        800 -- this 800 is overall minimum salary , we can use partition 
      7839 KING               10       5000        800
      7934 MILLER             10       1300        800
      7566 JONES              20       2975        800
      7902 FORD               20       3000        800
      7876 ADAMS              20       1100        800
      7369 SMITH              20        800        800
      7788 SCOTT              20       3000        800
      7521 WARD               30       1250        800
      7844 TURNER             30       1500        800
      7499 ALLEN              30       1600        800
      7900 JAMES              30        950        800
      7698 BLAKE              30       2850        800
      7654 MARTIN             30       1250        800

	  MAX() - MAX([ DISTINCT | ALL ] expr) [ OVER (analytic_clause) ]
	  
	  eg.
	  
	  SELECT empno,
       ename,
       deptno,
       sal,
       MAX(sal) OVER () AS max_sal
       FROM emp;

     EMPNO ENAME          DEPTNO        SAL    MAX_SAL
---------- ---------- ---------- ---------- ----------
      7369 SMITH              20        800       5000 -- max salary from all dept, we can use partion by
      7499 ALLEN              30       1600       5000
      7521 WARD               30       1250       5000
      7566 JONES              20       2975       5000
      7654 MARTIN             30       1250       5000
      7698 BLAKE              30       2850       5000
      7782 CLARK              10       2450       5000
      7788 SCOTT              20       3000       5000
      7839 KING               10       5000       5000
      7844 TURNER             30       1500       5000
      7876 ADAMS              20       1100       5000
      7900 JAMES              30        950       5000
      7902 FORD               20       3000       5000
      7934 MILLER             10       1300       5000
	  
	  SUM()- The SUM aggregate function returns the sum of the specified values in a set.
	 	  As an aggregate function it reduces the number of rows, hence the term "aggregate".
       

        syntax - SUM([ DISTINCT | ALL ] expr) [ OVER (analytic_clause) 	   
	  eg.
	  
	  SELECT empno,
       ename,
       deptno,
       sal,
       SUM(sal) OVER () AS total_sal
       FROM   emp;

     EMPNO ENAME          DEPTNO        SAL  TOTAL_SAL
---------- ---------- ---------- ---------- ----------
      7369 SMITH              20        800      29025
      7499 ALLEN              30       1600      29025
      7521 WARD               30       1250      29025
      7566 JONES              20       2975      29025
      7654 MARTIN             30       1250      29025
      7698 BLAKE              30       2850      29025
      7782 CLARK              10       2450      29025
      7788 SCOTT              20       3000      29025
      7839 KING               10       5000      29025
      7844 TURNER             30       1500      29025
      7876 ADAMS              20       1100      29025
      7900 JAMES              30        950      29025
      7902 FORD               20       3000      29025
      7934 MILLER             10       1300      29025
	  
	  AVG () - AVG([ DISTINCT | ALL ] expr) [ OVER(analytic_clause) ]
	  
	  eg.
	  SELECT empno,
       ename,
       deptno,
       sal,
       AVG(sal) OVER () AS mean_sal
       FROM   emp
       ORDER BY deptno;

     EMPNO ENAME          DEPTNO        SAL   MEAN_SAL
---------- ---------- ---------- ---------- ----------
      7782 CLARK              10       2450 2073.21429
      7839 KING               10       5000 2073.21429
      7934 MILLER             10       1300 2073.21429
      7566 JONES              20       2975 2073.21429
      7902 FORD               20       3000 2073.21429
      7876 ADAMS              20       1100 2073.21429
      7369 SMITH              20        800 2073.21429
      7788 SCOTT              20       3000 2073.21429
      7521 WARD               30       1250 2073.21429
      7844 TURNER             30       1500 2073.21429
      7499 ALLEN              30       1600 2073.21429
      7900 JAMES              30        950 2073.21429
      7698 BLAKE              30       2850 2073.21429
      7654 MARTIN             30       1250 2073.21429
	  
	  
	  LISTAGG () - LISTAGG function, producing a comma-separated list of employees for each department.
	  
	  eg.
	  COLUMN employees FORMAT A40
      SELECT deptno, LISTAGG(ename, ',') WITHIN GROUP (ORDER BY ename) AS employees
      FROM   emp
      GROUP BY deptno
      ORDER BY deptno;

    DEPTNO EMPLOYEES
---------- ----------------------------------------
        10 CLARK,KING,MILLER
        20 ADAMS,FORD,JONES,SCOTT,SMITH
        30 ALLEN,BLAKE,JAMES,MARTIN,TURNER,WARD



		
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   