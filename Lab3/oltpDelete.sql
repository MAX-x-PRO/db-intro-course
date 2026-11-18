-- Verify target machine before delete
SELECT * FROM machines_in_world WHERE id = 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa';

-- Remove test machine
DELETE FROM machines_in_world
WHERE id = 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'
RETURNING *;

-- Remove test recipe and items
BEGIN;

DELETE FROM recipes WHERE name = 'Copper Ingot';
DELETE FROM items WHERE name IN ('Copper Ore', 'Copper Ingot');

SELECT * FROM items WHERE name LIKE 'Copper%';

COMMIT;