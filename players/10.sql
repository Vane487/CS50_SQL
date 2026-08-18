n 10.sql, write SQL query to answer a question of your choice. This query should:
Make use of AS to rename a column
Involve at least condition, using WHERE
Sort by at least one column using ORDER BY


SELECT ROUND(AVG(weight),2) AS "Average weight" AND first_name, last_name AS "Player"
FROM players
WHERE 
