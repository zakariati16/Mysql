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

-- LMD 4 : Relation entre plusieurs tables (mère/enfant) appelé "One To Many"
-- On va pouvoir utiliser la clé primaire de la table initiale (mère) dans la table enfant, qui sera appelée clé étrangère (référence)
-- On reprend la DB clients
CREATE TABLE clients(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(70) UNIQUE,
    telephone VARCHAR(20) NOT NULL
);
-- On veut maintenant faire une table secondaire pour les téléphones
-- Il faut préciser la clé étrangère <FOREIGN KEY(son_nouveau_nom)> et son lieu initial <REFERENCES la_table(nom_colonne)>
CREATE TABLE telephone(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(20) NOT NULL,
    id_client INTEGER,
    FOREIGN KEY(id_client) REFERENCES clients(id) ON DELETE CASCADE
);
-- On peut maintenant ajouter des valeurs dans cette nouvelle table
INSERT INTO telephone(numero,id_client) 
VALUES
("0123456798",1),
("0153456798",1),
("012345698",2),
("0123456798",2),
("0124456798",2),
("0123458798",4),
("0123452798",4),
("0178452798",4),
("0123451298",5),
("0122252798",6)
;

-- Affichage de tous les numéros de téléphones de tous les clients (requête de jointure)

-- Tables sollicitées: clients et téléphone

-- Pour choisir les données d'une table spécifique, on va mettre le nom de table et la colonne voulue <table.colonne>

-- Pour faire la jonction entre les tables, on utilise <FROM> la DB mère <JOIN> la DB secondaire <ON> 

-- Et on précise où est faite la jointure: la colonne de la DB principale = la colonne de la DB secondaire

SELECT clients.prenom, clients.nom, telephone.numero FROM clients JOIN telephone ON clients.id=telephone.id_client;

-- Autre exemple avec ajout d'un CONCAT et d'un alias:

SELECT CONCAT(clients.prenom, " ",clients.nom) AS nom, telephone.numero FROM clients JOIN telephone ON clients.id=telephone.id_client;


-- Il est possible de définir les requêtes mathèmatiques comme calcul automatique via <GENERATED ALWAYS> <AS> <le_calcul> <STORED>

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `typePresta` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `nbDays` int(11) NOT NULL,
  `unitPrice` float NOT NULL,
  `state` tinyint(1) NOT NULL,
  `totalExcludeTaxe` float GENERATED ALWAYS AS (`nbDays` * `unitPrice`) STORED,
  `totalWithTaxe` float GENERATED ALWAYS AS (`nbDays` * `unitPrice` * 1.2) STORED
);



-- Utilisation de filtres de recherche avec <LIKE> et <%>

-- Chaine qui commencent par M2

SELECT * FROM clients 
WHERE companyName LIKE "M2%";

-- Chaine qui se terminent par formation

SELECT * FROM clients 
WHERE companyName LIKE "%formation";

-- Rechercher au milieu d'une chaine
-- chris@sopra.com => ok
-- jean@m2i.com
-- sarah@sopra.fr => ok
-- luc@sopra.edu => ok

SELECT * FROM clients 
WHERE  companyName LIKE "%sopra%"


-- Requête HAVING : utilisé à la place de WHERE lorsque l'on groupe des résultats

-- Toutes les ventes des marques qui ont réalisé un CA de plus de 20000000

SELECT manufacturer,SUM(price*units_sold) as chiffre_affaire 
FROM telephones 
GROUP BY manufacturer HAVING chiffre_affaire>20000000
;

-- On peut utiliser une requête SELECT dans une contrainte WHERE:

SELECT name, price 
FROM telephones 
WHERE price<(SELECT AVG(price) FROM telephones) 
ORDER BY price DESC