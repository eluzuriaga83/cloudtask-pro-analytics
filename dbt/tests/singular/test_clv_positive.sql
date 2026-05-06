# Ensure all CLV values are positive
select * 
from {{ ref('dim_customers') }}
where customer_lifetime_value < 0