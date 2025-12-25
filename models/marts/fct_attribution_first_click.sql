WITH session_events AS (
    -- Get data from the staging model you built earlier
    SELECT * FROM {{ ref('stg_ga4_events') }}
    WHERE source IS NOT NULL -- We only care about events with a marketing source
),

first_clicks AS (
    SELECT
        user_pseudo_id,
        source,
        medium,
        campaign,
        event_timestamp,
        -- This window function identifies the first event for every user
        ROW_NUMBER() OVER (
            PARTITION BY user_pseudo_id 
            ORDER BY event_timestamp ASC
        ) as click_rank
    FROM session_events
)

-- Only keep the rows where click_rank is 1 (the very first touch)
SELECT 
    user_pseudo_id,
    source,
    medium,
    campaign,
    event_timestamp AS first_click_timestamp
FROM first_clicks
WHERE click_rank = 1