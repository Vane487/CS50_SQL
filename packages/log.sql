
-- *** The Lost Letter ***  live over at 900 Somerville Avenue
At what type of address did the Lost Letter end up?:
At what address did the Lost Letter end up?:

SELECT address, type FROM addresses
WHERE id =
        ( SELECT address_id FROM scans
        WHERE action = 'Drop' AND package_id = (
            SELECT id FROM packages
            WHERE from_address_id = ( SELECT id from addresses WHERE address = ' 

            )
        )


-- *** The Devious Delivery ***

-- *** The Forgotten Gift ***

