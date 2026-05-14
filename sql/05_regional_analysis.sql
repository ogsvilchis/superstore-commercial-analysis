/*
═══════════════════════════════════════════════════════
PROJECT  : Superstore Commercial Strategy Analysis
SCRIPT   : 05 - Regional Analysis
PURPOSE  : Analyze sales and profit performance by
           region and state to identify geographic
           opportunities and underperforming markets
           Answers: Which regions and states should
           we prioritize or reallocate resources from?
AUTHOR   : Orlando Gabriel Sanchez Vilchis
DATE     : 11/05/2026
VERSION  : 1.0
═══════════════════════════════════════════════════════
*/

USE SuperstoreDB;
GO

-- ══════════════════════════════════════════════════
-- SECTION 1: PROFITABILITY BY REGION
-- Purpose: Compare total sales, profit and margin
--          across the 4 geographic regions
-- ══════════════════════════════════════════════════

SELECT
    Region,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS profit_margin_pct 
FROM dbo.Superstore
GROUP BY Region
ORDER BY profit_margin_pct DESC;


-- ══════════════════════════════════════════════════
-- SECTION 2: TOP 10 STATES BY PROFIT
-- Purpose: Identify the most profitable states
--          to prioritize commercial investment
-- ══════════════════════════════════════════════════

SELECT TOP 10
    State,
    Region,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM dbo.Superstore
GROUP BY 
    State,
    Region
ORDER BY total_profit DESC;


-- ══════════════════════════════════════════════════
-- SECTION 3: BOTTOM 10 STATES BY PROFIT
-- Purpose: Identify states generating losses
--          to evaluate resource reallocation
-- ══════════════════════════════════════════════════

SELECT TOP 10
    State,
    Region,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM dbo.Superstore
GROUP BY 
    State,
    Region
ORDER BY total_profit ASC;


-- ══════════════════════════════════════════════════
-- SECTION 4: CATEGORY PERFORMANCE BY REGION
-- Purpose: Identify which categories perform
--          differently across geographic regions
-- ══════════════════════════════════════════════════

SELECT
    Region,
    Category,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS profit_margin_pct 
FROM dbo.Superstore
GROUP BY 
    Region,
    Category
ORDER BY Region ASC, profit_margin_pct DESC;
