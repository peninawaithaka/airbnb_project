with 
l as(
    select *
    from {{ ref('dim_listings_cleansed')}}
),

h as (
    select *
    from {{ ref('dim_hosts_cleansed')}}
)

select
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.host_id,
    l.price,
    l.created_at,
    h.host_name,
    h.is_superhost as host_is_superhost,
    greatest(l.updated_at, h.updated_at) as updated_at
from  
    l
join h 
on l.host_id = h.host_id    