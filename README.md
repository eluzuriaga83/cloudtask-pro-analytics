# CloudTask Pro — Resume Summary & GitHub README

---

## 📄 RESUME SUMMARY (Pick the version that fits)

---

### Version 1: One Bullet (Short — for resume projects section)

**CloudTask Pro — SaaS Churn & Revenue Analytics Platform** | Python · dbt · BigQuery · Tableau
- Designed and built a modern data stack to investigate board-level churn concerns for a fast-growing SaaS company (0→600 customers since 2022) — ingesting subscription and revenue data through a Python ETL pipeline, transforming it with dbt (staging + dim/fact marts in BigQuery), and delivering 5 executive Tableau dashboards that answered CFO questions on churn trends, at-risk segments, and unit economics.

---

### Version 2: Three Bullets (Recommended — shows depth)

**CloudTask Pro — SaaS Churn & Revenue Analytics Platform** | Python · dbt · BigQuery · Tableau
- Designed a production-grade data pipeline using Python for validation and ingestion, dbt for layered transformations (staging → dim_customers, fct_monthly_metrics), and BigQuery as the warehouse — following dimensional modeling best practices with 40+ automated data quality tests.
- Built 5 Tableau executive dashboards answering CFO-level questions on churn trends, high-risk customer segments, and unit economics — surfacing that annual billing customers churn 33% less than monthly, the Business plan drives 43% of total revenue, and Very High Risk customers churn at 7x the rate of Medium Risk customers.
- Implemented a multi-factor customer risk scoring model combining feature usage and NPS score to proactively identify at-risk customers before they churn.

---

### Version 3: Full Project Block (For portfolio/LinkedIn)

**CloudTask Pro — SaaS Analytics Portfolio Project**
Tech Stack: Python · dbt · Google BigQuery · Tableau
Role: End-to-end analytics engineering and data visualization

- Architected a full modern data stack analytics platform from raw CSV data to executive dashboards, simulating a real-world SaaS analytics function for a 600-customer company with 4 years of data (2022–2025).
- Built Python ETL pipeline handling data validation, type conversion, and BigQuery loading — enforcing data quality before data enters the warehouse.
- Designed a dbt transformation layer with 5 models across staging and marts (stg_subscriptions, stg_monthly_revenue, dim_customers, fct_monthly_metrics) with 40+ automated tests covering uniqueness, referential integrity, accepted values, and business logic.
- Answered 5 CFO-level business questions on churn trends, plan profitability, unit economics (CLV vs CAC), customer risk, and retention cohorts — delivered through 5 interactive Tableau dashboards.
- Surfaced key business insights: annual billing customers churn 33% less than monthly, the Business plan drives 43% of total revenue, and Very High Risk customers (low feature usage + low NPS) churn at 7x the rate of Medium Risk customers.

---

---

# 📘 GITHUB README

---

# CloudTask Pro — SaaS Analytics Platform

> End-to-end analytics platform built with Python, dbt, BigQuery, and Tableau to analyze churn, revenue, and customer health for a SaaS company.

---

## 🎯 Project Purpose

This project simulates a real-world analytics engineering scenario:

> **"The board is concerned about churn. The CFO needs answers."**

CloudTask Pro is a hypothetical SaaS company with 600 customers and 4 years of data (2022–2025). The goal was to build a complete, production-grade analytics platform from raw data to executive dashboards — answering 5 critical business questions along the way.

---

## ❓ Business Questions Answered

| # | Question | Answer |
|---|----------|--------|
| 1 | What is our churn rate and how is it trending? | Overall churn declining, monthly billing at 60.5% vs annual at 40.3% (cumulative, 4yr) |
| 2 | Which plan and billing cycle churns most? | Monthly billing churns 33% more than annual; Starter has highest churn by plan |
| 3 | What are the top churn reasons by plan? | Price, poor feature support, and competitor loss are top 3 reasons |
| 4 | Which plans are most profitable (CLV vs CAC)? | Business plan drives 43% of total revenue; Enterprise 30% |
| 5 | What signals predict churn? | Very High Risk customers (low usage + low NPS) churn at 7x Medium Risk rate |

---

## 🏗️ Architecture

