-- Monthly sales performance
SELECT DATE_TRUNC('month', order_date) AS month, SUM(revenue) AS revenue, SUM(revenue-cost) AS profit, SUM(revenue-cost)/NULLIF(SUM(revenue),0) AS margin
FROM sales GROUP BY 1 ORDER BY 1;

-- Regional ranking
SELECT region, SUM(revenue) AS revenue, SUM(revenue-cost) AS profit
FROM sales GROUP BY region ORDER BY revenue DESC;
