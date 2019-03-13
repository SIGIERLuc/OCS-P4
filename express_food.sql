-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 03 juil. 2018 à 22:30
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `express_food`
--

-- --------------------------------------------------------

--
-- Structure de la table `customer_information`
--

DROP TABLE IF EXISTS `customer_information`;
CREATE TABLE IF NOT EXISTS `customer_information` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(300) NOT NULL,
  `postcode` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `customer_information`
--

INSERT INTO `customer_information` (`user_id`, `first_name`, `last_name`, `email`, `address`, `postcode`, `city`, `phone_number`, `creation_date`) VALUES
(1, 'Luc', 'SIGIER', 'lucsigier@gmail.com', '8 bis rue de rumilly', 74000, 'Annecy', '0650458072', '2018-07-03 14:22:36'),
(4, 'Clara', 'SIGIER', 'clara@gmail.com', '14 rue clemenceau', 25000, 'Besançon', '0650458072', '2018-07-03 14:23:04');

-- --------------------------------------------------------

--
-- Structure de la table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
CREATE TABLE IF NOT EXISTS `customer_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `delivry_man_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_customer_order_fk` (`user_id`),
  KEY `delivery_man_order_fk` (`delivry_man_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `customer_order`
--

INSERT INTO `customer_order` (`id`, `user_id`, `delivry_man_id`, `creation_date`, `total_price`, `status`, `payment_method`) VALUES
(1, 1, 3, '2018-07-03 14:30:07', 22, 'In progress', 'Espèce'),
(2, 4, 6, '2018-07-03 14:32:20', 33, 'Closed', 'Credit Card');

-- --------------------------------------------------------

--
-- Structure de la table `delivery_man`
--

DROP TABLE IF EXISTS `delivery_man`;
CREATE TABLE IF NOT EXISTS `delivery_man` (
  `user_id` int(11) NOT NULL,
  `status` varchar(150) NOT NULL,
  `latitude` decimal(13,9) NOT NULL,
  `longitude` decimal(13,9) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `delivery_man`
--

INSERT INTO `delivery_man` (`user_id`, `status`, `latitude`, `longitude`) VALUES
(3, 'Free', '13.235000000', '80.354000000'),
(6, 'Busy', '12.235000000', '80.354000000');

-- --------------------------------------------------------

--
-- Structure de la table `dish`
--

DROP TABLE IF EXISTS `dish`;
CREATE TABLE IF NOT EXISTS `dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `category` varchar(150) NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `image` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_dish_fk` (`creator_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dish`
--

INSERT INTO `dish` (`id`, `creator_id`, `name`, `price`, `category`, `selected`, `image`) VALUES
(1, 2, 'Salade de pâte', '12', 'Plat', 1, 'https://static.750g.com/images/622-auto/9e6558fd7bd4d5cb7e45ce48f0c3d39f/comment-faire-une-salade-de-pates-comme-en-italie.jpg'),
(2, 5, 'Salade de riz', '10', 'Plat', 0, 'https://static.750g.com/images/622-auto/9e6558fd7bd4d5cb7e45ce48f0c3d39f/comment-faire-une-salade-de-pates-comme-en-italie.jpg'),
(3, 5, 'Cake aux pommes', '5', 'Déssert', 1, 'https://static.750g.com/images/622-auto/9e6558fd7bd4d5cb7e45ce48f0c3d39f/comment-faire-une-salade-de-pates-comme-en-italie.jpg'),
(4, 2, 'Flan coco', '6', 'Déssert', 1, 'https://static.750g.com/images/622-auto/9e6558fd7bd4d5cb7e45ce48f0c3d39f/comment-faire-une-salade-de-pates-comme-en-italie.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `dish_history`
--

DROP TABLE IF EXISTS `dish_history`;
CREATE TABLE IF NOT EXISTS `dish_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_id` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `sale_date` datetime NOT NULL,
  `sale_amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_historique_des_plats_fk` (`dish_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dish_history`
--

INSERT INTO `dish_history` (`id`, `dish_id`, `price`, `sale_date`, `sale_amount`) VALUES
(1, 2, '10', '2018-07-03 14:30:07', 25),
(2, 1, '12', '2018-07-03 14:30:07', 30),
(3, 1, '13', '2018-07-08 14:30:07', 20),
(4, 3, '5', '2018-07-08 14:30:07', 20),
(5, 4, '6', '2018-07-08 14:30:07', 36);

-- --------------------------------------------------------

--
-- Structure de la table `dish_order`
--

DROP TABLE IF EXISTS `dish_order`;
CREATE TABLE IF NOT EXISTS `dish_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_order_id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_customer_order_fk` (`dish_id`),
  KEY `order_customer_order_fk` (`customer_order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dish_order`
--

INSERT INTO `dish_order` (`id`, `customer_order_id`, `dish_id`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 1),
(4, 2, 2),
(5, 2, 3),
(6, 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `role_name`) VALUES
(1, 'Client'),
(2, 'Livreur'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(36) NOT NULL,
  `password` varchar(36) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_fk` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `role_id`) VALUES
(1, 'Luc', 'ba235a245739eea25a50d216b3804369', 1),
(2, 'Chef 1', '430a18b0eac4f816e55f6d8122d838f2', 3),
(3, 'Roger', '45396a7fcd0e0b14c028a8f3621515d7', 2),
(4, 'Clara', '927401fe3ba35669cfd4850df37aeed6', 1),
(5, 'chef2', 'ec60a7e1c95185c5758837517aa5c046', 3),
(6, 'LivreurMan', '45396a7fcd0e0b14c08949f3621515d7', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
