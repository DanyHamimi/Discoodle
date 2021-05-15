-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 15 mai 2021 à 16:43
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

--
-- Structure de la table `accounts`
--
DROP DATABASE IF EXIST `discoodle`;
CREATE DATABASE IF NOT EXIST `discoodle`;
USE discoodle;
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
(6, 'dany', '$2b$10$fCx4K0bqSgrf4odkhOm1Y.zcCH0zMahlPktSWBwiqpdokA8Y4CEMq', 'rayanoo1302@gmail.com', 0, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`nom`, `contenu`, `auteur`, `date`, `idarticle`, `type`) VALUES
('test', 'salut ', 'test', '2021-05-11 16:06:59', 37, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `classes`
--

INSERT INTO `classes` (`id_classe`, `libelle_classe`, `id_user`) VALUES
(1, 'test', 1),
(3, 'test2', 2),
(6, 'dany', 2),
(10, 'test5', 3);

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
  KEY `fk_cours_classes` (`id_classe`),
  KEY `libelle_cours` (`libelle_cours`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id_cours`, `libelle_cours`, `id_classe`) VALUES
(1, 'eab', 1),
(2, 'rk', 1),
(3, 'dany', 1),
(4, 'progra', 1),
(6, 'rnld', 10),
(7, 'cr7', 10);

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
  `message` varchar(10000) NOT NULL,
  `id` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `channel` varchar(5000) NOT NULL DEFAULT '0',
  `user_id` varchar(256) NOT NULL DEFAULT '1',
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `message_log`
--

INSERT INTO `message_log` (`username`, `message`, `id`, `date`, `channel`, `user_id`) VALUES
('rayane', 'wqd', 'P6ac9UiJFTgFzfvpAAAZ', '2021-05-15 13:20:25', 'Progra0', '1'),
('rayane', 'wdq', 'P6ac9UiJFTgFzfvpAAAZ', '2021-05-15 13:20:25', 'Progra0', '1'),
('rayane', 'dwq', 'P6ac9UiJFTgFzfvpAAAZ', '2021-05-15 13:20:25', 'Progra0', '1'),
('rayane', 'dwq', 'P6ac9UiJFTgFzfvpAAAZ', '2021-05-15 13:20:25', 'Progra0', '1'),
('rayane', '', 'P6ac9UiJFTgFzfvpAAAZ', '2021-05-15 13:20:25', 'Progra0', '1'),
('rayane', 'wqddwq', 'P6ac9UiJFTgFzfvpAAAZ', '2021-05-15 13:20:28', 'test rk0', '1'),
('rayane', 'dwwdq', 'P6ac9UiJFTgFzfvpAAAZ', '2021-05-15 13:20:28', 'test rk0', '1'),
('rayane', 'dwqwd', 'P6ac9UiJFTgFzfvpAAAZ', '2021-05-15 13:20:28', 'test rk0', '1'),
('rayane', 'ca va ', 'P6ac9UiJFTgFzfvpAAAZ', '2021-05-15 13:20:34', 'test rk0', '1'),
('rayane', 'wdq', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:22:44', 'test rk20', '1'),
('rayane', 'dwqdqw', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:22:44', 'test rk20', '1'),
('rayane', 'dwq', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:22:47', 'test rk20', '1'),
('rayane', 'wdqdwqdqwdqwdqwdw', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:22:49', 'test rk20', '1'),
('rayane', 'dqw', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:30', 'test rk20', '1'),
('rayane', 'dw', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:30', 'test rk20', '1'),
('rayane', 'dw', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:30', 'test rk20', '1'),
('rayane', 'dqd', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:31', 'test rk20', '1'),
('rayane', 'qqw', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:31', 'test rk20', '1'),
('rayane', 'd', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:31', 'test rk20', '1'),
('rayane', 'dw', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:31', 'test rk20', '1'),
('rayane', 'dwq', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:31', 'test rk20', '1'),
('rayane', 'd', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:32', 'test rk20', '1'),
('rayane', 'd', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:32', 'test rk20', '1'),
('rayane', 'd', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:32', 'test rk20', '1'),
('rayane', '', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:32', 'test rk20', '1'),
('rayane', 'wwdqwqd', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:33', 'test rk20', '1'),
('rayane', 'wd', 'kLovItRvFwH1Wj-4AAAf', '2021-05-15 13:23:33', 'test rk20', '1'),
('rayane', 'wdq', '1BwbkSiceCfEww2BAABJ', '2021-05-15 14:11:56', 'abcdef0', '1'),
('rayane', 'dqw', '1BwbkSiceCfEww2BAABJ', '2021-05-15 14:11:56', 'abcdef0', '1'),
('rayane', 'dqwd', '1BwbkSiceCfEww2BAABJ', '2021-05-15 14:11:56', 'abcdef0', '1'),
('rayane', 'qwd', '1BwbkSiceCfEww2BAABJ', '2021-05-15 14:11:56', 'abcdef0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:40', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:40', 'toto0', '1'),
('rayane', '', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:41', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:41', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:41', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:41', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:41', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:41', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:41', 'toto0', '1'),
('rayane', 'dd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:42', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:42', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:42', 'toto0', '1'),
('rayane', '', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:42', 'toto0', '1'),
('rayane', 'ddd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:42', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:43', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:43', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:43', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:43', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:43', 'toto0', '1'),
('rayane', 'dd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:44', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:44', 'toto0', '1'),
('rayane', '', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:44', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:44', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:44', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:44', 'toto0', '1'),
('rayane', 'dd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:44', 'toto0', '1'),
('rayane', '', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:45', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:45', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:45', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:45', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:45', 'toto0', '1'),
('rayane', 'd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:45', 'toto0', '1'),
('rayane', 'ddd', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:46', 'toto0', '1'),
('rayane', '', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:46', 'toto0', '1'),
('rayane', '', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:46', 'toto0', '1'),
('rayane', 'dje ne ', 'YUg7hgTpvfUaDQhgAABP', '2021-05-15 14:13:47', 'toto0', '1'),
('rayane', 'dwq\'', 'V8bDWTj9ypyCz15gAABV', '2021-05-15 14:13:58', 'danychan0', '1'),
('rayane', 'qwd', 'V8bDWTj9ypyCz15gAABV', '2021-05-15 14:13:58', 'danychan0', '1'),
('rayane', 'dqwdqw', 'V8bDWTj9ypyCz15gAABV', '2021-05-15 14:13:58', 'danychan0', '1'),
('rayane', 'dqw', 'V8bDWTj9ypyCz15gAABV', '2021-05-15 14:13:58', 'danychan0', '1'),
('rayane', 'dqwwdq', 'V8bDWTj9ypyCz15gAABV', '2021-05-15 14:13:58', 'danychan0', '1'),
('rayane', 'dqw', 'V8bDWTj9ypyCz15gAABV', '2021-05-15 14:13:58', 'danychan0', '1'),
('rayane', 'dqw', 'V8bDWTj9ypyCz15gAABV', '2021-05-15 14:13:59', 'danychan0', '1'),
('rayane', 'dqw', 'V8bDWTj9ypyCz15gAABV', '2021-05-15 14:13:59', 'danychan0', '1'),
('rayane', 'dqw', 'V8bDWTj9ypyCz15gAABV', '2021-05-15 14:13:59', 'danychan0', '1'),
('rayane', 'dwqddw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:54', 'Progra0', '1'),
('rayane', 'dqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:54', 'Progra0', '1'),
('rayane', 'dqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:54', 'Progra0', '1'),
('rayane', 'dqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:54', 'Progra0', '1'),
('rayane', 'dqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:54', 'Progra0', '1'),
('rayane', '', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:54', 'Progra0', '1'),
('rayane', '', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:57', 'test rk0', '1'),
('rayane', 'qwd', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:57', 'test rk0', '1'),
('rayane', 'wdq', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:57', 'test rk0', '1'),
('rayane', 'dqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:57', 'test rk0', '1'),
('rayane', 'dqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:57', 'test rk0', '1'),
('rayane', 'dqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:57', 'test rk0', '1'),
('rayane', 'dqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:58', 'test rk0', '1'),
('rayane', 'dqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:58', 'test rk0', '1'),
('rayane', 'qdw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:58', 'test rk0', '1'),
('rayane', 'dqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:58', 'test rk0', '1'),
('rayane', 'dqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:58', 'test rk0', '1'),
('rayane', 'dqwd', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:58', 'test rk0', '1'),
('rayane', 'qwdqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:58', 'test rk0', '1'),
('rayane', 'qwd', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:59', 'test rk0', '1'),
('rayane', 'dqw', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:59', 'test rk0', '1'),
('rayane', 'dwq', 'KWJaq7IcimKapZRkAABz', '2021-05-15 15:25:59', 'test rk0', '1'),
('rayane', 'few', 'H37VgqYEImWf-y6_AABH', '2021-05-15 15:45:39', 'dany football cr70', '1'),
('rayane', 'f', 'H37VgqYEImWf-y6_AABH', '2021-05-15 15:45:39', 'dany football cr70', '1'),
('rayane', 'ewf', 'H37VgqYEImWf-y6_AABH', '2021-05-15 15:45:39', 'dany football cr70', '1'),
('rayane', 'efw', 'H37VgqYEImWf-y6_AABH', '2021-05-15 15:45:39', 'dany football cr70', '1'),
('rayane', 'efw', 'H37VgqYEImWf-y6_AABH', '2021-05-15 15:45:39', 'dany football cr70', '1'),
('rayane', 'wdq', 'a2KGrEBNfRBIvXzRAABN', '2021-05-15 15:46:14', 'dany football cr80', '1'),
('rayane', 'dwq', 'a2KGrEBNfRBIvXzRAABN', '2021-05-15 15:46:14', 'dany football cr80', '1'),
('rayane', 'dqw', 'a2KGrEBNfRBIvXzRAABN', '2021-05-15 15:46:14', 'dany football cr80', '1'),
('rayane', 'dqw', 'a2KGrEBNfRBIvXzRAABN', '2021-05-15 15:46:14', 'dany football cr80', '1'),
('rayane', 'dqw', 'a2KGrEBNfRBIvXzRAABN', '2021-05-15 15:46:15', 'dany football cr80', '1'),
('rayane', 'kjhkjhjkhj', 'Lh0cEGKRaUnfUYVNAAAb', '2021-05-15 16:19:02', 'le basket0', '1'),
('rayane', 'kjhjkhkj', 'Lh0cEGKRaUnfUYVNAAAb', '2021-05-15 16:19:03', 'le basket0', '1'),
('rayane', 'kjhkjhkjh', 'Lh0cEGKRaUnfUYVNAAAb', '2021-05-15 16:19:04', 'le basket0', '1'),
('rayane', 'hjkljhjl', 'Lh0cEGKRaUnfUYVNAAAb', '2021-05-15 16:19:05', 'le basket0', '1'),
('cr7', 'jhkgjhg', 'srGmcR3tA0TD2hzJAABP', '2021-05-15 16:21:05', 'toto0', '7'),
('cr7', 'jhvjhg', 'srGmcR3tA0TD2hzJAABP', '2021-05-15 16:21:05', 'toto0', '7'),
('cr7', 'kjhkj', 'srGmcR3tA0TD2hzJAABP', '2021-05-15 16:21:06', 'toto0', '7'),
('rayane', 'ca va /', 'tBM6XDukT-9CuzwsAAA3', '2021-05-15 16:21:15', 'toto0', '1'),
('cr7', 'dwqwdq', 'lln8P29sscCyE7_CAAAl', '2021-05-15 16:39:48', 'Progra0', '7'),
('cr7', 'dqw', 'lln8P29sscCyE7_CAAAl', '2021-05-15 16:39:48', 'Progra0', '7'),
('cr7', 'dqwdqw', 'lln8P29sscCyE7_CAAAl', '2021-05-15 16:39:48', 'Progra0', '7'),
('cr7', 'wqd', 'lln8P29sscCyE7_CAAAl', '2021-05-15 16:39:57', 'test rk0', '7'),
('cr7', 'dwq', 'lln8P29sscCyE7_CAAAl', '2021-05-15 16:39:58', 'test rk0', '7'),
('cr7', 'dwq', 'lln8P29sscCyE7_CAAAl', '2021-05-15 16:39:58', 'test rk0', '7'),
('cr7', 'dwq', 'lln8P29sscCyE7_CAAAl', '2021-05-15 16:39:58', 'test rk0', '7'),
('cr7', 'dwq', 'lln8P29sscCyE7_CAAAl', '2021-05-15 16:39:58', 'test rk0', '7'),
('a', 'wdq', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:44', 'abcdef0', '5'),
('a', 'dwq', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:44', 'abcdef0', '5'),
('a', 'dqw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:44', 'abcdef0', '5'),
('a', 'dqwqwd', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:47', 'abcdef0', '5'),
('a', 'dw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:47', 'abcdef0', '5'),
('a', 'dw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:47', 'abcdef0', '5'),
('a', 'qdq', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:47', 'abcdef0', '5'),
('a', 'w', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:47', 'abcdef0', '5'),
('a', 'dqw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:47', 'abcdef0', '5'),
('a', 'dqw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:47', 'abcdef0', '5'),
('a', 'dqw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:48', 'abcdef0', '5'),
('a', 'dqw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:48', 'abcdef0', '5'),
('a', 'dqw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:48', 'abcdef0', '5'),
('a', 'dwq', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:48', 'abcdef0', '5'),
('a', 'qwd', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:48', 'abcdef0', '5'),
('a', 'dwq', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:48', 'abcdef0', '5'),
('a', 'dqw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:48', 'abcdef0', '5'),
('a', 'dqw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:48', 'abcdef0', '5'),
('a', 'dwq', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:49', 'abcdef0', '5'),
('a', 'dqw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:49', 'abcdef0', '5'),
('a', 'dwq', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:49', 'abcdef0', '5'),
('a', 'dwq', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:49', 'abcdef0', '5'),
('a', 'dwq', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:49', 'abcdef0', '5'),
('a', 'dqw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:49', 'abcdef0', '5'),
('a', 'dqw', 'NH0nI29zO6gudGe6AABN', '2021-05-15 16:40:49', 'abcdef0', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `modules`
--

INSERT INTO `modules` (`id_module`, `libelle_module`, `id_cours`) VALUES
(1, 'test rk', 1),
(2, 'test rk2', 1),
(3, 'abcdef', 2),
(4, 'danychan', 3),
(5, 'toto', 4),
(6, 'alaz', 4),
(8, 'le basket', 6),
(11, 'dany football cr7', 6),
(12, 'dany football cr8', 7);

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
  PRIMARY KEY (`id_user`),
  KEY `profile_picture` (`profile_picture`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `email`, `usertype`, `class`, `profile_picture`) VALUES
(1, 'rayane', '$2b$10$HQo47qNEROxtogrxMJMamOaYEYkXk0Nord3j8Era9Go6kOjA8zs/e', 'rayanoo1302@gmail.com', 0, 1, './img/3196247.jpeg'),
(2, 'test', '$2b$10$IXEJoLfoNRdc9ifxTLlHgeYoZ7WAMQgfNHbEjCxHFQeUAlxcLM5CG', 'rayane.kaabeche@etu.u-paris.fr', 0, 0, './img/2459319.jpg'),
(3, 'dany', '$2b$10$4kU0eC89VXxhElSAvyfE6OFwZjv/V.ZZjncXrMqs6zMSPS7gpjJUq', 'dany@mail.fr', 0, 0, './img/9620270.jpg'),
(4, 'ednam', '$2b$10$nwnxZyujrE1hkUNq852X5eQ5NWpqEqtod5kly5UWj.oMEmPo.j7AS', 'ednam@mail.fr', 0, 0, './img/4291307.png'),
(5, 'a', '$2b$10$XXJb9l.xoZyFQdXF.HStz.RJO.FkOPJ8iTruX0tSDgbEHZ/m6g1Ey', 'a@a.a', 0, 1, './img/1080738.jpeg'),
(6, 'bbbbbbbbbbbbbbbbbbbbbbbb', '$2b$10$Sjz2lizHFUTYfsgaUFLCsuTrhmGEHSBefNPumJGTPIriqQFXoUWCm', 'b@a.a', 0, 0, './img/2707297.png'),
(7, 'cr7', '$2b$10$pq8D.FXLGACWKjl0zl9/MOQbDmZYIuohTCSV3CewtATMS/svmedke', 'cr7@cr7.cr7', 0, 1, './img/2737685.jpg');

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
