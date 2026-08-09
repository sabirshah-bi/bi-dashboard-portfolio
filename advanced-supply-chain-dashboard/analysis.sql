-- Monthly delivery and forecast performance
SELECT DATE_TRUNC('month', ship_date) AS month, region, SUM(delivered_units) AS actual_units, SUM(forecast_units) AS forecast_units, 1.0-SUM(absolute_forecast_error)/NULLIF(SUM(delivered_units),0) AS forecast_accuracy
FROM shipments GROUP BY 1,2 ORDER BY 1,2;

-- Supplier composite score inputs
SELECT supplier, AVG(CASE WHEN on_time='Yes' THEN 1.0 ELSE 0 END) AS on_time_rate, SUM(delivered_units)/NULLIF(SUM(ordered_units),0) AS fill_rate, 1.0-SUM(absolute_forecast_error)/NULLIF(SUM(delivered_units),0) AS forecast_accuracy, AVG(freight_cost) AS avg_freight_cost
FROM shipments GROUP BY supplier;

-- Inventory exceptions
SELECT sku, category, region, supplier, on_hand_units, reorder_point, inventory_value
FROM inventory WHERE on_hand_units < reorder_point ORDER BY inventory_value DESC;
