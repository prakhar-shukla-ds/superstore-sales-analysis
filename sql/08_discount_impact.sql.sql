-- ========================================================================================
-- Q39: Is there a relationship between Discount level and Profit (average Profit at each Discount bracket)?
-- ========================================================================================

SELECT 
    CASE 
        WHEN "Discount" = 0 THEN '0% (No Discount)'
        WHEN "Discount" > 0 AND "Discount" <= 0.1 THEN '1-10%'
        WHEN "Discount" > 0.1 AND "Discount" <= 0.2 THEN '11-20%'
        WHEN "Discount" > 0.2 AND "Discount" <= 0.3 THEN '21-30%'
        WHEN "Discount" > 0.3 AND "Discount" <= 0.5 THEN '31-50%'
        ELSE '50%+'
    END AS discount_bracket,
    COUNT(*) AS num_orders,
    ROUND(AVG("Sales"), 2) AS avg_sales,
    ROUND(AVG("Profit"), 2) AS avg_profit
FROM orders
GROUP BY discount_bracket
ORDER BY discount_bracket;

-- ========================================================================================
-- Q40: What is the average Profit for orders with 0 Discount vs orders with a Discount applied?
-- ========================================================================================

SELECT 
    CASE 
        WHEN "Discount" = 0 THEN 'No Discount'
        ELSE 'Discount Applied'
    END AS discount_status,
    COUNT(*) AS num_orders,
    ROUND(AVG("Sales"), 2) AS avg_sales,
    ROUND(AVG("Profit"), 2) AS avg_profit
FROM orders
GROUP BY discount_status
ORDER BY discount_status;

-- ========================================================================================
-- Q41: Which Category is hurt most by discounting (biggest drop in profit margin as Discount increases)?
-- ========================================================================================

WITH category_discount_margin AS (
    SELECT 
        "Category",
        CASE 
            WHEN "Discount" = 0 THEN 'No Discount'
            ELSE 'Discount Applied'
        END AS discount_status,
        SUM("Sales") AS total_sales,
        SUM("Profit") AS total_profit
    FROM orders
    GROUP BY "Category", discount_status
),
margin_calc AS (
    SELECT 
        "Category",
        discount_status,
        ROUND((total_profit / total_sales * 100), 2) AS profit_margin_pct
    FROM category_discount_margin
)
SELECT 
    no_disc."Category",
    no_disc.profit_margin_pct AS margin_no_discount,
    disc.profit_margin_pct AS margin_with_discount,
    ROUND(no_disc.profit_margin_pct - disc.profit_margin_pct, 2) AS margin_drop_pct
FROM margin_calc no_disc
JOIN margin_calc disc 
    ON no_disc."Category" = disc."Category"
    AND no_disc.discount_status = 'No Discount'
    AND disc.discount_status = 'Discount Applied'
ORDER BY margin_drop_pct DESC;

