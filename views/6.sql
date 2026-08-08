In 6.sql, write a SQL query to find the average entropy of prints by Hiroshige,
 rounded to two decimal places.
 Call the resulting column “Hiroshige Average Entropy”.
SELECT AVG (entropy) AS “Hiroshige Average Entropy”
FROM views
WHERE artist = 'Hiroshige';
