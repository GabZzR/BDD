DROP DATABASE IF EXISTS jeu_test;
CREATE DATABASE jeu_test;
USE jeu_test;

CREATE TABLE echantillon(
	id int NULL,
	nom varchar(20) NULL
);
/****** Object:  Table echantillon2    Script Date: 30/06/2021 15:59:15 ******/


CREATE TABLE echantillon2(
	id int NULL,
	nom varchar(20) NULL
);
/****** Object:  Table echantillon3    Script Date: 30/06/2021 15:59:15 ******/


CREATE TABLE echantillon3(
	id int NULL,
	nom varchar(20) NULL
);
/****** Object:  Table echantillon4    Script Date: 30/06/2021 15:59:15 ******/


CREATE TABLE echantillon4(
	id int NULL,
	nom varchar(20) NULL
);

INSERT echantillon (id, nom) VALUES (1, N'xx');
INSERT echantillon (id, nom) VALUES (2, N'yy');
INSERT echantillon (id, nom) VALUES (3, N'zz');
INSERT echantillon2 (id, nom) VALUES (1, N'hello');
INSERT echantillon2 (id, nom) VALUES (2, N'hallo');
INSERT echantillon2 (id, nom) VALUES (3, N'hi');
INSERT echantillon2 (id, nom) VALUES (4, N'Maripoasa');
INSERT echantillon2 (id, nom) VALUES (5, N'Jke');
INSERT echantillon3 (id, nom) VALUES (1, N'bobo');
INSERT echantillon3 (id, nom) VALUES (2, N'babar');
INSERT echantillon3 (id, nom) VALUES (3, N'bibi');
INSERT echantillon3 (id, nom) VALUES (4, N'bike');
INSERT echantillon3 (id, nom) VALUES (5, N'bob');
INSERT echantillon3 (id, nom) VALUES (6, N'bisoux');
INSERT echantillon4 (id, nom) VALUES (1, N'hello');
INSERT echantillon4 (id, nom) VALUES (2, N'hallo');
INSERT echantillon4 (id, nom) VALUES (3, N'hi');
INSERT echantillon4 (id, nom) VALUES (4, N'hillo');
INSERT echantillon4 (id, nom) VALUES (5, N'Description ion');
