/***********************************************************************************************************
Hydrologic Data Exploration 

Skills used: Querying Single Table, Filtering Data, Aggregate Functions
************************************************************************************************************/

-- Retrieve all data and columns from Hydrologic Data set

SELECT *
  FROM hydrologic_portfolio_project.hydrologic
  

-- Find the highest Daily mean streamflow recorded in the year 2000 and 2010

SELECT MAX(val) AS max_val
  FROM hydrologic_portfolio_project.hydrologic
  WHERE dates BETWEEN '2000-01-01' AND '2000-12-31'
  
SELECT MAX(val) AS max_val
  FROM hydrologic_portfolio_project.hydrologic
  WHERE dates BETWEEN '2010-01-01' AND '2010-12-31'


-- Find the lowest Daily mean streamflow recorded in the year 2000 and 2010

SELECT MIN(val) AS min_val
  FROM hydrologic_portfolio_project.hydrologic
  WHERE dates BETWEEN '2000-01-01' AND '2000-12-31'

SELECT MIN(val) AS min_val
  FROM hydrologic_portfolio_project.hydrologic
  WHERE dates BETWEEN '2010-01-01' AND '2010-12-31'
  
  
-- Retrieve the data that contains missing values

SELECT *
  FROM hydrologic_portfolio_project.hydrologic
 WHERE val = 'NA'


-- Find the average Daily mean streamflow recorded in the year 2000 and 2010.

SELECT AVG(val) AS avg_val
  FROM hydrologic_portfolio_project.hydrologic
  WHERE dates BETWEEN '2000-01-01' AND '2000-12-31'
       
SELECT AVG(val) AS avg_val
  FROM hydrologic_portfolio_project.hydrologic
  WHERE dates BETWEEN '2010-01-01' AND '2010-12-31'


-- Check the Hydrologic dataset with provisional and negative data

SELECT 
	  SUM(CASE WHEN val > 0 THEN 1 ELSE 0 END) AS Number_Of_Positive_Vals,
	  SUM(CASE WHEN val < 0 THEN 1 ELSE 0 END) AS Number_Of_Negative_Vals
  FROM hydrologic_portfolio_project.hydrologic;


-- Retrieve the Qualification code data that shows "N" code or "R" code
-- "N" indicates that a negative value was replaced
-- "R" indicates that a zero value was replaced

 SELECT *
  FROM hydrologic_portfolio_project.hydrologic
 WHERE qualcode = 'N' OR 'R'