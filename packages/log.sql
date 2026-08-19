
-- *** The Lost Letter ***  live over at 900 Somerville Avenue
SELECT contents FROM packages
WHERE from_address_id = (SELECT id FROM adresses WHERE address = ' 900 Somerville Avenue');

-- *** The Devious Delivery ***

-- *** The Forgotten Gift ***

