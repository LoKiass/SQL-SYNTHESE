CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    ideal_weight DECIMAL
);

INSERT INTO cats (name, ideal_weight) VALUES
('Whiskers', 4.5),
('Mittens', 5.0),
('Felix', 6.0);

CREATE TABLE weightning (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    poids DECIMAL,
    date DATE
);
INSERT INTO weightning (name, poids, date) VALUES
('Whiskers', 4.3, '2024-10-01'),
('Felix', 5.8, '2024-10-02');

-- Inner join - Prends les enregistrement de chaque table correspondant et existant
SELECT c.name, w.poids, w.date, c.ideal_weight
FROM cats as c
JOIN weightning as w ON c.name = w.name;

-- Left join, prends chaque enregistrement de gauche et afficher leurs enregistrement existantou non
SELECT c.name, w.poids, w.date, c.ideal_weight
FROM cats as c
LEFT JOIN weightning as w ON c.name = w.name;

-- Right join, Prends chaque enregistrement de droite et affiche les enregistrement existant ou non
SELECT w.name, w.poids, w.date, c.ideal_weight FROM cats as c
RIGHT JOIN weightning as w ON c.name = w.name;

-- FULL outer join, Prends chaque enregistrement sans aucune condition, existant ou non
SELECT * FROM cats as c
FULL OUTER JOIN weightning as w ON c.name = w.name;

-- Cross Join - Prends chaque possibilité avec produit cartésien (3x3) 
SELECT cats.name AS cat_name, weightning.name AS weightning_name, weightning.poids, weightning.date
FROM cats
CROSS JOIN weightning;
