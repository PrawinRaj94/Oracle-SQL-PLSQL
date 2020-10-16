Row limiting clause (12c onwards)
Fetch first 3 rows only -- this condition will allow to fetch first 3 rows only.
offset 3 fetch first 4 rows only -- this will allow you to skip first 3 rows and next four rows will be fetched.
fetch first 50 percent rows only -- this will fetch accordingly the 50 percent range.
fetch first 3 rows with ties -- this will allow to repeated values in the rows.

[offset] [first] [rows | percent rows] [only | with TIES]

SELECT * FROM top_n_rows FETCH FIRST 3 ROWS ONLY; -- this will fetch 1 2 3 rows only.
SELECT * FROM top_n_rows OFFSET 4 ROWS FETCH NEXT FIRST 5 ROWS; -- this will skip 4 rows and after that it will fetch next 5 rows.
SELECT * FROM top_n_rows FETCH FIRST 50 PERCENT ROWS ONLY; -- if there is 10 rows first 5 rows will be fetched.
SELECT * FROM top_n_rows FETCH FIRST 3 ROWS WITH TIES; -- 1 2 3 3 
SELECT * FROM top_n_rows ORDER BY 1 DESC FETCH FIRST 2 ROWS; -- 12 10 9 -- desending order.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
IDENTITY COLUMNS in oracle database 12c release (12.1)
Instead of sequence we c
an use identity columns.

all_tabs_identity_cols -- data dict table.

SYNTAX :
GENERATED 
[ALWAYS | BY DEFAULT [ON NULL]]
AS IDENTITY [(identity_options)]

GENERATED ALWAYS AS IDENTITY 
GENERATED BY DEFAULT AS IDENTITY -- will not allow null, we can enter our own values
GENERATED BY DEFAULT ON NULL AS IDENTITY  -- allowed to enter null values.
 
 
GENERATED ALWAYS AS IDENTITY :
INSERT INTO identity_opt_tab(descript)    VALUES ('JUST DESCRIPT') -- allowed to generate identity automatically.
INSERT INTO identity_opt_tab(id,descript) VALUES (55,'JUST DESCRIPT') -- not allowed to enter value manually.
INSERT INTO identity_opt_tab(id,descript) VALUES (NULL,'JUST DESCRIPT') -- not allowed to enter null value.

GENERATED BY DEFAULT AS IDENTITY :
INSERT INTO identity_opt_tab(descript)    VALUES ('JUST DESCRIPT') -- allowed to generate identity automatically.
INSERT INTO identity_opt_tab(id,descript) VALUES (55,'JUST DESCRIPT') -- allowed to enter value manually.
INSERT INTO identity_opt_tab(id,descript) VALUES (NULL,'JUST DESCRIPT') -- not allowed to enter null value.

GENERATED BY DEFAULT ON NULL AS IDENTITY :
INSERT INTO identity_opt_tab(descript)    VALUES ('JUST DESCRIPT') -- allowed to generate identity automatically.
INSERT INTO identity_opt_tab(id,descript) VALUES (55,'JUST DESCRIPT') -- allowed to enter value manually.
INSERT INTO identity_opt_tab(id,descript) VALUES (NULL,'JUST DESCRIPT') -- allowed to enter null value.

using the same way of creation which we used for creating sequence
START WITH 1
INCREMENT BY 1
MIN VALUE 1
MAX VALUE 999999999999999
NO CYCLE
NO CACHE;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------







