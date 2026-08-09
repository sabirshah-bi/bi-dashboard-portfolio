-- Department workforce scorecard
SELECT department, COUNT(*) AS headcount, AVG(engagement_score) AS engagement, AVG(training_hours) AS training_hours, AVG(CASE WHEN attrition='Yes' THEN 1.0 ELSE 0 END) AS attrition_rate
FROM workforce GROUP BY department ORDER BY headcount DESC;

-- Early-tenure attrition
SELECT CASE WHEN tenure_years < 2 THEN 'Under 2 years' ELSE '2+ years' END AS tenure_band, AVG(CASE WHEN attrition='Yes' THEN 1.0 ELSE 0 END) AS attrition_rate
FROM workforce GROUP BY 1;
