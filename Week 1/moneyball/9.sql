

SELECT teams.name, ROUND(AVG(salaries.salary),2) AS "average salary"
FROM teams
JOIN salaries ON teams.id = salaries.team_id
WHERE salaries.year = 2001
GROUP BY teams.id
ORDER BY "average salary" ASC
LIMIT 5;
