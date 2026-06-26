##Queries

-- 1. Top 5 funds by AUM
SELECT scheme_name, fund_house, aum_crore
FROM fact_performance
ORDER BY aum_crore DESC
LIMIT 5;

-- 2. Average NAV per year
SELECT strftime('%Y', date) AS year, AVG(nav) AS avg_nav
FROM fact_nav
GROUP BY year
ORDER BY year;

-- 3. Monthly SIP inflows trend
SELECT month, sip_inflow_crore
FROM fact_sip
ORDER BY month;

-- 4. Category-wise net inflows
SELECT category, SUM(net_inflow_crore) AS total_inflow
FROM fact_category_inflows
GROUP BY category
ORDER BY total_inflow DESC;

-- 5. Folio count growth over time
SELECT month, total_folios_crore, equity_folios_crore, debt_folios_crore
FROM fact_folio_count
ORDER BY month;

-- 6. Top 5 schemes by 3-year return
SELECT scheme_name, fund_house, return_3yr_pct
FROM fact_performance
ORDER BY return_3yr_pct DESC
LIMIT 5;

-- 7. Investor transaction volume by city
SELECT city, COUNT(*) AS num_transactions, SUM(amount_inr) AS total_amount
FROM fact_transactions
GROUP BY city
ORDER BY total_amount DESC
LIMIT 10;

-- 8. Portfolio holdings breakdown by sector
SELECT sector, SUM(weight_pct) AS total_weight
FROM fact_holdings
GROUP BY sector
ORDER BY total_weight DESC;

-- 9. Benchmark index performance trend
SELECT date, index_name, close_value
FROM dim_benchmark
ORDER BY date;

-- 10. Risk category distribution of funds
SELECT risk_category, COUNT(*) AS num_funds
FROM dim_fund
GROUP BY risk_category
ORDER BY num_funds DESC;
