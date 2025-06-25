SELECT
    e.entity_name,
    e.code,
    d.year,
    get_years_diff(d.year) AS years_diff
FROM pandemic.normalized_cases d
JOIN pandemic.entities e ON d.entity_id = e.id
LIMIT 10;
