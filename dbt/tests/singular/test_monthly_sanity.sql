-- Check that monthly metrics make sense
-- new_customers should be less that total_active_customers
-- total_mrr should be greater than or equal to 0

select *
from {{ ref('fct_monthly_metrics') }}
where  
      total_mrr < 0 --revenue should never be negative
   or (total_active_customers >0 and total_active_customers < churned_customers) --churned can not exceed total active customers
   or total_active_customers < 0
   or new_customers < 0
   or churned_customers < 0
