-- ======================================================================================== 
-- Q23:	What are total Sales and Profit by Year? 
-- ========================================================================================

SELECT 
	"Order Year",
	ROUND(SUM("Sales")::numeric,2) AS total_sales,
	ROUND(SUM("Profit")::numeric,2) AS total_profit
FROM orders
GROUP BY "Order Year"
ORDER BY "Order Year" DESC;

-- ======================================================================================== 
-- Q24:	What are total Sales and Profit by Month (across all years)? 
-- ========================================================================================

SELECT 
	"Order Year",
	"Order Month Name",
	ROUND(SUM("Sales")::numeric,2) AS total_sales,
	ROUND(SUM("Profit")::numeric,2) AS total_profit
FROM orders
GROUP BY 
	"Order Year",
	"Order Month Name",
	"Order Month"
ORDER BY 
	"Order Year" DESC,
	"Order Month";
	
-- ======================================================================================== 
-- Q25: Which month historically has the highest Sales (seasonality check)?
-- ========================================================================================

SELECT 
	MAX(total_sales) AS max_sales
FROM (
	SELECT 
	"Order Month Name",
	ROUND(SUM("Sales")::numeric,2) AS total_sales
FROM orders
GROUP BY
	"Order Month Name"
) AS monthly_sales;

-- ======================================================================================== 
-- Q26:	What is the month-over-month Sales growth?
-- ========================================================================================

-- ======================================================================================== 
-- Q27: What is the average Shipping Delay (Ship Date − Order Date) overall?
-- ========================================================================================

SELECT 
	ROUND(AVG("Ship Date"::date - "Order Date"::date),2) avg_overall_delay
FROM orders;

-- ======================================================================================== 
-- Q28: What is the average Shipping Delay by Ship Mode?
-- ========================================================================================

SELECT 
	"Ship Mode",
	ROUND(AVG("Ship Date"::date - "Order Date"::date),2) avg_overall_delay
FROM orders
GROUP BY "Ship Mode"
ORDER BY avg_overall_delay DESC;

-- ======================================================================================== 
-- Q29: Are there any orders shipped before the Order Date (data quality check)?
-- ========================================================================================

SELECT *
FROM orders
WHERE 
	CASE 
		WHEN "Order Date"::date > "Ship Date"::date THEN TRUE 
		ELSE FALSE
	END;

























































