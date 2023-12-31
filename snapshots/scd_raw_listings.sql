-- slowly changing dimension type 2 - keeps all historical data
-- new table is created in the dev schema, the snapshot uses the timestamp strategy with unique_key as id

{% snapshot scd_raw_listings %}

{{
    config(
        target_schema = 'dev',
        unique_key = 'id',
        strategy = 'timestamp',
        updated_at = 'updated_at',
        invalidate_hard_deletes = True
    )
}}

select * from {{ source('airbnb', 'listings')}}

{% endsnapshot %}