-- ========================================================================================
-- Q45:	Which Regional Manager oversees the region with the highest total Sales?
-- ========================================================================================

WITH max_sales AS (
	SELECT 
		p."Regional Manager",
		SUM(o."Sales") AS total_sales
	FROM orders o
	JOIN people p
		ON o."Region" = p."Region"
	GROUP BY p."Regional Manager"
)

SELECT 
	"Regional Manager", 
	total_sales 
FROM max_sales
WHERE total_sales = (
	SELECT 
		MAX(total_sales) 
	FROM max_sales 
)

-- ========================================================================================
-- Q46: What is the total Sales and Profit under each Regional Manager?
-- ========================================================================================

SELECT 
	p."Regional Manager",
	SUM(o."Sales") AS total_sales,
	SUM(o."Profit") AS total_profit
FROM orders o
JOIN people p
	ON o."Region" = p."Region"
GROUP BY p."Regional Manager"
ORDER BY 
	total_sales DESC,
	total_profit DESC











		