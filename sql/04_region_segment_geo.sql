-- ========================================================================================
-- Q17: What is the total Sales and Profit by Region?
-- ========================================================================================

SELECT 
	"Region",
	ROUND(SUM("Sales")::numeric,2) AS total_sales,
	ROUND(SUM("Profit")::numeric,2) AS total_profit
FROM orders
GROUP BY "Region"
ORDER BY 
	total_profit DESC, 
	total_sales DESC;

-- ========================================================================================
-- Q18: What is the total Sales and Profit by Segment?
-- ========================================================================================

SELECT 
	"Segment",
	ROUND(SUM("Sales")::numeric,2) AS total_sales,
	ROUND(SUM("Profit")::numeric,2) AS total_profit
FROM orders
GROUP BY "Segment"
ORDER BY 
	total_profit DESC, 
	total_sales DESC;

-- ========================================================================================
-- Q19: Which State/Province generates the most Sales?
-- ========================================================================================

WITH MAX_SALES AS (
	SELECT 
		"State/Province",
		ROUND(SUM("Sales")::numeric,2) AS sales
	FROM orders
	GROUP BY 
		"State/Province"
)

SELECT * FROM MAX_SALES
WHERE sales = (
	SELECT MAX(sales) FROM MAX_SALES
);

-- ========================================================================================
-- Q20: Which City generates the most Sales?
-- ========================================================================================

WITH MAX_SALES AS (
	SELECT 
		"City",
		ROUND(SUM("Sales")::numeric,2) AS sales
	FROM orders
	GROUP BY 
		"City"
)

SELECT * FROM MAX_SALES
WHERE sales = (
	SELECT MAX(sales) FROM MAX_SALES
);

-- ========================================================================================
-- Q21: What is the Sales and Profit breakdown by Region + Category combined?
-- ========================================================================================

SELECT 
	"Region",
	"Category",
	ROUND(SUM("Sales")::numeric,2) AS total_sales,
	ROUND(SUM("Profit")::numeric,2) AS total_profit
FROM orders
GROUP BY 
	"Region",
	"Category"
ORDER BY 
	"Region",
	total_sales DESC;

-- ========================================================================================
-- Q22: Which Region has the lowest profit margin?
-- ========================================================================================

WITH MARGIN AS (
	SELECT 
		"Region",
	    ROUND((SUM("Profit") / SUM("Sales") * 100)::numeric, 2) AS profit_margin_pct
	FROM orders
	GROUP BY "Region"
)

SELECT * FROM MARGIN 
WHERE profit_margin_pct = (
SELECT MIN(profit_margin_pct) FROM MARGIN
);