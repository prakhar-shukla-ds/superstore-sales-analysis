-- ======================================================================================== 
-- Q30:	Who are the top 10 customers by total Sales? 
-- ========================================================================================

WITH customer_sales AS (
	SELECT 
		"Customer Name",
		SUM("Sales") AS total_sales,
		DENSE_RANK() OVER (ORDER BY SUM("Sales") DESC) AS sales_rank
	FROM orders
	GROUP BY "Customer Name"
)

SELECT 
	"Customer Name",
	total_sales,
	sales_rank
FROM customer_sales
WHERE sales_rank <= 10

-- ======================================================================================== 
-- Q31: Who are the top 10 customers by total Profit?
-- ========================================================================================

WITH customer_profit AS (
	SELECT 
		"Customer Name",
		SUM("Profit") AS total_profit,
		DENSE_RANK() OVER (ORDER BY SUM("Profit") DESC) AS profit_rank
	FROM orders
	GROUP BY "Customer Name"
)

SELECT 
	"Customer Name",
	total_profit,
	profit_rank
FROM customer_profit
WHERE profit_rank <= 10

-- ======================================================================================== 
-- Q32: What are the top 10 customers ranked by number of orders placed?
-- ========================================================================================

 WITH customer_orders AS (
	SELECT 
		"Customer Name",
		COUNT("Order ID") AS total_orders,
		DENSE_RANK() OVER (ORDER BY COUNT("Order ID") DESC) AS orders_rank
	FROM orders
	GROUP BY "Customer Name"
)

SELECT 
	"Customer Name",
	total_orders,
	orders_rank
FROM customer_orders
WHERE orders_rank <= 10

-- ======================================================================================== 
-- Q33: What is the average order value per customer?
-- ========================================================================================

SELECT 
    "Customer Name",
    ROUND(SUM("Sales") / COUNT(DISTINCT "Order ID"),2) AS average_order_value
FROM orders
GROUP BY "Customer Name"
ORDER BY average_order_value DESC;

-- ======================================================================================== 
-- Q34: Which customers have generated a net loss overall?
-- ========================================================================================

SELECT 
    "Customer Name",
    SUM("Profit") AS net_loss
FROM orders
GROUP BY "Customer Name"
HAVING SUM("Profit") < 0
ORDER BY net_loss;

