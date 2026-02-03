{{ config(materialized='semantic_view') }}

TABLES(t1 AS {{ ref('silver_bookings') }})
DIMENSIONS(t1.booking_status as booking_status)
METRICS(t1.total_rows AS COUNT(t1.booking_status))
COMMENT='test semantic view'