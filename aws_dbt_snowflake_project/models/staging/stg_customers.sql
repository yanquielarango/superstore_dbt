with source as (
    select * from {{ source('raw', 'customers') }}
),

renamed as (
    select
        customer_id,
        customer_sk,
        customer_name,
        created_at
    from source
)

select * from renamed