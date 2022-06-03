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

-- pour calculer par exp le CA dans la table telephones
SELECT name, manufacturer,price, units_sold, price*units_sold FROM telephones;

-- pour modifier le nom de la colonne apres un Resulat on utilise la commande as
SELECT name as nom, manufacturer,price as prix, units_sold as solde_unite, price*units_sold as CA FROM telephones;

-- pour rajouter du caractere par exemple sur la colonne price (euros), on utlise CONCAT
--- << dans cette requete on a fusionner la colonne manufacturer et name avec CONCAT
--- << changer le name par le nom
---<< rajouter euros dans le contenu de la colonne price et changer le nom de la colonne
SELECT CONCAT(manufacturer," ",name) as nom,CONCAT(price,"€") as prix FROM telephones;


-- Création d'une vue
CREATE VIEW v_revenu_total AS SELECT name AS modele, manufacturer AS constructeur,price AS prix, units_sold AS unites_vendues, (price*units_sold) AS chiffre_affaire FROM telephones;


-- retourner les uniques sans doublons // eliminer les doublons 
SELECT DISTINCT(manufacturer) FROM telephones;



-- calculer le nb d'enregistrement avec la commande COUNT 
---- <<< Afficher le nombre d'appareils Apple

SELECT COUNT(*) FROM telephones WHERE manufacturer="apple";

--TOTAL DE VENTES (calculer la somme) des units_sold // moyenne // vente plus elevees // VENTE MOINS elevees

SELECT SUM(units_sold) FROM telephones;
SELECT AVG(units_sold) FROM telephones;
SELECT MAX(units_sold) FROM telephones;
SELECT MIN(units_sold) FROM telephones;

