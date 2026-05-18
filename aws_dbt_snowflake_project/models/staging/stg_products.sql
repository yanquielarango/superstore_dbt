with source as (
    select * from {{ source('raw', 'products') }}
),

renamed as (
    select
        product_id,
        product_sk,
        category,
        sub_category,
        product_name,
        created_at
    from source
)

select * from renamed