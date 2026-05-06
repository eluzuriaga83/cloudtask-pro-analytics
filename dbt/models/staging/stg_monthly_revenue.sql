{{
    config(
        materialized='view',
        tags=['daily']
    )
}}

SELECT 
    date,
    total_active_customers,
    new_customers,
    churned_customers,
    monthly_churn_rate_pct,
    total_mrr,
    avg_revenue_per_customer,
    customer_acquisition_cost,
    case
        when total_active_customers > 0 then total_mrr / total_active_customers
        else 0  -- or 0, depending on preference
    end as mrr_per_active_customer,
    customer_acquisition_cost * new_customers as monthly_cac_spend
FROM {{ source('raw', 'monthly_revenue') }}
order by date