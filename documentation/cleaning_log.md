# Cleaning Log
## Superstore Commercial Strategy Analysis

**Original file:** superstore_raw.csv  
**Cleaned file:** superstore_cleaned.xlsx  
**Tool used:** Microsoft Excel  
**Date:** May 2026  

---

## Issues Found & Resolved

| # | Column | Issue Found | Issue Type | Action Taken | Business Reason | Status |
|---|--------|-------------|------------|--------------|-----------------|--------|
| 1 | Row ID | Checked for fully duplicate rows using COUNTIF on Row ID column | Duplicate Check | No duplicates found. Verified that Row ID is a true unique identifier across all 9,994 records | Duplicate rows cause inflated metrics and incorrect aggregations in all KPIs | ✅ Verified — No action needed |
| 2 | Order Date | Two mixed error types detected due to regional settings conflict (Excel configured as DD/MM/YYYY, dataset in MM/DD/YYYY). Type A: Day ≤ 12 — Excel auto-converted with month and day swapped (stored as numeric serial). Type B: Day > 12 — Excel could not parse, stored as left-aligned text | Format Error — Mixed Types | Created helper column "Order Date Fixed". Applied IF(ISNUMBER()) to detect each case. For Type A: DATE(YEAR,DAY,MONTH) to swap month and day back. For Type B: DATE with FIND("/") to dynamically locate separators regardless of digit count. Validated with MIN(), MAX() and manual spot-checks against RAW_DATA. Pasted as values and replaced original column | Incorrect dates corrupt all time-series analysis, trend identification and seasonality detection | ✅ Fixed |
| 3 | Ship Date | Two mixed error types detected due to regional settings conflict (Excel configured as DD/MM/YYYY, dataset in MM/DD/YYYY). Type A: Day ≤ 12 — Excel auto-converted with month and day swapped (stored as numeric serial). Type B: Day > 12 — Excel could not parse, stored as left-aligned text | Format Error — Mixed Types | Created helper column "Ship Date Fixed". Applied IF(ISNUMBER()) to detect each case. For Type A: DATE(YEAR,DAY,MONTH) to swap month and day back. For Type B: DATE with FIND("/") to dynamically locate separators regardless of digit count. Validated with MIN(), MAX() and manual spot-checks against RAW_DATA. Pasted as values and replaced original column | Incorrect dates corrupt all time-series analysis, trend identification and seasonality detection | ✅ Fixed |
| 4 | Postal Code | ZIP codes starting with 0 lost leading zero — stored as integer instead of text. Example: "01234" saved as 1234 | Data Type Error | Created helper column "Postal Code Fixed" using TEXT(value,"00000") to force 5-digit format. Validated min value recovered leading zero. Pasted as values and replaced original column | ZIP codes are geographic identifiers, not numbers. Losing leading zeros causes mapping errors and incorrect geographic joins in SQL and Power BI | ✅ Fixed |
| 5 | Profit | Initial check found 1,871 negative profit records. Further analysis identified 65 additional records with Profit = 0 | Expected Behavior + Analytical Decision | Is_Profitable flag set to "No" for Profit ≤ 0 (includes both negative and zero-profit orders). Total unprofitable orders: 1,936 (19.4% of all orders) | Profit = 0 means no margin generated. All fixed and variable costs still apply, making zero-profit orders a net loss for the business in operational terms | ✅ Verified — Decision documented |
| 6 | Multiple | No calculated fields existed in raw dataset | Enhancement | Added 5 calculated columns: Profit_Margin, Discount_Category, Order_Year, Order_Month, Is_Profitable | These fields are essential for profitability analysis, discount impact measurement, trend analysis and seasonality detection | ✅ Added |
| 7 | Sales, Profit | Currency format ($) exports symbol to CSV causing SQL import failure | Export Format Issue | Removed Currency format — applied Number format with 2 decimals and no thousands separator | SQL Server cannot parse "$" symbol as numeric value | ✅ Fixed |
| 8 | Discount, Profit_Margin | Percentage format (%) exports symbol to CSV causing SQL import failure | Export Format Issue | Removed Percentage format — applied Number format with 2-4 decimals | SQL Server cannot parse "%" symbol as numeric value | ✅ Fixed |
| 9 | Profit_Margin_% | Column name contains special character % incompatible with SQL Server | Naming Convention | Renamed to Profit_Margin — updated in table, Data Dictionary and all references | Special characters in column names require escape brackets in every SQL query — reduces readability and risks errors | ✅ Fixed |

---

## Summary

| Metric | Value |
|--------|-------|
| Total issues found | 9 |
| Critical fixes | 4 (dates, postal code, formats, naming) |
| Analytical decisions | 1 (Profit = 0 classification) |
| Enhancements | 1 (calculated columns) |
| Export fixes | 3 (currency, percentage, column name) |
| Records after cleaning | 9,994 |
| Duplicate records removed | 0 |
