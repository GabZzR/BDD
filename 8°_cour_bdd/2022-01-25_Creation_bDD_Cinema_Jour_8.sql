DROP DATABASE IF EXISTS cinema;
CREATE DATABASE cinema;
SET DEFAULT_STORAGE_ENGINE=INNODB;
USE cinema;

CREATE TABLE Fonction(
id int PRIMARY KEY AUTO_INCREMENT,
des VARCHAR(50),
nom VARCHAR(50)
);

CREATE TABLE Employee(
id int PRIMARY KEY AUTO_INCREMENT,
nom VARCHAR(50) NOT NULL,
prenom VARCHAR(50) NOT NULL,
date_ent DATETIME ON UPDATE CURRENT_TIMESTAMP,
date_sort DATETIME,
id_fonction int,
mat VARCHAR(8),
CONSTRAINT FK_emplo_fonct FOREIGN KEY(id_fonction) REFERENCES Fonction(id)
);

CREATE TABLE Info_emp(
id_emp INT PRIMARY KEY,
adresse VARCHAR(255),
cp VARCHAR(5),
tel VARCHAR(12) NOT NULL,
mail VARCHAR(103) UNIQUE NOT NULL,
date_naiss DATETIME,
genre TINYINT,
secu VARCHAR(13),
CONSTRAINT FK_info_emp FOREIGN KEY(id_emp) REFERENCES Employee(id)
);

CREATE TABLE Genre(
id INT PRIMARY KEY AUTO_INCREMENT,
nom VARCHAR(40) NOT NULL
);

CREATE TABLE Film(
id int PRIMARY KEY AUTO_INCREMENT,
nom TEXT NOT NULL,
date_sor DATE NOT NULL,
realisateur VARCHAR(80) NOT NULL,
synopsis LONGTEXT NOT NULL,
classif VARCHAR(30) NOT NULL,
origine VARCHAR(3) NOT NULL,
duree SMALLINT NOT NULL
);

CREATE TABLE Genre_Film(
id_genre INT,
id_film INT,
CONSTRAINT FK_genrefirlm_film FOREIGN KEY(id_genre) REFERENCES Genre(id),
CONSTRAINT FK_genrefilm_genre FOREIGN KEY(id_film) REFERENCES Film(id)
);

CREATE TABLE Salle(
id INT PRIMARY KEY AUTO_INCREMENT,
nom VARCHAR(50) UNIQUE NOT NULL,
nb int DEFAULT(0)
);

CREATE TABLE Seance(
id INT PRIMARY KEY AUTO_INCREMENT,
plage VARCHAR(15) NOT NULL
);

CREATE TABLE Abonne(
id int PRIMARY KEY AUTO_INCREMENT,
nom VARCHAR(50) NOT NULL,
prenom VARCHAR(50) NOT NULL,
date_ins DATETIME ON UPDATE CURRENT_TIMESTAMP,
premium BINARY NOT NULL,
num_carte VARCHAR(13) UNIQUE NOT NULL);

CREATE TABLE Infos_abo(
id_emp INT PRIMARY KEY,
adresse VARCHAR(255),
cp VARCHAR(5),
tel VARCHAR(12) NOT NULL,
mail VARCHAR(103) UNIQUE NOT NULL,
date_naiss DATETIME,
genre TINYINT,
CONSTRAINT FK_infos_abo FOREIGN KEY (id_emp) REFERENCES Abonne(id)
);

CREATE TABLE Tarif(
id int PRIMARY KEY AUTO_INCREMENT,
nom VARCHAR(50) UNIQUE NOT NULL,
prix DECIMAL(5,2) NOT NULL
);

CREATE TABLE Programmation(
id_salle int NOT NULL,
id_seance INT NOT NULL,
id_film INT NOT NULL,
date_proj DATETIME NOT NULL,
version VARCHAR(6) NOT NULL,
CONSTRAINT FK_id_salle_salle FOREIGN KEY (id_salle) REFERENCES salle(id),
CONSTRAINT FK_id_seance_seance FOREIGN KEY (id_seance) REFERENCES seance(id),
CONSTRAINT FK_id_film_film FOREIGN KEY (id_film) REFERENCES film(id)
);

/*Metiers + Salles*/
INSERT IGNORE INTO salle(nom,nb) VALUES ('SNK',150),('Raiky',0),('St-Just',250),('Jean',100);
INSERT IGNORE INTO seance(plage) VALUES ('10h30'),('15h30'),('20h30');
INSERT IGNORE INTO fonction(nom) VALUES('Projectionniste'),('Billetiste'),('Agent de Securite'),('Exploitant');


/*INSERT IGNORE INTO genre*/
INSERT IGNORE INTO genre (nom) VALUES ('Action');
INSERT IGNORE INTO genre (nom) VALUES ('Adventure');
INSERT IGNORE INTO genre (nom) VALUES ('Animation');
INSERT IGNORE INTO genre (nom) VALUES ('Biography');
INSERT IGNORE INTO genre (nom) VALUES ('Comedy');
INSERT IGNORE INTO genre (nom) VALUES ('Crime');
INSERT IGNORE INTO genre (nom) VALUES ('Documentary');
INSERT IGNORE INTO genre (nom) VALUES ('Drama');
INSERT IGNORE INTO genre (nom) VALUES ('Horror');
INSERT IGNORE INTO genre (nom) VALUES ('Sci-Fi');

