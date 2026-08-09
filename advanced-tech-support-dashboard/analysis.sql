-- SLA and service funnel
SELECT agent_group, priority, COUNT(*) AS created_tickets, AVG(CASE WHEN first_response_min <= 60 THEN 1.0 ELSE 0 END) AS first_response_sla, AVG(CASE WHEN resolution_hours <= 24 THEN 1.0 ELSE 0 END) AS resolution_sla, AVG(csat) AS avg_csat
FROM tickets GROUP BY agent_group, priority;

-- Topic and day-type demand
SELECT topic, day_type, COUNT(*) AS tickets FROM tickets GROUP BY topic, day_type ORDER BY tickets DESC;

-- Monthly workload
SELECT DATE_TRUNC('month', created_date) AS month, COUNT(*) AS tickets, AVG(first_response_min) AS avg_first_response_min
FROM tickets GROUP BY 1 ORDER BY 1;

-- Geographic demand
SELECT country, COUNT(*) AS tickets, AVG(CASE WHEN status='Open' THEN 1.0 ELSE 0 END) AS open_rate
FROM tickets GROUP BY country ORDER BY tickets DESC;
