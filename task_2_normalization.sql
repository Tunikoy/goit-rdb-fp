CREATE TABLE pandemic.entities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity_name VARCHAR(255),
    code VARCHAR(10)
);

INSERT INTO pandemic.entities (entity_name, code)
SELECT DISTINCT Entity, Code
FROM pandemic.infectious_cases;

CREATE TABLE pandemic.infectious_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity_id INT,
    year INT,
    number_rabies DOUBLE,
    FOREIGN KEY (entity_id) REFERENCES pandemic.entities(id)
);

INSERT INTO pandemic.infectious_data (entity_id, year, number_rabies)
SELECT 
    e.id,
    ic.Year,
    CAST(NULLIF(ic.Number_rabies, '') AS DOUBLE)
FROM pandemic.infectious_cases ic
JOIN pandemic.entities e 
    ON ic.Entity = e.entity_name AND ic.Code = e.code;

SELECT COUNT(*) FROM pandemic.infectious_data;
