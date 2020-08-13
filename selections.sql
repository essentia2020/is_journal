-- Отчет по количеству рецензий
SELECT last_name, COUNT(r2.doi) as reviews
FROM researchers r
JOIN reviews r2
ON r.res_id = r2.res_id
GROUP BY first_name;

-- Национальный состав авторов
SELECT a.aff_country, COUNT(a2.doi) as articles
FROM affiliations a
JOIN articles_researchers a2
JOIN researchers_affiliations r2
ON a.aff_id = r2.aff_id AND
r2.res_id = a2.res_id
GROUP BY a.aff_country
ORDER BY articles DESC;