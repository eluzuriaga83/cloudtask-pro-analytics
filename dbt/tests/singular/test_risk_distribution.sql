# Check that we have customers in all risk categories(not all customers should be low risk)

with risk_counts as(
    select
        risk_level,
        count(*) as customer_count
    from {{ ref('dim_customers') }}
    group by risk_level
)
select *
from risk_counts
where customer_count = 0
