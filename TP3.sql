CREATE DATABASE TP3;
USE TP3;

--UNIQUE= exp(ligne9) on aura un unique username

CREATE TABLE utilisateurs(
id INT AUTO_INCREMENT PRIMARY KEY, 
nom VARCHAR(50) NOT NULL,
prenom VARCHAR (50) NOT NULL,
username VARCHAR (50) NOT NULL UNIQUE, 
adresse_email VARCHAR(50) NOT NULL UNIQUE, 
avatar VARCHAR (100) NOT NULL
);

CREATE TABLE photos (
id INT AUTO_INCREMENT PRIMARY KEY,
url_image VARCHAR (100),
id_user INT, 
FOREIGN KEY(id_user) REFERENCES utilisateurs (id) ON DELETE CASCADE
);


CREATE TABLE likes (
id INT AUTO_INCREMENT PRIMARY KEY,
id_photo INT 
FOREIGN KEY(id_photo) REFERENCES photos(id) ON DELETE CASCADE,
id_user INT,
FOREIGN KEY(id_user) REFERENCES utilisateurs (id) ON DELETE SET NULL,
);

CREATE TABLE IF NOT EXISTS Commentaire (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_photo INT,
    id_user INT,
    FOREIGN key (id_photo) REFERENCES Photos(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_user) REFERENCES utilisateur(id) ON UPDATE CASCADE ON DELETE CASCADE,
    contenu VARCHAR (100)
);


--insertion utilisateurs
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (1, 'Maddie', 'Isson', 'misson0', 'misson0@google.it', 'https://robohash.org/suntnoneos.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (2, 'Nananne', 'Huyton', 'nhuyton1', 'nhuyton1@hatena.ne.jp', 'https://robohash.org/molestiaequaearchitecto.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (3, 'Alard', 'Froome', 'afroome2', 'afroome2@telegraph.co.uk', 'https://robohash.org/utdelenitisapiente.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (4, 'April', 'Mose', 'amose3', 'amose3@addtoany.com', 'https://robohash.org/etmaioresvoluptatem.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (5, 'Lindsey', 'Searles', 'lsearles4', 'lsearles4@sakura.ne.jp', 'https://robohash.org/quodliberominima.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (6, 'Shandeigh', 'McGivena', 'smcgivena5', 'smcgivena5@ihg.com', 'https://robohash.org/errornostrummodi.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (7, 'Shawnee', 'Fuidge', 'sfuidge6', 'sfuidge6@chronoengine.com', 'https://robohash.org/earumetnemo.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (8, 'Guthry', 'Yackiminie', 'gyackiminie7', 'gyackiminie7@mail.ru', 'https://robohash.org/eligendiquiquo.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (9, 'Kristo', 'Tollady', 'ktollady8', 'ktollady8@seattletimes.com', 'https://robohash.org/evenietautminima.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (10, 'Rhody', 'De Brett', 'rdebrett9', 'rdebrett9@jigsy.com', 'https://robohash.org/quiaquodut.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (11, 'Dewain', 'Suddaby', 'dsuddabya', 'dsuddabya@yellowpages.com', 'https://robohash.org/cumqueidtemporibus.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (12, 'Lissy', 'Bene', 'lbeneb', 'lbeneb@ucoz.com', 'https://robohash.org/earumdoloribuslaborum.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (13, 'Abbey', 'Ramsby', 'aramsbyc', 'aramsbyc@bing.com', 'https://robohash.org/suscipiteaquesed.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (14, 'Coriss', 'Vowells', 'cvowellsd', 'cvowellsd@businessweek.com', 'https://robohash.org/nequeerrorsequi.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (15, 'Flory', 'Seckington', 'fseckingtone', 'fseckingtone@squidoo.com', 'https://robohash.org/ipsaeumvel.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (16, 'Nichole', 'Amies', 'namiesf', 'namiesf@paginegialle.it', 'https://robohash.org/illosintvoluptates.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (17, 'Alyda', 'Simao', 'asimaog', 'asimaog@cdbaby.com', 'https://robohash.org/auttemporibusminus.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (18, 'Clarice', 'Gair', 'cgairh', 'cgairh@dropbox.com', 'https://robohash.org/similiquesolutaimpedit.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (19, 'Gallard', 'Nano', 'gnanoi', 'gnanoi@earthlink.net', 'https://robohash.org/enimdelectusnam.png?size=50x50&set=set1');
insert into utilisateurs (id, nom, prenom, username, adresse_email, avatar) values (20, 'Robbi', 'Syddie', 'rsyddiej', 'rsyddiej@yellowbook.com', 'https://robohash.org/quofugiatsed.png?size=50x50&set=set1');



--question 4

SELECT commentaire.contenu, utilisateurs.username from utilisateurs JOIN commentaire 
ON utilisateurs.id=commentaire.id_user; 

--question 5 Pour chaque commentaire, afficher son contenu et l'url de la photo à laquel le commentaire a été ajouté

SELECT commentaire.id, photos.url_image , commentaire.contenu, utilisateurs.username
FROM commentaire
JOIN utilisateurs
ON utilisateurs.id=commentaire.id_user
JOIN photos
ON utilisateurs.id=photos.id_user
;

--question 6

SELECT photos.url_image,CONCAT(utilisateurs.nom," ",utilisateurs.prenom) AS Contact FROM photos
Join utilisateurs
ON photos.id=utilisateurs.id;

--question 7

SELECT utilisateurs.username, commentaire.contenu, photos.id FROM commentaire 
JOIN utilisateurs ON utilisateurs.id=commentaire.id_user
JOIN photos ON photos.id=commentaire.id_photo
WHERE photos.id=3;

--question 8 et 9
SELECT utilisateurs.username, commentaire.contenu, photos.id, photos.url_image
FROM commentaire
JOIN utilisateurs
ON utilisateurs.id=commentaire.id_user
JOIN photos
ON commentaire.id_photo=photos.id
WHERE photos.id_user=commentaire.id_user
;

--question 10
SELECT COUNT(*) FROM likes WHERE id_photo=4; 



