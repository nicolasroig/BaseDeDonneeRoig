-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 01 Mars 2021 à 21:22
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `roig_nicolas_info_1a`
--
-- Database: NOM_PRENOM_INFO1X_SUJET_BD_104
-- Détection si une autre base de donnée du même nom existe

DROP DATABASE if exists roig_nicolas_info_1a;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS roig_nicolas_info_1a;

-- Utilisation de cette base de donnée

USE roig_nicolas_info_1a;
-- --------------------------------------------------------

--
-- Structure de la table `t_client`
--

CREATE TABLE `t_client` (
  `Id_client` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_client`
--

INSERT INTO `t_client` (`Id_client`, `nom`, `prenom`) VALUES
(1, 'Wick', 'John');

-- --------------------------------------------------------

--
-- Structure de la table `t_materiel`
--

CREATE TABLE `t_materiel` (
  `Id_materiel` int(11) NOT NULL,
  `materiel` tinytext NOT NULL,
  `type_de_materiel` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_preter_materiel`
--

CREATE TABLE `t_preter_materiel` (
  `Id_preter_materiel` int(11) NOT NULL,
  `Etat_avant_pret` text NOT NULL,
  `date_pret` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_materiel` int(11) NOT NULL,
  `fk_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_retour_materiel`
--

CREATE TABLE `t_retour_materiel` (
  `Id_retour_materiel` int(11) NOT NULL,
  `date_retour` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `etat_apres` text NOT NULL,
  `fk_materiel` int(11) NOT NULL,
  `fk_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_retour_materiel`
--

INSERT INTO `t_retour_materiel` (`Id_retour_materiel`, `date_retour`, `etat_apres`, `fk_materiel`, `fk_client`) VALUES
(3, '2021-03-01 21:20:21', 'Yo', 1, 1),
(4, '2021-03-01 21:20:21', 'yo', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_technicien`
--

CREATE TABLE `t_technicien` (
  `Id_technicien` int(11) NOT NULL,
  `technicien` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `t_client`
--
ALTER TABLE `t_client`
  ADD PRIMARY KEY (`Id_client`);

--
-- Index pour la table `t_materiel`
--
ALTER TABLE `t_materiel`
  ADD PRIMARY KEY (`Id_materiel`);

--
-- Index pour la table `t_preter_materiel`
--
ALTER TABLE `t_preter_materiel`
  ADD PRIMARY KEY (`Id_preter_materiel`),
  ADD KEY `fk_materiel` (`fk_materiel`),
  ADD KEY `fk_client` (`fk_client`);

--
-- Index pour la table `t_retour_materiel`
--
ALTER TABLE `t_retour_materiel`
  ADD PRIMARY KEY (`Id_retour_materiel`),
  ADD KEY `fk_materiel` (`fk_materiel`),
  ADD KEY `fk_client` (`fk_client`);

--
-- Index pour la table `t_technicien`
--
ALTER TABLE `t_technicien`
  ADD PRIMARY KEY (`Id_technicien`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `t_client`
--
ALTER TABLE `t_client`
  MODIFY `Id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `t_materiel`
--
ALTER TABLE `t_materiel`
  MODIFY `Id_materiel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_preter_materiel`
--
ALTER TABLE `t_preter_materiel`
  MODIFY `Id_preter_materiel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_retour_materiel`
--
ALTER TABLE `t_retour_materiel`
  MODIFY `Id_retour_materiel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `t_technicien`
--
ALTER TABLE `t_technicien`
  MODIFY `Id_technicien` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
