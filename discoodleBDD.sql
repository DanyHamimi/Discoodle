-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 16 avr. 2021 à 00:08
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `discoodle`
--

-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS discoodle;
CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '';
use discoodle;



--
-- Structure de la table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `usertype` int(11) NOT NULL DEFAULT '0',
  `class` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `email`, `usertype`, `class`) VALUES
(1, 'mail', '$2b$10$BaHsg8374G/aZGm9KvJdie196yTHtexPRuGYnA.0NQD2Y9h58d2Bm', 'mail@mail.fr', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `nom` varchar(600) NOT NULL,
  `contenu` varchar(6000) NOT NULL,
  `auteur` varchar(200) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idarticle` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`idarticle`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `nom` varchar(400) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class1` int(11) NOT NULL DEFAULT '-1',
  `class2` int(11) NOT NULL DEFAULT '-1',
  `class3` int(11) NOT NULL DEFAULT '-1',
  `class4` int(11) NOT NULL DEFAULT '-1',
  `class5` int(11) NOT NULL DEFAULT '-1',
  `idowner` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `img`
--

DROP TABLE IF EXISTS `img`;
CREATE TABLE IF NOT EXISTS `img` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message` varchar(2000) NOT NULL,
  `userid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(11) NOT NULL COMMENT '0 message, 1 image, 2 fichier',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `message_log`
--

DROP TABLE IF EXISTS `message_log`;
CREATE TABLE IF NOT EXISTS `message_log` (
  `username` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `channel` varchar(5000) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `message_log`
--

INSERT INTO `message_log` (`username`, `message`, `id`, `date`, `channel`) VALUES
('sasa', 'sa', 'JVTiCWCI1V9Ozl_FAAAD', '2021-04-09 01:11:16', ''),
('sasa', 's', 'JVTiCWCI1V9Ozl_FAAAD', '2021-04-09 01:11:17', ''),
('sasa', 'as', 'JVTiCWCI1V9Ozl_FAAAD', '2021-04-09 01:11:17', ''),
('sasa', 'a', 'JVTiCWCI1V9Ozl_FAAAD', '2021-04-09 01:11:17', ''),
('sasa', 'sa', 'JVTiCWCI1V9Ozl_FAAAD', '2021-04-09 01:11:17', ''),
('sasa', 's', 'JVTiCWCI1V9Ozl_FAAAD', '2021-04-09 01:11:17', ''),
('sasa', 'a', 'JVTiCWCI1V9Ozl_FAAAD', '2021-04-09 01:11:17', ''),
('sasa', 'sa', 'JVTiCWCI1V9Ozl_FAAAD', '2021-04-09 01:11:17', ''),
('sasa', 's', 'JVTiCWCI1V9Ozl_FAAAD', '2021-04-09 01:11:18', ''),
('sasa', 'a', 'JVTiCWCI1V9Ozl_FAAAD', '2021-04-09 01:11:18', ''),
('ezaeaz', 'eza', 'ByD6MuqiFGy47tCZAAAF', '2021-04-09 01:11:52', ''),
('ezaeaz', 'eaz', 'ByD6MuqiFGy47tCZAAAF', '2021-04-09 01:11:52', ''),
('ezaeaz', 'e', 'ByD6MuqiFGy47tCZAAAF', '2021-04-09 01:11:52', ''),
('ezaeaz', 'za', 'ByD6MuqiFGy47tCZAAAF', '2021-04-09 01:11:52', ''),
('ezaeaz', 'e', 'ByD6MuqiFGy47tCZAAAF', '2021-04-09 01:11:53', ''),
('ezaeaz', 'ezae', 'ByD6MuqiFGy47tCZAAAF', '2021-04-09 01:12:34', ''),
('ezaeaz', 'za', 'ByD6MuqiFGy47tCZAAAF', '2021-04-09 01:12:34', ''),
('ezaeaz', 'e', 'ByD6MuqiFGy47tCZAAAF', '2021-04-09 01:12:34', ''),
('ezaeaz', 'az', 'ByD6MuqiFGy47tCZAAAF', '2021-04-09 01:12:34', ''),
('mail', 'salut', 'p91TnymUT8FH04EqAAAL', '2021-04-15 17:33:22', ''),
('mail', 'salut', '0ZiodJ8I_NQwBH-BAAAF', '2021-04-15 23:29:23', '0'),
('mail', 'saluty', '0ZiodJ8I_NQwBH-BAAAF', '2021-04-15 23:29:25', '0'),
('mail', 'sqsq', 'Owe3eG596OkJRNKmAAAO', '2021-04-15 23:53:12', '0'),
('mail', 'sqsq', 'Owe3eG596OkJRNKmAAAO', '2021-04-15 23:53:13', '0'),
('mail', 'dsqdqsd', 'PQ00RhCabxYeYYtEAAAL', '2021-04-15 23:54:05', '0'),
('mail', 'qss', 'PQ00RhCabxYeYYtEAAAL', '2021-04-15 23:54:05', '0'),
('mail', 'dqs', 'PQ00RhCabxYeYYtEAAAL', '2021-04-15 23:54:05', '0'),
('mail', 'd', 'PQ00RhCabxYeYYtEAAAL', '2021-04-15 23:54:05', '0'),
('mail', 'qs', 'PQ00RhCabxYeYYtEAAAL', '2021-04-15 23:54:06', '0'),
('mail', 'zazaza', 'f3CF3A8-_2PwfrRfAAAP', '2021-04-15 23:54:11', '0'),
('mail', 'SASA', 'EUgCzASmCTAj38RBAAAT', '2021-04-15 23:55:11', '0'),
('mail', 'salut', '4V3U6euaCaAThwjIAAAH', '2021-04-16 00:00:51', '0');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
