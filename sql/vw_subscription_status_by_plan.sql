CREATE OR REPLACE VIEW vw_subscription_status_by_plan AS
SELECT
    p.plan_name,
    COUNT(*) FILTER (WHERE s.status = 'Active')   AS active_subs,
    COUNT(*) FILTER (WHERE s.status = 'Paused')   AS paused_subs,
    COUNT(*) FILTER (WHERE s.status = 'Canceled') AS canceled_subs,
    COUNT(*) AS total_subs,
    ROUND(100.0 * COUNT(*) FILTER (WHERE s.status = 'Active') / COUNT(*), 2) AS active_pct,
    ROUND(100.0 * COUNT(*) FILTER (WHERE s.status = 'Paused') / COUNT(*), 2) AS paused_pct,
    ROUND(100.0 * COUNT(*) FILTER (WHERE s.status = 'Canceled') / COUNT(*), 2) AS canceled_pct
FROM subscriptions s
LEFT JOIN plans p
    ON s.plan_id = p.plan_id
GROUP BY p.plan_name;
