

SELECT english_title AS 'Engish names of highest brightnesses of Hiroshige '
FROM views
WHERE artist = 'Hiroshige'
ORDER BY brightness DESC
LIMIT 2;
