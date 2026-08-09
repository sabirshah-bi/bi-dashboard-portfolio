-- Monthly subscriber and financial scorecard
SELECT month, SUM(subscribers) AS subscribers, SUM(new_subscribers) AS gross_adds, SUM(new_subscribers)-SUM(disconnects) AS net_adds, SUM(disconnects)/NULLIF(SUM(subscribers),0) AS churn_rate, SUM(capex)/NULLIF(SUM(revenue),0) AS capex_to_sales FROM telecom_monthly GROUP BY month ORDER BY month;

-- Subscriber plan mix
SELECT month, plan_type, SUM(subscribers) AS subscribers FROM telecom_monthly GROUP BY month, plan_type ORDER BY month, subscribers DESC;
