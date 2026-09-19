-- ========================================================================================
-- Q6: What is the total Sales and total Profit across the entire dataset?
-- ========================================================================================

SELECT 
	ROUND(SUM("Sales")::numeric, 2) AS total_sales, 
	ROUND(SUM("Profit")::numeric, 2) AS total_profit
FROM orders;

-- ========================================================================================
-- Q7: What is the overall profit margin (Profit / Sales)
-- ========================================================================================

SELECT 
    ROUND(SUM("Profit")::numeric, 2) AS total_profit,
    ROUND(SUM("Sales")::numeric, 2) AS total_sales,
    ROUND((SUM("Profit") / SUM("Sales") * 100)::numeric, 2) AS profit_margin_pct
FROM orders;

-- ========================================================================================
-- Q8: What is the average Sales value per order?
-- ========================================================================================

SELECT 
	ROUND(AVG("Sales")::numeric,2) AS avg_sales_per_order
FROM orders;

-- ========================================================================================
-- Q9: Which single order has the highest Sales value? The highest Profit? The biggest loss?
-- ========================================================================================

-- Highest Sales
SELECT 
	"Order ID","Product Name", ROUND("Sales"::numeric,2) AS highest_sales
FROM orders
WHERE "Sales" = (
	SELECT 
		MAX("Sales")
	FROM orders
);

-- Highest Profit
SELECT 
	"Order ID","Product Name", ROUND("Profit"::numeric,2) AS highest_profit
FROM orders
WHERE "Profit" = (
	SELECT 
		MAX("Profit")
	FROM orders
);

-- Biggest loss
SELECT 
	"Order ID","Product Name", ROUND("Profit"::numeric,2) AS biggest_loss
FROM orders
WHERE "Profit" = (
	SELECT 
		MIN("Profit")
	FROM orders
);

-- ========================================================================================
-- Q10: How many orders resulted in a loss (negative Profit)?
-- ========================================================================================

SELECT 
	COUNT(*) AS loss_making_orders
FROM orders
WHERE "Profit" < 0;































































