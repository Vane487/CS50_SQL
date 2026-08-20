
SELECT districts.name, expenditures.per_pupil_expenditure, graduation_rates.graduated
FROM districts
JOIN expenditures ON districts.id = expenditures.district_id
JOIN graduation_rates ON  districts.id = graduation_rates.district_id
WHERE districts.type = 'Public School District'
AND expenditures.per_pupil_expenditure > (
    SELECT AVG(per_pupil_expenditure) FROM expenditures
)
AND graduation_rates.graduated > (
    SELECT AVG(graduated) FROM graduation_rates
)
ORDER BY graduation_rates.graduated DESC, expenditures.per_pupil_expenditure DESC;
