-- ========================================================================================
-- Q11: What is the total Sales and Profit by Category?
-- ========================================================================================

SELECT 
	"Category", 
	ROUND(SUM("Sales")::numeric,2) AS total_sales, 
	ROUND(SUM("Profit")::numeric,2) AS total_profit
FROM orders
GROUP BY "Category"
ORDER BY total_profit DESC, total_sales DESC;

-- ========================================================================================
-- Q12:What is the total Sales and Profit by Sub-Category?
-- ========================================================================================

SELECT
	"Sub-Category",
	ROUND(SUM("Sales")::numeric,2) AS total_sales,
	ROUND(SUM("Profit")::numeric,2) AS total_profit
FROM orders
GROUP BY "Sub-Category"
ORDER BY total_profit DESC, total_sales DESC;

-- ========================================================================================
-- Q13:Which Sub-Categories are unprofitable (negative total Profit) despite having sales?
-- ========================================================================================
SELECT 
    "Sub-Category",
    ROUND(SUM("Sales")::numeric, 2) AS total_sales,
    ROUND(SUM("Profit")::numeric, 2) AS total_profit
FROM orders
GROUP BY "Sub-Category"
HAVING SUM("Profit") < 0
ORDER BY total_profit DESC, total_sales DESC;

-- ========================================================================================
-- Q14:What is the average Discount given per Category?
-- ========================================================================================

SELECT 
	"Category", 
	ROUND(AVG("Discount")::numeric,2) * 100 as avg_discount_pct
FROM orders
GROUP BY "Category"
ORDER BY avg_discount_pct DESC;

-- ========================================================================================
-- Q15:Which Category has the highest profit margin (%)?
-- ========================================================================================

SELECT 
    "Category",
    ROUND(SUM("Sales")::numeric, 2) AS total_sales,
    ROUND(SUM("Profit")::numeric, 2) AS total_profit,
    ROUND((SUM("Profit") / SUM("Sales") * 100)::numeric, 2) AS profit_margin_pct
FROM orders
GROUP BY "Category"
ORDER BY profit_margin_pct DESC;

-- ========================================================================================
-- Q16:What is the total Quantity sold per Category and Sub-Category?
-- ========================================================================================

-- Per Category
SELECT 
    "Category",
    SUM("Quantity") AS total_quantity
FROM orders
GROUP BY "Category"
ORDER BY total_quantity DESC;

-- Per Sub-Category
SELECT 
    "Sub-Category",
    SUM("Quantity") AS total_quantity
FROM orders
GROUP BY "Sub-Category"
ORDER BY total_quantity DESC;

































































