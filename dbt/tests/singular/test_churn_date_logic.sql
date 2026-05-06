-- if churned = 0, churn_date should be NULL
-- if churned = 1, churn_date should not be NULL

select * 
from {{ ref('dim_customers') }}
where (churned = 0 and churn_date is not null) 
    or (churned = 1 and churn_date is null)