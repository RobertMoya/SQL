-- Robert Moya
-- Jensen Gastelum

COLUMN table_name FORMAT A20
COLUMN column_name FORMAT A20
COLUMN comments FORMAT A40 WRAPPED

SET LINESIZE 132
SET PAGESIZE 55
SET PAUSE ON
BREAK ON OFFICE
BREAK ON STAFF
BREAK ON MANAGER
BREAK ON TAXI
BREAK ON JOB
BREAK ON CONTRACT
BREAK ON BUSINESS
BREAK ON PRIVATE
BREAK ON TAXIDRIVER

SPOOL report.txt

SELECT table_name, comments     
  FROM user_tab_comments
  WHERE table_name IN ('OFFICE','STAFF','MANAGER','TAXI','JOB','CONTRACT','BUSINESS','PRIVATE','TAXIDRIVER'); 
  --ORDER BY table_name; 


SELECT table_name, column_name, comments     
  FROM user_col_comments
  WHERE table_name IN ('OFFICE'); 
  --ORDER BY table_name; 

-- Query comments of columns for every <tablename> 
SELECT table_name, column_name, comments    
FROM user_col_comments    
WHERE table_name IN ('STAFF');

-- Query comments of columns for every <tablename> 
SELECT table_name, column_name, comments    
FROM user_col_comments    
WHERE table_name IN ('MANAGER');

-- Query comments of columns for every <tablename> 
SELECT table_name, column_name, comments    
FROM user_col_comments    
WHERE table_name IN ('TAXI');


-- Query comments of columns for every <tablename> 
SELECT table_name, column_name, comments    
FROM user_col_comments    
WHERE table_name IN ('JOB');

-- Query comments of columns for every <tablename> 
SELECT table_name, column_name, comments    
FROM user_col_comments    
WHERE table_name IN ('CONTRACT');

-- Query comments of columns for every <tablename> 
SELECT table_name, column_name, comments    
FROM user_col_comments    
WHERE table_name IN ('BUSINESS');

-- Query comments of columns for every <tablename> 
SELECT table_name, column_name, comments    
FROM user_col_comments    
WHERE table_name IN ('PRIVATE');

-- Query comments of columns for every <tablename> 
SELECT table_name, column_name, comments    
FROM user_col_comments    
WHERE table_name IN ('TAXIDRIVER');

spool off