/*insertion Film*/
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('$', '1971-12-17 00:00:00.000', 'A bank security expert plots with a call girl to rob three safety deposit boxes containing $1.5 million in cash belonging to three very different criminals from a high-tech security bank in Hamburg, Germany.', 'R', 'English', 121); 
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('$9.99', '2009-09-17 00:00:00.000', 'A stop-motion animated story about people living in a Sydney apartment complex looking for meaning in their lives.', 'R', 'English', 78); 
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('$ellebrity', '2013-01-11 00:00:00.000', 'Celebrity photographer Kevin Mazur gives an all access pass to life behind the velvet rope and in front of the camera.', 'NOT RATED', 'English', 89); 
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('(500) Days of Summer', '2009-08-07 00:00:00.000', 'An offbeat romantic comedy about a woman who does''t believe true love exists, and the young man who falls for her.', 'PG-13', 'English', 95); 
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('(Untitled)', '2011-06-02 00:00:00.000', 'A Chelsea art gallerist falls for a brooding new music composer in this comic tale about the state of contemporary art.', 'R', 'English', 96); 
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('*batteries not included', '1987-12-18 00:00:00.000', 'Apartment block tenants seek the aid of alien mechanical life-forms to save their building from demolition.', 'PG', 'English', 106); ;
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('...All the Marbles', '1981-10-16 00:00:00.000', 'Harry manages The California Dolls, a female wrestling tag team endlessly touring America, and he''s also romantically involved with one of them. Their fortunes seem on the slide (...', 'R', 'English', 113); ;
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('...And ;d Created Woma', '1957-10-21 00:00:00.000', 'In sunny St. Tropez, a young sexpot loves one brother but marries the other.', 'PG', 'French', 90); ;
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('...And Justice for All.', '1979-10-19 00:00:00.000', 'A lawyer (Al Pacino) is forced to defend a guilty judge, while defending other innocent clients, and trying to find punishment for the guilty and provide justice for the innocent.', 'R', 'English', 119); ;
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('[Rec]', '2007-11-23 00:00:00.000', 'A television reporter and cameraman follow emergency workers into a dark apartment building and are quickly locked inside with something terrifying.', 'R', 'Spanish', 78); ;
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('[Rec] 2', '2009-10-02 00:00:00.000', 'In order to ascertain the current situation inside, a supposed medical officer and a GEO team step into the quarantined and ill-fated apartment building.', 'R', 'Spanish', 85); ;
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('[REC] 3: Genesis', '2012-03-30 00:00:00.000', 'A couple''s wedding day turns horrific as some of the guests start showing signs of a strange illness.', 'R', 'Spanish', 80); ;
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('[REC] 4: Apocalypse', '2014-10-31 00:00:00.000', 'Television reporter Ã¨ngela is rescued from the building and taken to an oil tanker to be examined. However, it is unknown whether it is her who is carrying the seed of the mysterious demonic virus.', 'R', 'Spanish', 95);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('1', '2013-10-24 00:00:00.000', 'Three college friends hit the biggest party of the year, where a mysterious phenomenon disrupts the night, quickly descending into a chaos that challenges their friendships -- and whether they can stay alive.', 'NOT RATED', 'English', 95);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('10', '1979-10-05 00:00:00.000', 'A Hollywood lyricist ;es through a mid-life crisis and becomes infatuated with a sexy, newly married woman.', 'R', 'English', 122);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('10 Cent Pistol', '2015-07-24 00:00:00.000', 'A story about two lifelong criminals who maneuver through the shady underbelly of Los Angeles in search of wealth, love and redemption.', 'UNRATED', 'English', 91);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('10 Items or Less', '2007-02-08 00:00:00.000', 'An actor (Freeman) prepping for an upcoming role meets a quirky grocery clerk (Vega), and the pair hit the road to show one another their respective worlds.', 'R', 'English', 82);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('10 Questions for the Dalai Lama', '2006-05-01 00:00:00.000', 'How do you reconcile a commitment to non-violence when faced with violence? Why do the poor often seem happier than the rich? Must a society lose its traditions in order to move into the ...', 'UNRATED', 'English', 85);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('10 Things I Hate About You', '1999-03-31 00:00:00.000', 'A new kid must find a guy to date the meanest girl in school, the older sister of the girl he has a crush on, who cannot date until her older sister does.', 'PG-13', 'English', 97);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('10,000 Black Men Named George', '2002-02-24 00:00:00.000', 'Union activist Asa Philip Randolph''s efforts to organize the black porters of the Pullman Rail Company in 1920s America.', 'R', 'English', 95);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('10.000 Km', '2015-07-10 00:00:00.000', 'Two people in love, two apartments - one in Barcelona and another on in Los Angeles - and the images of their past, present and future. Can love survive 10,000km?', 'R', 'Spanish', 99);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('10.5', '2004-05-02 00:00:00.000', 'An earthquake reaching a 10.5 magnitude on the Richter scale, strikes the west coast of the U.S. and Canada. A large portion of land falls into the ocean, and the situation is worsened by aftershocks and tsunami.', 'UNRATED', 'English', 165);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('100 Bloody Acres', '2013-08-01 00:00:00.000', 'Reg and Lindsay run an organic fertiliser business. They need a fresh supply of their "secret ingredient" to process through the meat grinder. Reg comes across two guys and a girl with a broken-down vehicle on their way to a music festival.', 'NOT RATED', 'English', 91);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('100 Girls', '2000-09-01 00:00:00.000', 'This sexy, teen-comedy is about a freshman, Matthew, at college who meets his dream girl in a dorm elevator during a blackout. He never sees her face, but instantly falls in love. In the ...', 'R', 'English', 94);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('101 Dalmatians', '1961-01-25 00:00:00.000', 'When a litter of dalmatian puppies are abducted by the minions of Cruella De Vil, the parents must find them before she uses them for a diabolical fashion statement.', 'G', 'English', 79);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('101 Dalmatians II: Patch''s London Adventure', '2003-01-21 00:00:00.000', 'Being one of 101 takes its toll on Patch, who does''t feel unique. When he''s accidentally left behind on moving day, he meets his idol, Thunderbolt, who enlists him on a publicity campaign.', 'G', 'English', 70);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('101 Reykjavèk', '2000-06-01 00:00:00.000', 'Thirty-year-old Hlynur still lives with his mother and spends his days drinking, watching porn and surfing the net while living off unemployment checks. A girl is interested in him, but he ...', 'NOT RATED', 'Icelandic', 88);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('102 Dalmatians', '2000-11-22 00:00:00.000', 'Cruella DeVil gets out of prison and ;es after them darned puppies once more.', 'G', 'English', 100);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('11:11', '2004-02-28 00:00:00.000', 'A troubled young woman, haunted by her mother''s ghost, is suddenly confronted by paranormal events which are wreaking havoc on her small college town. She struggles to understand the meaning of these supernatural events...', 'R', 'English', 95);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('11:14', '2004-08-20 00:00:00.000', 'The events leading up to an 11:14 PM car crash, from five very different perspectives.', 'R', 'English', 86);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('12', '2007-09-20 00:00:00.000', 'Twelve jurors must decide the fate of a Chechen adolescent charged with murdering his stepfather.', 'PG-13', 'Russia', 159);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('12 and Holding', '2006-07-07 00:00:00.000', 'After his twin brother is accidentally killed by vengeful bullies, a 12-year old boy and his friends face the harsh realities of death, teenage hormones, and family dysfunction.', 'R', 'English', 94);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('12 Angry Me', '1997-08-17 00:00:00.000', 'Twelve men must decide the fate of one when one juror objects to the jury''s decision.', 'PG-13', 'English', 117);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('12 Years a Slave', '2013-11-08 00:00:00.000', 'In the antebellum United States, Solomon Northup, a free black man from upstate New York, is abducted and sold into slavery.', 'R', 'English', 134);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('12:01', '1993-07-05 00:00:00.000', 'Barry Thomas is the average office worker. He becomes attracted to Lisa Fredericks who works in the same company. After work, Barry witnesses the murder of Lisa and ;es to a bar to get ...', 'PG-13', 'English', 92);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('12:08 East of Bucharest', '2006-09-29 00:00:00.000', 'It''s the 22nd of December. Sixteen years have passed since the revolution, and in a small town Christmas is about to come. Piscoci, an old retired man is preparing for another Christmas ...', 'UNRATED', 'Romania', 89);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('127 Hours', '2011-01-28 00:00:00.000', 'A climber ;es on a hike and becomes trapped.', 'R', 'English', 94);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('13', '2010-03-01 00:00:00.000', 'A naive young man assumes a dead ma''s identity and finds himself embroiled in an underground world of power, violence, and chance where men gamble behind closed doors on the lives of other men.', 'R', 'English', 91);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('13 Assassins', '2010-09-25 00:00:00.000', 'A group of assassins come together for a suicide mission to kill an evil lord.', 'R', 'Japanese', 141);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('13 ;ing on 30', '2004-04-23 00:00:00.000', 'A 13 year old girl plays a game on her 13th birthday and wakes up the next day as a 30 year old woman.', 'PG-13', 'English', 98);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('13 Hours in a Warehouse', '2008-10-28 00:00:00.000', 'As five underworld heavies settle in for an all night stay at an abandoned warehouse and former film studio, a series of bizarre and unsettling occurrences quickly lead them to believe they...', 'R', 'English', 92);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('13 Minutes', '2015-04-09 00:00:00.000', 'In November 1939, Georg Elser''s attempt to assassinate Adolf Hitler fails, and he is arrested. During his confinement, he recalls the events leading up to his plot and his reasons for deciding to take such drastic action.', 'R', 'Germa', 114);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('13 Sins', '2014-04-11 00:00:00.000', 'A cryptic phone call sets off a dangerous game of risks for Elliot, a down-on-his luck salesman. The game promises increasing rewards for completing 13 tasks, each more sinister than the last.', 'R', 'English', 93);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('13 Tzameti', '2006-02-08 00:00:00.000', 'Sebastian, a young man, has decided to follow instructions intended for someone else, without knowing where they will take him. Something else he does not know is that Gerard Dorez, a cop ...', 'NOT RATED', 'French', 93);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('13/13/13', '2013-10-01 00:00:00.000', 'For millennia, calendars have added an extra day every four years. In doing so, they violated the ancient Mayan calendar. Now we are in the 13th month of the 13th year of the new millennium...', 'NOT RATED', 'English', 86);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('13: Game of Death', '2006-10-05 00:00:00.000', 'Pusit is having the worst day of his life. He just lost his job and is in serious debt. That is all about to change when he receives a mysterious phone call with a tempting offer. If he ...', 'R', 'Thai', 114);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('14 Blades', '2014-08-22 00:00:00.000', 'A kung fu thriller set during the Ming Dynasty and centered on a secret service agent (Donnie Yen) in the emperor''s court who is betrayed and then hunted by his colleagues.', 'R', 'Mandari', 114);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('1408', '2007-06-22 00:00:00.000', 'A man who specializes in debunking paranormal occurrences checks into the fabled room 1408 in the Dolphin Hotel. Soon after settling in, he confronts genuine terror.', 'PG-13', 'English', 104);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('1492: Conquest of Paradise', '1992-10-09 00:00:00.000', 'Christopher Columbus'' discovery of the Americas and the effect this has on the indigenous people.', 'PG-13', 'English', 154);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('15 Minutes', '2001-03-09 00:00:00.000', 'A homicide detective and a fire marshall must stop a pair of murderers who commit videotaped crimes to become media darlings.', 'R', 'English', 120);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('16 Acres', '2012-11-16 00:00:00.000', 'The dramatic inside story of the monumental collision of interests at Ground Zero in the decade after 9/11.', 'NOT RATED', 'English', 95);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('16 Blocks', '2006-03-03 00:00:00.000', 'An aging alcoholic cop is assigned the task of escorting a witness from police custody to a courthouse 16 blocks away. There are, however, chaotic forces at work that prevent them from making it in one piece.', 'PG-13', 'English', 105);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('16 Wishes', '2010-06-25 00:00:00.000', 'A 16 year old girl prepares a list of 16 wishes for 8 years, hoping they will come true on her 16th birthday. A fairy comes to give her 16 candles that make the 16 wishes come true. Her ...', 'G', 'English', 90);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('16 Years of Alcohol', '2004-07-30 00:00:00.000', '16 years of alcohol is about a skinhead named Frankie; his violent childhood, alcoholism and his love for Ska.', 'R', 'English', 102);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('17 Agai', '2009-04-17 00:00:00.000', 'About a guy whose life did''t quite turn out how he wanted it to and wishes he could ; back to high school and change it. He wakes up one day and is seventeen again and gets the chance to rewrite his life.', 'PG-13', 'English', 102);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('17 Girls', '2012-09-21 00:00:00.000', 'When Camille accidentally becomes pregnant, 16 of her friends and classmates decide to follow suit, throwing their town and school into chaos.', 'NOT RATED', 'French', 86);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('1776', '1972-11-17 00:00:00.000', 'A musical retelling of the American Revolutio''s political struggle in the Continental Congress to declare independence.', 'PG', 'English', 141);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('1900', '1977-11-04 00:00:00.000', 'Set in Italy, the film follows the lives and interactions of two boys/men, one born a bastard of peasant stock (Depardieu), the other born to a land owner (de Niro). The drama spans from ...', 'R', 'Italia', 317);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('1911', '2011-09-23 00:00:00.000', 'A historical drama based on the founding of the Republic of China when nationalist forces led by Sun Yat-sen overthrew the Qing Dynasty.', 'R', 'Mandari', 121);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('1968 Tunnel Rats', '2009-03-13 00:00:00.000', 'During the Vietnam War [1959-1975] a special US combat unit is sent out to hunt and kill the Viet Cong soldiers in a man-to-man combat in the endless tunnels underneath the jungle of Vietnam. Suicide squads of a special kind.', 'R', 'English', 96);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('1969', '1988-11-18 00:00:00.000', 'Two friends, Ralph and Scott live in a small minded town at the onset of wide public dissatisfaction with the Vietnam war. While Scott''s brother enlists, he and Ralph are outspoken in their...', 'R', 'English', 95);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('2 Days in New York', '2012-03-28 00:00:00.000', 'Manhattan couple Marion and Mingus, who each have children from prior relationships, find their comfortable family dynamic jostled by a visit from Mario''s relatives.', 'R', 'English', 96);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('2 Days in Paris', '2007-08-31 00:00:00.000', 'Marion and Jack try to rekindle their relationship with a visit to Paris, home of Mario''s parents -- and several of her ex-boyfriends.', 'R', 'English', 96);
INSERT IGNORE INTO film (nom,date_sor,synopsis,classif,origine,duree) VALUES ('2 Days in the Valley', '1996-09-27 00:00:00.000', '48 hours of intersecting lives and crimes in Los Angeles.', 'R', 'English', 104);

