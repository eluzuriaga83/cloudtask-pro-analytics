{{
    config(
        materialized='view',
        tags=['daily']
    )
}}

SELECT
    customer_id,
    plan,
    billing_cycle,
    industry,
    company_size,
    seats,
    monthly_revenue,
    acquisition_channel,
    region,
    signup_date,
    churned,
    churn_date,
    churn_reason,
    support_tickets_12mo,
    nps_score,
    feature_usage_pct,
    upgraded,
    case
        when churned = 0 then round(date_diff(date('2025-12-31'), signup_date, day) /30.0,1)
        else round(date_diff(churn_date, signup_date, day) /30.0,1)
    end as months_active,
    DATE_TRUNC(signup_date, MONTH) AS signup_month 
FROM {{ source('raw', 'subscriptions') }}
