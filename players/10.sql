


SELECT birth_state, ROUND(AVG(weight), 2) AS "Average Weight"
FROM players
WHERE birth_state != 'PA' AND weight IS NOT NULL
GROUP BY birth_state
ORDER BY "Average Weight" DESC;
