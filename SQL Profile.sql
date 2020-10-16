SQL Profile :A SQL profile is a set of auxiliary information specific to a SQL statement.
             The database can use the auxiliary information to improve execution plans.
			 SQL profile helps the optimizer minimize mistakes and thus more likely to select the best plan.

Purpose of SQL Profile :
             When profiling a sql statement,sql tuning advisor tuning will use a specific set of bind values as input.
			 
			 advantages : Unlike hints, no changes to application source code are necessary when using SQL profiles.
			              SQL profiles do not tie the optimizer to a specific plan or subplan.
						  SQL profiles fix incorrect estimates while giving the optimizer the flexibility to pick the best plan in different situations.
						  
For further details : https://docs.oracle.com/database/121/TGSQL/tgsql_profiles.htm#TGSQL596 