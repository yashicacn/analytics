WITH session_events AS (
    SELECT * FROM {{ ref('stg_ga4_events') }}
    WHERE source IS NOT NULL
),

last_clicks AS (
    SELECT
        user_pseudo_id,
        source,
        medium,
        campaign,
        event_timestamp,
        -- We use DESC (Descending) to get the newest event first
        ROW_NUMBER() OVER (
            PARTITION BY user_pseudo_id 
            ORDER BY event_timestamp DESC
        ) as click_rank
    FROM session_events
)

-- Only keep the rank 1 (the very last touchpoint)
SELECT 
    user_pseudo_id,
    source,
    medium,
    campaign,
    event_timestamp AS last_click_timestamp
FROM last_clicks
WHERE click_rank = 1