```
CSV Data (subscriptions, monthly_revenue)
        │
        ▼
Python ETL Pipeline
  • Data validation & type conversion
  • Data quality checks
  • Load to BigQuery
        │
        ▼
Google BigQuery
  • Raw tables: subscriptions, monthly_revenue
  • Dataset: saas_analytics_dev
        │
        ▼
dbt Transformations
  ├── Staging
  │     ├── stg_subscriptions
  │     └── stg_monthly_revenue
  └── Marts
        ├── dim_customers       (CLV, risk scoring, churn timing)
        └── fct_monthly_metrics (MRR growth, churn trends)
        │
        ▼
Tableau Dashboards (5 dashboards)
  ├── Dashboard 1: Executive Summary
  ├── Dashboard 2: Churn Analysis
  ├── Dashboard 3: Unit Economics (CLV vs CAC)
  ├── Dashboard 4: Risk Assessment
  └── Dashboard 5: Retention & Cohorts
```

---

## 📁 Project Structure

```
cloudtask-pro-analytics/
│
├── data/
│   ├── monthly_revenue.csv          # Raw monthly metrics (48 months)
│   ├── subscriptions.csv            # Raw customer data (600 customers, 18 fields)
│   └── processed/                   # Cleaned datasets output (after Python validation)
│
├── dbt/
│   ├── dbt_project.yml              # dbt project configuration
│   ├── packages.yml                 # dbt package dependencies
│   ├── profiles.yml                 # BigQuery connection settings
│   ├── .user.yml                    # Local dbt user config
│   │
│   ├── models/
│   │   ├── staging/                 # Layer 1: clean & rename raw fields
│   │   │   ├── stg_subscriptions.sql
│   │   │   ├── stg_subscriptions.yml
│   │   │   ├── stg_monthly_revenue.sql
│   │   │   └── stg_monthly_revenue.yml
│   │   │
│   │   └── marts/                   # Layer 2: business logic & calculations
│   │       ├── dim_customers.sql    # CLV, risk level, churn timing
│   │       ├── fct_monthly_metrics.sql  # MRR growth, churn trends
│   │       └── marts.yml            # Tests for mart models
│   │
│   ├── tests/
│   │   └── singular/                # Custom SQL business logic tests
│   │
│   └── target/                      # Compiled models (auto-generated, git ignored)
│
├── logs/                            # dbt run logs
│   └── dbt.log
│
├── notebooks/
│   └── EDA.ipynb                    # Exploratory data analysis
│
├── .gitignore                       # Excludes service-account-key.json, venv, target
└── README.md
```

---

## 🛠️ Tech Stack

| Layer | Tool | Purpose |
|-------|------|---------|
| Ingestion | Python + Pandas | Validation, type conversion, BigQuery loading |
| Warehouse | Google BigQuery | Cloud data warehouse |
| Transformation | dbt (dbt-fusion 2.0) | Staging + mart models, data testing |
| Visualization | Tableau | 5 executive dashboards |
| Version Control | Git + GitHub | Source control |

---

## 📊 dbt Models

### Staging Layer (Views)
| Model | Source | Purpose |
|-------|--------|---------|
| `stg_subscriptions` | subscriptions | Clean customer data, calculates months_active |
| `stg_monthly_revenue` | monthly_revenue | Clean monthly metrics, calculates mrr_per_customer |

### Mart Layer (Tables)
| Model | Grain | Purpose |
|-------|-------|---------|
| `dim_customers` | One row per customer | CLV, risk level, churn timing, customer status |
| `fct_monthly_metrics` | One row per month | MRR growth rate, churn trends, CAC spend |

### Key Calculated Fields
```sql
-- Customer Lifetime Value
customer_lifetime_value = monthly_revenue × months_active

-- Risk Level (multi-factor)
CASE
  WHEN feature_usage_pct < 20 OR nps_score < 4 THEN 'Very High Risk'
  WHEN feature_usage_pct < 40 OR nps_score < 6 THEN 'High Risk'
  WHEN feature_usage_pct < 60 OR nps_score < 8 THEN 'Medium Risk'
  ELSE 'Low Risk'
END

-- Churn Timing
CASE
  WHEN churned = 0            THEN 'Active'
  WHEN months_active < 3      THEN 'Early Churn (< 3 months)'
  WHEN months_active < 12     THEN 'Mid-Tenure Churn (3-12 months)'
  ELSE                             'Late Churn (> 12 months)'
END

-- MRR Growth Rate (month-over-month)
(current_mrr - previous_mrr) / previous_mrr × 100
```

