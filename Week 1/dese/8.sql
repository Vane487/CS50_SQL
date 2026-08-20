

SELECT districts.name, expenditures.pupils
FROM districts
JOIN expenditures ON districts.id = expenditures.district_id;


