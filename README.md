# Olist Brazilian E-Commerce Analysis — SQL + Python

**Tools:** Python · Pandas · SQLAlchemy · SQLite · Matplotlib · Seaborn  
**Dataset:** [Olist Brazilian E-Commerce](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) — 100k+ orders, 8 relational tables

## Project Overview
End-to-end data analysis project simulating a real analyst workflow:
raw CSV files → relational database (schema-first) → SQL queries → Python visualizations → business insights.

This project uses a **schema-first approach** — database tables are defined with PRIMARY KEY and FOREIGN KEY constraints before any data is loaded, mirroring how production data pipelines work in industry.

## Key Findings
- Customer review scores decline 28% when delivery exceeds 20 days — with the sharpest drop past the 14-day threshold
- Top 3 product categories (Bed & Bath, Health & Beauty, Sport & Leisure) account for 40%+ of total platform revenue
- Amazonas (AM) records the longest average delivery time yet achieves above-average review scores — consistent with the 
**Expectation-Disconfirmation Model**: customers in remote states have lower baseline delivery expectations, so relative performance matters more than absolute speed
- Credit card instalment usage (avg 3.1 instalments) signals liquidity-constrained buyers, suggesting affordability-focused promotions could unlock higher order values

## Business Recommendations
- Segment logistics KPIs by region rather than applying a single national target — geography fundamentally limits delivery speed in northern states
- Prioritise logistics intervention for orders projected to exceed 14 days, the critical satisfaction threshold
- Introduce instalment promotions for credit card orders above R$200 to increase average order value
- Invest in regional fulfilment infrastructure for AM, RR and AP states

## How to Run
1. Download dataset from Kaggle link above, place all 8 CSVs in `data/raw/`
2. `pip install -r requirements.txt`
3. Run notebooks in order: 01 → 02 → 03 → 04 → 05

## Project Structure
olist-ecommerce-analysis/
│
├── data/
│   ├── raw/                     ← 8 Kaggle CSVs (gitignored)
│   ├── processed/               ← clean exported CSVs
│   ├── charts_eda/              ← EDA visualizations from notebook 04
│   └── charts_insights/         ← business insight charts from notebook 05
│
├── database/
│   ├── queries/                 ← 6 standalone SQL query files
│   │   ├── delivery_performance.sql
│   │   ├── delivery_vs_satisfaction.sql
│   │   ├── monthly_revenue.sql
│   │   ├── payment_methods.sql
│   │   ├── state_performance.sql
│   │   └── top_categories.sql
│   ├── schema.sql               ← table definitions with PRIMARY KEY, FOREIGN KEY
│   └── olist.db                 ← SQLite database (gitignored)
│
├── notebooks/
│   ├── 01_data_ingestion.ipynb    ← schema-first load: schema.sql → 8 tables → olist.db
│   ├── 02_sql_exploration.ipynb   ← JOIN, GROUP BY, HAVING, CASE WHEN queries
│   ├── 03_data_cleaning.ipynb     ← timestamp fixes, inconsistency detection, derived columns
│   ├── 04_eda.ipynb               ← visualizations saved to data/charts_eda/
│   ├── 05_business_insights.ipynb ← question → SQL → chart → economic interpretation
│   └── checkcolumns.ipynb         ← column verification before schema design
│
├── Olist_Case_Study_Report.pdf    ← full written analysis with economic theory
├── .gitignore
├── requirements.txt
└── README.md

## Author
Tay Tze Ping — Bachelor of Economics, Majoring in Applied Statistics  
University of Malaya