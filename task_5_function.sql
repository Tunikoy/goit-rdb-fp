DELIMITER $$

CREATE FUNCTION get_years_diff(year_input INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(
        YEAR,
        STR_TO_DATE(CONCAT(year_input, '-01-01'), '%Y-%m-%d'),
        CURRENT_DATE()
    );
END $$

DELIMITER ;