/*insertion table employee*/
INSERT IGNORE INTO employee (nom,prenom,date_ent,date_sort,id_fonction,mat)
VALUES
  ("Pfeiffer","Gretchen","2014-08-26 15:24:46","2025-11-16 22:48:26",3,"VC6BP0G0"),
  ("Fink","Inez","2013-11-21 03:26:53","2024-08-06 22:22:12",3,"NR4ED4B8"),
  ("Jung","Christen","2012-06-30 18:43:29","2025-07-04 11:45:07",3,"FO8FI1I4"),
  ("Schmitt","Isadora","2014-04-16 13:09:04","2024-11-18 12:03:18",3,"UI2QK4X8"),
  ("Maier","Mira","2017-03-18 18:20:22","2024-03-27 23:04:17",2,"BW8YY1H1"),
  ("Wenzler","Nayda","2016-08-15 05:50:27","2024-06-26 20:08:00",3,"PY7ES3U9"),
  ("Köhler","Aaron","2019-01-08 04:08:47","2023-06-04 12:45:58",2,"WA8JQ1N6"),
  ("Bogner","Renee","2010-08-18 23:51:28","2024-10-21 07:29:11",4,"UI5ER5Y6"),
  ("Braun","Cole","2010-09-17 09:22:08","2025-08-18 02:48:11",2,"JZ8RC1T5"),
  ("Michaelis","Brandon","2017-09-16 20:09:12","2024-08-04 23:39:32",2,"ID4RH3W6");
INSERT IGNORE INTO employee (nom,prenom,date_ent,date_sort,id_fonction,mat)
VALUES
  ("Boger","Elaine","2013-08-20 12:27:31","2024-01-06 09:56:56",4,"AJ6SB2Y8"),
  ("Boger","Tanek","2012-08-04 03:16:33","2023-10-09 12:46:28",4,"ZS9QS3Y1"),
  ("Winkler","Brendan","2018-02-22 21:32:42","2024-06-09 10:51:53",3,"GT5HN3M9"),
  ("Winter","Brian","2010-02-04 07:16:56","2023-10-01 17:27:29",4,"RH3JQ1S9"),
  ("Brugger","Leila","2013-07-14 00:38:30","2023-05-28 15:47:07",3,"KJ5PC5R0"),
  ("Pfarrer","Halla","2011-05-26 22:22:23","2025-02-23 08:46:38",2,"OH3XC4Q6"),
  ("Brugger","Kaye","2010-06-17 22:03:16","2024-10-08 06:18:03",1,"MF9HN6E6"),
  ("Schäfer","Kylynn","2012-09-22 22:34:58","2023-05-06 18:24:47",3,"PQ1IF1I2"),
  ("Seidel","Kiara","2017-09-05 09:36:45","2025-02-09 19:26:40",3,"ZW5MI4X2"),
  ("Sauer","Freya","2016-02-21 07:26:20","2025-03-21 19:37:16",3,"SF2UB7V7");
