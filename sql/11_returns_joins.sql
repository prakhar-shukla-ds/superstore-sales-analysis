-- ========================================================================================
-- Q47: What percentage of total orders were returned?
-- ========================================================================================

WITH order_data AS (
	SELECT 
		COUNT(r."Returned") AS total_returns,
		COUNT(o."Order ID") AS total_orders
	FROM orders o
	LEFT JOIN returns r
		ON o."Order ID" = r."Order ID"
)

SELECT 
	ROUND((total_returns::numeric / total_orders) * 100,2) AS return_rate_pct 
FROM order_data;

-- ========================================================================================
-- Q48: What is the return rate (%) by Category?
-- ========================================================================================

WITH order_data AS (
	SELECT 
		o."Category" AS return_category,
		COUNT(r."Returned") AS orders_returned,
		COUNT(o."Order ID") AS total_orders
	FROM orders o
	LEFT JOIN returns r
		ON o."Order ID" = r."Order ID"
	GROUP BY o."Category"
)

SELECT
	return_category,
	ROUND((orders_returned::numeric / total_orders) * 100,2) AS return_rate_pct 
FROM order_data
ORDER BY return_rate_pct DESC;

-- ========================================================================================
-- Q49: What is the return rate (%) by Sub-Category?
-- ========================================================================================

WITH order_data AS (
	SELECT 
		o."Sub-Category" AS return_sub_category,
		COUNT(r."Returned") AS orders_returned,
		COUNT(o."Order ID") AS total_orders
	FROM orders o
	LEFT JOIN returns r
		ON o."Order ID" = r."Order ID"
	GROUP BY o."Sub-Category"
)

SELECT
	return_sub_category,
	ROUND((orders_returned::numeric / total_orders) * 100,2) AS return_rate_pct 
FROM order_data
ORDER BY return_rate_pct DESC;

-- ========================================================================================
-- Q50:	Which Region has the highest return rate?
-- ========================================================================================

WITH order_data AS (
	SELECT 
		o."Region" AS return_region,
		COUNT(r."Returned") AS orders_returned,
		COUNT(o."Order ID") AS total_orders
	FROM orders o
	LEFT JOIN returns r
		ON o."Order ID" = r."Order ID"
	GROUP BY o."Region"
)

SELECT
	return_region,
	ROUND((orders_returned::numeric / total_orders) * 100,2) AS return_rate_pct 
FROM order_data
ORDER BY return_rate_pct DESC;

-- ========================================================================================
-- Q51:	Which customers have the most returns?
-- ========================================================================================

WITH order_data AS (
	SELECT 
		o."Customer Name" AS return_cust,
		COUNT(r."Returned") AS orders_returned,
		COUNT(o."Order ID") AS total_orders
	FROM orders o
	LEFT JOIN returns r
		ON o."Order ID" = r."Order ID"
	GROUP BY o."Customer Name"
)

SELECT
	return_cust,
	ROUND((orders_returned::numeric / total_orders) * 100,2) AS return_rate_pct 
FROM order_data
ORDER BY return_rate_pct DESC;















































