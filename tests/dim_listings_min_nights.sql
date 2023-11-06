-- test if minimum nights is < 1
--test passes if no values are returned from the query - meaning that there are no nights < 1

select 
    * 
from 
    {{ ref('dim_listings_cleansed')}}
where minimum_nights < 1