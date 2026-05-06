{{
    config(
        materialized='table',
        unique_key='date',
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
    mrr_per_active_customer,
    monthly_cac_spend,
    round(
    case
      when lag(total_mrr) over (order by date) is not null
        and lag(total_mrr) over (order by date) > 0
        then (total_mrr - lag(total_mrr) over (order by date)) /
             lag(total_mrr) over (order by date) * 100
      else 0
    end,0) as mrr_growth_rate_pct,
    -- Same pattern for new customer growth
      round(
        case
            when lag(new_customers) over (order by date) is not null
                and lag(new_customers) over (order by date) > 0
                then (new_customers - lag(new_customers) over (order by date)) /
                    lag(new_customers) over (order by date) * 100
            else 0
        end,0) as new_customer_growth_rate_pct,
  
FROM {{ ref('stg_monthly_revenue') }}
ORDER BY date
