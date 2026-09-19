-- ========================================================================================
-- Q54:	What is the Sales, Profit, and Return Rate side-by-side per Category (single summary table)?
-- ========================================================================================

WITH order_data AS (
	SELECT 
		o."Category" AS category,
		SUM("Sales") AS sales,
		SUM("Profit") AS profit,
		COUNT(r."Returned") AS orders_returned,
		COUNT(o."Order ID") AS total_orders
	FROM orders o
	LEFT JOIN returns r
		ON o."Order ID" = r."Order ID"
	GROUP BY o."Category"
)

SELECT
	category,
	sales,
	profit,
	ROUND((orders_returned::numeric / total_orders) * 100,2) AS return_rate_pct 
FROM order_data
ORDER BY 
	sales DESC,
	profit DESC,
	return_rate_pct DESC;

-- ========================================================================================
-- Q55:	Rank Sub-Categories by profit margin using a window function.
-- ========================================================================================

WITH order_data AS (
	SELECT 
		SUM("P")
	FROM orders o
)














