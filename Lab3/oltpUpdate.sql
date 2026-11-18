-- Verify target machine before update
SELECT id, craft_speed_mult, energy_consume_mult 
FROM machines_in_world 
WHERE id = 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa';

-- Overclock machine to 150%
UPDATE machines_in_world
SET craft_speed_mult = 1.50,
    energy_consume_mult = 1.71
WHERE id = 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'
RETURNING *;

-- Verify target factory line before update
SELECT id, location, factory_line_name 
FROM factory_line 
WHERE id = '22222222-2222-2222-2222-222222222222';

-- Rename factory line
UPDATE factory_line
SET factory_line_name = 'Copper & Steel Foundry'
WHERE id = '22222222-2222-2222-2222-222222222222'
RETURNING *;