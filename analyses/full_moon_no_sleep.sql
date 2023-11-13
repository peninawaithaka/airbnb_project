--queries in the analyses folder are not materialized into any table.
-- use dbt compile to run the query

with mart_full_moon_reviews as (
    select * from {{ ref('mart_fullmoon_reviews')}}
)

select  
    is_full_moon,
    review_sentiment,
    count(*) as reviews
from
    mart_full_moon_reviews
group by
    is_full_moon,
    review_sentiment
order by
    is_full_moon,
    review_sentiment