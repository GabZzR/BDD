
-- -----------------------------------------------------
-- Data for table `imprim3D`.`commande`
-- -----------------------------------------------------
START TRANSACTION;
USE `imprim3D`;
INSERT INTO `imprim3D`.`commande` (`idcommande`, `vendeur`, `acheteur`, `objet`, `statut`, `date_creation`, `maj`) VALUES (1, 1, 1, 1, 1, '2022-03-15', '2022-03-22');

COMMIT;


-- -----------------------------------------------------
-- Data for table `imprim3D`.`vendeur`
-- -----------------------------------------------------
START TRANSACTION;
USE `imprim3D`;
INSERT INTO `imprim3D`.`vendeur` (`idvendeur`, `nom`, `age`, `genre`, `date_arrive`, `nb_vente`) VALUES (1, 'Robert', '51', 'Homme', '2021-08-09', 29);

COMMIT;


-- -----------------------------------------------------
-- Data for table `imprim3D`.`acheteur`
-- -----------------------------------------------------
START TRANSACTION;
USE `imprim3D`;
INSERT INTO `imprim3D`.`acheteur` (`idacheteur`, `nom`, `age`, `genre`, `date_insci`, `nb_commande`) VALUES (1, 'Michel', '62', 'Homme', '2018-07-21', 16);

COMMIT;


-- -----------------------------------------------------
-- Data for table `imprim3D`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `imprim3D`;
INSERT INTO `imprim3D`.`user` (`iduser`, `vendeur`, `acheteur`) VALUES (1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `imprim3D`.`objet`
-- -----------------------------------------------------
START TRANSACTION;
USE `imprim3D`;
INSERT INTO `imprim3D`.`objet` (`idobjet`, `matiere`, `couleur`, `longueur`, `largeur`, `profondeur`, `prix`) VALUES (1, 1, 1, 10, 10, 10, 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `imprim3D`.`statut`
-- -----------------------------------------------------
START TRANSACTION;
USE `imprim3D`;
INSERT INTO `imprim3D`.`statut` (`idstatut`, `type_statut`) VALUES (1, 'ANNULE');
INSERT INTO `imprim3D`.`statut` (`idstatut`, `type_statut`) VALUES (2, 'CONFIRME');
INSERT INTO `imprim3D`.`statut` (`idstatut`, `type_statut`) VALUES (3, 'ARCHIVE');
INSERT INTO `imprim3D`.`statut` (`idstatut`, `type_statut`) VALUES (4, 'EN COURS');
INSERT INTO `imprim3D`.`statut` (`idstatut`, `type_statut`) VALUES (5, 'TERMINE');

COMMIT;


-- -----------------------------------------------------
-- Data for table `imprim3D`.`matiere`
-- -----------------------------------------------------
START TRANSACTION;
USE `imprim3D`;
INSERT INTO `imprim3D`.`matiere` (`idmatiere`, `type_matiere`) VALUES (1, 'PLA');
INSERT INTO `imprim3D`.`matiere` (`idmatiere`, `type_matiere`) VALUES (2, 'ABS');
INSERT INTO `imprim3D`.`matiere` (`idmatiere`, `type_matiere`) VALUES (3, 'PVA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `imprim3D`.`couleur`
-- -----------------------------------------------------
START TRANSACTION;
USE `imprim3D`;
INSERT INTO `imprim3D`.`couleur` (`idcouleur`, `couleurcol`) VALUES (1, 'noir');
INSERT INTO `imprim3D`.`couleur` (`idcouleur`, `couleurcol`) VALUES (2, 'blanc');
INSERT INTO `imprim3D`.`couleur` (`idcouleur`, `couleurcol`) VALUES (3, 'or');
INSERT INTO `imprim3D`.`couleur` (`idcouleur`, `couleurcol`) VALUES (4, 'argent');
INSERT INTO `imprim3D`.`couleur` (`idcouleur`, `couleurcol`) VALUES (5, 'violet');
INSERT INTO `imprim3D`.`couleur` (`idcouleur`, `couleurcol`) VALUES (6, 'vert');

COMMIT;

