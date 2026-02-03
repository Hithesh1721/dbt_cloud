{% set configs = [
    {
        "table":"DEV.SILVER.SILVER_BOOKINGS",
        "columns": "silver_bookings.*",
        "alias": "silver_bookings"
    },
    {
        "table":"DEV.SILVER.SILVER_LISTINGS",
        "columns": "silver_listings.*",
        "alias": "silver_listings",
        "join_condition": "silver_bookings.booking_lisitng_id=silver_listings.listing_id"
    },
    {
        "table":"DEV.SILVER.SILVER_HOSTS",
        "columns": "silver_hosts.*",
        "alias": "silver_hosts",
        "join_condition": "silver_listings.lisitng_host_id=silver_hosts.host_id"
    }

]
%}


SELECT 
{% for con in configs%}
    {{ con['columns'] }}{% if not loop.last %},{% endif %}
{% endfor %}
FROM
{% for con in configs%}
    {% if loop.first %}
        {{ con['table'] }} AS {{ con['alias'] }}
    {% else %}
        LEFT JOIN {{ con['table'] }} AS {{ con['alias'] }} ON {{ con['join_condition'] }}
    {% endif %}
{% endfor %}

