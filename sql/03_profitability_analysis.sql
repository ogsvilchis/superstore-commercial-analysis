/*
═══════════════════════════════════════════════════════
PROJECT  : Superstore Commercial Strategy Analysis
SCRIPT   : 03 - Profitability Analysis
PURPOSE  : Analyze profit margins by category,
           sub-category and product level
           Answers: Which products and categories
           should we keep, optimize or eliminate?
AUTHOR   : Orlando Gabriel Sanchez Vilchis
DATE     : 11/05/2026
VERSION  : 1.0
═══════════════════════════════════════════════════════
*/

USE SuperstoreDB;
GO

-- ══════════════════════════════════════════════════
-- SECTION 1: PROFIT MARGIN BY CATEGORY
-- Purpose: Calculate and compare profit margin
--          percentage across the 3 product categories
-- ══════════════════════════════════════════════════

SELECT
    Category,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS profit_margin_pct
FROM dbo.Superstore
GROUP BY Category
ORDER BY profit_margin_pct DESC;


-- ══════════════════════════════════════════════════
-- SECTION 2: PROFIT MARGIN BY SUB-CATEGORY
-- Purpose: Identify which sub-categories generate
--          profit and which destroy value
-- ══════════════════════════════════════════════════

SELECT 
    Category,
    Sub_Category,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS profit_margin_pct
FROM dbo.Superstore
GROUP BY 
    Category, 
    Sub_Category
ORDER BY profit_margin_pct DESC;


-- ══════════════════════════════════════════════════
-- SECTION 3: BOTTOM 10 PRODUCTS BY PROFIT
-- Purpose: Identify the 10 products generating
--          the highest losses for the business
-- ══════════════════════════════════════════════════

SELECT TOP 10
    Product_Name,
    Category,
    Sub_Category,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM dbo.Superstore
GROUP BY 
    Product_Name,
    Category,
    Sub_Category
ORDER BY total_profit ASC;


-- ══════════════════════════════════════════════════
-- SECTION 4: PROFITABILITY BY SEGMENT AND CATEGORY
-- Purpose: Identify which customer segment drives
--          profit in each product category
-- ══════════════════════════════════════════════════

SELECT 
    Segment,
    Category,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM dbo.Superstore
GROUP BY 
    Segment,
    Category
ORDER BY 
    Segment ASC, 
    total_profit DESC;


-- ══════════════════════════════════════════════════
-- SECTION 5: UNPROFITABLE ORDERS SUMMARY
-- Purpose: Quantify the scale of loss-making orders
--          across categories and segments
-- ══════════════════════════════════════════════════

SELECT
    Category,
    Segment,
    COUNT(*) AS total_orders,
    SUM(CASE 
        WHEN Profit <= 0 THEN 1 
        ELSE 0 
    END) AS loss_orders,
    CAST(ROUND((SUM(CASE 
        WHEN Profit <= 0 THEN 1 
        ELSE 0 
    END) *100.0/COUNT(*)),2) AS DECIMAL(4,2))  AS loss_order_pct
FROM dbo.Superstore
GROUP BY 
    Category,
    Segment
ORDER BY loss_order_pct DESC;