INSERT IGNORE INTO employee (nom,prenom,date_ent,date_sort,id_fonction,mat)
VALUES
  ("Merkle","Castor","2012-11-04 13:24:53","2023-03-15 02:20:07",3,"LM3IP2S5"),
  ("Jansen","Ariel","2017-06-07 10:03:18","2024-10-16 15:30:10",3,"ML8BX7E8"),
  ("Pfeiffer","Lani","2010-08-11 07:12:01","2023-11-28 15:17:18",3,"NN2UQ3G1"),
  ("Sauer","Prescott","2019-09-21 04:54:34","2025-03-15 14:17:17",1,"DH9PD3O1"),
  ("Seidel","Desirae","2017-07-09 03:36:43","2023-04-09 00:13:56",2,"SP8VE9Y5"),
  ("Sauer","Tiger","2018-02-20 19:35:40","2025-06-01 05:35:44",3,"JB7UE1R7"),
  ("Wagner","Theodore","2019-12-05 13:21:56","2024-08-28 09:43:57",4,"ZB4BL5Y8"),
  ("Möller","Victoria","2009-11-23 00:45:12","2024-01-13 05:31:32",2,"XI9QX2Y2"),
  ("Scholz","April","2009-03-12 12:10:56","2025-05-21 02:27:14",2,"DC8YU1I7"),
  ("Specht","Olivia","2021-02-17 15:24:30","2025-12-31 06:02:28",2,"DW3GK8Q2");
INSERT IGNORE INTO employee (nom,prenom,date_ent,date_sort,id_fonction,mat)
VALUES
  ("Schulz","Ralph","2016-04-18 01:56:44","2024-12-25 09:45:38",3,"RE6II2H3"),
  ("Merkle","Kenyon","2016-03-01 23:04:22","2023-05-09 14:43:26",1,"QN1YI5V2"),
  ("Bäcker","Susan","2015-07-31 12:36:00","2024-01-16 21:55:55",2,"EG6OS4C6"),
  ("Schubert","Jemima","2019-04-09 00:40:50","2023-02-15 12:01:18",1,"JC5FD1D3"),
  ("Jung","Jaime","2019-09-25 08:28:29","2023-12-23 15:31:30",3,"YX3YW4H6"),
  ("Maler","Jessamine","2010-12-11 02:41:09","2025-04-10 14:08:14",1,"LR9QQ8W6"),
  ("Fink","Nathaniel","2011-11-18 13:01:47","2025-05-25 07:21:57",3,"YV7KS1Z0"),
  ("Beyer","Marcia","2019-10-27 09:20:15","2025-03-13 21:03:03",3,"RE8UD6U5"),
  ("Michaelis","Jemima","2017-08-31 08:25:42","2025-11-26 15:49:01",1,"TO1CQ6D0"),
  ("Wolff","Deborah","2011-04-06 06:03:30","2023-02-28 06:13:16",3,"SN7JH6R6");
INSERT IGNORE INTO employee (nom,prenom,date_ent,date_sort,id_fonction,mat)
VALUES
  ("Beyer","Jesse","2013-11-05 05:08:33","2025-06-23 00:26:06",2,"XR1BD1V9"),
  ("Schwarz","Josephine","2016-12-12 22:48:49","2024-05-04 18:27:38",2,"SK4HP4X6"),
  ("Fink","Andrew","2016-09-16 20:16:36","2024-12-16 19:04:12",3,"FJ5UW1K1"),
  ("Friedmann","Zelenia","2010-03-21 16:45:51","2023-07-03 15:22:58",2,"RZ4HH1P8"),
  ("Obermeyer","Henry","2018-01-29 15:35:33","2023-05-23 17:28:18",3,"XD3JV7Q2"),
  ("Bauer","Ayanna","2012-02-17 17:24:39","2025-07-24 12:11:42",2,"VI3JH6Q6"),
  ("Vogel","Ray","2017-02-25 21:46:02","2025-10-30 13:52:47",2,"GW8CU3W1"),
  ("Werner","Fritz","2009-06-12 01:18:53","2024-04-08 11:00:16",3,"PP0NV7B3"),
  ("Weber","Melodie","2015-08-27 01:44:54","2024-11-26 02:58:14",3,"RW4RC1Y6"),
  ("Neumann","Garth","2010-06-15 11:43:54","2026-01-20 09:50:28",3,"ZS3PB7W1");
INSERT IGNORE INTO employee (nom,prenom,date_ent,date_sort,id_fonction,mat)
VALUES
  ("Werner","James","2009-12-06 19:45:42","2023-06-18 15:33:42",4,"TE9CK0O0"),
  ("Schinacher","Aphrodite","2015-08-24 15:11:10","2023-10-31 16:21:19",3,"ME9TA3E4"),
  ("Krämer","Samuel","2018-08-10 17:28:19","2024-11-07 09:24:35",3,"HW5OD5Q3"),
  ("Strauß","Karen","2016-10-07 11:12:01","2023-03-01 12:08:34",2,"SN6RG6M7"),
  ("Schinacher","Octavia","2019-12-06 20:59:46","2025-01-24 00:58:32",2,"IP7UF3M5"),
  ("Werner","Galvin","2015-01-22 20:15:21","2025-12-29 19:59:03",1,"KW1KW4C8"),
  ("Lehmann","Haviva","2018-05-26 09:32:55","2025-10-14 10:41:57",2,"KU8SZ6N8"),
  ("Dreher","Julie","2020-08-02 09:20:05","2025-07-08 13:50:16",1,"YG1QP5P5"),
  ("Sauer","Dieter","2020-10-12 16:14:14","2024-05-24 19:21:15",1,"SS6PL0X8"),
  ("Koch","Kalia","2019-08-07 18:26:22","2024-08-02 18:15:47",1,"ZY5LQ4F5");
INSERT IGNORE INTO employee (nom,prenom,date_ent,date_sort,id_fonction,mat)
VALUES
  ("Ruf","Kylan","2015-03-21 18:17:06","2023-03-15 17:19:06",4,"EN5XD8G4"),
  ("Kienzle","Oprah","2017-12-14 06:44:18","2024-03-03 06:10:52",2,"CH3FI7N4"),
  ("Merkle","Maya","2018-08-02 21:43:25","2024-05-17 15:28:19",3,"AL4DU4Y7"),
  ("Martin","Wesley","2009-07-11 02:05:31","2024-06-20 00:16:16",4,"HP3WT5L4"),
  ("Kowalski","Mona","2014-10-21 16:26:25","2025-11-19 14:41:12",1,"FS6OG6H7"),
  ("Graf","Damon","2016-12-31 13:34:23","2023-06-13 07:23:50",4,"ZL9UG2J3"),
  ("Lehmann","Charles","2010-05-03 17:18:47","2023-01-30 22:45:37",1,"BF3CY5W6"),
  ("Roßmann","Serena","2010-07-28 22:11:51","2025-09-01 08:31:26",4,"UF7BE6W5"),
  ("Schinacher","Amery","2016-05-15 09:49:05","2024-03-21 07:08:03",2,"OO4HX3I8"),
  ("Möller","Inez","2013-11-02 12:30:24","2024-01-22 19:13:05",3,"HO4RU2E7");
