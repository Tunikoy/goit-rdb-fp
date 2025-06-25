SELECT
  d.entity_id,
  e.entity_name,
  d.year,
  STR_TO_DATE(CONCAT(d.year, '-01-01'), '%Y-%m-%d') AS year_start,
  CURRENT_DATE() AS today,
  TIMESTAMPDIFF(YEAR,
    STR_TO_DATE(CONCAT(d.year, '-01-01'), '%Y-%m-%d'),
    CURRENT_DATE()
  ) AS years_diff
FROM pandemic.normalized_cases d
JOIN pandemic.entities e ON d.entity_id = e.id
LIMIT 10;

