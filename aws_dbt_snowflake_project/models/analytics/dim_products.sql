with stg as (
    select * from {{ ref('stg_products') }}
),

unknown as (
    select
        0           as product_sk,
        'UNKNOWN'   as product_id,
        'Unknown'   as category,
        'Unknown'   as sub_category,
        'Unknown'   as product_name
)

select
    product_sk,
    product_id,
    category,
    sub_category,
    product_name
from stg

union all

select * from unknown