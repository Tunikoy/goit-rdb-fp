-- 1. довідник країн
DROP TABLE IF EXISTS pandemic.entities;
CREATE TABLE pandemic.entities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity_name VARCHAR(255),
    code VARCHAR(10)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

INSERT INTO pandemic.entities(entity_name, code)
SELECT DISTINCT Entity, Code
FROM pandemic.infectious_cases;

-- 2. нормалізована факт-таблиця
DROP TABLE IF EXISTS pandemic.infectious_data;
CREATE TABLE pandemic.infectious_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity_id INT,
    year INT,
    number_rabies DOUBLE,
    FOREIGN KEY (entity_id) REFERENCES pandemic.entities(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

INSERT INTO pandemic.infectious_data (
    entity_id, year, number_rabies
)
SELECT
    e.id,
    ic.Year,
    CAST(NULLIF(ic.Number_rabies,'') AS DOUBLE)
FROM pandemic.infectious_cases ic
JOIN pandemic.entities e
      ON ic.Entity = e.entity_name
     AND ic.Code   = e.code;

-- 3. контроль
SELECT COUNT(*) AS rows_in_infectious_data
FROM pandemic.infectious_data;
