-- Get all recipes that require more than 4 MW of energy or take longer than 5 seconds
SELECT id, name, base_craft_time, req_energy
FROM recipes
WHERE req_energy > 4 OR base_craft_time > 5.00;

-- Find all machines with a speed multiplier greater than 1.0    
SELECT id, machine_id, factory_line_id, craft_speed_mult, energy_consume_mult
FROM machines_in_world
WHERE craft_speed_mult > 1.00;

-- Get details of machines in the 'Grass Fields' location
SELECT 
    m.id AS machine_uuid,
    fl.factory_line_name,
    mt.machine_name,
    COALESCE(r.name, 'Не призначено (Генератор)') AS active_recipe,
    m.craft_speed_mult
FROM machines_in_world m
JOIN factory_line fl ON m.factory_line_id = fl.id
JOIN machine_types mt ON m.machine_id = mt.id
LEFT JOIN recipes r ON m.recipe_id = r.id
WHERE fl.location = 'Grass Fields';

-- Get Reinforced Iron Plate recipe ingredients and outputs 
SELECT 
    r.name AS recipe_name,
    i.name AS item_name,
    CASE WHEN ri.is_input THEN 'Вхід (Сировина)' ELSE 'Вихід (Продукт)' END AS direction,
    ri.quantity
FROM recipe_items ri
JOIN recipes r ON ri.recipe_id = r.id
JOIN items i ON ri.item_id = i.id
WHERE r.name = 'Reinforced Iron Plate';