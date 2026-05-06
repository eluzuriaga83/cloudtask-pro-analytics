-- Check that MRR growth is reasonable (not negative for more than 3 months in a row)
with mrr_growth as (
    select
        date,
        mrr_growth_rate_pct,
        lag(mrr_growth_rate_pct) over (order by date) as prev_month_growth,
        lag(mrr_growth_rate_pct, 2) over (order by date) as prev_prev_month_growth
    from {{ ref('fct_monthly_metrics') }}
)
select *
from mrr_growth
where mrr_growth_rate_pct < 0
    and prev_month_growth < 0
    and prev_prev_month_growth < 0