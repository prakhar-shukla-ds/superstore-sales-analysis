-- ========================================================================================
-- Q1: How many total orders are there?
-- ========================================================================================

SELECT 
	COUNT(*) AS total_orders 
FROM orders;

-- ========================================================================================
-- Q2: How many unique customers placed orders?
-- ========================================================================================

SELECT 
	COUNT(DISTINCT "Customer ID") AS unique_customers
FROM orders;

-- ========================================================================================
-- Q3: What is the date range of orders (earliest to latest)?
-- ========================================================================================

SELECT 
	DATE(MIN("Order Date")) AS ealriest_date,
	DATE(MAX("Order Date")) AS latest_date,
	DATE(MAX("Order Date")) - DATE(MIN("Order Date")) AS date_range_days 
FROM orders;

-- ========================================================================================
-- Q4: How many unique products are sold?
-- ========================================================================================

SELECT 
	COUNT(DISTINCT "Product ID") AS unique_products
FROM orders;

-- ========================================================================================
-- Q5: How many orders exist per Region, Segment, and Category?
-- ========================================================================================

-- By Region
SELECT 
	"Region", 
	COUNT(*) AS order_count
FROM orders
GROUP BY "Region";

-- By Segment
SELECT 
	"Segment", 
	COUNT(*) AS order_count
FROM orders
GROUP BY "Segment";

-- By Category
SELECT 
	"Category", 
	COUNT(*) AS order_count
FROM orders
GROUP BY "Category";





























