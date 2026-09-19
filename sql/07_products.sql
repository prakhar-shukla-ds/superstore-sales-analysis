-- ========================================================================================
-- Q35: What are the top 10 best-selling products by Sales?
-- ========================================================================================

SELECT 
    "Product Name",
    ROUND(SUM("Sales"), 2) AS total_sales
FROM orders
GROUP BY "Product Name"
ORDER BY total_sales DESC
LIMIT 10;


-- ========================================================================================
-- Q36: What are the top 10 best-selling products by Quantity sold?
-- ========================================================================================

SELECT 
    "Product Name",
    SUM("Quantity") AS total_quantity
FROM orders
GROUP BY "Product Name"
ORDER BY total_quantity DESC
LIMIT 10;


-- ========================================================================================
-- Q37: Which products have the highest average Discount?
-- ========================================================================================

SELECT 
    "Product Name",
    ROUND(AVG("Discount"), 3) AS avg_discount
FROM orders
GROUP BY "Product Name"
ORDER BY avg_discount DESC
LIMIT 10;

-- ========================================================================================
-- Q38: Which products are the least profitable (or a net loss) despite selling well?
-- ========================================================================================

WITH product_summary AS (
    SELECT 
        "Product Name",
        SUM("Sales") AS total_sales,
        SUM("Profit") AS total_profit,
        SUM("Quantity") AS total_quantity
    FROM orders
    GROUP BY "Product Name"
)
SELECT 
    "Product Name",
    ROUND(total_sales, 2) AS total_sales,
    ROUND(total_profit, 2) AS total_profit,
    total_quantity
FROM product_summary
WHERE total_profit < 0
ORDER BY total_profit ASC, total_sales DESC;