---

## 🧪 Data Quality Tests

**40+ automated tests** across all models:

| Test Type | Example |
|-----------|---------|
| Uniqueness | `customer_id` has no duplicates |
| Not null | Required fields always populated |
| Accepted values | `risk_level` only in [High, Medium, Low] |
| Referential integrity | All customers in facts exist in dim |
| Business logic | Churned customers must have `churn_date` |
| Range checks | `feature_usage_pct` between 0 and 100 |

```bash
# Run all tests
cd dbt
dbt test

# Run tests for a specific model
dbt test --select dim_customers
```

---

## 🚀 Quick Start

### 1. Clone the repo
```bash
git clone https://github.com/YOUR_USERNAME/cloudtask-pro-analytics.git
cd cloudtask-pro-analytics
```

### 2. Set up Python environment
```bash
python -m venv venv
source venv/bin/activate        # Windows: venv\Scripts\activate
pip install -r requirements.txt
```

### 3. Configure Google Cloud
```bash
gcloud auth login
gcloud config set project YOUR_GCP_PROJECT_ID
bq mk --dataset saas_analytics_dev
```

### 4. Explore the data (optional)
```bash
# Open EDA notebook
jupyter notebook notebooks/EDA.ipynb
```

### 5. Run dbt
```bash
cd dbt
dbt deps          # Install packages
dbt run           # Build all models
dbt test          # Run all 40+ tests
dbt docs generate # Generate documentation
dbt docs serve    # View at http://localhost:8000
```

### 6. Connect Tableau
```
1. Open Tableau Desktop
2. Connect → Google BigQuery
3. Project: your-gcp-project
4. Dataset: saas_analytics_dev
5. Tables: dim_customers, fct_monthly_metrics
6. Build dashboards
```


---

## 📈 Key Insights

### Revenue & Growth
- **Business plan** drives **43% of total revenue** — the highest of any plan
- **Enterprise** accounts for **30% of revenue** — high value, lower volume
- MRR grew consistently over 4 years (2022–2025)

### Churn
- **Annual billing** customers churn **33% less** than monthly billing customers
  - Monthly churn rate: **60.5%** (cumulative, 4yr dataset)
  - Annual churn rate: **40.3%** (cumulative, 4yr dataset)
- Churn rate varies significantly across plans — Starter highest, Enterprise lowest

### Risk Signals
- **Very High Risk** customers churn at **75%** vs **10%** for Medium Risk — a **7x difference**
- Risk level combines two factors: feature usage % + NPS score
- **Low Risk customers have 0% churn** — strong signal that engaged customers stay
- Early churn (0–3 months) is the highest-risk period — onboarding matters most

---

## 📊 Tableau Dashboards

| Dashboard | Key Charts | Business Question |
|-----------|-----------|-------------------|
| **1. Executive Summary** | MRR trend, Churn trend, Customers by plan, Revenue by plan | How is the business performing? |
| **2. Churn Analysis** | Churn by plan, by company size, top reasons, churn timing | Why and when do customers leave? |
| **3. Unit Economics** | CLV vs CAC, CLV:CAC ratio by plan, payback period | Which plans are most profitable? |
| **4. Risk Assessment** | Risk distribution, feature usage vs churn, at-risk customer table | Who is about to churn? |
| **5. Retention & Cohorts** | Cohort heatmap, retention curves, churn timing by plan | How long do customers stay? |

---

## 📄 License

MIT — free to use for learning and portfolio purposes.

---

## 👤 About

Built as a portfolio project to demonstrate end-to-end analytics engineering skills using a modern data stack (Python → BigQuery → dbt → Tableau).

**Skills demonstrated:**
- Data pipeline design & implementation
- Dimensional data modeling (Kimball methodology)
- dbt best practices (staging → marts, 40+ tests)
- Advanced SQL (window functions, CTEs, aggregations)
- SaaS metrics expertise (CLV, CAC, churn, MRR)
- Executive dashboard design (Tableau)
- Professional documentation
