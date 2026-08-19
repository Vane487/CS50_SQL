
-- *** The Lost Letter ***  live over at 900 Somerville Avenue
At what type of address did the Lost Letter end up?:
At what address did the Lost Letter end up?:

SELECT address, type FROM addresses
WHERE id = (
    SELECT address_id FROM scans
    WHERE action = 'Drop' AND package_id = (
        SELECT id FROM packages
        WHERE from_address_id = (
            SELECT id FROM addresses WHERE address = '900 Somerville Avenue'
        )
    )
);


-- *** The Devious Delivery ***
-- Finding out the contents of the box ---
SELECT contents FROM packages WHERE from_address_id IS NULL;

SELECT address, type FROM addresses
WHERE id = (
    SELECT address_id FROM scans
    WHERE action = 'Drop' AND package_id = (
        SELECT id FROM packages WHERE from_address_id IS NULL
    )
);

-- *** The Forgotten Gift ***

-- FInding the contents --

SELECT contents FROM packages
WHERE from_address_id =
                      ( SELECT id
                      FROM addresses
                      WHERE address = '109 Tileston Street' )
AND to_address_id = (
                     SELECT id FROM addresses WHERE
                     address = '728 Maple Place'
);


WHO HAS THE GIFT

SELECT name FROM drivers
WHERE id = ( SELECT driver_id
       FROM scans
       WHERE package_id)

