{{
  config(
    materialized = 'incremental',
    unique_key='LISTING_ID'
    )
}}


SELECT 
LISTING_ID,
HOST_ID AS LISITNG_HOST_ID,
PROPERTY_TYPE,
ROOM_TYPE,
CITY,
COUNTRY,
ACCOMMODATES,
BEDROOMS,
BATHROOMS,
PRICE_PER_NIGHT,
CREATED_AT AS LISTING_CREATED_AT,
{{ tag('price_per_night') }} AS PRICE_RATEING
FROM {{ ref('bronze_listings') }}