Queries Summary

Query 1: Top 5 Funds by AUM
SQL:
SELECT scheme_name, fund_house, aum_crore
FROM fact_performance
ORDER BY aum_crore DESC
LIMIT 5;

Sample Output:
+-------------------------------------------------------------+------------------+----------+
| scheme_name                                                 | fund_house       | aum_crore|
+-------------------------------------------------------------+------------------+----------+
| Mirae Asset Emerging Bluechip Fund - Regular - Growth       | Mirae Asset MF   | 49046    |
| Kotak Emerging Equity Fund - Regular - Growth               | Kotak Mahindra MF| 47469    |
| Nippon India Small Cap Fund - Regular - Growth              | Nippon India MF  | 43630    |
| DSP Top 100 Equity Fund - Regular - Growth                  | DSP Mutual Fund  | 41828    |
| UTI Mid Cap Fund - Regular - Growth                         | UTI Mutual Fund  | 41728    |
+-------------------------------------------------------------+------------------+----------+

Insight:
The top funds by AUM are dominated by mid‑cap and small‑cap equity schemes, showing strong investor interest in growth‑oriented funds.


Query 2: Average NAV per Year
SQL:
SELECT strftime('%Y', date) AS year, AVG(nav) AS avg_nav
FROM fact_nav
GROUP BY year
ORDER BY year;

Sample Output:
+------+---------------------+
| year | avg_nav             |
+------+---------------------+
| 2022 | 215.1346329326923   |
| 2023 | 245.92460712500002  |
| 2024 | 276.0924481679389   |
| 2025 | 308.7722698467433   |
| 2026 | 347.70671483644855  |
+------+---------------------+

Insight:
The average NAV shows steady year‑on‑year growth, reflecting consistent performance and investor confidence.


Query 3: Monthly SIP Inflows Trend
SQL:
SELECT month, sip_inflow_crore
FROM fact_sip
ORDER BY month;

Sample Output:
+------------+------------------+
| month      | sip_inflow_crore |
+------------+------------------+
| 2022-01-01 | 11517            |
| 2022-02-01 | 11438            |
| 2022-03-01 | 12328            |
| 2022-04-01 | 11863            |
| 2022-05-01 | 12286            |
| 2022-06-01 | 12276            |
| 2022-07-01 | 12140            |
| 2022-08-01 | 12694            |
+------------+------------------+

Insight:
SIP inflows remain strong and stable, with a noticeable peak in March and August 2022, indicating investor preference for systematic investments.


Query 4: Category-wise Net Inflows
SQL:
SELECT category, SUM(net_inflow_crore) AS total_inflow
FROM fact_category_inflows
GROUP BY category
ORDER BY total_inflow DESC;

Sample Output:
+--------------------+--------------+
| category           | total_inflow |
+--------------------+--------------+
| Liquid             | 451275       |
| Sectoral/Thematic  | 103829       |
| Flexi Cap          | 63989        |
| Large & Mid Cap    | 57752        |
| Short Duration     | 55530        |
| Mid Cap            | 55312        |
| Small Cap          | 46596        |
| Hybrid             | 38868        |
+--------------------+--------------+

Insight:
Liquid funds dominate inflows, showing investor preference for short‑term, low‑risk investments, while thematic and flexi‑cap funds also attract significant interest.



Query 5: Folio Count Growth Over Time
SQL:
SELECT month, total_folios_crore, equity_folios_crore, debt_folios_crore
FROM fact_folio_count
ORDER BY month;

Sample Output:
+------------+--------------------+---------------------+-------------------+
| month      | total_folios_crore | equity_folios_crore | debt_folios_crore |
+------------+--------------------+---------------------+-------------------+
| 2022-01-01 | 13.26              | 9.28                | 1.86              |
| 2022-04-01 | 13.91              | 9.74                | 1.95              |
| 2022-07-01 | 13.85              | 9.69                | 1.94              |
| 2022-10-01 | 14.12              | 9.88                | 1.98              |
| 2023-01-01 | 14.81              | 10.37               | 2.07              |
| 2023-04-01 | 15.54              | 10.88               | 2.18              |
| 2023-07-01 | 16.28              | 11.40               | 2.28              |
| 2023-10-01 | 16.72              | 11.70               | 2.34              |
+------------+--------------------+---------------------+-------------------+

