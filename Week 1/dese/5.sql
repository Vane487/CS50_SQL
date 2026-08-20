
 SELECT city, COUNT (*) AS "number_of_schools"
 FROM schools
 WHERE type = 'Public School'
 GROUP BY city
 HAVING COUNT(*)<= 3
 ORDER BY COUNT(*) DESC, city ASC;
