with source as (
    select * from {{ source('raw', 'locations') }}
),

renamed as (
    select
        location_sk,
        postal_code,
        city,
        state,
        region,
        country,
        created_at
    from source
)

select * from renamed