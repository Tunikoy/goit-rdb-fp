SELECT 
    e.entity_name,
    e.code,
    ROUND(AVG(d.number_rabies), 2) AS avg_rabies,
    MIN(d.number_rabies) AS min_rabies,
    MAX(d.number_rabies) AS max_rabies,
    SUM(d.number_rabies) AS total_rabies
FROM pandemic.infectious_data d
JOIN pandemic.entities e ON d.entity_id = e.id
WHERE d.number_rabies IS NOT NULL
GROUP BY e.entity_name, e.code
ORDER BY avg_rabies DESC
LIMIT 10;
