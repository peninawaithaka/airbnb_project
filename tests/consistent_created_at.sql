select 
    fr.review_date as review_date, 
    dlc.created_at as created_at
from 
    {{ ref('dim_listings_cleansed')}} as dlc
inner join  {{ ref("fct_reviews")}}   as fr on dlc.listing_id = fr.listing_id
where review_date < created_at