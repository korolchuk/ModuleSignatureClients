DROP database if exists signature_clients;

CREATE DATABASE `signature_clients`;

use signature_clients;

CREATE TABLE `pays` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `nationalite` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `pays` VALUES 
(1,'France','Française'),
(2,'Belgique','Belge'),
(3, 'Allemagne', 'Allemande'),
(4, 'Italie', 'Italienne');                ;

CREATE TABLE `ville` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cp` varchar(5),
  `nom` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `ville` VALUES 
(1,'69000','Lyon'),
(2,'75000','Paris'),
(3,'13000','Marseille'),
(4,'86000','Poitiers'),
(5,'74000','Annecy'),
(6,'06429','Isola 2000');

CREATE TABLE `type_marital` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_marital` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `type_marital` VALUES 
(1,'célibataire'),
(2,'marié\(e\)'), 
(3, 'divorcé\(e\)'), 
(4, 'veuf\(ve\)'), 
(5, 'séparé\(e\) de corps');

CREATE TABLE `type_evenement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `evenement` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `type_evenement` VALUES 
(1,'Mariage'),
(2,'Divorce'), 
(3, 'Veuvage'), 
(4, 'PACS'), 
(5, 'Rupture de PACS'), 
(6, 'Séparation de corps');

CREATE TABLE `lieu_mariage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lieu` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `lieu_mariage` VALUES 
(1,'mairie'), 
(2,'consulat'), 
(3,'autre autorité');

CREATE TABLE `cause_rupture_PACS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cause` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `cause_rupture_PACS` VALUES 
(1,'mariage'), 
(2,'rupture'), 
(3,'décès'), 
(4,'rupture');

CREATE TABLE `type_PACS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `type_PACS` VALUES 
(1,'authentique'), 
(2,'SSP déposé'), 
(3,'SSP non déposé');

CREATE TABLE `regime_mariage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `regime_mariage` VALUES 
(1,'communauté légale réduite aux acquets'), 
(2,'communauté légale meubles et acquets'), 
(3,'communauté conventionnelle réduite aux acquets'),
(4,'communauté conventionnelle meubles et acquets'), 
(5,'communauté conventionnelle meubles et acquets'), 
(6,'séparation de biens'), 
(7,'séparation de biens avec société acquets'), 
(8,'participation aux acquets'), 
(9,'autre régime français');

CREATE TABLE `divorce_rendu_par` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rendu_par` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `divorce_rendu_par` VALUES 
(1,'tribunal de grande instance'), 
(2,'cour d\'appel');

CREATE TABLE `civilite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `civilite` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `civilite` VALUES 
(1,'M'), 
(2,'Mme'), 
(3,'Mlle');

CREATE TABLE `capacite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `capacite` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `capacite` VALUES 
(1,'capable'), 
(2,'tutelle'), 
(3,'curatelle'), 
(4,'sauvegarde de justice'), 
(5,'habilitation familiale');

CREATE TABLE `statut` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statut` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `statut` VALUES 
(1,'résident'), 
(2,'résident UE'), 
(3,'non résident');

CREATE TABLE `categorie` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT,
   `categorie` varchar(200) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `categorie` VALUES
(1,'général'),
(2,'document d\'arpentage'),
(3,'titre de propriété'),
(4,'donation'),
(5,'testament'),
(6,'acte de mariage');

CREATE TABLE `document` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `libelle` varchar(200) NOT NULL,
  `id_categorie` bigint(20) DEFAULT NULL,
  `type_doc` varchar(200) NOT NULL,
  `date_enregistrement` date NOT NULL,
  `lien_vers_contenu` varchar(200) NOT NULL,
  `id_client` bigint(20) NOT NULL,
  CONSTRAINT `fk_document_id_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `document` VALUES
(1,'201901_factureGaz', 1, 'txt', '2019-02-16', 'archiveClients\\1\\', 1),
(2,'20010905_certificatMariage', 6, 'txt', '2018-06-07', 'archiveClients\\2\\', 2),
(3,'201805_factureTelephone', 1, 'txt', '2018-06-07', 'archiveClients\\2\\', 2),
(4,'200208_acteProprieteMaison', 3, 'txt', '2018-06-07', 'archiveClients\\2\\', 2);

