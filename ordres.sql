--SELECT * FROM telephones WHERE manufacturer=Samsung OR manufacturer=Apple;
----< ici on peut remplacer OR par la commande IN ca donne ce Rt
SELECT * FROM telephones WHERE manufacturer IN("Apple","Samsung");


-- SELECT name,manufacturer,price FROM telephones WHERE price>=150 AND price<=200; 
-- a la place on peut utiliser BETWEEN
SELECT name,manufacturer,price FROM telephones WHERE price BETWEEN 150 AND 200;



--Afficher en ordre croissant (1,2,3...)
SELECT id,name,manufacturer,price FROM telephones ORDER BY price ASC;

--Afficher en ordre decroissant
SELECT id,name,manufacturer,price FROM telephones ORDER BY price DESC;

-- Afficher en ordre decroissant avec deux conditions
SELECT id,name,manufacturer,price FROM telephones ORDER BY price DESC,manufacturer;

