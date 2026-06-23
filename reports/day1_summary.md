# Day 1 Dataset Summary

| Dataset                   | Rows   | Columns | Missing Values | Duplicate Rows |
|----------------------------|--------|---------|----------------|----------------|
| 01_fund_master.csv         | 40     | 15      | 0              | 0              |
| 02_nav_history.csv         | 46000  | 3       | 0              | 0              |
| 03_aum_by_fund_house.csv   | 90     | 5       | 0              | 0              |
| 04_monthly_sip_inflows.csv | 48     | 6       | 12             | 0              |
| 05_category_inflows.csv    | 144    | 3       | 0              | 0              |
| 06_industry_folio_count.csv| 21     | 6       | 0              | 0              |
| 07_scheme_performance.csv  | 40     | 19      | 0              | 0              |
| 08_investor_transactions.csv| 32778 | 13      | 0              | 0              |
| 09_portfolio_holdings.csv  | 322    | 8       | 0              | 0              |
| 10_benchmark_indices.csv   | 8050   | 3       | 0              | 0              |


- All 10 datasets ingested successfully.
- Missing values found only in `04_monthly_sip_inflows.csv` (12 entries).
- No duplicate rows detected across datasets.
- Fund master exploration:
  - 10 unique fund houses
  - 2 categories (Equity, Debt)
  - 12 sub-categories (Large Cap, Mid Cap, Small Cap, ELSS, etc.)
  - 5 risk categories (Low, Moderate, Moderately High, High, Very High)
- AMFI code validation: all codes in fund_master are present in nav_history.
- Live NAV data fetched for HDFC Top 100 Direct and 5 key schemes (SBI, ICICI, Nippon, Axis, Kotak).

