-- ==============================================================================================================
-- Cohort Analysis Project
-- Author: Umesh Harsana
-- ==============================================================================================================

-- ----------------------------------------------TABLE-----------------------------------------------------------

-- creating table

CREATE DATABASE cohort_project;
USE cohort_project;

CREATE TABLE online_retail (
    Invoice VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    Price DOUBLE,
    CustomerID INT,
    Country VARCHAR(100),
    Revenue DOUBLE,
    OrderMonth DATE
);

-- loading data into the table

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clean_dataset.csv'
INTO TABLE online_retail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- overview of data

SELECT COUNT(*) FROM online_retail;
SELECT * FROM online_retail LIMIT 10;

-- --------------------------------------------Analysis---------------------------------------------------------

-- creating cohort data

WITH cohort_data AS(
	SELECT
		CustomerID,
        OrderMonth,
        Revenue,
        MIN(OrderMonth) OVER(PARTITION BY CustomerID) AS CohortMonth
	FROM online_retail
)
SELECT * FROM cohort_data;

-- creating cohort index

WITH cohort_data AS(
	SELECT
		CustomerID,
        OrderMonth,
        Revenue,
        MIN(OrderMonth) OVER(PARTITION BY CustomerID) AS CohortMonth
	FROM online_retail
)

SELECT 
	CustomerID,
    CohortMonth,
    OrderMonth,
    Revenue,
    TIMESTAMPDIFF(MONTH, CohortMonth, OrderMonth) + 1 AS CohortIndex
FROM cohort_data;

-- creating retention table

WITH cohort_data AS(
	SELECT
		CustomerID,
        OrderMonth,
        Revenue,
        MIN(OrderMonth) OVER(PARTITION BY CustomerID) AS CohortMonth
	FROM online_retail
),

cohort_index AS(
	SELECT 
		CustomerID,
		CohortMonth,
		OrderMonth,
        Revenue,
		TIMESTAMPDIFF(MONTH, CohortMonth, OrderMonth) + 1 AS CohortIndex
	FROM cohort_data
)

SELECT
	CohortMonth,
    CohortIndex,
    COUNT(DISTINCT CustomerID) AS Customers
FROM cohort_index
GROUP BY CohortMonth, CohortIndex
ORDER BY CohortMonth, CohortIndex;

-- creating retention percentage table

WITH cohort_data AS(
	SELECT
		CustomerID,
        OrderMonth,
        Revenue,
        MIN(OrderMonth) OVER(PARTITION BY CustomerID) AS CohortMonth
	FROM online_retail
),

cohort_index AS(
	SELECT 
		CustomerID,
		CohortMonth,
		OrderMonth,
        Revenue,
		TIMESTAMPDIFF(MONTH, CohortMonth, OrderMonth) + 1 AS CohortIndex
	FROM cohort_data
),

cohort_table AS(
	SELECT
		CohortMonth,
		CohortIndex,
		COUNT(DISTINCT CustomerID) AS Customers
	FROM cohort_index
	GROUP BY CohortMonth, CohortIndex
)

SELECT
	c1.CohortMonth,
    c1.CohortIndex,
    c1.Customers,
    ROUND((c1.Customers*100.0/c2.Customers),2) AS RetentionRate
FROM cohort_table c1
JOIN cohort_table c2
ON c1.CohortMonth = c2.CohortMonth
AND c2.CohortIndex = 1
ORDER BY c1.CohortMonth, c1.CohortIndex;