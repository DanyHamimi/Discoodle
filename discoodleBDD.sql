-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 15 mai 2021 à 12:35
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
  KEY `fk_cours_classes` (`id_classe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id_cours`, `libelle_cours`, `id_classe`) VALUES
(1, 'eab', 1),
(2, 'rk', 1),
(3, 'dany', 1),
(4, 'progra', 1);

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
  `user_id` varchar(256) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `modules`
--

INSERT INTO `modules` (`id_module`, `libelle_module`, `id_cours`) VALUES
(1, 'test rk', 1),
(2, 'test rk2', 1),
(3, 'abcdef', 2),
(4, 'danychan', 3),
(5, 'toto', 4),
(6, 'alaz', 4);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `email`, `usertype`, `class`, `profile_picture`) VALUES
(1, 'rayane', '$2b$10$HQo47qNEROxtogrxMJMamOaYEYkXk0Nord3j8Era9Go6kOjA8zs/e', 'rayanoo1302@gmail.com', 0, 0, './img/3196247.jpeg'),
(2, 'test', '$2b$10$IXEJoLfoNRdc9ifxTLlHgeYoZ7WAMQgfNHbEjCxHFQeUAlxcLM5CG', 'rayane.kaabeche@etu.u-paris.fr', 0, 0, './img/2459319.jpg'),
(3, 'dany', '$2b$10$4kU0eC89VXxhElSAvyfE6OFwZjv/V.ZZjncXrMqs6zMSPS7gpjJUq', 'dany@mail.fr', 0, 0, './img/9620270.jpg'),
(4, 'ednam', '$2b$10$nwnxZyujrE1hkUNq852X5eQ5NWpqEqtod5kly5UWj.oMEmPo.j7AS', 'ednam@mail.fr', 0, 0, './img/4291307.png'),
(5, 'a', '$2b$10$XXJb9l.xoZyFQdXF.HStz.RJO.FkOPJ8iTruX0tSDgbEHZ/m6g1Ey', 'a@a.a', 0, 0, './img/1080738.jpeg'),
(6, 'bbbbbbbbbbbbbbbbbbbbbbbb', '$2b$10$Sjz2lizHFUTYfsgaUFLCsuTrhmGEHSBefNPumJGTPIriqQFXoUWCm', 'b@a.a', 0, 0, './img/2707297.png');

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
