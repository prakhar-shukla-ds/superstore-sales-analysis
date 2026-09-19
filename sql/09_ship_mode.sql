-- ========================================================================================
-- Q42:	What is the total Sales and Profit by Ship Mode?
-- ========================================================================================

SELECT 
	"Ship Mode",
	SUM("Sales") AS total_sales,
	SUM("Profit") AS total_profit
FROM orders
GROUP BY "Ship Mode"
ORDER BY 
	total_sales DESC, 
	total_profit DESC

-- ========================================================================================
-- Q43: Which Ship Mode is used most frequently?
-- ========================================================================================

WITH CTE AS (
    SELECT 
        "Ship Mode" AS ship_mode,
        COUNT(*) AS mode_count
    FROM orders
    GROUP BY "Ship Mode"
)

SELECT 
    ship_mode,
    mode_count
FROM CTE
WHERE mode_count = (
    SELECT 
		MAX(mode_count)
    FROM CTE
);





















