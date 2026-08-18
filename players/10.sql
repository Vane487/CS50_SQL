


SELECT ROUND(AVG(weight),2) AS "Average weight" AND first_name, last_name AS "Player"
FROM players
WHERE birth_state != 'PA'
ORDER BY debut DESC;