CREATE TABLE `deces` (
  `id_personne` bigint(20) NOT NULL,
  `date_deces` date NOT NULL,
  `ville_etrangere` varchar(200) DEFAULT NULL,
  `commentaire` varchar(200) DEFAULT NULL,
  `id_ville` bigint(20) DEFAULT NULL,
  `id_pays` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_personne`), 
  CONSTRAINT `fk_deces_id_pays` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION, 
  CONSTRAINT `fk_deces_id_ville` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `deces` VALUES 
(1,'2019-02-21', null, 'décès à l\'hôpital', 1, 1);

CREATE TABLE `adresse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `est_principale` boolean NOT NULL,
  `num` int(4) DEFAULT NULL,
  `ordre_voie` varchar(5) DEFAULT NULL,
  `type_voie` varchar(15) DEFAULT NULL,
  `nom_voie` varchar(200) NOT NULL,
  `complement1` varchar(200) DEFAULT NULL,
  `complement2` varchar(200) DEFAULT NULL,
  `lieu_dit` varchar(200) DEFAULT NULL,
  `spf` varchar(200) DEFAULT NULL,
  `ville_etrangere` varchar(200) DEFAULT NULL,
  `id_ville` bigint(20) NOT NULL,
  `id_pays` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_personne_id_ville` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION, 
  CONSTRAINT `fk_personne_id_pays` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `adresse` VALUES 
(1, true, 4, 'bis', 'rue', 'Louis XIV', null, null, null, null, null, 1, 1),
(2, true, 5, 'ter', 'avenue', 'Napoléon Bonarparte', null, null, null, null, null, 2, 1),
(3, true, 6, null, 'rue', 'Voltaire', null, null, null, null, null, 3, 1),
(4, false, 2, null, 'rue', 'Ada Lovelace', null, null, null, null, null, 4, 1),
(5, true, 12, null, 'rue', 'Tim Berners-Lee', null, null, null, null, null, 5, 1),
(6, false, '3565', null, 'route', 'des cîmes', 'le chalet bleu', null, 'La montagne penchée', null, null, 6, 1);

CREATE TABLE `historique` (
  `id_client` bigint(20) NOT NULL,
  `id_evenement` bigint(20) NOT NULL,
  PRIMARY KEY (`id_client`, `id_evenement`),
  KEY `fk_historique_id_client_idx` (`id_client`),
  KEY `fk_historique_id_evenement_idx` (`id_evenement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `historique` 
VALUES 
(1, 1),
(2, 2);

CREATE TABLE `habitation` (
  `id_personne` bigint(20) NOT NULL,
  `id_adresse` bigint(20) NOT NULL,
  PRIMARY KEY (`id_personne`, `id_adresse`),
  KEY `fk_habitation_id_personne_idx` (`id_personne`),
  KEY `fk_habitation_id_adresse_idx` (`id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `evenement` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `id_type_evenement` bigint(20) DEFAULT NULL,
  `id_type_PACS` bigint(20) default null, 
  `date_evt` date DEFAULT NULL,
  `jugement_divorce_date` date DEFAULT NULL,
  `comment_separation` varchar(200) DEFAULT NULL,
  `ville_etrangere_mariage` varchar(200) DEFAULT NULL,
  `id_cause_rupture_PACS` bigint(20) DEFAULT NULL,
  `notaire` varchar(50) DEFAULT NULL,
  `id_divorce_rendu_par` bigint(20) DEFAULT NULL,
  `id_lieu_mariage` bigint(20) DEFAULT NULL,
  `id_regime_mariage` bigint(20) DEFAULT NULL,
  `id_pays_mariage` bigint(20) DEFAULT NULL,
  `id_ville` bigint(20) DEFAULT NULL,
  `id_conjoint` bigint(20) DEFAULT NULL,
  CONSTRAINT `fk_evenement_id_type_evenement` FOREIGN KEY (`id_type_evenement`) REFERENCES `type_evenement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evenement_id_cause_rupture_PACS` FOREIGN KEY (`id_cause_rupture_PACS`) REFERENCES `cause_rupture_pacs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evenement_id_type_PACS` FOREIGN KEY (`id_type_PACS`) REFERENCES `type_PACS` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evenement_id_divorce_rendu_par` FOREIGN KEY (`id_divorce_rendu_par`) REFERENCES `divorce_rendu_par` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION, 
  CONSTRAINT `fk_evenement_id_lieu_mariage` FOREIGN KEY (`id_lieu_mariage`) REFERENCES `lieu_mariage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evenement_id_regime_mariage` FOREIGN KEY (`id_regime_mariage`) REFERENCES `regime_mariage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evenement_id_pays_mariage` FOREIGN KEY (`id_pays_mariage`) REFERENCES `pays` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evenement_id_ville` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `evenement` (`id`, `id_type_evenement`, `id_conjoint`)
VALUES 
(1, 1, null),
(2, 2, 3);

CREATE TABLE `personne` (
  `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `est_client` boolean NOT NULL,
  `id_civilite` bigint(20) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `prenoms` varchar(200) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `ville_etrangere_naissance` varchar(50) DEFAULT NULL,
  `nationalite` varchar(50) DEFAULT NULL,
  `profession` varchar(200) DEFAULT NULL,
  `nom_usuel` varchar(200) DEFAULT NULL,
  `prenom_usuel` varchar(200) DEFAULT NULL,
  `id_type_marital` bigint(20) NOT NULL,
  `est_pacse` boolean NOT NULL,
  `id_conjoint` bigint(20) DEFAULT NULL,
  `date_liaison` date DEFAULT NULL,
  `clerc_referent` varchar(200) DEFAULT NULL,
  `notaire_referent` varchar(200) DEFAULT NULL,
  `date_modif_fiche` date DEFAULT NULL,
  `telephone` varchar(200) DEFAULT NULL,
  `comment_telephone` varchar(200) DEFAULT NULL,
  `telephone_pro` varchar(200) DEFAULT NULL,
  `comment_telephone_pro` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `comment_email` varchar(200) DEFAULT NULL,
  `email_pro` varchar(200) DEFAULT NULL,
  `comment_email_pro` varchar(200) DEFAULT NULL,
  `fax` varchar(200) DEFAULT NULL,
  `comment_fax` varchar(200) DEFAULT NULL,
  `site_web` varchar(200) DEFAULT NULL,
  `comment_site_web` varchar(20) DEFAULT NULL,
  `id_statut` bigint(20) NOT NULL,
  `id_pays_naissance` bigint(20) NOT NULL,
  `id_ville_naissance` bigint(20) DEFAULT NULL,
  `id_capacite` bigint(20) NOT NULL,
  CONSTRAINT `fk_personne_id_civilite` FOREIGN KEY (`id_civilite`) REFERENCES `civilite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personne_id_type_marital` FOREIGN KEY (`id_type_marital`) REFERENCES `type_marital` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personne_id_conjoint` FOREIGN KEY (`id_conjoint`) REFERENCES `personne` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personne_id_statut` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personne_id_pays_naissance` FOREIGN KEY (`id_pays_naissance`) REFERENCES `pays` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personne_id_ville_naissance` FOREIGN KEY (`id_ville_naissance`) REFERENCES `ville` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personne_id_capacite` FOREIGN KEY (`id_capacite`) REFERENCES `capacite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `personne`
(id, est_client, nom, nom_usuel, prenoms, id_type_marital, est_pacse, id_conjoint, date_liaison, telephone, email, date_modif_fiche, id_civilite, id_capacite, id_statut, id_pays_naissance, id_ville_naissance, profession, date_naissance, nationalite, notaire_referent, clerc_referent)
VALUES 
(1, true, 'Dupont', null, 'Jean', 1, false, null, null, '0102030406', 'jean@epsi.fr', '2019-02-27', 1, 1, 1, 1, 1, 'ingénieur', '1960-09-05', 'Française', 'Leduc', 'Naciri'),
(2, true, 'Tapie', 'Martin', 'Julie', 2, false, null, '2001-09-05', '0475345657', 'julie@epsi.fr', '2019-02-19', 2, 1, 1, 1, 1, 'dentiste', '1975-07-29', 'Anglaise', 'Bellin', 'Lemaire' ),
(3, false, 'Martin', null, 'Michel', 2, false, 2, '2001-09-05', '0475345657', 'michel@epsi.fr', '2019-03-04', 1, 1, 1, 1, 1, 'professeur des écoles', '1977-09-30', 'Française', 'Leduc', 'Bergen'),
(4, true, 'Muche', null, 'Bernard', 1, false, null, null, '0440345467', 'bernard@epsi.fr', '2019-03-05', 1, 1, 2, 2, 1, 'agriculteur', '1965-03-05', null, 'Bellin', 'Naciri'),
(5, true, 'Biche', null, 'Jules', 1, false, null, null, '0309890987', 'jules@epsi.fr', '2019-03-06', 1, 1, 1, 1, 1, 'manutentionnaire', '1985-11-05', null, 'Bellin', 'Lemaire');

UPDATE `personne` 
SET id_conjoint = 3, date_liaison = '2001-09-05' WHERE id=2;

INSERT INTO `habitation` 
VALUES 
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 5),
(2, 6),
(3, 6),
(1, 4);

ALTER TABLE `document`
ADD CONSTRAINT `fk_document_id_client` FOREIGN KEY (`id_client`) REFERENCES `personne` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `evenement`
ADD CONSTRAINT `fk_evenement_id_conjoint` FOREIGN KEY (`id_conjoint`) REFERENCES `personne` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `historique`
ADD CONSTRAINT `fk_historique_id_client` FOREIGN KEY (`id_client`) REFERENCES `personne` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_historique_id_evenement` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `deces`
ADD CONSTRAINT `fk_deces_id_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id`) ON DELETE cascade ON UPDATE NO ACTION;

ALTER TABLE `habitation`
ADD CONSTRAINT `fk_habitation_id_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION, 
ADD CONSTRAINT `fk_habitation_id_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


