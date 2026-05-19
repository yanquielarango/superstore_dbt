with stg as (
    select * from {{ ref('stg_customers') }}
)

select distinct
    customer_sk,
    customer_id,
    customer_name
from stg