{{
    config(
        materialized='table',
        unique_key='customer_id',
        tags=['daily']
    )
}}

SELECT
    -- Customer identifiers
    customer_id,
    plan,
    billing_cycle,
    -- Customer attributes
    industry,
    company_size,
    case 
        when company_size = '1-10' or company_size='11-50' then 'Small'
        when company_size = '201-500' or company_size = '51-200' then 'Medium'
        ELSE 'Large'
    end as company_size_label,
    acquisition_channel,
    region,
    -- key dates
    signup_date,
    signup_month,
    months_active,
    -- Churn information
    churned,
    churn_date,
    churn_reason,
    -- Engagement and revenue metrics
    support_tickets_12mo,
    nps_score,
    feature_usage_pct,
    monthly_revenue,
    -- Calculated business metrics
    round(monthly_revenue * months_active, 2) as customer_lifetime_value,
    -- Risk scoring (multi-factor)
    case
        when feature_usage_pct < 20 or nps_score <4 then 'Very High Risk'
        when feature_usage_pct < 40 or  nps_score < 6 then 'High Risk'
        when feature_usage_pct < 60 or nps_score < 8 then 'Medium Risk'
        else 'Low Risk'
    end as risk_level,
    -- Customer status
    case when churned = 0 then 'Active' else 'Churned' end as customer_status,
    -- Churn timing segmentation
    case
        when months_active < 3 and churned = 1 then 'Early'
        when months_active < 12 and churned = 1 then 'Mid-term'
        when months_active >= 12 and churned = 1 then 'Late'
        else 'Active'
    end as churn_timing,
    -- Metadata
    current_timestamp as dbt_updated_at
FROM {{ ref('stg_subscriptions') }}