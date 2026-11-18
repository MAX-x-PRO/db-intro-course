CREATE TABLE factory_line (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    location VARCHAR(50) NOT NULL,
    factory_line_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE machine_types (
    id SERIAL PRIMARY KEY,
    machine_name VARCHAR(50) NOT NULL UNIQUE,
    energy_production INTEGER NOT NULL DEFAULT 0 CHECK (energy_production >= 0)
);

CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    base_craft_time NUMERIC(10, 2) NOT NULL CHECK (base_craft_time > 0),
    req_energy INTEGER NOT NULL DEFAULT 0 CHECK (req_energy >= 0)
);

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE machines_in_world (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    machine_id INTEGER NOT NULL REFERENCES machine_types(id) ON DELETE RESTRICT,
    recipe_id INTEGER REFERENCES recipes(id) ON DELETE SET NULL,
    factory_line_id UUID NOT NULL REFERENCES factory_line(id) ON DELETE CASCADE,
    craft_speed_mult NUMERIC(10, 2) NOT NULL DEFAULT 1.00 CHECK (craft_speed_mult >= 0.01 AND craft_speed_mult <= 2.50),
    energy_consume_mult NUMERIC(10, 2) NOT NULL DEFAULT 1.00 CHECK (energy_consume_mult > 0)
);

CREATE TABLE recipe_items (
    recipe_id INTEGER NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    item_id INTEGER NOT NULL REFERENCES items(id) ON DELETE RESTRICT,
    is_input BOOLEAN NOT NULL DEFAULT TRUE,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (recipe_id, item_id, is_input)
);