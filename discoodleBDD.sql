-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 10 mai 2021 à 17:07
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
USE discoodle;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `email`, `usertype`, `class`) VALUES
(1, 'mail', '$2b$10$BaHsg8374G/aZGm9KvJdie196yTHtexPRuGYnA.0NQD2Y9h58d2Bm', 'mail@mail.fr', 0, 0),
(2, 'dany', '$2b$10$KqwEw4u824t6vk2tv/mlA.pov0vBJvrdJgPdIWiPopmyivkmy/fIK', 'dany@mail.fr', 0, 0),
(3, 'louis', '$2b$10$GFo0l84Yy3c2nNp3kYE1A.KYlKCbn9ZVZDL6M8r1HA4fvRd6PT0LW', 'louis@mail.fr', 0, 0),
(4, 'bab', '$2b$10$DXLjGZcGzDGnn552SjqnNeS8OqevfpxSJsFDozVjuPxlfe3B1urbC', 'bab@bab.fr', 0, 0),
(5, 'pass', '$2b$10$c1TyOf/2BbvWnQKbQrPlcuoQITcU.FNkMwbAWpYCBgqi4pUqGtdsi', 'pass@mail.com', 0, 0),
(6, 'dany', '$2b$10$fCx4K0bqSgrf4odkhOm1Y.zcCH0zMahlPktSWBwiqpdokA8Y4CEMq', 'rayanoo1302@gmail.com', 0, 0);

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
-- Structure de la table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id_classe` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_classe` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_classe`),
  KEY `fk_classes_users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id_cours` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_cours` varchar(255) NOT NULL,
  `id_classe` int(11) NOT NULL,
  PRIMARY KEY (`id_cours`),
  KEY `fk_cours_classes` (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
('mail', 'salut', '4V3U6euaCaAThwjIAAAH', '2021-04-16 00:00:51', '0'),
('mail', 'salut', 'YE2P6y5hvPL9_lYiAAAX', '2021-04-16 09:13:03', '0'),
('mail', 'ca va ', 'YE2P6y5hvPL9_lYiAAAX', '2021-04-16 09:13:04', '0'),
('mail', 'tu fais quoi', 'YE2P6y5hvPL9_lYiAAAX', '2021-04-16 09:13:07', '0'),
('dany', 'qs', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:25', '0'),
('dany', '', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:25', '0'),
('dany', 'asc', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:25', '0'),
('dany', 'c', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:26', '0'),
('dany', 'cs', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:26', '0'),
('dany', 'acs', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:26', '0'),
('dany', 'aasc', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:26', '0'),
('dany', 'acs', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:26', '0'),
('dany', '', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:26', '0'),
('dany', 'cas', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:26', '0'),
('dany', 'ascacs', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:27', '0'),
('dany', 'ac', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:27', '0'),
('dany', 'scas', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:27', '0'),
('dany', 'csaCSACAS', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:31', '0'),
('dany', 'sac', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:31', '0'),
('dany', '', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:32', '0'),
('dany', 'asc', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:32', '0'),
('dany', 'cas', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:32', '0'),
('dany', 'cs', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:32', '0'),
('dany', 'csa', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:32', '0'),
('dany', 'csa', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:33', '0'),
('dany', 'c', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:34', '0'),
('dany', 'c', 'jPRJr6B7S80lvIJMAAAD', '2021-04-21 08:52:35', '0'),
('dany', 'qwdd', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:52:58', '0'),
('dany', 'ww', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:52:59', '0'),
('dany', 'dqwdq', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:52:59', '0'),
('dany', 'qwd', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:52:59', '0'),
('dany', 'qwd', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:52:59', '0'),
('dany', 'qdw', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:52:59', '0'),
('dany', 'qdwqw', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:52:59', '0'),
('dany', 'dqw', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:00', '0'),
('dany', 'dq', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:00', '0'),
('dany', 'dwq', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:00', '0'),
('dany', 'dwq', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:00', '0'),
('dany', 'dwqdw', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:00', '0'),
('dany', 'qdw', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:00', '0'),
('dany', 'qw', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:01', '0'),
('dany', 'dqwd', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:01', '0'),
('dany', 'qwd', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:01', '0'),
('dany', 'qdw', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:01', '0'),
('dany', 'qdw', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:01', '0'),
('dany', '', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:01', '0'),
('dany', 'qdwdwqwdq', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:04', '0'),
('dany', 'dw', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:04', '0'),
('dany', 'qdw', 'U7yrwEn_iuw6kUjRAAAF', '2021-04-21 08:53:04', '0'),
('dany', 'qwddwq', 'nqjDAPiw0rHjVtqCAAAJ', '2021-04-21 08:53:27', '0'),
('dany', 'salut', 'nqjDAPiw0rHjVtqCAAAJ', '2021-04-21 08:53:33', '0'),
('dany', 'ca av ', 'nqjDAPiw0rHjVtqCAAAJ', '2021-04-21 08:53:34', '0'),
('dany', '', 'nqjDAPiw0rHjVtqCAAAJ', '2021-04-21 08:53:35', '0'),
('dany', 'd', 'nqjDAPiw0rHjVtqCAAAJ', '2021-04-21 08:53:37', '0'),
('dany', 'qdw', 'nqjDAPiw0rHjVtqCAAAJ', '2021-04-21 08:53:41', '0'),
('dany', 'qdw', 'nqjDAPiw0rHjVtqCAAAJ', '2021-04-21 08:53:42', '0'),
('dany', 'dqw', 'nqjDAPiw0rHjVtqCAAAJ', '2021-04-21 08:53:42', '0'),
('dany', 'dwq', 'nqjDAPiw0rHjVtqCAAAJ', '2021-04-21 08:53:43', '0'),
('dany', 'ca va ', 'nqjDAPiw0rHjVtqCAAAJ', '2021-04-21 08:53:55', '0'),
('dany', 'tu fais quoi', 'nqjDAPiw0rHjVtqCAAAJ', '2021-04-21 08:54:03', '0'),
('dany', 'salut ca va ', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:03', '0'),
('dany', 'tu', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:05', '0'),
('dany', '', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:05', '0'),
('dany', '', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:05', '0'),
('dany', '', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:05', '0'),
('dany', '', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:06', '0'),
('dany', 'd', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:06', '0'),
('dany', 'd', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:07', '0'),
('dany', '', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:08', '0'),
('dany', 'ff', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:22', '0'),
('dany', 'f', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:23', '0'),
('dany', 'f', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:23', '0'),
('dany', 'f', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:23', '0'),
('dany', 'f', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:23', '0'),
('dany', 'f', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:23', '0'),
('dany', 'f', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:24', '0'),
('dany', '', 'jmN_LziOdkQzxkRCAAAT', '2021-04-21 08:56:24', '0'),
('dany', 'ici les images marche bien en vrai', 'EReF5WURs5fIzDHmAAAV', '2021-04-21 08:57:08', '0'),
('dany', 'je trouve ', 'EReF5WURs5fIzDHmAAAV', '2021-04-21 08:57:10', '0'),
('dany', 'qdw', 'EReF5WURs5fIzDHmAAAV', '2021-04-21 08:57:12', '0'),
('dany', '', 'EReF5WURs5fIzDHmAAAV', '2021-04-21 08:57:12', '0'),
('dany', 'y a du retard ', 'EReF5WURs5fIzDHmAAAV', '2021-04-21 08:57:16', '0'),
('dany', 'sah ', 'EReF5WURs5fIzDHmAAAV', '2021-04-21 08:57:17', '0'),
('dany', '<3', 'EReF5WURs5fIzDHmAAAV', '2021-04-21 08:57:39', '0'),
('louis', 'salut ', 'jRja0MoKc8btnxvqAAAF', '2021-05-06 11:00:26', '0'),
('louis', 'ca va ', 'jRja0MoKc8btnxvqAAAF', '2021-05-06 11:00:28', '0'),
('louis', 'ljewdfbnkjlefewf', 'Eaat2IGPKEZSI9GSAAAN', '2021-05-06 11:01:25', '0'),
('louis', 'ewf', 'Eaat2IGPKEZSI9GSAAAN', '2021-05-06 11:01:25', '0'),
('louis', 'few', 'Eaat2IGPKEZSI9GSAAAN', '2021-05-06 11:01:25', '0'),
('louis', 'efw', 'Eaat2IGPKEZSI9GSAAAN', '2021-05-06 11:01:25', '0'),
('rayane', 'salut', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:04:15', '0'),
('rayane', 'salut ca va tu vas bien ?', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:22', '0'),
('rayane', 'dqw', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:23', '0'),
('rayane', 'dqw', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:23', '0'),
('rayane', '', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:23', '0'),
('rayane', 'wdq', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:24', '0'),
('rayane', 'dqw', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:24', '0'),
('rayane', 'qwd', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:24', '0'),
('rayane', 'wdq', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:24', '0'),
('rayane', 'dqw', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:24', '0'),
('rayane', 'dw', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:24', '0'),
('rayane', 'dwq', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:24', '0'),
('rayane', 'je ne sais pas pk ', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:29', '0'),
('rayane', 'ca marche pas', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:33', '0'),
('rayane', 'oui', 'RkC9RqdhhcdtSq7jAAAH', '2021-05-08 17:05:35', '0'),
('test', '<h1>test</h1>', 'WdESFvpDOhhNj8n8AAAH', '2021-05-09 13:21:05', '0'),
('test', '😃', 'WdESFvpDOhhNj8n8AAAH', '2021-05-09 13:21:17', '0'),
('test', '🔥', 'WdESFvpDOhhNj8n8AAAH', '2021-05-09 13:21:20', '0'),
('test', 'salut', 'P2W5r7KlHVkgsTDwAAAR', '2021-05-09 13:38:35', '0'),
('test', 'ca va ?', 'P2W5r7KlHVkgsTDwAAAR', '2021-05-09 13:38:38', '0'),
('test', 'tu fais quoi ?', 'P2W5r7KlHVkgsTDwAAAR', '2021-05-09 13:38:40', '0'),
('test', 'kmhadefbwkhjbs', 'P2W5r7KlHVkgsTDwAAAR', '2021-05-09 13:39:07', '0'),
('test', '<h1> test</h1>', 'P2W5r7KlHVkgsTDwAAAR', '2021-05-09 13:39:33', '0'),
('dany', 'dw', 'FrmJkQANGza-rqpkAAAH', '2021-05-10 14:37:14', 'Progra0'),
('dany', 'qdw', 'FrmJkQANGza-rqpkAAAH', '2021-05-10 14:37:14', 'Progra0'),
('dany', 'q', 'FrmJkQANGza-rqpkAAAH', '2021-05-10 14:37:14', 'Progra0'),
('dany', 'dqw', 'FrmJkQANGza-rqpkAAAH', '2021-05-10 14:37:14', 'Progra0'),
('dany', 'qwd', 'FrmJkQANGza-rqpkAAAH', '2021-05-10 14:37:14', 'Progra0'),
('dany', 'qwd', 'FrmJkQANGza-rqpkAAAH', '2021-05-10 14:37:14', 'Progra0'),
('dany', 'qwd', 'FrmJkQANGza-rqpkAAAH', '2021-05-10 14:37:14', 'Progra0'),
('dany', 'dqw', 'FrmJkQANGza-rqpkAAAH', '2021-05-10 14:37:14', 'Progra0'),
('dany', 'dqw', '49qY2uHtjm0TkEGaAAAJ', '2021-05-10 14:37:25', 'Cours C20'),
('dany', 'dwqdqw', '49qY2uHtjm0TkEGaAAAJ', '2021-05-10 14:37:25', 'Cours C20'),
('dany', 'dqw', '49qY2uHtjm0TkEGaAAAJ', '2021-05-10 14:37:25', 'Cours C20'),
('dany', 'dqw', '49qY2uHtjm0TkEGaAAAJ', '2021-05-10 14:37:25', 'Cours C20'),
('dany', 'dqw', '49qY2uHtjm0TkEGaAAAJ', '2021-05-10 14:37:26', 'Cours C20'),
('dany', 'qdw', '49qY2uHtjm0TkEGaAAAJ', '2021-05-10 14:37:26', 'Cours C20'),
('test', '<h1>test</h1>', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:24', 'Cours C20'),
('test', 'dqw', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:54', 'Cours C10'),
('test', 'd', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:54', 'Cours C10'),
('test', 'wq', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:54', 'Cours C10'),
('test', 'dwqdqw', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:55', 'Cours C10'),
('test', 'wdq', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:55', 'Cours C10'),
('test', 'dqw', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:55', 'Cours C10'),
('test', 'dqw', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:55', 'Cours C10'),
('test', 'dw', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:55', 'Cours C10'),
('test', 'q', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:55', 'Cours C10'),
('test', 'dwq', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:55', 'Cours C10'),
('test', 'dwqqwd', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:57', 'Cours C10'),
('test', 'dw', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:57', 'Cours C10'),
('test', '', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:57', 'Cours C10'),
('test', 'dwq', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:58', 'Cours C10'),
('test', 'qdw', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:58', 'Cours C10'),
('test', 'dqw', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:58', 'Cours C10'),
('test', 'qdw', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:58', 'Cours C10'),
('test', 'qwd', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:58', 'Cours C10'),
('test', 'dqw', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:58', 'Cours C10'),
('test', 'dqw', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:58', 'Cours C10'),
('test', '', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:46:58', 'Cours C10'),
('test', 'salut', 'kWSwm3WdKqwCSw2IAAAT', '2021-05-10 14:47:05', 'Cours C10'),
('test', 'dwqdqw', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:35', 'Progra0'),
('test', 'dqw', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:35', 'Progra0'),
('test', 'dqw', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:36', 'Progra0'),
('test', 'qwd', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:36', 'Progra0'),
('test', 'qdw', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:36', 'Progra0'),
('test', 'dqwdqwwqd', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:38', 'Progra0'),
('test', 'dqw', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:38', 'Progra0'),
('test', '', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:38', 'Progra0'),
('test', 'dqw', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:38', 'Progra0'),
('test', 'dqwwdq', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:40', 'Cours EA20'),
('test', 'dwq', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:40', 'Cours EA20'),
('test', 'dqw', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:40', 'Cours EA20'),
('test', '', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:40', 'Cours EA20'),
('test', 'qwd', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:41', 'Cours EA20'),
('test', 'dqw', 'oG4G76QTbxPI_r2YAAAH', '2021-05-10 16:52:42', 'Cours EA20'),
('test', 'dq', 'V9eGK2pB8uUG8RbBAAAP', '2021-05-10 16:54:31', 'Progra0'),
('test', 'wdw', 'V9eGK2pB8uUG8RbBAAAP', '2021-05-10 16:54:31', 'Progra0'),
('test', 'q', 'V9eGK2pB8uUG8RbBAAAP', '2021-05-10 16:54:31', 'Progra0'),
('test', 'dwq', 'V9eGK2pB8uUG8RbBAAAP', '2021-05-10 16:54:31', 'Progra0'),
('test', 'dqw', 'V9eGK2pB8uUG8RbBAAAP', '2021-05-10 16:54:31', 'Progra0'),
('test', 'qdw', 'V9eGK2pB8uUG8RbBAAAP', '2021-05-10 16:54:31', 'Progra0'),
('test', 'dqw', 'V9eGK2pB8uUG8RbBAAAP', '2021-05-10 16:54:32', 'Progra0'),
('test', 'dqw', 'V9eGK2pB8uUG8RbBAAAP', '2021-05-10 16:54:33', 'Progra0'),
('test', 'wdqdw', 'V9eGK2pB8uUG8RbBAAAP', '2021-05-10 16:54:36', 'Cours EA10'),
('test', 'qdwq', 'V9eGK2pB8uUG8RbBAAAP', '2021-05-10 16:54:36', 'Cours EA10'),
('test', 'dqw', 'V9eGK2pB8uUG8RbBAAAP', '2021-05-10 16:54:37', 'Cours EA10'),
('test', 'dqw', 'V9eGK2pB8uUG8RbBAAAP', '2021-05-10 16:54:47', 'Progra0'),
('test', '', 'e0hUztrTE-u4gnVEAAAV', '2021-05-10 16:56:01', 'Progra0'),
('test', '', 'e0hUztrTE-u4gnVEAAAV', '2021-05-10 16:56:01', 'Progra0'),
('test', 'efw', 'e0hUztrTE-u4gnVEAAAV', '2021-05-10 16:56:02', 'Progra0'),
('test', 'f', 'e0hUztrTE-u4gnVEAAAV', '2021-05-10 16:56:02', 'Progra0'),
('test', 'efw', 'e0hUztrTE-u4gnVEAAAV', '2021-05-10 16:56:02', 'Progra0'),
('test', 'few', 'e0hUztrTE-u4gnVEAAAV', '2021-05-10 16:56:02', 'Progra0'),
('test', 'dwq', '8CZtIC4TAQ3frSOlAAAJ', '2021-05-10 16:59:26', 'Progra0'),
('test', 'dqw', '8CZtIC4TAQ3frSOlAAAJ', '2021-05-10 16:59:26', 'Progra0'),
('test', 'dqw', '8CZtIC4TAQ3frSOlAAAJ', '2021-05-10 16:59:26', 'Progra0'),
('test', 'dqw', '8CZtIC4TAQ3frSOlAAAJ', '2021-05-10 16:59:26', 'Progra0'),
('test', 'dqw', '8CZtIC4TAQ3frSOlAAAJ', '2021-05-10 16:59:26', 'Progra0'),
('test', 'ca va tu fais quoi ?', 'TAfm2U1Kyu0iZLShAAAP', '2021-05-10 16:59:42', 'Progra0');

-- --------------------------------------------------------

--
-- Structure de la table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id_module` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_module` varchar(255) NOT NULL,
  `id_cours` int(11) NOT NULL,
  PRIMARY KEY (`id_module`),
  KEY `fk_modules_cours` (`id_cours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `usertype` int(11) NOT NULL DEFAULT '0',
  `class` int(11) NOT NULL,
  `profile_picture` varchar(256) NOT NULL DEFAULT '/public/img/2439831.jpg',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `email`, `usertype`, `class`, `profile_picture`) VALUES
(1, 'rayane', '$2b$10$HQo47qNEROxtogrxMJMamOaYEYkXk0Nord3j8Era9Go6kOjA8zs/e', 'rayanoo1302@gmail.com', 0, 0, '/public/img/2439831.jpg'),
(2, 'test', '$2b$10$IXEJoLfoNRdc9ifxTLlHgeYoZ7WAMQgfNHbEjCxHFQeUAlxcLM5CG', 'rayane.kaabeche@etu.u-paris.fr', 0, 0, './img/4532468.jpg');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classes` (`id_classe`);

--
-- Contraintes pour la table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