INSERT IGNORE INTO employee (nom,prenom,date_ent,date_sort,id_fonction,mat)
VALUES
  ("Roßmann","Colette","2012-05-10 13:46:14","2023-10-31 00:48:16",4,"BT4MM3B9"),
  ("Pfeiffer","Kareem","2015-01-02 17:09:24","2023-08-11 09:03:21",1,"XL6XY8I7"),
  ("Brugger","Sylvester","2018-02-08 21:32:40","2025-11-26 15:23:06",3,"UQ6NI1G9"),
  ("Braun","Lucas","2019-12-19 19:11:37","2024-07-13 20:06:46",4,"HF4PD1J1"),
  ("Raab","Norman","2016-04-06 02:17:30","2023-07-26 07:43:17",1,"PD4XG8Y3"),
  ("Dittrich","Ayanna","2015-05-01 20:23:59","2025-06-27 05:42:51",2,"TT2HT2G8"),
  ("Fiedler","Ashton","2013-05-21 15:06:01","2025-03-11 18:40:08",4,"QI3LS5C5"),
  ("Pietsch","Channing","2012-07-27 01:43:47","2024-05-15 13:05:44",3,"AW8NV7V8"),
  ("Bäcker","Kerry","2010-04-11 05:01:59","2023-12-09 14:54:35",2,"MD9WI8U3"),
  ("Raab","Vaughan","2019-12-01 15:35:51","2025-09-02 12:06:17",3,"YR6GA7X1");
INSERT IGNORE INTO employee (nom,prenom,date_ent,date_sort,id_fonction,mat)
VALUES
  ("Schmitt","Hall","2011-08-13 13:12:50","2024-07-18 03:08:36",3,"HZ2OQ9S8"),
  ("Fink","Cyrus","2020-12-31 18:03:39","2025-12-05 18:43:33",1,"JT0AQ9B1"),
  ("Böhm","Ezekiel","2010-09-21 09:37:15","2025-04-09 05:11:01",3,"NJ4ZY2J3"),
  ("Schmid","Ferdinand","2020-01-31 04:50:40","2024-05-26 08:06:44",4,"OO3EV2R7"),
  ("Bachmann","Lucian","2018-06-01 02:26:41","2025-03-01 21:50:02",3,"DH9QV3W2"),
  ("Braun","Kasimir","2011-03-31 22:04:51","2024-08-22 20:08:11",4,"XQ7HQ0G7"),
  ("Frank","Rashad","2010-09-11 02:32:39","2024-04-13 15:12:13",4,"VS6VY7R1"),
  ("Dreher","Axel","2016-05-02 15:19:46","2023-06-19 14:52:36",1,"RN5OV1B7"),
  ("Perlmann","Dominic","2019-03-13 02:00:43","2024-02-18 05:36:48",4,"JD0IE1S1"),
  ("Richter","Slade","2019-03-12 02:20:32","2023-05-04 07:06:34",3,"IO3HX2S6");
INSERT IGNORE INTO employee (nom,prenom,date_ent,date_sort,id_fonction,mat)
VALUES
  ("Schumann","Libby","2018-12-02 22:29:01","2026-01-16 12:34:16",2,"TA3EC7I3"),
  ("Boger","Zeph","2015-07-08 21:37:44","2024-06-19 03:45:52",3,"BO2PA9N6"),
  ("Schmid","Rhonda","2017-11-18 06:48:02","2024-05-29 05:42:04",2,"QL6QN2Y4"),
  ("Schulz","Conan","2012-07-30 02:21:39","2023-02-13 07:08:51",1,"VQ7CO7J7"),
  ("Brugger","Inez","2014-09-07 17:54:45","2023-03-11 14:28:59",4,"EZ6JI4Q3"),
  ("Hausmann","Hilda","2020-11-10 15:06:41","2023-11-07 18:49:26",2,"JP3PO1U8"),
  ("Simon","Dillon","2009-08-28 20:21:18","2023-06-06 17:57:52",2,"KD4DK9H1"),
  ("Fiedler","Odysseus","2013-04-19 01:34:36","2024-04-26 08:43:52",2,"SO3AU2J4"),
  ("Jacobi","Oscar","2014-09-24 11:18:17","2025-06-25 09:32:24",4,"XU0OF1G2"),
  ("Weber","Baker","2012-05-05 14:36:52","2025-11-06 23:21:02",4,"HA2YL1K1");

/*Insertion Dans info_emp*/
INSERT IGNORE INTO info_emp (id_emp,adresse,cp,tel,mail,date_naiss,genre,secu)
VALUES
  (14,"P.O. Box 236, 8620 Dis Road","62421","0548177362","et.euismod@outlook.ch","1978-04-30 04:22:59",1,"5"),
  (91,"861-958 Ut Road","41596","0638352314","penatibus@protonmail.com","1989-08-26 01:12:34",4,"5"),
  (68,"1955 Purus, Av.","51505","0318737210","dui.lectus.rutrum@google.eu","1969-09-15 05:32:28",2,"7"),
  (96,"266-9177 Velit. Road","84227","0662678075","ipsum.curabitur@protonmail.eu","1968-06-22 15:17:55",2,"3"),
  (76,"Ap #860-3542 At Av.","68062","0379723862","sem.molestie.sodales@icloud.ch","1989-02-24 16:06:11",3,"6"),
  (91,"Ap #510-8632 Non Rd.","42456","0682446802","interdum.sed@outlook.com","1995-10-23 04:16:43",3,"3"),
  (78,"P.O. Box 239, 3642 Tempus Street","29771","0801779542","quis.accumsan@yahoo.ch","1966-01-19 22:34:59",3,"4"),
  (95,"Ap #401-9556 Augue Avenue","30368","0645663477","sapien.cursus.in@yahoo.ch","1971-09-02 01:02:56",3,"3"),
  (95,"3442 Eu St.","81047","0986278866","aliquam.vulputate@hotmail.ch","1973-01-18 15:22:44",2,"3"),
  (46,"9274 Duis St.","31853","0770844337","arcu.iaculis.enim@google.fr","1987-11-20 17:55:30",3,"7");
INSERT IGNORE INTO info_emp (id_emp,adresse,cp,tel,mail,date_naiss,genre,secu)
VALUES
  (33,"Ap #912-7836 Dictum Av.","02057","0676673802","massa@aol.fr","1967-03-11 15:57:37",2,"6"),
  (61,"Ap #863-3522 Elementum Road","86185","0173146562","fringilla.porttitor@aol.eu","1963-12-03 01:34:53",2,"1"),
  (95,"616-2672 Nisl. Rd.","61745","0363767530","per.inceptos@protonmail.eu","1970-02-26 06:29:32",2,"7"),
  (94,"P.O. Box 636, 2905 Aliquam St.","18502","0878481452","mauris.blandit@hotmail.eu","1967-01-28 10:35:22",4,"1"),
  (94,"Ap #410-2956 Hendrerit Avenue","40450","0484245365","diam.eu@icloud.com","2000-06-04 20:39:02",3,"2"),
  (87,"Ap #573-1256 Morbi Rd.","71151","0311356354","nunc.commodo@icloud.fr","1998-02-06 07:35:09",2,"8"),
  (37,"P.O. Box 460, 5657 Et St.","87299","0816187343","nibh.quisque@protonmail.eu","1976-02-06 15:58:13",2,"4"),
  (23,"P.O. Box 824, 8117 Auctor St.","43655","0695944471","eget.laoreet@aol.eu","1998-05-27 13:12:19",2,"8"),
  (73,"1970 Ante Avenue","67257","0845887595","interdum@hotmail.com","1999-03-18 21:52:12",2,"9"),
  (26,"390-3271 Erat Road","62506","0235906011","luctus.curabitur@protonmail.ch","1973-03-11 07:36:11",2,"1");
