WITH raw_events AS (
    SELECT
        user_pseudo_id,
        TIMESTAMP_MICROS(event_timestamp) as event_timestamp,
        event_name,
        traffic_source.source as source,
        traffic_source.medium as medium,
        traffic_source.name as campaign
    FROM {{ source('ga4', 'raw_events') }}
    -- Filtering for a small date range to keep it fast/free
    WHERE _TABLE_SUFFIX BETWEEN '20201201' AND '20201205'
)

SELECT * FROM raw_events