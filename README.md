# Olist E-Commerce Analysis — SQL + Python

**Tools:** Python · Pandas · SQLAlchemy · SQLite · Matplotlib · Seaborn  
**Dataset:** [Olist Brazilian E-Commerce](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) — 100k+ orders, 8 relational tables

## Project Overview
End-to-end data analysis project simulating a real analyst workflow:
raw CSV files → relational database (schema-first) → SQL queries → Python visualizations → business insights.

## Key Findings
- Customer review scores drop from ~4.3 to ~3.1 when delivery exceeds 20 days
- Top 3 revenue categories account for over 40% of total sales
- Credit card instalments dominate payments, suggesting price-sensitive buyers
- Northern states (AM, RR, AP) show longest delivery times and lowest review scores

## How to Run
1. Download dataset from Kaggle link above, place all 8 CSVs in `data/raw/`
2. `pip install -r requirements.txt`
3. Run notebooks in order: 01 → 02 → 03 → 04 → 05

## Project Structure
- `database/schema.sql` — manually written table definitions (PRIMARY KEY, FOREIGN KEY)
- `database/queries/` — 6 key SQL queries saved as standalone .sql files
- `notebooks/01` — runs schema.sql then loads 8 CSVs into SQLite (if_exists=append)
- `notebooks/02` — SQL exploration: JOIN, GROUP BY, HAVING, CASE WHEN
- `notebooks/03` — data cleaning, type fixes, logical inconsistency detection
- `notebooks/04` — EDA visualizations saved to data/processed/
- `notebooks/05` — business insights: question → SQL → chart → recommendation
