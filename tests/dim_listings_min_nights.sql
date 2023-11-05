-- test if minimum nights is < 1

select 
    * 
from 
    {{ ref('dim_listings_cleansed')}}
where minimum_nights < 1