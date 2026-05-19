with stg as (
    select * from {{ ref('stg_locations') }}
)

select distinct
    location_sk,
    postal_code,
    city,
    state,
    region,
    country
from stg