INSERT IGNORE INTO info_emp (id_emp,adresse,cp,tel,mail,date_naiss,genre,secu)
VALUES
  (16,"773-5038 Lobortis, Street","61821","0188914573","vulputate.posuere@icloud.ch","2000-10-15 07:56:33",3,"9"),
  (75,"498-5113 Rutrum Rd.","57242","0857773648","nec.orci@google.com","1987-02-24 16:28:28",3,"6"),
  (42,"185-3035 Diam St.","57546","0727866482","mi.aliquam@protonmail.eu","1987-08-11 06:20:30",3,"5"),
  (66,"655-9534 At Av.","43441","0833273874","sed.dolor@yahoo.com","1983-04-29 17:29:10",4,"1"),
  (53,"Ap #735-9318 Sed Ave","91534","0957784827","donec.elementum.lorem@protonmail.ch","1978-06-01 22:59:41",2,"3"),
  (20,"410-3955 Aenean Rd.","25438","0632865174","lectus@hotmail.fr","1986-09-24 22:52:08",2,"1"),
  (56,"P.O. Box 446, 9967 Etiam Street","71585","0847436275","est.nunc.ullamcorper@yahoo.ch","1993-09-30 08:17:49",4,"2"),
  (47,"P.O. Box 775, 6026 Velit St.","16128","0745466722","ac@hotmail.eu","1994-02-09 01:14:10",3,"0"),
  (68,"P.O. Box 897, 7793 Quis Av.","75607","0799257485","nunc.ut@outlook.fr","2000-12-17 06:15:30",3,"9"),
  (59,"837-6310 Penatibus Avenue","42624","0416681058","a.enim@protonmail.ch","1996-02-28 12:04:43",4,"1");

/*Insertion Abonne*/
INSERT IGNORE INTO abonne (nom,prenom,date_ins,premium,num_carte)
VALUES
  ("Kennedy Oneal","Dora Ballard","Oct 25, 2018","0","U151385J65W39"),
  ("Justina Walls","Lane Gaines","Jan 21, 2018","0","Y797871N64V33"),
  ("Lisandra Morton","David Logan","Nov 4, 2019","0","R864730S76X18"),
  ("August Faulkner","Nadine Wallace","Jan 16, 2020","0","S218186S45K68"),
  ("Lamar Riddle","Illiana Dunn","Apr 18, 2017","0","Q692581P29N92"),
  ("Uriah Stokes","Colette Nguyen","Aug 15, 2017","1","X164458G39V52"),
  ("Jarrod Leon","Alan Sykes","Nov 28, 2019","1","H773075X74Y58"),
  ("Amos Mills","Basil Branch","May 22, 2019","1","G871053A78D61"),
  ("Akeem Stuart","Francesca Chase","Dec 15, 2017","1","D319645C25K27"),
  ("Donna Shelton","Madaline Anthony","Aug 17, 2019","0","V782334F87K02");
INSERT IGNORE INTO abonne (nom,prenom,date_ins,premium,num_carte)
VALUES
  ("Anthony Dean","Carlos Cunningham","Dec 13, 2017","1","T742203B75P30"),
  ("Nehru Bryant","Amos Roberson","Dec 15, 2018","1","U433651F37C76"),
  ("Cruz Meadows","Nero Sutton","May 18, 2018","1","M536376W72J44"),
  ("Cynthia Bell","Macy Carver","Dec 14, 2019","1","Z060064C22I57"),
  ("Callum Middleton","Curran Fischer","Oct 5, 2018","0","C972747S57P25"),
  ("Dean Holcomb","Lane Jenkins","Dec 15, 2018","1","L629785H31P23"),
  ("Carla Stuart","Beverly Riddle","Feb 6, 2019","0","B882385O81U64"),
  ("Caryn Nieves","Mufutau Cervantes","Dec 25, 2019","0","V829177F17P13"),
  ("Nehru Whitehead","Dara Lamb","Jan 23, 2018","1","Q235868V84M15"),
  ("Aileen Bass","Cara Brown","Apr 29, 2017","0","F457754K57Q80");
INSERT IGNORE INTO abonne (nom,prenom,date_ins,premium,num_carte)
VALUES
  ("Halee Gilbert","Kyle Gilliam","Aug 10, 2018","0","X573328H94S52"),
  ("Karleigh Wilkinson","Britanney Mcintosh","Feb 21, 2018","1","W294266J69X81"),
  ("Oscar Baker","Mufutau Gonzales","Aug 18, 2017","0","I597865X48R55"),
  ("Calvin Floyd","Quon Skinner","Jan 21, 2018","0","T783609C77B62"),
  ("Martin Bass","Fay Meadows","Nov 9, 2019","0","D755323K45Z55"),
  ("Rafael Alford","Caleb Craig","Jul 20, 2019","1","P268588Q16T47"),
  ("Jeremy Calderon","Justin Farmer","Jun 21, 2019","1","V461853B18J45"),
  ("Giacomo Hebert","Evelyn Pena","Feb 13, 2017","1","Q824785C14G45"),
  ("Wang Cabrera","Hadassah House","Nov 25, 2019","1","A750654Q59F96"),
  ("Farrah Burnett","Branden Ware","Dec 22, 2018","0","X876263I92U59");
INSERT IGNORE INTO abonne (nom,prenom,date_ins,premium,num_carte)
VALUES
  ("Latifah White","Ivy Little","Nov 3, 2019","1","D096785R65U62"),
  ("Sydney Crawford","Kellie Johnston","Mar 11, 2018","1","B323273I02I68"),
  ("Rhea Dunn","Gloria Dunn","Jan 7, 2020","1","L246941E49K82"),
  ("Nita Leonard","Chester Albert","Feb 2, 2019","1","J612471R65B67"),
  ("Caleb Raymond","Rashad Noel","Jan 26, 2017","0","V666873R38F77"),
  ("Jacob Dillard","Lucius Huffman","Aug 29, 2019","1","Y527096Q25T69"),
  ("Oren Pruitt","Lillian Rocha","Jun 14, 2018","0","S517363M44U14"),
  ("Chastity Smith","Cally Rodriquez","Jan 27, 2017","1","U765818Q28D15"),
  ("Natalie Mayo","Stephanie Carr","Apr 27, 2017","0","U795257D50I18"),
  ("Rhiannon Dotson","Jorden Franks","Aug 16, 2017","0","I831182R46F53");
INSERT IGNORE INTO abonne (nom,prenom,date_ins,premium,num_carte)
VALUES
  ("Kibo Kidd","Astra Donaldson","Aug 10, 2017","1","V879786E75W24"),
  ("Quinn Head","Hanna Wells","Jul 31, 2018","1","X544086B01U11");