Insight:
Folio counts show steady growth across total, equity, and debt categories, reflecting rising investor participation.


Query 6: Top 5 Schemes by 3-Year Return
SQL:
SELECT scheme_name, fund_house, return_3yr_pct
FROM fact_performance
ORDER BY return_3yr_pct DESC
LIMIT 5;

Sample Output:
+-----------------------------------------------+----------------------+---------------+
| scheme_name                                   | fund_house           | return_3yr_pct|
+-----------------------------------------------+----------------------+---------------+
| SBI Small Cap Fund - Regular Plan - Growth    | SBI Mutual Fund      | 23.39         |
| SBI Small Cap Fund - Direct Plan - Growth     | SBI Mutual Fund      | 23.14         |
| ABSL Small Cap Fund - Regular - Growth        | Aditya Birla Sun Life| 22.38         |
| Axis Small Cap Fund - Regular - Growth        | Axis Mutual Fund     | 20.98         |
| Nippon India Small Cap Fund - Regular - Growth| Nippon India MF      | 20.15         |
+-----------------------------------------------+----------------------+---------------+

Insight:
Small-cap funds dominate the top performers, highlighting strong returns in higher-risk equity segments.


Query 7: Investor Transaction Volume by City
SQL:
SELECT city, COUNT(*) AS num_transactions, SUM(amount_inr) AS total_amount
FROM fact_transactions
GROUP BY city
ORDER BY total_amount DESC
LIMIT 10;

Sample Output:
(No data provided in screenshot — insert table here once available)

Insight:
This query reveals which cities contribute the highest transaction volumes, useful for geographic investor analysis.


Query 8: Portfolio Holdings Breakdown by Sector
SQL:
SELECT sector, SUM(weight_pct) AS total_weight
FROM fact_holdings
GROUP BY sector
ORDER BY total_weight DESC;

Sample Output:
+---------------+----------------+
| sector        | total_weight   |
+---------------+----------------+
| Banking       | 652.26         |
| IT            | 455.47         |
| Pharma        | 407.45         |
| Automobile    | 323.65         |
| Utilities     | 265.54         |
| FMCG          | 229.11         |
| Infrastructure| 192.16         |
| Diversified   | 169.23         |
+---------------+----------------+

Insight:
Banking and IT sectors dominate portfolio holdings, showing investor preference for financial and technology stocks.


Query 9: Benchmark Index Performance Trend
SQL:
SELECT date, index_name, close_value
FROM dim_benchmark
ORDER BY date;

Sample Output:
+------------+-----------------+-------------+
| date       | index_name      | close_value |
+------------+-----------------+-------------+
| 2022-01-03 | NIFTY50         | 17492.79    |
| 2022-01-03 | NIFTY100        | 17778.24    |
| 2022-01-03 | NIFTY_MIDCAP150 | 9721.79     |
| 2022-01-03 | BSE_SMALLCAP    | 26554.60    |
| 2022-01-03 | NIFTY500        | 14837.07    |
| 2022-01-03 | CRISIL_LIQUID   | 2281.51     |
| 2022-01-03 | CRISIL_GILT     | 1451.06     |
| 2022-01-04 | NIFTY50         | 17689.64    |
+------------+-----------------+-------------+

Insight:
Benchmark indices show daily fluctuations, with NIFTY50 and NIFTY100 leading equity market trends.


Query 10: Risk Category Distribution of Funds
SQL:
SELECT risk_category, COUNT(*) AS num_funds
FROM dim_fund
GROUP BY risk_category
ORDER BY num_funds DESC;

Sample Output:
+-----------------+-----------+
| risk_category   | num_funds |
+-----------------+-----------+
| Moderate        | 16        |
| High            | 8         |
| Very High       | 6         |
| Low             | 6         |
| Moderately High | 4         |
+-----------------+-----------+

Insight:
Most funds fall under the Moderate risk category, indicating balanced investor appetite, while a significant number also pursue high and very high risk strategies.
