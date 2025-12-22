CREATE OR REPLACE VIEW vw_monthly_churn AS
WITH active_customers AS (
    SELECT
        DATE_TRUNC('month', start_date) AS month_start,
        COUNT(*) AS total_active_customers
    FROM subscriptions
    WHERE start_date <= DATE_TRUNC('month', start_date)
      AND (end_date IS NULL OR end_date >= DATE_TRUNC('month', start_date))
    GROUP BY DATE_TRUNC('month', start_date)
),
churned_customers AS (
    SELECT
        DATE_TRUNC('month', end_date) AS month_start,
        COUNT(*) AS total_churned_customers
    FROM subscriptions
    WHERE end_date IS NOT NULL
    GROUP BY DATE_TRUNC('month', end_date)
),
monthly_churn AS (
    SELECT
        a.month_start,
        a.total_active_customers,
        COALESCE(c.total_churned_customers, 0) AS total_churned_customers,
        (COALESCE(c.total_churned_customers, 0)::DECIMAL
         / a.total_active_customers) * 100 AS churn_rate
    FROM active_customers a
    LEFT JOIN churned_customers c
        ON a.month_start = c.month_start
)
SELECT
    month_start,
    churn_rate,
    LAG(churn_rate) OVER (ORDER BY month_start) AS previous_month_churn,
    ((churn_rate - LAG(churn_rate) OVER (ORDER BY month_start))
      / LAG(churn_rate) OVER (ORDER BY month_start)) * 100
      AS mom_churn_pct
FROM monthly_churn;
