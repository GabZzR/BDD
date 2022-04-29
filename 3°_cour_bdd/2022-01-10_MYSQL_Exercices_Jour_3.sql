/*Matin*/

/*Nous Allons inserer deux nouvelles personnes dnas la table pers*/
#Eloi & Gabriele
INSERT INTO pers(DATE_CREAT,DATE_NAISS,ID,ID_MANAGER,MAT,NOM,PRENOM,SEXE,ID_POSTE)
	VALUES	( NOW(),"1987-02-03",710029,0,700,"Capocelli","Gabriele",1,225),
			( NOW(),"1992-12-01",710030,0,701,"Du Crest","Eloi",1,225);


/*
Pour ENlever le "safe mode"
SET SQL_SAFE_UPDATES=0;
Pour remettre le "safe_mode"
SET SQL_SAFE_UPDATES=1;
*/
/*Mettons a jour les Dates d'entrees a + Jr*/
UPDATE pers
	SET DATE_ENT = DATE_ADD(NOW(), INTERVAL 4 DAY)
    WHERE MAT IN (701,700); /*Attention au SAFE_MODE*/
#OU
UPDATE pers
	SET DATE_ENT = DATE_ADD(NOW(), INTERVAL 4 DAY)
    WHERE ID IN (710030,710029);/*Pas de SAFE_MODE*/

/*Nous allons supprimer la ligne contenant Eloi*/
DELETE FROM pers
WHERE PRENOM LIKE "%Eloi%";
/*Allons verifier*/	
SELECT * FROM PERS;

/*NOus allons supprimer les personnes qui ont moins de 27ans*/
DELETE FROM pers
WHERE TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) < 27;

/*Apres Midi*/


 # 1 compter les personnes en fonction des poste et les grouper par genre;
 SELECT
	POSTE.DES as Poste, # Nom du poste dans la table poste
    CASE
			WHEN sexe = 1 then 'Homme'
			WHEN sexe = 2 then 'Femme'
			ELSE 'Autre'
		END as Genre,
        COUNT(*) as Nbr
FROM PERS
	INNER JOIN POSTE ON POSTE.ID_POST = PERS.ID_POSTE #jointure sur id_post & id_poste
GROUP BY POSTE.DES,(CASE
			WHEN sexe = 1 then 'Homme'
			WHEN sexe = 2 then 'Femme'
			ELSE 'Autre'
		END);
	
#2 compter les personnes en fonction de leur service et les grouper par genre;
    SELECT 
    SERVICE.DES as Service, # Nom du poste dans la table poste
    CASE
			WHEN sexe = 1 then 'Homme'
			WHEN sexe = 2 then 'Femme'
			ELSE 'Autre'
		END as Genre,
        COUNT(*) as Nbr
    FROM PERS
	INNER JOIN POSTE ON POSTE.ID_POST = PERS.ID_POSTE #jointure sur id_post & id_poste
    INNER JOIN SERVICE ON SERVICE.ID_SERVICE = POSTE.ID_SERVICE
    GROUP BY SERVICE.DES,(CASE
			WHEN sexe = 1 then 'Homme'
			WHEN sexe = 2 then 'Femme'
			ELSE 'Autre'
		END);

#3 compter le nombre de personne par service
    SELECT 
		SERVICE.DES AS 'Service',
		COUNT(*) AS 'NBR'
    FROM PERS
	INNER JOIN POSTE ON POSTE.ID_POST = PERS.ID_POSTE #jointure sur id_post & id_poste
    INNER JOIN SERVICE ON SERVICE.ID_SERVICE = POSTE.ID_SERVICE
    GROUP BY SERVICE.DES;
    
# 4 compter le nombre de personne par poste
	SELECT 
		POSTE.DES AS 'Poste',
		COUNT(*) AS 'NBR'
    FROM PERS
	INNER JOIN POSTE ON POSTE.ID_POST = PERS.ID_POSTE #jointure sur id_post & id_poste
    GROUP BY POSTE.DES;

# 5 Afficher par colonne le nombre de personnes par poste
/*Methode 1*/
SELECT
	Poste.des,
	COUNT(IF(sexe=2,sexe,NULL))AS 'Femme',
	COUNT(IF(sexe=1,sexe,NULL))AS 'Homme'