/*Insertion info abo*/
INSERT IGNORE INTO infos_abo (id_emp,adresse,cp,tel,mail,date_naiss,genre)
VALUES
  (63,"920 Nam St.","26931","0841326212","orci@yahoo.ch","1998-01-04 13:39:49",4),
  (45,"Ap #496-1115 Fringilla Rd.","82377","0617233976","mauris@google.eu","1986-12-07 10:08:22",2),
  (46,"9445 Viverra. Avenue","98643","0744558932","libero@hotmail.ch","1997-10-17 12:33:25",3),
  (23,"Ap #777-810 Lectus Avenue","81460","0298057373","magna@outlook.fr","1996-10-26 22:22:07",3),
  (19,"3497 Nunc St.","28381","0720213218","sed.eu@icloud.eu","1997-01-19 18:07:38",3),
  (70,"274-5275 Non Road","53091","0145851399","volutpat.nunc@hotmail.eu","1985-11-30 14:14:27",4),
  (21,"955 Varius Ave","04293","0207588325","pretium.aliquet@yahoo.ch","1989-09-22 11:39:34",1),
  (29,"P.O. Box 217, 8806 Elit, Street","70322","0317727833","dictum@outlook.fr","2000-04-14 04:28:46",2),
  (98,"Ap #631-2498 Tellus. Rd.","72766","0474553201","duis.sit.amet@outlook.ch","1983-06-30 18:29:06",3),
  (14,"156-5850 Non Road","04434","0377610883","nascetur@aol.eu","1999-07-21 09:36:40",4);
INSERT IGNORE INTO infos_abo (id_emp,adresse,cp,tel,mail,date_naiss,genre)
VALUES
  (48,"Ap #394-7726 Nisi St.","55081","0444533701","eu.dolor.egestas@outlook.ch","1995-08-10 02:24:46",3),
  (15,"638-5286 Elit. Road","72658","0725002766","phasellus.ornare@outlook.com","1986-09-25 10:01:13",4),
  (27,"P.O. Box 260, 603 Nec Av.","43638","0877621873","feugiat@protonmail.fr","1989-03-06 13:34:54",1),
  (37,"Ap #973-9151 Sodales Rd.","93281","0842708572","mollis.phasellus@icloud.eu","1989-05-22 14:18:34",4),
  (99,"P.O. Box 520, 2326 Ipsum Street","85915","0482536924","enim.nec@yahoo.fr","1983-06-07 07:42:54",2),
  (70,"2804 Dui. St.","24347","0418335063","tempor.lorem@hotmail.com","1998-08-30 20:13:45",3),
  (15,"Ap #364-6134 Felis, Av.","28768","0885271675","ipsum.nunc@icloud.com","1991-12-02 14:35:26",4),
  (84,"Ap #108-8146 Sed Ave","24596","0232884808","in.aliquet@yahoo.eu","1995-05-22 17:11:28",3),
  (72,"Ap #635-8287 Enim, Rd.","78825","0230587362","enim.nec@protonmail.com","1992-09-15 23:04:31",3),
  (25,"245-2549 Eu St.","15951","0847204974","eleifend@yahoo.com","1999-04-25 12:50:34",3);
INSERT IGNORE INTO infos_abo (id_emp,adresse,cp,tel,mail,date_naiss,genre)
VALUES
  (36,"P.O. Box 155, 6193 Hendrerit Avenue","77514","0525488177","augue@aol.ch","1997-04-26 02:53:28",1),
  (83,"P.O. Box 339, 3773 Auctor St.","31699","0138535611","enim.condimentum@google.com","1994-06-21 03:33:45",1),
  (23,"3420 Cras Av.","68231","0542522018","eu@protonmail.com","1996-10-25 14:29:28",4),
  (28,"485-4172 Quam. Rd.","10561","0246468818","orci.donec@protonmail.fr","1991-03-22 18:49:17",2),
  (51,"P.O. Box 785, 343 Mauris Av.","78418","0287216684","ac@hotmail.fr","1992-04-11 16:41:53",1),
  (53,"337-7574 Maecenas St.","70232","0121820107","nisi.mauris.nulla@google.com","1991-06-17 04:09:38",3),
  (33,"741-6888 Mattis. Ave","57767","0835852458","eu.nulla.at@hotmail.fr","1991-01-02 06:31:42",3),
  (55,"4517 Nam Road","21585","0252185566","penatibus@google.com","1985-12-08 21:53:01",4),
  (65,"984-7224 Netus Road","02243","0911375232","tellus.aenean@protonmail.com","1983-01-25 13:40:46",3),
  (81,"882-4490 Sagittis Street","63043","0104913333","ut.nec@hotmail.eu","1998-05-29 15:45:31",4);
INSERT IGNORE INTO infos_abo (id_emp,adresse,cp,tel,mail,date_naiss,genre)
VALUES
  (55,"302-2933 Mattis Rd.","45964","0225289108","dolor.donec@yahoo.com","1996-09-24 15:29:45",2),
  (81,"725-7550 Bibendum St.","24853","0612556422","enim@yahoo.com","1995-11-15 22:35:51",2),
  (64,"P.O. Box 742, 1776 Parturient Rd.","97725","0472882460","ut.semper@icloud.fr","1993-10-28 22:48:23",1),
  (50,"360-3479 Mattis. Av.","63766","0558371579","mollis@aol.eu","1990-11-21 11:41:18",3),
  (13,"P.O. Box 370, 485 Tristique St.","47823","0977224464","tempus@google.ch","1988-03-23 23:25:39",4),
  (57,"P.O. Box 441, 2267 Cras St.","67167","0239652067","fermentum@yahoo.eu","1990-08-29 14:54:06",3),
  (31,"Ap #686-6481 Et St.","42428","0556855832","ipsum.porta@google.fr","1999-04-15 08:44:17",3),
  (41,"906-4745 Euismod Av.","57889","0447928839","placerat.eget@outlook.fr","1992-04-21 21:40:04",3),
  (49,"905-8590 Faucibus Avenue","59584","0309987973","eu@yahoo.ch","1990-12-22 22:40:46",2),
  (77,"6124 Suspendisse Street","28906","0652646609","quis@icloud.eu","1983-03-26 12:20:36",2);
INSERT IGNORE INTO infos_abo (id_emp,adresse,cp,tel,mail,date_naiss,genre)
VALUES
  (15,"P.O. Box 441, 4285 Vel, Rd.","51744","0383089286","in@aol.ch","1998-08-08 02:37:28",4),
  (52,"Ap #227-545 Ornare. St.","11191","0558736862","dictum.proin@outlook.ch","1987-02-01 07:55:46",3),
  (58,"616-1356 Sit Avenue","75720","0445495453","amet.consectetuer.adipiscing@google.ch","1986-10-09 00:25:02",1),
  (43,"Ap #642-6174 Consectetuer St.","42646","0388860919","integer.urna.vivamus@outlook.fr","1990-09-02 12:10:49",3),
  (73,"Ap #213-4156 Sed Ave","15020","0445757752","cursus@protonmail.fr","1987-05-01 21:53:32",4),
  (33,"Ap #898-2072 At St.","61584","0253685534","et.ipsum@yahoo.ch","1994-11-28 13:50:35",4),
  (45,"Ap #751-5637 Luctus Av.","15480","0546828699","vulputate.nisi@protonmail.eu","1986-04-11 13:48:07",3),
  (22,"734-5802 Dolor, Avenue","67598","0272436895","sociis.natoque.penatibus@google.com","1998-02-11 09:34:07",3),
  (75,"Ap #316-3678 Imperdiet Rd.","11190","0545073836","neque.sed@yahoo.eu","1997-02-14 17:11:04",2),
  (46,"Ap #594-9064 Posuere Rd.","75899","0371240131","suspendisse@google.ch","1992-01-11 09:37:10",2);
