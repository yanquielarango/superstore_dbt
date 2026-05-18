with source as (
    select * from {{ source('raw', 'orders') }}
),

renamed as (
    select
        order_id,
        to_date(replace(order_date, '.', '/'), 'DD/MM/YYYY')  as order_date,
        to_date(replace(ship_date, '.', '/'), 'DD/MM/YYYY')   as ship_date,
        ship_mode,
        customer_id,
        segment,
        postal_code,
        product_id,
        to_number(replace(sales, ',', '.'), 10, 2)            as sales,
        quantity,
        to_number(replace(discount, ',', '.'), 5, 2)          as discount,
        to_number(replace(profit, ',', '.'), 10, 2)           as profit,
        created_at
    from source
)

select * from renamed