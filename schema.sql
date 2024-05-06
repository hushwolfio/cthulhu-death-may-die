CREATE TABLE IF NOT EXISTS investigators (
    i_id SERIAL PRIMARY KEY,
    i_name VARCHAR(50) NOT NULL UNIQUE,
    image_url VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS traits (
    t_id SERIAL PRIMARY KEY,
    t_name VARCHAR(50) NOT NULL UNIQUE,
    is_unique BOOLEAN
);

CREATE TABLE IF NOT EXISTS investigator_traits (
    it_id SERIAL PRIMARY KEY,
    i_id INT NOT NULL,
    t_id INT NOT NULL,
    FOREIGN KEY (i_id) REFERENCES investigators(i_id),
    FOREIGN KEY (t_id) REFERENCES traits(t_id),
    UNIQUE (i_id, t_id)  -- Ensure uniqueness of (i_id, t_id) pairs
);

CREATE TABLE IF NOT EXISTS game_box (
    gb_id SERIAL PRIMARY KEY,
    c_name VARCHAR(50) NOT NULL UNIQUE,
    created_at DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS episode_card (
    ep_id SERIAL PRIMARY KEY,
    ec_name VARCHAR(100) NOT NULL UNIQUE,
    FOREIGN KEY (c_id) REFERENCES game_box(gb_id)
);

CREATE TABLE IF NOT EXISTS episode_card_investigators (
    eci_id SERIAL PRIMARY KEY,
    ep_id INT NOT NULL,
    i_id INT NOT NULL,
    FOREIGN KEY (ep_id) REFERENCES episode_card(ep_id),
    FOREIGN KEY (i_id) REFERENCES investigators(i_id),
    UNIQUE (ep_id, i_id)  -- Ensure uniqueness of (ep_id, i_id) pairs
);

CREATE TABLE IF NOT EXISTS elder_one_card (
    eoc_id SERIAL PRIMARY KEY,
    FOREIGN KEY (gb_id) REFERENCES game_box(gb_id)
);

CREATE TABLE IF NOT EXISTS elder_one_card_enemies (
    eoce_id SERIAL PRIMARY KEY,
    eoc_id INT NOT NULL,
    e_id INT NOT NULL,
    FOREIGN KEY (eoc_id) REFERENCES elder_one_card(eoc_id),
    FOREIGN KEY (e_id) REFERENCES enemies(e_id),
    UNIQUE (eoc_id, e_id)  -- Ensure uniqueness of (eoc_id, e_id) pairs
);

CREATE TABLE IF NOT EXISTS elder_one (
    eo_id SERIAL PRIMARY KEY,
    eo_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS enemies (
    e_id SERIAL PRIMARY KEY,
    e_name VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (et_id) REFERENCES enemy_type(et_id),
    image_url VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS enemy_type (
    et_id SERIAL PRIMARY KEY,
    is_cultist BOOLEAN
);