FROM pers
	INNER JOIN POSTE on POSTE.ID_POST=PERS.ID_POSTE
GROUP BY poste.des;

/*Methode 2*/
SELECT
	Poste.des,
	COUNT(CASE WHEN sexe=1 THEN sexe ELSE NULL END)AS "Femme",
	COUNT(CASE WHEN sexe=2 THEN sexe ELSE NULL END)AS "Homme"
FROM pers
	INNER JOIN POSTE on POSTE.ID_POST=PERS.ID_POSTE
GROUP BY poste.des;


/**INSERT(str,pos,len,newstr)**/

/*Tenter de creer une fonction de pseudonymisation
--POUR les noms et les prenoms , nous allons tenter de remplacer ( la 3eme lettre et la derniere)
--Par la lettre X
--ET si le nom et le prenom sont inferieur ou egal a 3 lettre , je remplace uniquement la premiere et la derniere lettre
--EX : TIPPING -> TIXPINX
--EX : LOY -> XOX
--EX : BU -> XX
--Fonction pour recuperer la longueur d'une chaine LENGTH()
--Fonction pour remplacer une lettre a une position donnée SUBSTRING(3 arguments) , INSERT(4 arguments)
--SUBSTRING(Expression,position,longueur)
--INSERT(Expression,position,longueur,Substitution)
*/
/*Exemple*/
SELECT 
NOM,
      INSERT( INSERT(NOM,LENGTH(NOM),1,'X') ,3,1,'X') as Essai
FROM PERS;

/*prototypage*/
SELECT 
	NOM,
	CASE	
		WHEN LENGTH(NOM)<=3 THEN INSERT( INSERT(NOM,LENGTH(NOM),1,'X') ,1,1,'X')
		ELSE INSERT( INSERT(NOM,LENGTH(NOM),1,'X') ,3,1,'X')
	END as Pseudonimi
FROM PERS;

/*CHanger l'avant derniere lettre par un Y*/
SELECT 
	NOM,
	INSERT(NOM, LENGTH(NOM)-1 , 1 ,'Y') as '1',
	INSERT( INSERT(NOM,LENGTH(NOM)-1,1,'y') ,3,1,'y') as '2'
FROM PERS;


/*Je souhaite afficher par tranches d'ages le nombre d'hommes et de femmes , je veux afficher par ligne , puis par colonne*/


/*Affichage Ligne*/
SELECT
CASE WHEN sexe=1 THEN 'Homme' ELSE 'Femme' END as 'Sexe',
	CASE
		WHEN  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) >= 0 AND  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) <30 THEN '10-30'
		WHEN  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) >= 30 AND  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) <60 THEN '30-60'
		WHEN  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) >= 60 AND  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) <90 THEN '60-90'
		ELSE '90 +'
	END AS "tranche",
	COUNT(*) as 'Nb'
FROM PERS
GROUP BY (CASE WHEN sexe=1 THEN 'Homme' ELSE 'Femme' END ),(CASE
		WHEN  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) >= 0 AND  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) <30 THEN '10-30'
		WHEN  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) >= 30 AND  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) <60 THEN '30-60'
		WHEN  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) >= 60 AND  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) <90 THEN '60-90'
		ELSE '90 +'
	END );

/*Affichage colonne*/
SELECT 
	CASE WHEN sexe=1 THEN 'Homme' ELSE 'Femme' END as 'Sexe',
	COUNT(CASE WHEN TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) >= 0 AND  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) <30 THEN Sexe ELSE NULL END) AS '10-30',
    COUNT(CASE WHEN TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) >= 30 AND  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) <60 THEN Sexe ELSE NULL END) AS '30-60',
    COUNT(CASE WHEN TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) >= 60 AND  TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) <90 THEN Sexe ELSE NULL END) AS '60-90',
    COUNT(CASE WHEN TIMESTAMPDIFF(YEAR,DATE_NAISS,NOW()) >= 90 THEN Sexe ELSE NULL END) AS '90+'
FROM PERS
GROUP BY (CASE WHEN sexe=1 THEN 'Homme' ELSE 'Femme' END );