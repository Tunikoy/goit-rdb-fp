SELECT 
    e.entity_name, 
    e.code,
    d.year,
    get_years_diff(d.year) AS years_diff
FROM pandemic.infectious_data d
JOIN pandemic.entities e ON d.entity_id = e.id
LIMIT 10;
