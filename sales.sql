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


INSERT INTO clients (company_name,first_name,last_name,email,phone,address,zip_code,country,state)VALUES("capgemini","fabrice","martin","martin@gmail.com","0656858433","abc","xyz","france","0");

INSERT INTO clients (company_name,first_name,last_name,email,phone,address,zip_code,country,state)VALUES("m2iformation","julien","lamard","lamard@gmail.com","06112283344","xyz","france","1");
