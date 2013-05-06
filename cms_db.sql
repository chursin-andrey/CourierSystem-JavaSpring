DROP DATABASE IF EXISTS `cms_db`;
CREATE database IF NOT EXISTS `cms_db` DEFAULT CHARACTER SET utf8;
USE `cms_db`;

CREATE TABLE IF NOT EXISTS `courier` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;


CREATE TABLE IF NOT EXISTS `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_start_time` datetime NOT NULL,
  `delivery_stop_time` datetime NOT NULL,
  `sender_name` varchar(50) NOT NULL,
  `sender_address` varchar(50) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `recipient_address` varchar(50) NOT NULL,
  `courier_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_courier_fk` (`courier_id`)
) ENGINE=MyISAM;


CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role_fk` (`role_id`)
) ENGINE=MyISAM;


INSERT INTO `user` (`id`, `name`, `login`, `password`, `role_id`) VALUES
(1, 'Чурсин	Андрей', 'chursin', '827ccb0eea8a706c4c34a16891f84e7b', 2),
(2, 'Врагов Роман', 'vragov', '827ccb0eea8a706c4c34a16891f84e7b', 2);


CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;


INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_ADMIN');
