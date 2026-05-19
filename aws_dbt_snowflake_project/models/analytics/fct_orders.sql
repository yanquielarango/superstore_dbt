with stg as (
    select * from {{ ref('stg_orders') }}
),

locations as (
    select * from {{ ref('stg_locations') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

products as (
    select * from {{ ref('stg_products') }}
)

select
    o.order_id,
    o.order_date,
    o.ship_date,
    o.ship_mode,
    o.segment,
    o.sales,
    o.quantity,
    o.discount,
    o.profit,
    l.location_sk,
    c.customer_sk,
    coalesce(p.product_sk, 0) as product_sk
from stg o
left join locations l on o.postal_code = l.postal_code
left join customers c on o.customer_id = c.customer_id
left join products p on o.product_id = p.product_id