-- Редколлегия
CREATE VIEW editorial_board AS
SELECT
researchers.res_id as id,
CONCAT(TRIM(researchers.first_name), ' ', TRIM(researchers.last_name)) AS eng_name,
CONCAT(TRIM(researchers.first_name_ru), ' ', TRIM(researchers.last_name_ru)) AS ru_name,
researchers.h_index_sco AS h_index_scopus,
researchers.h_index_wos AS h_index_wos,
affiliations.aff_country AS country
FROM researchers
JOIN researchers_affiliations
JOIN affiliations
ON researchers.res_id = researchers_affiliations.res_id
AND researchers_affiliations.aff_id = affiliations.aff_id
WHERE editorial = 1;

-- Выводим статистику по странам
SELECT COUNT(*)
FROM editorial_board
AS members
GROUP BY country
ORDER BY COUNT(*) DESC;

-- Выводим статистику по h-индексу
SELECT 
AVG(h_index_scopus) AS average_h_index_scopus,
AVG(h_index_wos) AS average_h_index_wos
FROM editorial_board;

