-- Add new items
INSERT INTO items (name)
VALUES 
    ('Copper Ore'),
    ('Copper Ingot')
RETURNING *;

-- Add new recipe of Copper Ingot
INSERT INTO recipes (name, base_craft_time, req_energy)
VALUES ('Copper Ingot', 2.00, 4)
RETURNING *;

-- Link items to recipe
INSERT INTO recipe_items (recipe_id, item_id, is_input, quantity)
VALUES 
    ((SELECT id FROM recipes WHERE name = 'Copper Ingot'), (SELECT id FROM items WHERE name = 'Copper Ore'), TRUE, 1),
    ((SELECT id FROM recipes WHERE name = 'Copper Ingot'), (SELECT id FROM items WHERE name = 'Copper Ingot'), FALSE, 1)
RETURNING *;

-- Add new machine instance
INSERT INTO machines_in_world (id, machine_id, recipe_id, factory_line_id, craft_speed_mult, energy_consume_mult)
VALUES (
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    (SELECT id FROM machine_types WHERE machine_name = 'Smelter'),
    (SELECT id FROM recipes WHERE name = 'Copper Ingot'),
    '22222222-2222-2222-2222-222222222222',
    1.00,
    1.00
)
RETURNING *;