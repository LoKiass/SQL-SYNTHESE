CREATE TABLE IF NOT EXISTS entrainement (
    Var1 decimal(3,1),
    Var2 date,
    Var3 varchar(32),
    Var4 integer
);

INSERT INTO entrainement(Var1, Var2, Var3, Var4)
VALUES(3.1, '2024-01-24', 'varChar1', 14);
INSERT INTO entrainement(Var1, Var2, Var3, Var4)
VALUES(6.1, '25-01-24', 'varChar2', 25);
INSERT INTO entrainement(Var1, Var2, Var3, Var4)
VALUES(9.4, '24-01-25', 'varChar1', 90);
INSERT INTO entrainement(Var1, Var2, Var3, Var4)
VALUES(0.1, '24-01-27', 'varChar1', 62);
INSERT INTO entrainement(Var1, Var2, Var3, Var4)
VALUES(3.1, '24-01-24', 'varChar1', 19);

-- Select et triage et autres termes

SELECT * FROM entrainement; -- Selectionner toutes les collones de la tables entrainements
SELECT * FROM entrainement ORDER BY Var1 ASC; -- Du plus petit au plus grands
SELECT * FROM entrainement ORDER BY Var1 DESC; -- Du plus grands au plus petit
SELECT * FROM entrainement ORDER BY Var1 LIMIT 1; -- Ajouter le nombre maximum de record
SELECT * FROM entrainement ORDER BY Var1 OFFSET 1; -- Ajouter un offset au record qu'on veut recuperer (Ne prends donc pas en compte le premier)

-- Fonction d'agrégations

SELECT MAX(e.Var1) as maxOfVar1 -- AS permet de crée une alias pour eviter de devoir re-ecrire la table complétement
FROM entrainement as e; -- Selection la plus grande valeur de la collonne Var1

SELECT MIN(e.Var4) as minOfVar4 -- Selectionner la valeur la plus petite
FROM entrainement as e;

SELECT AVG(e.Var1) as averageOfVar1 -- Faire la moyenne de la collone Var1
FROM entrainement as e;

SELECT SUM(e.Var1) as sumOfVar1  -- Faire le totale d'une collone
FROM entrainement as e;

SELECT COUNT(e.Var2) as countOfVar2 -- Nombre de record totale
FROM entrainement as e;

-- Modification de la structure
ALTER TABLE entrainement ADD COLUMN Var5 int; -- Permet de modifier la structure de la TABLE

ALTER TABLE entrainement ADD CONSTRAINT nonNull CHECK (Var1 IS NOT NULL); -- Permet aussi d'ajouter des contraintes
INSERT INTO entrainement (Var1) VALUES (0); -- Cette commande ne pourras donc pas être effectuer

ALTER TABLE entrainement DROP CONSTRAINT nonNull; -- Suprimmer une contrainte

-- Commande update (Modification des données de la base de donné)

UPDATE entrainement SET Var5 = 10 WHERE Var5 IS NULL; -- Permet de mettres les valeur de Var5 à 10 ou Var1 est Null
UPDATE entrainement SET Var3 = 'VarChar0' WHERE Var3 = 'VarChar3';

-- Commande DELETE

DELETE FROM entrainement WHERE Var5 = 0 -- Suprimmer le record ou VAR5 = 0
