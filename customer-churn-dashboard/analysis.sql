-- Churn by plan
SELECT plan, COUNT(*) AS customers, AVG(CASE WHEN churned='Yes' THEN 1.0 ELSE 0 END) AS churn_rate
FROM customers GROUP BY plan ORDER BY churn_rate DESC;

-- Support ticket risk
SELECT support_tickets, COUNT(*) AS customers, AVG(CASE WHEN churned='Yes' THEN 1.0 ELSE 0 END) AS churn_rate
FROM customers GROUP BY support_tickets ORDER BY support_tickets;
