# Data Dictionary
This document describes the Bluestock Mutual Fund star schema.  
It covers all fact and dimension tables, their columns, data types, business definitions, and source references.  
Purpose: To ensure clarity and consistency in data usage across analysis, reporting, and queries.


## 1. fact_performance
| Column Name       | Data Type | Business Definition | Source |
|-------------------|-----------|---------------------|--------|
| amfi_code         | STRING    | Unique identifier for mutual fund scheme | AMFI scheme master |
| return_1yr_pct    | DECIMAL   | 1-year return percentage | Scheme performance dataset |
| return_3yr_pct    | DECIMAL   | 3-year return percentage | Scheme performance dataset |
| return_5yr_pct    | DECIMAL   | 5-year return percentage | Scheme performance dataset |
| sharpe_ratio      | DECIMAL   | Risk-adjusted return measure | Scheme performance dataset |
| expense_ratio_pct | DECIMAL   | Annual expense ratio percentage | Scheme performance dataset |
| aum               | DECIMAL   | Assets under management (₹ Crores) | Scheme performance dataset |

---

## 2. fact_nav
| Column Name | Data Type | Business Definition | Source |
|-------------|-----------|---------------------|--------|
| amfi_code   | STRING    | Fund scheme identifier | AMFI NAV history |
| date        | DATE      | Trading date | AMFI NAV history |
| nav         | DECIMAL   | Net Asset Value per unit | AMFI NAV history |

---

## 3. fact_transactions
| Column Name        | Data Type | Business Definition | Source |
|--------------------|-----------|---------------------|--------|
| investor_id        | STRING    | Unique identifier for investor | Investor transactions dataset |
| transaction_date   | DATE      | Date of transaction | Investor transactions dataset |
| amfi_code          | STRING    | Fund scheme identifier | Investor transactions dataset |
| transaction_type   | STRING    | Type of transaction (Purchase, Redemption, SIP) | Investor transactions dataset |
| amount_inr         | DECIMAL   | Transaction amount in INR | Investor transactions dataset |
| state              | STRING    | Investor’s state | Investor transactions dataset |
| city               | STRING    | Investor’s city | Investor transactions dataset |
| city_tier          | STRING    | Classification of city (Tier 1/2/3) | Investor transactions dataset |
| age_group          | STRING    | Age bracket of investor | Investor transactions dataset |
| gender             | STRING    | Gender of investor | Investor transactions dataset |
| annual_income_lakh | DECIMAL   | Annual income in lakhs | Investor transactions dataset |
| payment_mode       | STRING    | Mode of payment (UPI, Netbanking, etc.) | Investor transactions dataset |
| kyc_status         | STRING    | KYC compliance status | Investor transactions dataset |

---

## 4. dim_fund
| Column Name | Data Type | Business Definition | Source |
|-------------|-----------|---------------------|--------|
| fund_id     | INTEGER   | Surrogate key for fund | Generated dimension |
| amfi_code   | STRING    | Fund scheme identifier | AMFI scheme master |
| scheme_name | STRING    | Name of mutual fund scheme | AMFI scheme master |
| fund_house  | STRING    | Asset management company | AMFI scheme master |
| category    | STRING    | Fund category (Equity, Debt, Hybrid, etc.) | AMFI scheme master |
| plan        | STRING    | Plan type (Direct/Regular) | AMFI scheme master |

---

## 5. dim_nav
| Column Name | Data Type | Business Definition | Source |
|-------------|-----------|---------------------|--------|
| nav_id      | INTEGER   | Surrogate key for NAV record | Generated dimension |
| amfi_code   | STRING    | Fund scheme identifier | AMFI NAV history |
| date        | DATE      | Trading date | AMFI NAV history |
| nav         | DECIMAL   | Net Asset Value per unit | AMFI NAV history |
| year        | INTEGER   | Year extracted from date | Derived from NAV history |
| month       | INTEGER   | Month extracted from date | Derived from NAV history |
| day         | INTEGER   | Day extracted from date | Derived from NAV history |

---
