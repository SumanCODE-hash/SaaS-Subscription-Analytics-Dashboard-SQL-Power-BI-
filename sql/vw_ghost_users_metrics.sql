CREATE OR REPLACE VIEW vw_ghost_users_metrics AS
WITH last_activity AS (
    SELECT
        s.user_id,
        s.plan_id,
        MAX(al.activity_timestamp) AS last_activity_date
    FROM subscriptions s
    LEFT JOIN activity_logs al
        ON s.user_id = al.user_id
    WHERE s.status = 'Active'
    GROUP BY s.user_id, s.plan_id
),
ghost_users AS (
    SELECT
        *,
        CASE
            WHEN last_activity_date IS NULL
              OR last_activity_date < CURRENT_DATE - INTERVAL '30 days'
            THEN 1 ELSE 0
        END AS is_ghost
    FROM last_activity
)
SELECT
    p.plan_name,
    COUNT(*) AS total_active_users,
    SUM(is_ghost) AS ghost_users_count,
    ROUND(100.0 * SUM(is_ghost) / COUNT(*), 2) AS ghost_users_pct
FROM ghost_users g
LEFT JOIN plans p
    ON g.plan_id = p.plan_id
GROUP BY p.plan_name;
