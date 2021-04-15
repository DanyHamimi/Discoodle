-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 25 mars 2021 à 14:20
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
-- Base de données : `msg`
--

-- --------------------------------------------------------

--
-- Structure de la table `img`
--
/* Windows OLD SQL use insted of new sql caching_sha2_password this is the reason why it not connected
create database nodelogin;
use nodelogin
ALTER USER 'nodelogin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
*/

CREATE DATABASE IF NOT EXISTS discoodle;
CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '';
use discoodle;
DROP TABLE IF EXISTS `img`;
CREATE TABLE IF NOT EXISTS `img` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message` varchar(2000) NOT NULL,
  `userid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(11) NOT NULL COMMENT '0 message, 1 image, 2 fichier',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

CREATE TABLE IF NOT EXISTS `message_log` (
  `username` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
