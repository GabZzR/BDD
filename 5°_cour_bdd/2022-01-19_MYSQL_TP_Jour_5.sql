/*
 Source Server         : Monsql
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : store

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 19/01/2022 08:17:52
*/

DROP DATABASE IF EXISTS STORE;
CREATE DATABASE STORE;
USE STORE;

SET default_storage_engine=InnoDB;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `Id_categorie` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Categorie` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Description` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Couleur` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`Id_categorie`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('ACC', 'Accessoires', 'Sacs, cassettes, livres', 'Bleu');
INSERT INTO `categories` VALUES ('LOG', 'logiciels', NULL, 'Vert');
INSERT INTO `categories` VALUES ('MAT', 'materiel', 'ff', 'Jaune');
INSERT INTO `categories` VALUES ('PHO', 'Photo', 'Appareils photo et jumelles', 'Bleu');
INSERT INTO `categories` VALUES ('SON', 'Son', 'Radio-cassettes et baladeurs', 'Vert');
INSERT INTO `categories` VALUES ('TEL', 'Téléphonie', 'Sans fil, répondeurs, fax', 'Rouge');
INSERT INTO `categories` VALUES ('VID', 'Vidéo', 'Caméscopes, manuels et magnétoscopes', 'Rouge');

-- ----------------------------
-- Table structure for clients
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients`  (
  `Id_client` int(11) NOT NULL,
  `Titre` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Nom` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Prenom` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Adresse` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Code_Postal` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Ville` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Pays` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Remise` int(11) NULL DEFAULT 0,
  `Date_contact` datetime(6) NULL DEFAULT NULL,
  `Tel1` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mail` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `Bon_payeur` tinyint(1) NULL DEFAULT 0,
  `Commentaire` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `Date_naissance` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_client`) USING BTREE,
  INDEX `FK_PAYS_CLIENTS`(`Pays`) USING BTREE,
  CONSTRAINT `FK_PAYS_CLIENTS` FOREIGN KEY (`Pays`) REFERENCES `pays` (`Id_pays`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clients
-- ----------------------------
INSERT INTO `clients` VALUES (1, 'Mme', 'DUCHOU', 'Léo', 'rue des plumes', '74500', 'GRUFFY', 'MLI', 10, NULL, '04.50.45.29.', '', 1, 'ceci est un test fds fsdq', '1998-03-09 00:00:00.000000');
INSERT INTO `clients` VALUES (2, 'Mme', 'ARMAND', 'Zoé', '5 rue des Fleurs', '66700', 'ARGELES SUR MER', 'FRA', 25, '1997-05-06 00:00:00.000000', '04.50 67 97 ', '', 0, 'Cliente contactée grâce à M. Rimatel de Nantes', '1975-01-01 00:00:00.000000');
INSERT INTO `clients` VALUES (3, 'M.', 'ARMEL', 'Paul', '2 rue des Étoiles', '44000', 'NANTES', 'FRA', 20, '1997-04-21 00:00:00.000000', '04.50.45.95.', '', 1, '', '1994-03-10 00:00:00.000000');
INSERT INTO `clients` VALUES (4, 'Mlle', 'BARO', '', '7 rue Ernest Renan', '79000', 'NIORT', 'FRA', 0, '1997-06-03 00:00:00.000000', '04.50.52.62.', '', 1, 'Une seule commande a été enregistrée pour ce client', '1994-03-22 00:00:00.000000');
INSERT INTO `clients` VALUES (5, 'Mme', 'BAUDU', '', '2 Place St Paul', '35100', 'RENNES', 'FRA', 20, '1997-06-22 00:00:00.000000', '04.50.52.27.', '', 1, '', '1994-04-08 00:00:00.000000');
INSERT INTO `clients` VALUES (6, 'M.', 'BERNARD', '', '14 rue du Calvaire', '72000', 'LE MANS', 'FRA', 30, '1997-04-06 00:00:00.000000', '04.50.01.53.', '', 1, '', '1994-04-19 00:00:00.000000');
INSERT INTO `clients` VALUES (7, 'M.', 'BOUVRON', '', '18 Place Rimbaud', '44000', 'NANTES', 'FRA', 20, '1999-06-22 00:00:00.000000', '', '', 1, '', '1994-04-19 00:00:00.000000');
INSERT INTO `clients` VALUES (8, 'M.', 'BOUVRON', '', '18 Place Rimbaud', '44000', 'NANTES', 'FRA', 30, '1997-06-22 00:00:00.000000', '04.50 69 17 ', '', 1, '', '1975-01-01 00:00:00.000000');
INSERT INTO `clients` VALUES (9, 'M.', 'CARDIN', '', '2 rue des Merisiers', '33120', 'ARCACHON', 'FRA', 10, '1997-05-13 00:00:00.000000', '04.49.87 47 ', '', 0, '', '1994-05-02 00:00:00.000000');
INSERT INTO `clients` VALUES (10, 'Mme', 'CHAUME', '', '10 rue du Bon Pasteur', '66000', 'PERPIGNAN', 'FRA', 20, '1997-04-15 00:00:00.000000', '04.90.87.33.', '', 0, '', '1994-05-02 00:00:00.000000');
INSERT INTO `clients` VALUES (11, 'M.', 'CHAMBORD', '', '72 rue de la Marne', '72000', 'LE MANS', 'FRA', 20, '1997-05-06 00:00:00.000000', '04.50.44.51.', '', 0, '', '1994-05-17 00:00:00.000000');
INSERT INTO `clients` VALUES (12, 'Mlle', 'CHARRON', '', '14 rue de la Patrie', '17300', 'ROCHEFORT', 'FRA', 10, '1997-05-10 00:00:00.000000', '04.50 32 46 ', '', 0, '', '1994-07-13 00:00:00.000000');
INSERT INTO `clients` VALUES (13, 'Mme', 'DALIN', '', '18 av. de la Perrière', '44390', 'NORT-SUR-ERDRE', 'FRA', 20, '1997-04-29 00:00:00.000000', '04.49.70.84.', '', 1, '', '1994-07-27 00:00:00.000000');
INSERT INTO `clients` VALUES (14, 'M.', 'DELANÖE', '', '39 rue de la Gare', '79000', 'NIORT', 'FRA', 10, '1997-04-06 00:00:00.000000', '04.65.23.93.', '', 1, '', '1994-08-24 00:00:00.000000');
INSERT INTO `clients` VALUES (15, 'M.', 'DENISOT', '', '18 rue Jules Le Guen', '66700', 'ARGELES SUR MER', 'FRA', 20, '1997-04-06 00:00:00.000000', '04.50.32.43.', '', 1, 'Retard de paiement constaté pour les deux premières commandes', '1994-08-24 00:00:00.000000');
INSERT INTO `clients` VALUES (16, 'M.', 'DRUEL', '', '27 rue Contrescarpe', '44000', 'NANTES', 'FRA', 10, '1999-06-29 00:00:00.000000', '04.50.64.66.', '', 1, '', '1994-09-28 00:00:00.000000');
INSERT INTO `clients` VALUES (17, 'M.', 'DUSTILE', '', '13 Bd. Schumann', '33120', 'ARCACHON', 'FRA', 20, '1997-06-12 00:00:00.000000', '04.50 52 44 ', '', 1, '', '1975-01-01 00:00:00.000000');
INSERT INTO `clients` VALUES (18, 'M.', 'DUTILLEUL', '', '5 rue des Vignes', '66700', 'ARGELES SUR MER', 'FRA', 20, '1997-06-26 00:00:00.000000', '04.50 51 70 ', '', 1, '', '1979-02-09 00:00:00.000000');
INSERT INTO `clients` VALUES (19, 'M.', 'FABRE', '', '31 rue du Petit Bois', '75016', 'PARIS', 'FRA', 30, '1997-04-11 00:00:00.000000', '04.50 51 70 ', '', 0, '', '1989-02-02 00:00:00.000000');
INSERT INTO `clients` VALUES (20, 'Mlle', 'GUEHÉNEC', '', '14 rue Raspail', '69003', 'LYON', 'FRA', 10, '1997-04-20 00:00:00.000000', '04.61.62.51.', '', 1, '', '1994-10-27 00:00:00.000000');
INSERT INTO `clients` VALUES (21, 'M.', 'GUILLEMIN', '', '3 rue des Mimosas', '17000', 'LA ROCHELLE', 'FRA', 30, '1997-06-26 00:00:00.000000', '04.76.40.09.', '', 1, '', '1994-10-27 00:00:00.000000');
INSERT INTO `clients` VALUES (22, 'Mlle', 'HUCHON', '', '15 Bd. du Massacre', '44000', 'NANTES', 'FRA', 10, '1999-04-06 00:00:00.000000', '04.50.27.28.', '', 1, '', '1995-02-08 00:00:00.000000');
INSERT INTO `clients` VALUES (23, 'M.', 'JAMET', '', '78 av. de la République', '17000', 'LA ROCHELLE', 'FRA', 0, '1997-06-28 00:00:00.000000', '04.50.44.18.', '', 1, '', '1995-03-15 00:00:00.000000');
INSERT INTO `clients` VALUES (24, 'M.', 'LAFORGE', '', '1 Place de l\'Église', '17000', 'LA ROCHELLE', 'FRA', 30, '1997-05-25 00:00:00.000000', '04.48.78.55.', '', 1, '', '1995-03-15 00:00:00.000000');
INSERT INTO `clients` VALUES (25, 'Mme', 'LAGARDE', '', '2 rue des Primevères', '49000', 'ANGERS', 'FRA', 30, '1997-06-16 00:00:00.000000', '04.50.02.97.', '', 1, '', '1995-03-15 00:00:00.000000');
INSERT INTO `clients` VALUES (26, 'Mlle', 'LAMBARD', '', '3 Bd. des Anglais', '75016', 'PARIS', 'FRA', 30, '1997-06-13 00:00:00.000000', '', '', 0, '', '1995-03-29 00:00:00.000000');
INSERT INTO `clients` VALUES (27, 'Mlle', 'LAMBARD', '', '3 Bd. des Anglais', '75016', 'PARIS', 'FRA', 20, '1997-06-13 00:00:00.000000', '04.50.22.20.', '', 1, '', '1995-03-29 00:00:00.000000');
INSERT INTO `clients` VALUES (28, 'M.', 'LEMASSON', '', '55 Bd Victor Hugo', '72000', 'LE MANS', 'FRA', 10, '1998-06-23 00:00:00.000000', '04.50.69.34.', '', 1, '', '1995-03-29 00:00:00.000000');
INSERT INTO `clients` VALUES (29, 'M.', 'LENARD', '', '12 rue des Halles', '34100', 'MONTPELLIER', 'FRA', 10, '1997-05-23 00:00:00.000000', '04.5067 60 7', '', 1, 'Client fidèle qui passe des commandes régulièrement (à peu près une par mois)', '1995-03-10 00:00:00.000000');
INSERT INTO `clients` VALUES (30, 'M.', 'LEROY', '', '3 rue des Roses', '79000', 'NIORT', 'FRA', 30, '1997-04-01 00:00:00.000000', '04.50.22.52.', '', 1, '', '1995-04-12 00:00:00.000000');
INSERT INTO `clients` VALUES (31, 'Mme', 'MADIC', '', '21 rue de Grillaud', '72000', 'LE MANS', 'FRA', 10, '1997-04-01 00:00:00.000000', '04.50.64.02.', '', 1, '', '1995-04-07 00:00:00.000000');
INSERT INTO `clients` VALUES (32, 'Mme', 'MAHÉ', '', '12 rue des Pommiers', '79000', 'NIORT', 'FRA', 10, '1997-06-28 00:00:00.000000', '04.50.67.69.', '', 1, '', '1995-04-07 00:00:00.000000');
INSERT INTO `clients` VALUES (33, 'M.', 'MESNARD', '', '2 Place de la Monnaie', '85480', 'FOUGERE', 'FRA', 20, '1997-05-01 00:00:00.000000', '04.48.23.22.', '', 1, '', '1995-04-07 00:00:00.000000');
INSERT INTO `clients` VALUES (34, 'M.', 'MINGUY', '', '14 Bd. Vincent Gâche', '40000', 'MONTMARSAN', 'FRA', 10, '1997-04-21 00:00:00.000000', '04.50.51.51.', '', 1, '', '1995-04-12 00:00:00.000000');
INSERT INTO `clients` VALUES (35, 'Mme', 'MORICE', '', '23 rue des Hauts Pavés', '35100', 'RENNES', 'FRA', 30, '1997-06-05 00:00:00.000000', '', '', 1, 'Une remise de 10% a été accordée sur la dernière commande suite à un retard d\'envoi', '1995-04-12 00:00:00.000000');
INSERT INTO `clients` VALUES (36, 'Mme', 'MORICE', '', '23 rue des Hauts Pavés', '35100', 'RENNES', 'FRA', 10, '1997-06-05 00:00:00.000000', '04.68.87.74.', '', 1, 'Une remise de 10% a été accordée sur la dernière commande suite à un retard d\'envoi', '1995-04-20 00:00:00.000000');
INSERT INTO `clients` VALUES (37, 'M.', 'MUREAU', '', '21 rue des Cordeliers', '34100', 'MONTPELLIER', 'FRA', 30, '1998-06-30 00:00:00.000000', '04.50.45.19.', '', 1, '', '1995-04-20 00:00:00.000000');
INSERT INTO `clients` VALUES (38, 'M.', 'NEUVILLE', '', '19 allée des Acacias', '72000', 'LE MANS', 'FRA', 20, '1997-06-12 00:00:00.000000', '04.50.66.11.', '', 1, '', '1995-04-20 00:00:00.000000');
INSERT INTO `clients` VALUES (39, 'M.', 'NOLEAU', '', '6 rue Léon Blum', '17000', 'LA ROCHELLE', 'FRA', 10, '1997-05-03 00:00:00.000000', '04.50.52.88.', '', 1, '', '1995-04-20 00:00:00.000000');
INSERT INTO `clients` VALUES (40, 'Mlle', 'PAVILLON', '', '9 Bd. de L\'Océan', '64100', 'BAYONNE', 'FRA', 10, '1999-05-12 00:00:00.000000', '04.50.45.01.', '', 1, '', '1995-04-20 00:00:00.000000');
INSERT INTO `clients` VALUES (41, 'Mme', 'PERRAUX', '', '1 rue du Chêne Creux', '34190', 'GANGES', 'FRA', 20, '1997-05-16 00:00:00.000000', '04.50.22.10.', '', 1, '', '1995-04-20 00:00:00.000000');
INSERT INTO `clients` VALUES (42, 'M.', 'PERRICHON', '', '3 Place du Marché', '35100', 'RENNES', 'FRA', 20, '1997-05-19 00:00:00.000000', '04.50.01.00.', '', 1, '', '1995-04-20 00:00:00.000000');
INSERT INTO `clients` VALUES (43, 'Mme', 'PESLIER', '', '27 rue du Château', '34190', 'GANGES', 'FRA', 20, '1997-06-05 00:00:00.000000', '04.50.52.83.', '', 1, '', '1995-04-20 00:00:00.000000');
INSERT INTO `clients` VALUES (44, 'Mme', 'REMOND', '', '3 rue de Biarritz', '44000', 'NANTES', 'FRA', 10, '1997-06-05 00:00:00.000000', '04.72.35.88.', '', 1, '', '1995-04-20 00:00:00.000000');
INSERT INTO `clients` VALUES (45, 'M.', 'REMOND', '', '18 avenue des 3 Mousquetaires', '66000', 'PERPIGNAN', 'FRA', 30, '1997-04-10 00:00:00.000000', '04.80.77.85.', '', 1, '', '1995-04-20 00:00:00.000000');
INSERT INTO `clients` VALUES (46, 'M.', 'RIMATEL', '', '12 allée d\'Orléans', '44000', 'NANTES', 'FRA', 10, '1998-06-01 00:00:00.000000', '04.50.45.32.', '', 1, 'A passé une grosse commande en janvier 1996; depuis, plus rien. Penser à reprendre contact', '1995-04-27 00:00:00.000000');
INSERT INTO `clients` VALUES (47, 'Mlle', 'RISPOLI', '', '2 rue des Violettes', '34190', 'GANGES', 'FRA', 0, '1997-06-15 00:00:00.000000', '04.50 44 30 ', '', 1, '', '1975-01-01 00:00:00.000000');
INSERT INTO `clients` VALUES (48, 'Mlle', 'ROBIC', '', '5 av. Gutemberg', '17100', 'ROCHEFORT', 'FRA', 20, '1997-06-27 00:00:00.000000', '04.50 45 09 ', '', 1, '', '1975-01-01 00:00:00.000000');
INSERT INTO `clients` VALUES (49, 'M.', 'THUAUD', '', '2 av. Paul Bert', '53000', 'LAVAL', 'FRA', 20, '1997-05-16 00:00:00.000000', '04.50 51 70 ', '', 0, '', '1975-01-01 00:00:00.000000');
INSERT INTO `clients` VALUES (50, 'M.', 'TILLARD', '', '3 Cours Chazelles', '44000', 'NANTES', 'FRA', 20, '1997-06-12 00:00:00.000000', '04.50 32 44 ', '', 0, '', '1975-01-01 00:00:00.000000');
INSERT INTO `clients` VALUES (51, 'Mme', 'TOUCHET', '', '4 Bd. Jules Verne', '33120', 'ARCACHON', 'FRA', 20, '1997-04-25 00:00:00.000000', '04.50 52 81 ', '', 0, '', '1975-01-01 00:00:00.000000');
INSERT INTO `clients` VALUES (52, 'M.', 'VISONNEAU', '', '52 Bd. de l\'Égalité', '16000', 'ANGOULEME', 'FRA', 10, '1997-06-03 00:00:00.000000', '04.50 51 21 ', '', 1, '', '1991-01-10 00:00:00.000000');
INSERT INTO `clients` VALUES (54, 'Mme', 'JALLEAU', NULL, 'Rue des pommes', '75200', 'PARIS', 'FRA', 20, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `clients` VALUES (56, 'lm', 'toto', NULL, 'RRRRR', '75000', 'PARIS', 'ARG', 0, NULL, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for commandes
-- ----------------------------
DROP TABLE IF EXISTS `commandes`;
CREATE TABLE `commandes`  (
  `Id_Commande` int(11) NOT NULL,
  `Id_client` int(11) NULL DEFAULT NULL,
  `date_commande` datetime(6) NULL DEFAULT NULL,
  `Id_vendeur` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_Commande`) USING BTREE,
  INDEX `FK_Commandes_clients`(`Id_client`) USING BTREE,
  INDEX `FK_Commandes_vendeurs`(`Id_vendeur`) USING BTREE,
  CONSTRAINT `FK_Commandes_clients` FOREIGN KEY (`Id_client`) REFERENCES `clients` (`Id_client`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Commandes_vendeurs` FOREIGN KEY (`Id_vendeur`) REFERENCES `vendeurs` (`Id_vendeur`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commandes
-- ----------------------------
INSERT INTO `commandes` VALUES (1, 6, NULL, NULL);
INSERT INTO `commandes` VALUES (5, 16, '2020-10-27 10:09:43.000000', 1);
INSERT INTO `commandes` VALUES (6, 4, '2020-10-27 10:10:07.000000', 1);
INSERT INTO `commandes` VALUES (7, 2, '2020-10-27 16:37:41.000000', 2);
INSERT INTO `commandes` VALUES (8, 3, '2020-10-27 16:54:15.000000', 3);
INSERT INTO `commandes` VALUES (9, 2, '2020-10-27 16:58:10.000000', 3);
INSERT INTO `commandes` VALUES (10, 3, '2022-01-12 09:44:29.000000', 2);
INSERT INTO `commandes` VALUES (12, 15, '2022-01-12 09:47:35.000000', 1);
INSERT INTO `commandes` VALUES (13, 5, '2020-10-28 09:49:10.000000', 3);
INSERT INTO `commandes` VALUES (15, 16, '2020-10-28 09:52:44.000000', 4);
INSERT INTO `commandes` VALUES (16, 54, '2020-10-28 10:17:22.000000', 2);
INSERT INTO `commandes` VALUES (17, 54, '2020-10-28 10:17:36.000000', 4);
INSERT INTO `commandes` VALUES (18, 54, '2020-10-28 10:18:17.000000', 2);
INSERT INTO `commandes` VALUES (19, 23, '2021-10-28 10:18:21.000000', 4);
INSERT INTO `commandes` VALUES (20, 29, '2021-10-28 12:05:36.000000', 2);
INSERT INTO `commandes` VALUES (21, 29, '2021-10-28 12:05:42.000000', 3);
INSERT INTO `commandes` VALUES (22, 29, '2021-10-28 12:07:50.000000', 3);
INSERT INTO `commandes` VALUES (23, 21, '2021-10-28 14:59:13.000000', 4);
INSERT INTO `commandes` VALUES (24, NULL, '2021-10-28 23:21:06.000000', 4);

-- ----------------------------
-- Table structure for lignes_commandes
-- ----------------------------
DROP TABLE IF EXISTS `lignes_commandes`;
CREATE TABLE `lignes_commandes`  (
  `Id_ligne` int(11) NOT NULL,
  `Id_commande` int(11) NOT NULL,
  `Id_produit` int(11) NOT NULL,
  `Quantite` int(11) NOT NULL,
  PRIMARY KEY (`Id_ligne`) USING BTREE,
  INDEX `FK_lc_prduits`(`Id_produit`) USING BTREE,
  INDEX `FK_lc_commandes`(`Id_commande`) USING BTREE,
  CONSTRAINT `FK_lc_commandes` FOREIGN KEY (`Id_commande`) REFERENCES `commandes` (`Id_Commande`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_lc_prduits` FOREIGN KEY (`Id_produit`) REFERENCES `produits` (`Id_produits`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lignes_commandes
-- ----------------------------
INSERT INTO `lignes_commandes` VALUES (1, 1, 14, 3);
INSERT INTO `lignes_commandes` VALUES (2, 7, 11, 2);
INSERT INTO `lignes_commandes` VALUES (4, 7, 15, 3);
INSERT INTO `lignes_commandes` VALUES (5, 7, 9, 1);
INSERT INTO `lignes_commandes` VALUES (6, 7, 14, 1);
INSERT INTO `lignes_commandes` VALUES (7, 7, 17, 1);
INSERT INTO `lignes_commandes` VALUES (8, 21, 28, 1);
INSERT INTO `lignes_commandes` VALUES (9, 21, 30, 2);
INSERT INTO `lignes_commandes` VALUES (10, 22, 28, 1);
INSERT INTO `lignes_commandes` VALUES (11, 22, 30, 2);
INSERT INTO `lignes_commandes` VALUES (12, 21, 7, 2);
INSERT INTO `lignes_commandes` VALUES (13, 23, 16, 3);
INSERT INTO `lignes_commandes` VALUES (14, 23, 2, 4);
INSERT INTO `lignes_commandes` VALUES (15, 9, 6, 1);
INSERT INTO `lignes_commandes` VALUES (16, 9, 20, 2);
INSERT INTO `lignes_commandes` VALUES (17, 9, 8, 1);
INSERT INTO `lignes_commandes` VALUES (18, 10, 23, 4);
INSERT INTO `lignes_commandes` VALUES (19, 10, 24, 2);
INSERT INTO `lignes_commandes` VALUES (20, 8, 9, 2);
INSERT INTO `lignes_commandes` VALUES (21, 8, 17, 1);
INSERT INTO `lignes_commandes` VALUES (22, 6, 14, 1);
INSERT INTO `lignes_commandes` VALUES (23, 6, 30, 1);
INSERT INTO `lignes_commandes` VALUES (24, 6, 9, 1);
INSERT INTO `lignes_commandes` VALUES (25, 13, 9, 1);
INSERT INTO `lignes_commandes` VALUES (26, 13, 12, 1);
INSERT INTO `lignes_commandes` VALUES (27, 12, 5, 5);
INSERT INTO `lignes_commandes` VALUES (28, 12, 30, 5);
INSERT INTO `lignes_commandes` VALUES (29, 12, 4, 5);
INSERT INTO `lignes_commandes` VALUES (30, 15, 3, 6);
INSERT INTO `lignes_commandes` VALUES (31, 15, 2, 4);
INSERT INTO `lignes_commandes` VALUES (32, 5, 1, 1);
INSERT INTO `lignes_commandes` VALUES (33, 5, 15, 1);
INSERT INTO `lignes_commandes` VALUES (34, 5, 19, 1);
INSERT INTO `lignes_commandes` VALUES (35, 5, 25, 1);
INSERT INTO `lignes_commandes` VALUES (36, 5, 28, 1);
INSERT INTO `lignes_commandes` VALUES (40, 19, 10, 1);
INSERT INTO `lignes_commandes` VALUES (41, 19, 4, 1);
INSERT INTO `lignes_commandes` VALUES (42, 19, 27, 1);
INSERT INTO `lignes_commandes` VALUES (43, 19, 15, 1);
INSERT INTO `lignes_commandes` VALUES (44, 19, 8, 1);
INSERT INTO `lignes_commandes` VALUES (45, 19, 28, 1);
INSERT INTO `lignes_commandes` VALUES (46, 19, 6, 1);
INSERT INTO `lignes_commandes` VALUES (47, 20, 4, 1);
INSERT INTO `lignes_commandes` VALUES (48, 20, 10, 4);
INSERT INTO `lignes_commandes` VALUES (49, 20, 20, 4);
INSERT INTO `lignes_commandes` VALUES (50, 20, 27, 1);
INSERT INTO `lignes_commandes` VALUES (51, 20, 27, 2);
INSERT INTO `lignes_commandes` VALUES (52, 16, 8, 1);
INSERT INTO `lignes_commandes` VALUES (53, 16, 9, 1);
INSERT INTO `lignes_commandes` VALUES (54, 16, 5, 1);
INSERT INTO `lignes_commandes` VALUES (55, 16, 28, 1);
INSERT INTO `lignes_commandes` VALUES (56, 16, 30, 1);
INSERT INTO `lignes_commandes` VALUES (57, 17, 2, 1);
INSERT INTO `lignes_commandes` VALUES (58, 17, 10, 1);
INSERT INTO `lignes_commandes` VALUES (59, 18, 8, 1);
INSERT INTO `lignes_commandes` VALUES (60, 18, 19, 2);
INSERT INTO `lignes_commandes` VALUES (61, 15, 8, 8);

-- ----------------------------
-- Table structure for pays
-- ----------------------------
DROP TABLE IF EXISTS `pays`;
CREATE TABLE `pays`  (
  `Id_pays` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `NOM` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ARTICLE` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `NOM_LONG` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CAPITALE` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `langue` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id_pays`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pays
-- ----------------------------
INSERT INTO `pays` VALUES ('AFG', 'Afghanistan', 'l\'', 'République islamique d\'Afghanistan', 'Kaboul', NULL);
INSERT INTO `pays` VALUES ('AGO', 'Angola', 'l\'', 'République d\'Angola', 'Luanda', NULL);
INSERT INTO `pays` VALUES ('ALB', 'Albanie', 'l\'', 'République d\'Albanie', 'Tirana', NULL);
INSERT INTO `pays` VALUES ('AND', 'Andorre', 'l\'', 'Principauté d\'Andorre', 'Andorre-la-Vieille', NULL);
INSERT INTO `pays` VALUES ('ARE', 'Émirats arabes unis', 'les', 'Émirats arabes unis', 'Abou Dabi', 'fdsqfdsq');
INSERT INTO `pays` VALUES ('ARG', 'Argentine', 'l\'', 'République argentine', 'Buenos Aires', NULL);
INSERT INTO `pays` VALUES ('ARM', 'Arménie', 'l\'', 'République d\'Arménie', 'Erevan', NULL);
INSERT INTO `pays` VALUES ('ATG', 'Antigua-et-Barbuda', NULL, 'Antigua-et-Barbuda', 'Saint John\'s', 'fdsqfdsq');
INSERT INTO `pays` VALUES ('AUS', 'Australie', 'l\'', 'Commonwealth d\'Australie', 'Canberra', NULL);
INSERT INTO `pays` VALUES ('AUT', 'Autriche', 'l\'', 'République d\'Autriche', 'Vienne', 'fdsqfdsq');
INSERT INTO `pays` VALUES ('AZE', 'Azerbaïdjan', 'l\'', 'République d\'Azerbaïdjan', 'Bakou', NULL);
INSERT INTO `pays` VALUES ('BDI', 'Burundi', 'le', 'République du Burundi', 'Gitega', NULL);
INSERT INTO `pays` VALUES ('BEL', 'Belgique', 'la', 'Royaume de Belgique', 'Bruxelles', NULL);
INSERT INTO `pays` VALUES ('BEN', 'Bénin', 'le', 'République du Bénin', 'Porto-Novo', NULL);
INSERT INTO `pays` VALUES ('BFA', 'Burkina', 'le', 'Burkina Faso', 'Ouagadougou', 'fdsqfsdqfdsq');
INSERT INTO `pays` VALUES ('BGD', 'Bangladesh', 'l\'', 'République populaire du Bangladesh', 'Dacca', NULL);
INSERT INTO `pays` VALUES ('BGR', 'Bulgarie', 'la', 'République de Bulgarie', 'Sofia', NULL);
INSERT INTO `pays` VALUES ('BHR', 'Bahreïn', NULL, 'Royaume de Bahreïn', 'Manama', NULL);
INSERT INTO `pays` VALUES ('BHS', 'Bahamas', 'les', 'Commonwealth des Bahamas', 'Nassau', NULL);
INSERT INTO `pays` VALUES ('BIH', 'Bosnie-Herzégovine', 'la', 'Bosnie-Herzégovine', 'Sarajevo', NULL);
INSERT INTO `pays` VALUES ('BLR', 'Biélorussie', 'la', 'République de Biélorussie', 'Minsk', NULL);
INSERT INTO `pays` VALUES ('BLZ', 'Bélize', 'le', 'Bélize', 'Belmopan', NULL);
INSERT INTO `pays` VALUES ('BOL', 'Bolivie', 'la', 'État plurinational de Bolivie', 'Sucre / La Paz', NULL);
INSERT INTO `pays` VALUES ('BRA', 'Brésil', 'le', 'République fédérative du Brésil', 'Brasilia', NULL);
INSERT INTO `pays` VALUES ('BRB', 'Barbade', 'la', 'Barbade', 'Bridgetown', NULL);
INSERT INTO `pays` VALUES ('BRN', 'Brunei', 'le', 'Brunei Darussalam', 'Bandar Seri Begawan', NULL);
INSERT INTO `pays` VALUES ('BTN', 'Bhoutan', 'le', 'Royaume du Bhoutan', 'Thimphou', NULL);
INSERT INTO `pays` VALUES ('BWA', 'Botswana', 'le', 'République du Botswana', 'Gaborone', NULL);
INSERT INTO `pays` VALUES ('CAF', 'Centrafrique', 'la', 'République centrafricaine', 'Bangui', NULL);
INSERT INTO `pays` VALUES ('CAN', 'Canada', 'le', 'Canada', 'Ottawa', NULL);
INSERT INTO `pays` VALUES ('CHE', 'Suisse', 'la', 'Confédération suisse', 'Berne', NULL);
INSERT INTO `pays` VALUES ('CHL', 'Chili', 'le', 'République du Chili', 'Santiago', NULL);
INSERT INTO `pays` VALUES ('CHN', 'Chine', 'la', 'République populaire de Chine', 'Pékin', NULL);
INSERT INTO `pays` VALUES ('CIV', 'Côte d\'Ivoire', 'la', 'République de Côte d\'Ivoire', 'Yamoussoukro', NULL);
INSERT INTO `pays` VALUES ('CMR', 'Cameroun', 'le', 'République du Cameroun', 'Yaoundé', NULL);
INSERT INTO `pays` VALUES ('COD', 'République démocratique du Congo', 'la', 'République démocratique du Congo', 'Kinshasa', NULL);
INSERT INTO `pays` VALUES ('COG', 'Congo', 'le', 'République du Congo', 'Brazzaville', NULL);
INSERT INTO `pays` VALUES ('COK', 'Îles Cook', 'les', 'Îles Cook', 'Avarua', NULL);
INSERT INTO `pays` VALUES ('COL', 'Colombie', 'la', 'République de Colombie', 'Bogota', NULL);
INSERT INTO `pays` VALUES ('COM', 'Comores', 'les', 'Union des Comores', 'Moroni', NULL);
INSERT INTO `pays` VALUES ('CPV', 'Cap-Vert', 'le', 'République du Cap-Vert', 'Praia', NULL);
INSERT INTO `pays` VALUES ('CRI', 'Costa Rica', 'le', 'République du Costa Rica', 'San José', NULL);
INSERT INTO `pays` VALUES ('CUB', 'Cuba', NULL, 'République de Cuba', 'La Havane', NULL);
INSERT INTO `pays` VALUES ('CYP', 'Chypre', NULL, 'République de Chypre', 'Nicosie', NULL);
INSERT INTO `pays` VALUES ('CZE', 'Tchéquie', 'la', 'République tchèque', 'Prague', NULL);
INSERT INTO `pays` VALUES ('DEU', 'Allemagne', 'l\'', 'République fédérale d\'Allemagne', 'Berlin', NULL);
INSERT INTO `pays` VALUES ('DJI', 'Djibouti', 'le', 'République de Djibouti', 'Djibouti', NULL);
INSERT INTO `pays` VALUES ('DMA', 'Dominique', 'la', 'Commonwealth de la Dominique', 'Roseau', NULL);
INSERT INTO `pays` VALUES ('DNK', 'Danemark', 'le', 'Royaume du Danemark', 'Copenhague', NULL);
INSERT INTO `pays` VALUES ('DOM', 'République dominicaine', 'la', 'République dominicaine', 'Saint-Domingue', NULL);
INSERT INTO `pays` VALUES ('DZA', 'Algérie', 'l\'', 'République algérienne démocratique et populaire', 'Alger', NULL);
INSERT INTO `pays` VALUES ('ECU', 'Équateur', 'l\'', 'République d\'Équateur', 'Quito', NULL);
INSERT INTO `pays` VALUES ('EGY', 'Égypte', 'l\'', 'République arabe d\'Égypte', 'Le Caire', NULL);
INSERT INTO `pays` VALUES ('ERI', 'Érythrée', 'l\'', 'État d\'Érythrée', 'Asmara', NULL);
INSERT INTO `pays` VALUES ('ESP', 'Espagne', 'l\'', 'Royaume d\'Espagne', 'Madrid', NULL);
INSERT INTO `pays` VALUES ('EST', 'Estonie', 'l\'', 'République d\'Estonie', 'Tallinn', NULL);
INSERT INTO `pays` VALUES ('ETH', 'Éthiopie', 'l\'', 'République démocratique fédérale d\'Éthiopie', 'Addis Abeba', NULL);
INSERT INTO `pays` VALUES ('FIN', 'Finlande', 'la', 'République de Finlande', 'Helsinki', NULL);
INSERT INTO `pays` VALUES ('FJI', 'Fidji', 'les', 'République des Fidji', 'Suva', NULL);
INSERT INTO `pays` VALUES ('FRA', 'France', 'la', 'République française', 'Paris', NULL);
INSERT INTO `pays` VALUES ('FSM', 'Micronésie', 'la', 'États fédérés de Micronésie', 'Palikir', NULL);
INSERT INTO `pays` VALUES ('GAB', 'Gabon', 'le', 'République gabonaise', 'Libreville', NULL);
INSERT INTO `pays` VALUES ('GBR', 'Royaume-Uni', 'le', 'Royaume-Uni de Grande-Bretagne et d\'Irlande du Nord', 'Londres', NULL);
INSERT INTO `pays` VALUES ('GEO', 'Géorgie', 'la', 'Géorgie', 'Tbilissi', NULL);
INSERT INTO `pays` VALUES ('GHA', 'Ghana', 'le', 'République du Ghana', 'Accra', NULL);
INSERT INTO `pays` VALUES ('GIN', 'Guinée', 'la', 'République de Guinée', 'Conakry', NULL);
INSERT INTO `pays` VALUES ('GMB', 'Gambie', 'la', 'République de Gambie', 'Banjul', NULL);
INSERT INTO `pays` VALUES ('GNB', 'Guinée-Bissao', 'la', 'République de Guinée-Bissao', 'Bissao', NULL);
INSERT INTO `pays` VALUES ('GNQ', 'Guinée équatoriale', 'la', 'République de Guinée équatoriale', 'Malabo', NULL);
INSERT INTO `pays` VALUES ('GRC', 'Grèce', 'la', 'République hellénique', 'Athènes', NULL);
INSERT INTO `pays` VALUES ('GRD', 'Grenade', 'la', 'Grenade', 'Saint-Georges', NULL);
INSERT INTO `pays` VALUES ('GTM', 'Guatémala', 'le', 'République du Guatémala', 'Guatémala', NULL);
INSERT INTO `pays` VALUES ('GUY', 'Guyana', 'le', 'République coopérative du Guyana', 'Georgetown', NULL);
INSERT INTO `pays` VALUES ('HND', 'Honduras', 'le', 'République du Honduras', 'Tégucigalpa', NULL);
INSERT INTO `pays` VALUES ('HRV', 'Croatie', 'la', 'République de Croatie', 'Zagreb', NULL);
INSERT INTO `pays` VALUES ('HTI', 'Haïti', NULL, 'République d\'Haïti', 'Port-au-Prince', NULL);
INSERT INTO `pays` VALUES ('HUN', 'Hongrie', 'la', 'Hongrie', 'Budapest', NULL);
INSERT INTO `pays` VALUES ('IDN', 'Indonésie', 'l\'', 'République d\'Indonésie', 'Jakarta', NULL);
INSERT INTO `pays` VALUES ('IND', 'Inde', 'l\'', 'République de l\'Inde', 'New Delhi', NULL);
INSERT INTO `pays` VALUES ('IRL', 'Irlande', 'l\'', 'Irlande', 'Dublin', NULL);
INSERT INTO `pays` VALUES ('IRN', 'Iran', 'l\'', 'République islamique d\'Iran', 'Téhéran', NULL);
INSERT INTO `pays` VALUES ('IRQ', 'Irak', 'l\'', 'République d\'Irak', 'Bagdad', NULL);
INSERT INTO `pays` VALUES ('ISL', 'Islande', 'l\'', 'République d\'Islande', 'Reykjavik', NULL);
INSERT INTO `pays` VALUES ('ISR', 'Israël', NULL, 'État d\'Israël', NULL, NULL);
INSERT INTO `pays` VALUES ('ITA', 'Italie', 'l\'', 'République italienne', 'Rome', NULL);
INSERT INTO `pays` VALUES ('JAM', 'Jamaïque', 'la', 'Jamaïque', 'Kingston', NULL);
INSERT INTO `pays` VALUES ('JOR', 'Jordanie', 'la', 'Royaume hachémite de Jordanie', 'Amman', NULL);
INSERT INTO `pays` VALUES ('JPN', 'Japon', 'le', 'Japon', 'Tokyo', NULL);
INSERT INTO `pays` VALUES ('KAZ', 'Kazakhstan', 'le', 'République du Kazakhstan', 'Nour-Soultan', NULL);
INSERT INTO `pays` VALUES ('KEN', 'Kénya', 'le', 'République du Kénya', 'Nairobi', NULL);
INSERT INTO `pays` VALUES ('KGZ', 'Kirghizstan', 'le', 'République kirghize', 'Bichkek', NULL);
INSERT INTO `pays` VALUES ('KHM', 'Cambodge', 'le', 'Royaume du Cambodge', 'Phnom Penh', NULL);
INSERT INTO `pays` VALUES ('KIR', 'Kiribati', 'les', 'République des Kiribati', 'Bairiki', NULL);
INSERT INTO `pays` VALUES ('KNA', 'Saint-Christophe-et-Niévès', NULL, 'Fédération de Saint-Christophe-et-Niévès', 'Basseterre', NULL);
INSERT INTO `pays` VALUES ('KOR', 'Corée du Sud', 'la', 'République de Corée', 'Séoul', NULL);
INSERT INTO `pays` VALUES ('KOS', 'Kosovo', 'le', 'République du Kosovo', 'Pristina', NULL);
INSERT INTO `pays` VALUES ('KWT', 'Koweït', 'le', 'État du Koweït', 'Koweït', NULL);
INSERT INTO `pays` VALUES ('LAO', 'Laos', 'le', 'République démocratique populaire lao', 'Vientiane', NULL);
INSERT INTO `pays` VALUES ('LBN', 'Liban', 'le', 'République libanaise', 'Beyrouth', NULL);
INSERT INTO `pays` VALUES ('LBR', 'Libéria', 'le', 'République du Libéria', 'Monrovia', NULL);
INSERT INTO `pays` VALUES ('LBY', 'Libye', 'la', 'État de Libye', 'Tripoli', NULL);
INSERT INTO `pays` VALUES ('LCA', 'Sainte-Lucie', NULL, 'Sainte-Lucie', 'Castries', NULL);
INSERT INTO `pays` VALUES ('LIE', 'Liechtenstein', 'le', 'Principauté du Liechtenstein', 'Vaduz', NULL);
INSERT INTO `pays` VALUES ('LKA', 'Sri Lanka', 'le', 'République démocratique socialiste du Sri Lanka', 'Sri Jayewardenepura-Kotte', NULL);
INSERT INTO `pays` VALUES ('LSO', 'Lésotho', 'le', 'Royaume du Lesotho', 'Maséru', NULL);
INSERT INTO `pays` VALUES ('LTU', 'Lituanie', 'la', 'République de Lituanie', 'Vilnius', NULL);
INSERT INTO `pays` VALUES ('LUX', 'Luxembourg', 'le', 'Grand-Duché de Luxembourg', 'Luxembourg', NULL);
INSERT INTO `pays` VALUES ('LVA', 'Lettonie', 'la', 'République de Lettonie', 'Riga', NULL);
INSERT INTO `pays` VALUES ('MAR', 'Maroc', 'le', 'Royaume du Maroc', 'Rabat', NULL);
INSERT INTO `pays` VALUES ('MCO', 'Monaco', NULL, 'Principauté de Monaco', 'Monaco', NULL);
INSERT INTO `pays` VALUES ('MDA', 'Moldavie', 'la', 'République de Moldavie', 'Chisinau', NULL);
INSERT INTO `pays` VALUES ('MDG', 'Madagascar', NULL, 'République de Madagascar', 'Antananarivo (Tananarive)', NULL);
INSERT INTO `pays` VALUES ('MDV', 'Maldives', 'les', 'République des Maldives', 'Malé', NULL);
INSERT INTO `pays` VALUES ('MEX', 'Mexique', 'le', 'États-Unis du Mexique', 'Mexico', NULL);
INSERT INTO `pays` VALUES ('MHL', 'Îles Marshall', 'les', 'République des Îles Marshall', 'Delap-Uliga-Darrit', NULL);
INSERT INTO `pays` VALUES ('MKD', 'Macédoine du Nord', 'l\'', 'République de Macédoine du Nord', 'Skopje', NULL);
INSERT INTO `pays` VALUES ('MLI', 'Mali', 'le', 'République du Mali', 'Bamako', NULL);
INSERT INTO `pays` VALUES ('MLT', 'Malte', NULL, 'République de Malte', 'La Valette', NULL);
INSERT INTO `pays` VALUES ('MMR', 'Birmanie', 'la', 'République de l\'Union de Birmanie', 'Naypyidaw', NULL);
INSERT INTO `pays` VALUES ('MNE', 'Monténégro', 'le', 'Monténégro', 'Podgorica', NULL);
INSERT INTO `pays` VALUES ('MNG', 'Mongolie', 'la', 'Mongolie', 'Oulan-Bator', NULL);
INSERT INTO `pays` VALUES ('MOZ', 'Mozambique', 'le', 'République du Mozambique', 'Maputo', NULL);
INSERT INTO `pays` VALUES ('MRT', 'Mauritanie', 'la', 'République islamique de Mauritanie', 'Nouakchott', NULL);
INSERT INTO `pays` VALUES ('MUS', 'Maurice', NULL, 'République de Maurice', 'Port-Louis', NULL);
INSERT INTO `pays` VALUES ('MWI', 'Malawi', 'le', 'République du Malawi', 'Lilongwé', NULL);
INSERT INTO `pays` VALUES ('MYS', 'Malaisie', 'la', 'Malaisie', 'Kuala Lumpur', NULL);
INSERT INTO `pays` VALUES ('NAM', 'Namibie', 'la', 'République de Namibie', 'Windhoek', NULL);
INSERT INTO `pays` VALUES ('NER', 'Niger', 'le', 'République du Niger', 'Niamey', NULL);
INSERT INTO `pays` VALUES ('NGA', 'Nigéria', 'le', 'République fédérale du Nigéria', 'Abuja', NULL);
INSERT INTO `pays` VALUES ('NIC', 'Nicaragua', 'le', 'République du Nicaragua', 'Managua', NULL);
INSERT INTO `pays` VALUES ('NIU', 'Niue', NULL, 'Niue', 'Alofi', NULL);
INSERT INTO `pays` VALUES ('NLD', 'Pays-Bas', 'les', 'Royaume des Pays-Bas', 'Amsterdam', NULL);
INSERT INTO `pays` VALUES ('NOR', 'Norvège', 'la', 'Royaume de Norvège', 'Oslo', NULL);
INSERT INTO `pays` VALUES ('NPL', 'Népal', 'le', 'République démocratique fédérale du Népal', 'Katmandou', NULL);
INSERT INTO `pays` VALUES ('NRU', 'Nauru', NULL, 'République de Nauru', 'Yaren', NULL);
INSERT INTO `pays` VALUES ('NZL', 'Nouvelle-Zélande', 'la', 'Nouvelle-Zélande', 'Wellington', NULL);
INSERT INTO `pays` VALUES ('OMN', 'Oman', NULL, 'Sultanat d\'Oman', 'Mascate', NULL);
INSERT INTO `pays` VALUES ('PAK', 'Pakistan', 'le', 'République islamique du Pakistan', 'Islamabad', NULL);
INSERT INTO `pays` VALUES ('PAN', 'Panama', 'le', 'République du Panama', 'Panama', NULL);
INSERT INTO `pays` VALUES ('PER', 'Pérou', 'le', 'République du Pérou', 'Lima', NULL);
INSERT INTO `pays` VALUES ('PHL', 'Philippines', 'les', 'République des Philippines', 'Manille', NULL);
INSERT INTO `pays` VALUES ('PLW', 'Palaos', 'les', 'République des Palaos', 'Melekeok', NULL);
INSERT INTO `pays` VALUES ('PNG', 'Papouasie-Nouvelle-Guinée', 'la', 'État indépendant de Papouasie-Nouvelle-Guinée', 'Port Moresby', NULL);
INSERT INTO `pays` VALUES ('POL', 'Pologne', 'la', 'République de Pologne', 'Varsovie', NULL);
INSERT INTO `pays` VALUES ('PRK', 'Corée du Nord', 'la', 'République populaire démocratique de Corée', 'Pyongyang', NULL);
INSERT INTO `pays` VALUES ('PRT', 'Portugal', 'le', 'République portugaise', 'Lisbonne', NULL);
INSERT INTO `pays` VALUES ('PRY', 'Paraguay', 'le', 'République du Paraguay', 'Assomption (Asuncion)', NULL);
INSERT INTO `pays` VALUES ('QAT', 'Qatar', 'le', 'État du Qatar', 'Doha', NULL);
INSERT INTO `pays` VALUES ('ROU', 'Roumanie', 'la', 'Roumanie', 'Bucarest', NULL);
INSERT INTO `pays` VALUES ('RUS', 'Russie', 'la', 'Fédération de Russie', 'Moscou', NULL);
INSERT INTO `pays` VALUES ('RWA', 'Rwanda', 'le', 'République du Rwanda', 'Kigali', NULL);
INSERT INTO `pays` VALUES ('SAU', 'Arabie saoudite', 'l\'', 'Royaume d\'Arabie saoudite', 'Riyad', NULL);
INSERT INTO `pays` VALUES ('SDN', 'Soudan', 'le', 'République du Soudan', 'Khartoum', NULL);
INSERT INTO `pays` VALUES ('SDS', 'Soudan du Sud', 'le', 'République du Soudan du Sud', 'Djouba', NULL);
INSERT INTO `pays` VALUES ('SEN', 'Sénégal', 'le', 'République du Sénégal', 'Dakar', NULL);
INSERT INTO `pays` VALUES ('SGP', 'Singapour', NULL, 'République de Singapour', 'Singapour', NULL);
INSERT INTO `pays` VALUES ('SLB', 'Salomon', 'les', 'Îles Salomon', 'Honiara', NULL);
INSERT INTO `pays` VALUES ('SLE', 'Sierra Leone', 'la', 'République de Sierra Leone', 'Freetown', NULL);
INSERT INTO `pays` VALUES ('SLV', 'Salvador', 'le', 'République du Salvador', 'San Salvador', NULL);
INSERT INTO `pays` VALUES ('SMR', 'Saint-Marin', NULL, 'République de Saint-Marin', 'Saint-Marin', NULL);
INSERT INTO `pays` VALUES ('SOM', 'Somalie', 'la', 'République fédérale de Somalie', 'Mogadiscio', NULL);
INSERT INTO `pays` VALUES ('SRB', 'Serbie', 'la', 'République de Serbie', 'Belgrade', NULL);
INSERT INTO `pays` VALUES ('STP', 'Sao Tomé-et-Principe', NULL, 'République démocratique de Sao Tomé-et-Principe', 'Sao Tomé', NULL);
INSERT INTO `pays` VALUES ('SUR', 'Suriname', 'le', 'République du Suriname', 'Paramaribo', NULL);
INSERT INTO `pays` VALUES ('SVK', 'Slovaquie', 'la', 'République slovaque', 'Bratislava', NULL);
INSERT INTO `pays` VALUES ('SVN', 'Slovénie', 'la', 'République de Slovénie', 'Ljubljana', NULL);
INSERT INTO `pays` VALUES ('SWE', 'Suède', 'la', 'Royaume de Suède', 'Stockholm', NULL);
INSERT INTO `pays` VALUES ('SWZ', 'Eswatini', 'le', 'Royaume d\'Eswatini', 'Mbabané', NULL);
INSERT INTO `pays` VALUES ('SYC', 'Seychelles', 'les', 'République des Seychelles', 'Victoria', NULL);
INSERT INTO `pays` VALUES ('SYR', 'Syrie', 'la', 'République arabe syrienne', 'Damas', NULL);
INSERT INTO `pays` VALUES ('TCD', 'Tchad', 'le', 'République du Tchad', 'Ndjamena', NULL);
INSERT INTO `pays` VALUES ('TGO', 'Togo', 'le', 'République togolaise', 'Lomé', NULL);
INSERT INTO `pays` VALUES ('THA', 'Thaïlande', 'la', 'Royaume de Thaïlande', 'Bangkok', NULL);
INSERT INTO `pays` VALUES ('TJK', 'Tadjikistan', 'le', 'République du Tadjikistan', 'Douchanbé', NULL);
INSERT INTO `pays` VALUES ('TKM', 'Turkménistan', 'le', 'Turkménistan', 'Achgabat', NULL);
INSERT INTO `pays` VALUES ('TLS', 'Timor oriental', 'le', 'République démocratique du Timor oriental', 'Dili', NULL);
INSERT INTO `pays` VALUES ('TON', 'Tonga', 'les', 'Royaume des Tonga', 'Nuku\'alofa', NULL);
INSERT INTO `pays` VALUES ('TTO', 'Trinité-et-Tobago', 'la', 'République de Trinité-et-Tobago', 'Port-d\'Espagne (Port of Spain)', NULL);
INSERT INTO `pays` VALUES ('TUN', 'Tunisie', 'la', 'République tunisienne', 'Tunis', NULL);
INSERT INTO `pays` VALUES ('TUR', 'Turquie', 'la', 'République de Turquie', 'Ankara', NULL);
INSERT INTO `pays` VALUES ('TUV', 'Tuvalu', 'les', 'Tuvalu', 'Vaiaku', NULL);
INSERT INTO `pays` VALUES ('TZA', 'Tanzanie', 'la', 'République unie de Tanzanie', 'Dodoma', NULL);
INSERT INTO `pays` VALUES ('UGA', 'Ouganda', 'l\'', 'République d\'Ouganda', 'Kampala', NULL);
INSERT INTO `pays` VALUES ('UKR', 'Ukraine', 'l\'', 'Ukraine', 'Kiev', NULL);
INSERT INTO `pays` VALUES ('URY', 'Uruguay', 'l\'', 'République orientale de l\'Uruguay', 'Montévidéo', NULL);
INSERT INTO `pays` VALUES ('USA', 'États-Unis', 'les', 'États-Unis d\'Amérique', 'Washington', NULL);
INSERT INTO `pays` VALUES ('UZB', 'Ouzbékistan', 'l\'', 'République d\'Ouzbékistan', 'Tachkent', NULL);
INSERT INTO `pays` VALUES ('VAT', 'Vatican', 'le', 'Vatican (Saint-Siège)', NULL, NULL);
INSERT INTO `pays` VALUES ('VCT', 'Saint-Vincent-et-les-Grenadines', NULL, 'Saint-Vincent-et-les-Grenadines', 'Kingstown', NULL);
INSERT INTO `pays` VALUES ('VEN', 'Vénézuéla', 'le', 'République bolivarienne du Vénézuéla', 'Caracas', NULL);
INSERT INTO `pays` VALUES ('VNM', 'Vietnam', 'le', 'République socialiste du Vietnam', 'Hanoï', NULL);
INSERT INTO `pays` VALUES ('VUT', 'Vanuatu', 'le', 'République du Vanuatu', 'Port-Vila', NULL);
INSERT INTO `pays` VALUES ('WSM', 'Samoa', 'les', 'État indépendant des Samoa', 'Apia', NULL);
INSERT INTO `pays` VALUES ('YEM', 'Yémen', 'le', 'République du Yémen', 'Sanaa', NULL);
INSERT INTO `pays` VALUES ('ZAF', 'Afrique du Sud', 'l\'', 'République d\'Afrique du Sud', 'Prétoria', NULL);
INSERT INTO `pays` VALUES ('ZMB', 'Zambie', 'la', 'République de Zambie', 'Lusaka', NULL);
INSERT INTO `pays` VALUES ('ZWE', 'Zimbabwé', 'le', 'République du Zimbabwé', 'Hararé', NULL);

-- ----------------------------
-- Table structure for produits
-- ----------------------------
DROP TABLE IF EXISTS `produits`;
CREATE TABLE `produits`  (
  `Id_produits` int(11) NOT NULL,
  `Produit` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PrixUHT` decimal(19, 4) NOT NULL DEFAULT 0.0000,
  `Conditionnement` tinyint(4) NULL DEFAULT NULL,
  `txTVA` float NULL DEFAULT NULL,
  `Id_categorie` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id_produits`) USING BTREE,
  INDEX `FK_produits_categ`(`Id_categorie`) USING BTREE,
  CONSTRAINT `FK_produits_categ` FOREIGN KEY (`Id_categorie`) REFERENCES `categories` (`Id_categorie`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produits
-- ----------------------------
INSERT INTO `produits` VALUES (1, 'Sac photo-vidéo - Dim 25x11,5x16,5', 250.0000, 1, 0.3, 'ACC');
INSERT INTO `produits` VALUES (2, 'Cassettes pour magnétoscope VHS 240 mn (x3)', 199.0000, 3, 0.206, 'ACC');
INSERT INTO `produits` VALUES (3, 'Cassettes pour magnétoscope VHS 300 mn (x2)', 250.0000, 2, 0.206, 'ACC');
INSERT INTO `produits` VALUES (4, 'La photo de A à Z', 199.0000, 1, 0.055, 'PHO');
INSERT INTO `produits` VALUES (5, 'Guide de la photographie', 249.0000, 1, 0.055, 'PHO');
INSERT INTO `produits` VALUES (6, 'Compact super zoom 35/120 mm - Dim 13x6,8x6,1', 1499.0000, 1, 0.206, 'PHO');
INSERT INTO `produits` VALUES (7, 'Reflex zoom 75/300 mm - Dim 14,5x9x6', 3795.0000, 1, 0.206, 'PHO');
INSERT INTO `produits` VALUES (8, 'Reflex motorisé Autofocus - Dim 14,5x9x6', 2600.0000, 1, 0.206, 'PHO');
INSERT INTO `produits` VALUES (9, 'Polaroïd Autofocus - Dim 14,5x12,5x10', 590.0000, 1, 0.206, 'PHO');
INSERT INTO `produits` VALUES (10, 'Jumelles compactes à prismes - Grossit 8x', 599.0000, 1, 0.206, 'PHO');
INSERT INTO `produits` VALUES (11, 'Jumelles compactes à prismes - Grossit 10x', 659.0000, 1, 0.206, 'PHO');
INSERT INTO `produits` VALUES (12, 'Jumelles compactes à prismes - Grossit 12x', 699.0000, 1, 0.206, 'PHO');
INSERT INTO `produits` VALUES (13, 'Radio-K7 stéréo avec lecteur CD - 2x8 W', 1095.0000, 1, 0.206, 'SON');
INSERT INTO `produits` VALUES (14, 'Radio-K7 stéréo avec lecteur CD 2x16 W', 1595.0000, 1, 0.206, 'SON');
INSERT INTO `produits` VALUES (15, 'Baladeur radio-K7 - Autoreverse - Dolby B', 650.0000, 1, 0.206, 'SON');
INSERT INTO `produits` VALUES (16, 'Baladeur lecteur CD', 999.0000, 1, 0.206, 'SON');
INSERT INTO `produits` VALUES (17, 'Téléphone sans fil - 9 mémoires - Touche bis', 399.0000, 1, 0.206, 'TEL');
INSERT INTO `produits` VALUES (18, 'Téléphone sans fil - 9 mémoires - Ampli.', 590.0000, 1, 0.206, 'TEL');
INSERT INTO `produits` VALUES (19, 'Téléphone sans fil - 11 mémoires - Touche bis', 590.0000, 1, 0.206, 'TEL');
INSERT INTO `produits` VALUES (20, 'Téléphone sans fil numérique - Autonomie 40 H', 1490.0000, 1, 0.206, 'TEL');
INSERT INTO `produits` VALUES (21, 'Téléphone sans fil + 1 combiné supplémentaire', 895.0000, 1, 0.206, 'TEL');
INSERT INTO `produits` VALUES (22, 'Téléphone répondeur numérique', 1290.0000, 1, 0.206, 'TEL');
INSERT INTO `produits` VALUES (23, 'Répondeur-enregistreur numérique', 499.0000, 1, 0.206, 'TEL');
INSERT INTO `produits` VALUES (24, 'Phonefax - Affichage LCD - Transm. 1 p./22 s.', 1990.0000, 1, 0.206, 'TEL');
INSERT INTO `produits` VALUES (25, 'Phonefax - Transm. 1 p./23 s.', 2500.0000, 1, 0.206, 'TEL');
INSERT INTO `produits` VALUES (26, 'Phonefax - Reconnaissance auto. Télé./fax', 3990.0000, 1, 0.206, 'TEL');
INSERT INTO `produits` VALUES (27, 'Phonefax - Transmission 1 p./14 s.', 2990.0000, 1, 0.206, 'TEL');
INSERT INTO `produits` VALUES (28, 'Caméscope Ultra-compact VHS-C Secam Zoom 12 x', 3790.0000, 1, 0.206, 'VID');
INSERT INTO `produits` VALUES (29, 'Caméscope VHS Pal/Secam Zoom 24x', 6990.0000, 1, 0.206, 'VID');
INSERT INTO `produits` VALUES (30, 'Guide pratique de la vidéo amateur', 150.0000, 1, 0.055, 'VID');
INSERT INTO `produits` VALUES (31, 'Magnétoscope double cassette Pal/Secam', 3990.0000, 1, 0.206, 'VID');
INSERT INTO `produits` VALUES (32, 'Magnétoscope Hifi Stéréo Nicam 4 têtes', 2990.0000, 1, 0.206, 'VID');
INSERT INTO `produits` VALUES (34, 'Word', 250.0000, 1, 0.2, 'LOG');
INSERT INTO `produits` VALUES (35, 'Excel', 300.0000, 1, 0.2, 'LOG');
INSERT INTO `produits` VALUES (36, 'Access', 320.0000, 1, 0.2, 'LOG');
INSERT INTO `produits` VALUES (37, 'Excel', 350.0000, 1, 0.2, 'LOG');
INSERT INTO `produits` VALUES (38, 'Windows', 100.0000, 1, 0.2, 'LOG');

-- ----------------------------
-- Table structure for vendeurs
-- ----------------------------
DROP TABLE IF EXISTS `vendeurs`;
CREATE TABLE `vendeurs`  (
  `Id_vendeur` int(11) NOT NULL,
  `Prenom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Nom` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `salaire` double NULL DEFAULT NULL,
  `Fonction` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id_vendeur`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vendeurs
-- ----------------------------
INSERT INTO `vendeurs` VALUES (1, 'Alain', 'FAVRE', '06 55 44 77 32', 2530, 'VRP');
INSERT INTO `vendeurs` VALUES (2, 'Zoé', 'DUFOUR', '07 52 52 14 23', 3200, 'Commercial');
INSERT INTO `vendeurs` VALUES (3, 'Pierre', 'PROST', '06 55 44 11 22', 2002, 'Commercial');
INSERT INTO `vendeurs` VALUES (4, 'Julie', 'POMME', '07 57 45 56 85', 660, 'Directeur');

SET FOREIGN_KEY_CHECKS = 1;
