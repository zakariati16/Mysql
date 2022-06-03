 CREATE DATABASE sales;
 USE sales;
 

    CREATE TABLE telephones(
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
manufacturer VARCHAR(30) NOT NULL,
price FLOAT(4,2) NOT NULL,
units_sold INTEGER(10) NOT NULL
);

DESC telephones;

INSERT INTO telephones (name, manufacturer, price, units_sold)
values("N1280","Nokia",199,1925),
("Iphone 4","Apple",399,9436),
("Galaxy S 5","Samsung",299,2359),
("S5620 Monte","Samsung",250,2385),
("N8","Nokia",150,7543),
("Droid","Motorola",150,8395),
("Iphone 13 ProMax","Apple",1300,12849),
("Galaxy Note 20","Samsung",1100,10353);

SELECT name,manufacturer FROM telephones;

SELECT name,manufacturer FROM telephones WHERE price>=150 AND price<=200;
SELECT * FROM telephones WHERE manufacturer=Samsung OR manufacturer=Apple;



----TP2----

CREATE DATABASE TP2
USE TP2 

CREATE TABLE clients (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    company_Name VARCHAR(20) NOT NULL,
    first_name VARCHAR (30) NOT NULL,
    last_name VARCHAR (20) NOT NULL,
    email VARCHAR (50) NOT NULL,
    phone INTEGER NOT NULL,
    address VARCHAR (100) NOT NULL,
    zip_code VARCHAR (20) NOT NULL,
    country VARCHAR (30) NOT NULL,
    state INTEGER (1) NOT NULL,
 
);


CREATE TABLE orders (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    typepresta VARCHAR(20) NOT NULL,
    designation VARCHAR (30) NOT NULL,
    client_id INTEGER NOT NULL,
    nb_days INTEGER NOT NULL,
    unit_price FLOAT (5,2) NOT NULL,
    state INTEGER (1) NOT NULL,
    FOREIGN KEY(client_id) REFERENCES clients(id)
);

--2-- remplisssage de BD

INSERT INTO clients (company_name,first_name,last_name,email,phone,address,zip_code,country,state)VALUES("capgemini","fabrice","martin","martin@gmail.com","0656858433","abc","xyz","france","0");

INSERT INTO clients (company_name,first_name,last_name,email,phone,address,zip_code,country,state)VALUES("m2iformation","julien","lamard","lamard@gmail.com","06112283344","xyz","france","1");
--3-- AJOUT les clients athos et sopra steria
INSERT INTO clients (companyName,first_Name,last_Name,email,phone,address,zip_Code,country,state)
values ("ATOS", "Jean", "Zozor", "jzozor@mail.com", "06 09 08 07 06", "quelque part", "tre","France", 1),
("SOPRA STRERIA", "Anthony", "Toto", "toto@mail.com", "05 61 55 33 33", "Rue de l'Humanité", "zzz",  "France", 0);


-- remplissage table orders

INSERT INTO orders (typepresta,designation,client_id,nb_days,unit_price,state)
VALUES("formation","angular_init",2,3,1200,0),
("formation","react_avance",2,3,1000,2),
("coaching","react_teachlead",1,20,900,2),
("coaching","nest.jst_techlead",1,50,800,1),
("coaching","react_teachlead",3,23,700,1),
("coaching","jakarataEE",3,21,850,2),
("coaching","angular techlead",4,40,650,1),
("coaching","jakarataEE",3,25,810,2),
("coaching","react_teachlead",4,28,810,0),
("coaching","react_teachlead",2,23,700,1)
;

--afficher toutes les formations sollicités par le client M2iformation;

SELECT orders.typepresta, orders.designation from orders WHERE client_id=2; 

--> Afficher les noms et contacts de tous les contacts des clients qui ont sollicité un
coaching
SELECT clients.first_name,clients.last_name,clients.email,clients.phone,clients.address,orders.typepresta 
from clients JOIN orders ON clients.id=orders.client_id where typepresta = "coaching"; 

--> Afficher les noms et contacts de tous les contacts des clients qui ont sollicité un coaching pour les accompagnements React.js

SELECT clients.first_name,clients.last_name,clients.email,clients.phone,clients.address,orders.typepresta,orders.designation 
from clients JOIN orders ON clients.id=orders.client_id where typepresta = "coaching" AND designation="react.js"; 

--> calculer le prix total de la formation en HT ET TTC
CREATE VIEW pricetotal AS SELECT
typePresta," ",designation,
unitPrice*nbDays,
unitPrice*nbDays*1.2,
 state
 from orders;


 --> 7. Lister toutes les prestations qui sont confirméset qui vont rapporter plus 30.000€


SELECT prestation FROM priceTotal WHERE totalWithTaxe>=30000 AND state=2;