INSERT IGNORE INTO infos_abo (id_emp,adresse,cp,tel,mail,date_naiss,genre)
VALUES
  (27,"4627 Non Av.","87733","0336236251","donec.sollicitudin.adipiscing@outlook.ch","1985-12-08 08:29:40",3),
  (84,"601-4737 Maecenas Street","44633","0924837478","imperdiet.ullamcorper@aol.com","1986-05-08 20:18:17",4),
  (72,"228-8225 Orci St.","63177","0470755721","commodo.tincidunt.nibh@outlook.ch","1998-04-13 13:24:51",2),
  (87,"967-8295 Aenean Av.","13746","0582839029","amet.ornare@aol.fr","1996-03-09 02:19:33",2),
  (87,"229-6883 Nunc Av.","25366","0918150166","vivamus.nisi@hotmail.com","1995-01-18 13:49:39",1),
  (70,"303-2027 Aliquet St.","15291","0760271846","tincidunt.nunc@outlook.eu","1990-08-27 06:23:04",4),
  (60,"P.O. Box 887, 419 Augue Rd.","32570","0455522157","tellus@icloud.eu","1996-09-03 22:47:18",2),
  (68,"7192 Arcu. Street","85141","0751017927","eget.mollis@hotmail.fr","1984-08-14 17:16:39",2),
  (41,"Ap #478-2666 Nisl. Ave","12680","0497570809","dictum.eleifend.nunc@yahoo.fr","1994-01-18 09:25:37",4),
  (68,"454-1908 Eu Avenue","23746","0567324951","molestie.tellus.aenean@yahoo.fr","1990-06-04 06:20:36",4);
INSERT IGNORE INTO infos_abo (id_emp,adresse,cp,tel,mail,date_naiss,genre)
VALUES
  (56,"7048 Lobortis Av.","38939","0627550614","nunc.quisque@google.com","1987-03-01 22:44:41",1),
  (92,"138-9198 Lacinia. St.","44930","0669853421","vivamus.rhoncus.donec@aol.fr","1988-05-28 01:41:20",2),
  (49,"5116 Purus. St.","94844","0333560076","blandit@outlook.com","1985-10-21 02:56:01",4),
  (95,"390-9380 Sed Road","61135","0442495977","quis.pede@google.eu","1988-11-05 09:24:40",3),
  (86,"Ap #834-247 Nam Avenue","17245","0641228532","lacus.etiam.bibendum@icloud.com","1996-01-20 10:49:59",2),
  (85,"8358 A, Road","65988","0174127825","turpis.vitae@protonmail.com","1999-11-16 12:54:31",3),
  (94,"275-5252 At St.","65862","0258561083","sagittis.semper@yahoo.eu","1984-04-16 07:29:35",3),
  (76,"Ap #959-1287 Facilisis Road","63308","0749238183","ac.risus@hotmail.com","2000-01-15 03:32:09",2),
  (25,"597-1895 Amet St.","16637","0958484618","ut.eros@icloud.fr","1992-04-18 08:19:36",2),
  (43,"221-723 Mauris Avenue","48931","0551332975","est.mollis@aol.com","1991-01-28 12:52:40",1);
INSERT IGNORE INTO infos_abo (id_emp,adresse,cp,tel,mail,date_naiss,genre)
VALUES
  (69,"5371 Eu, Ave","43617","0840653254","sem@protonmail.com","1996-03-25 18:08:33",4),
  (95,"P.O. Box 129, 3168 Donec Av.","04246","0376445226","libero.nec@aol.com","1997-03-17 06:26:23",2),
  (15,"P.O. Box 598, 1821 Scelerisque Ave","89108","0808814717","aenean@hotmail.com","1990-09-21 13:39:37",4),
  (88,"359-5036 Vitae, Rd.","47574","0367853014","nonummy.fusce.fermentum@yahoo.com","1997-06-05 19:41:23",4),
  (17,"325-276 Metus Avenue","96333","0555367860","porta@outlook.eu","1995-02-15 13:08:29",2),
  (91,"Ap #416-8122 Leo. Av.","03256","0577778313","donec.at@outlook.com","1991-08-01 05:11:01",1),
  (76,"Ap #789-6477 Enim Av.","65116","0470237270","vel.convallis.in@outlook.ch","1999-12-25 15:47:03",1),
  (98,"5391 A, Rd.","17572","0684519701","sapien@outlook.fr","2001-01-23 10:10:09",2),
  (89,"Ap #867-2574 Montes, Av.","58266","0874038755","turpis.egestas.aliquam@aol.eu","1989-01-18 06:10:29",2),
  (33,"P.O. Box 948, 4681 Lorem. Av.","27314","0336331461","pede.ultrices@yahoo.ch","1983-03-03 13:37:01",1);
INSERT IGNORE INTO infos_abo (id_emp,adresse,cp,tel,mail,date_naiss,genre)
VALUES
  (77,"489-5865 Vitae Avenue","44231","0339674556","gravida.nunc@outlook.com","1992-12-24 17:47:10",4),
  (89,"716-4876 Quis, Ave","20644","0228007626","dolor@google.com","2000-08-02 17:55:32",2),
  (26,"Ap #620-9001 Ut St.","14512","0731776190","malesuada.id@protonmail.ch","1993-05-03 15:13:35",2),
  (46,"Ap #404-110 Proin Ave","76525","0757320664","semper.cursus@aol.fr","1997-05-27 00:38:08",4),
  (91,"Ap #810-4098 Ut Rd.","73461","0617664766","laoreet.lectus@protonmail.fr","1987-03-03 23:16:16",2),
  (75,"576-8428 Convallis Rd.","09446","0931523272","consectetuer.adipiscing.elit@icloud.ch","1987-11-22 23:10:33",3),
  (22,"P.O. Box 145, 8119 Mattis. Avenue","33354","0883023721","proin.ultrices.duis@icloud.fr","2000-12-24 17:51:08",3),
  (32,"P.O. Box 906, 5037 Ac St.","16425","0404597246","felis.eget@aol.eu","1994-06-05 17:35:43",4),
  (13,"3920 Pharetra Rd.","87505","0195721855","sem@aol.eu","1995-08-26 05:56:08",2),
  (39,"840-3920 Amet Av.","13436","0637546853","magna.malesuada@outlook.ch","1994-11-16 19:00:19",3);
INSERT IGNORE INTO infos_abo (id_emp,adresse,cp,tel,mail,date_naiss,genre)
VALUES
  (92,"P.O. Box 803, 5480 Nibh Street","87411","0591511340","condimentum.eget@google.fr","1996-04-23 10:02:37",3),
  (66,"729-3747 Quisque St.","11536","0511296768","fusce.diam@hotmail.fr","1997-06-20 14:38:47",4),
  (15,"Ap #444-2388 Donec St.","42749","0425754143","mollis.duis@protonmail.eu","2000-04-02 02:16:04",3),
  (82,"P.O. Box 916, 5539 Non, Ave","52197","0795976388","libero.donec.consectetuer@yahoo.ch","1994-10-13 09:35:52",3),
  (63,"P.O. Box 180, 4692 Placerat Avenue","87414","0937978511","enim.condimentum@protonmail.fr","1989-09-08 09:52:17",3),
  (50,"1569 Quisque Av.","33127","0411692671","suspendisse.non@hotmail.ch","1990-11-22 21:41:29",4),
  (80,"862-7005 Purus Ave","15872","0418626586","ac@google.com","1987-02-21 10:23:45",3),
  (59,"P.O. Box 282, 1860 Ac Rd.","86636","0724833831","aenean.sed.pede@outlook.ch","1994-08-14 16:30:22",2),
  (60,"Ap #524-4737 Vehicula Av.","85881","0749946750","dictum.eleifend@aol.fr","1989-12-17 16:51:37",3),
  (59,"Ap #739-4522 Tellus St.","20552","0305489318","arcu.aliquam@google.fr","1990-08-17 20:27:45",1);