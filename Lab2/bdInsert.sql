INSERT INTO factory_line (id, location, factory_line_name) VALUES
    ('11111111-1111-1111-1111-111111111111', 'Grass Fields', 'Starter Iron Hub'),
    ('22222222-2222-2222-2222-222222222222', 'Rocky Desert', 'Steel Foundry Sector'),
    ('33333333-3333-3333-3333-333333333333', 'Northern Forest', 'Smart Plating Assembly'),
    ('44444444-4444-4444-4444-444444444444', 'Blue Crater', 'Coal Power Plant');

INSERT INTO machine_types (id, machine_name, energy_production) VALUES
    (1, 'Smelter', 0),
    (2, 'Constructor', 0),
    (3, 'Assembler', 0),
    (4, 'Foundry', 0),
    (5, 'Coal Generator', 75);

INSERT INTO items (id, name) VALUES
    (1, 'Iron Ore'),
    (2, 'Iron Ingot'),
    (3, 'Iron Plate'),
    (4, 'Iron Rod'),
    (5, 'Screw'),
    (6, 'Reinforced Iron Plate'),
    (7, 'Coal');

INSERT INTO recipes (id, name, base_craft_time, req_energy) VALUES
    (1, 'Iron Ingot', 2.00, 4),
    (2, 'Iron Plate', 6.00, 4),
    (3, 'Iron Rod', 4.00, 4),
    (4, 'Screw', 6.00, 4),
    (5, 'Reinforced Iron Plate', 12.00, 15);

INSERT INTO recipe_items (recipe_id, item_id, is_input, quantity) VALUES
    -- 1 Iron Ore -> 1 Iron Ingot
    (1, 1, TRUE, 1),
    (1, 2, FALSE, 1),
    -- 3 Iron Ingot -> 2 Iron Plate
    (2, 2, TRUE, 3),
    (2, 3, FALSE, 2),
    -- 1 Iron Ingot -> 1 Iron Rod
    (3, 2, TRUE, 1),
    (3, 4, FALSE, 1),
    -- 1 Iron Rod -> 4 Screw
    (4, 4, TRUE, 1),
    (4, 5, FALSE, 4),
    -- 6 Iron Plate + 12 Screw -> 1 Reinforced Iron Plate
    (5, 3, TRUE, 6),
    (5, 5, TRUE, 12),
    (5, 6, FALSE, 1);

INSERT INTO machines_in_world (machine_id, recipe_id, factory_line_id, craft_speed_mult, energy_consume_mult) VALUES
    (1, 1, '11111111-1111-1111-1111-111111111111', 1.00, 1.00),
    (1, 1, '11111111-1111-1111-1111-111111111111', 1.50, 1.71),
    (2, 2, '11111111-1111-1111-1111-111111111111', 1.00, 1.00),
    (3, 5, '33333333-3333-3333-3333-333333333333', 2.00, 2.50),
    (5, NULL, '44444444-4444-4444-4444-444444444444', 1.00, 1.00);