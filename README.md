# 🛒 Superstore Commercial Strategy Analysis

![Excel](https://img.shields.io/badge/Excel-Advanced-217346?style=flat&logo=microsoftexcel&logoColor=white)
![SQL](https://img.shields.io/badge/SQL_Server-Intermediate-CC2927?style=flat&logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Intermediate-F2C811?style=flat&logo=powerbi&logoColor=black)
![Status](https://img.shields.io/badge/Status-Completed-2E7D32?style=flat)

> **A full-cycle data analytics portfolio project** simulating a real consulting engagement for a US retail giant. Built to demonstrate end-to-end analytical capabilities — from raw data cleaning to executive-level storytelling.

---

## 📊 Dashboard Preview

### Executive Overview
![Executive Overview](images/dashboard/executive_overview.png)

### Category & Product Strategy
![Category Strategy](images/dashboard/category_strategy.png)

### Region & Segment Strategy
![Region & Segment](images/dashboard/region_segment.png)

---

## 🏢 Business Context

A Superstore Giant operating across the United States (2014–2017) needed strategic guidance on resource allocation. With growing market competition and declining margins in key areas, leadership required a data-driven answer to one central question:

> **"Which products, regions, categories, and customer segments should we target — and which should we avoid?"**

**Stakeholder:** VP of Commercial Strategy  
**Dataset:** 9,994 order records | 4 years | 4 regions | 3 categories  
**Period:** January 2014 – December 2017  

---

## 🔍 Key Findings

| # | Finding | Impact |
|---|---------|--------|
| 1 | **Furniture** generates $742K in sales but only **2.49% profit margin** | Critical underperformer — review pricing strategy |
| 2 | **Tables** sub-category operates at **-8.56% margin** — actively losing money | Immediate action required |
| 3 | Any discount above **20% destroys margin** — High discount orders show **-77.4% margin** | Discount policy redesign needed |
| 4 | **Central region** applies 24% avg discount vs West's 11% — directly causing its **7.92% margin** (lowest) | Discount ceiling needed in Central |
| 5 | **19.4% of all orders are unprofitable** — 1,936 orders with Profit ≤ 0 | Structural pricing issue |
| 6 | **Home Office** has the highest profit margin (14.03%) but lowest volume — untapped growth opportunity | Prioritize acquisition in this segment |
| 7 | **California + New York** represent 70-80% of their respective region's profit | Geographic concentration risk |
| 8 | **Q4 generates 38.2% of annual revenue** vs Q1's 15.6% — strong seasonality | Inventory and staffing planning needed |

---

## ✅ Strategic Recommendations

### TARGET — Prioritize Investment
- **Technology** (17.4% margin) and **Office Supplies** (17.0% margin)
- **West** and **East** regions — strongest and most consistent performers
- **Home Office** segment — highest margin per order, growth potential
- **Labels, Copiers, Envelopes** — highest margin sub-categories (37-44%)
- **No discount or Low discount (≤20%)** orders — 29.51% and 11.91% margin

### AVOID / REVIEW — Reduce or Restructure
- **Furniture** category — especially **Tables** (-8.56%) and **Bookcases** (-3.02%)
- **Central region** — excessive discounting destroying margins
- **Texas** (-$25,729), **Ohio** (-$16,971), **Pennsylvania** (-$15,560) — highest loss states
- **High discount policy (>40%)** — generating $99,558 in cumulative losses

---

## 🛠️ Tools & Skills Demonstrated

### Microsoft Excel — Advanced
- Data cleaning and transformation (mixed date formats, data type corrections)
- 5 calculated columns with business logic
- Pivot Tables and dynamic charts
- KPI Summary dashboard
- Data Dictionary and Cleaning Log documentation

### SQL Server — Intermediate
- 6 analytical scripts from basic aggregations to CTEs and subqueries
- Window functions and CASE WHEN logic
- Cross-dimensional analysis (Region × Category, Segment × Discount)
- Post-import data validation
- Professional commenting and naming conventions

### Power BI — Intermediate
- Star schema data model with Calendar table
- 10 DAX measures including time intelligence (YoY Growth)
- Dynamic TARGET/AVOID cards using CONCATENATEX + TOPN
- 3-page executive dashboard with custom SVG backgrounds
- Interactive slicers synchronized across all pages

---

## 📁 Project Structure

```
superstore-commercial-analysis/
│
├── 📁 data/
│   ├── raw/                    # Original unmodified dataset
│   └── cleaned/                # Cleaned Excel file (26 columns)
│
├── 📁 sql/
│   ├── 00_table_setup_and_verification.sql
│   ├── 01_data_exploration.sql
│   ├── 02_sales_analysis.sql
│   ├── 03_profitability_analysis.sql
│   ├── 04_customer_segmentation.sql
│   ├── 05_regional_analysis.sql
│   └── 06_discount_impact.sql
│
├── 📁 excel/
│   └── superstore_analysis.xlsx    # Pivot tables + KPI dashboard
│
├── 📁 powerbi/
│   └── superstore_dashboard.pbix   # 3-page executive dashboard
│
├── 📁 images/
│   ├── dashboard/                  # Power BI screenshots
│   └── charts/                     # Excel chart screenshots
│
├── 📁 documentation/
│   ├── data_dictionary.md          # 26 column definitions
│   ├── cleaning_log.md             # 9 issues documented
│   └── sql_documentation.md        # Query findings and notes
│
├── 📁 reports/
│   └── executive_summary.md        # Full case study
│
└── README.md
```

---

## 🔄 Methodology

This project follows a structured consulting approach:

```
1. DISCOVERY      → Business context, stakeholder definition, SMART objectives
2. DATA CLEANING  → Excel — 9 issues identified and documented
3. SQL ANALYSIS   → 6 scripts answering 7 business questions
4. EXCEL ANALYSIS → Pivot tables, KPI summary, trend charts
5. VISUALIZATION  → Power BI 3-page executive dashboard
6. DOCUMENTATION  → Data dictionary, cleaning log, SQL findings
```

---

## 📈 Business Questions Answered

| BQ | Question | Script |
|----|----------|--------|
| BQ-01 | Which products and sub-categories generate losses? | 03_profitability_analysis |
| BQ-02 | Which regions and states are most/least profitable? | 05_regional_analysis |
| BQ-03 | Which customer segment is most valuable? | 04_customer_segmentation |
| BQ-04 | How does discount impact profitability by category? | 06_discount_impact |
| BQ-05 | Which ship mode affects margins and in which region? | 02_sales_analysis |
| BQ-06 | What is the sales and profit trend over time? | 01_data_exploration |
| BQ-07 | Which are the top 10 most and least profitable products? | 03_profitability_analysis |

---

## 🚀 How to Reproduce

### Excel
1. Open `data/cleaned/superstore_cleaned.xlsx`
2. Review `CLEANING_LOG` tab for all transformations applied
3. Open `excel/superstore_analysis.xlsx` for pivot tables and charts

### SQL
1. Create database: `CREATE DATABASE SuperstoreDB;`
2. Import `data/cleaned/superstore_cleaned.csv` using Import Flat File
3. Run scripts in `/sql/` in numerical order (00 → 06)

### Power BI
1. Open `powerbi/superstore_dashboard.pbix`
2. If prompted, update data source path to your local `superstore_cleaned.xlsx`
3. Refresh data and navigate the 3 dashboard pages

---

## 👨‍💼 Author

**Orlando Gabriel Sanchez Vilchis**  
Business & International Trade | Data & BI Analyst  

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/orlando-gabriel-sanchez-vilchis)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-181717?style=flat&logo=github&logoColor=white)](https://github.com/ogsvilchis)

---

## 📄 License

This project uses the [Superstore Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final/data) from Kaggle, available for educational and portfolio purposes.

---

*Built as a portfolio project to demonstrate end-to-end data analytics capabilities across Excel, SQL Server, and Power BI.*
