-- Telecom service operations scorecard
SELECT service_type, region, priority, COUNT(*) AS tickets, AVG(response_hours) AS avg_response_hours, AVG(resolution_hours) AS avg_resolution_hours, AVG(customer_rating) AS avg_rating, AVG(CASE WHEN response_hours<=12 AND resolution_hours<=72 THEN 1.0 ELSE 0 END) AS sla_compliance FROM telecom_tickets GROUP BY service_type, region, priority;

-- Monthly issue trend
SELECT month, issue_type, COUNT(*) AS tickets FROM telecom_tickets GROUP BY month, issue_type ORDER BY month, tickets DESC;
