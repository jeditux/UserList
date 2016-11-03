-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.23 - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.3.0.5046
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных test
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET cp1251 */;
USE `test`;

-- Дамп структуры для таблица test.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL DEFAULT '',
  `age` int(11) NOT NULL DEFAULT '0',
  `isAdmin` bit(1) NOT NULL DEFAULT b'0',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=cp1251;

-- Дамп данных таблицы test.user: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `age`, `isAdmin`, `createdDate`) VALUES
	(1, 'Boris', 35, b'0', '2016-11-15 00:00:00'),
	(2, 'Anatoliy', 30, b'1', '2016-11-15 00:00:00'),
	(3, 'Svetlana2', 12, b'0', '2016-11-08 00:00:00'),
	(4, 'Vasya', 42, b'1', '2016-11-18 00:00:00'),
	(5, 'Медвед', 19, b'0', '2016-11-15 00:00:00'),
	(6, 'Jimmy', 34, b'1', '2008-06-10 00:00:00'),
	(7, 'Bill', 65, b'0', '2016-09-12 00:00:00'),
	(8, 'Vasya Pupkin', 14, b'0', '2016-11-14 00:00:00'),
	(9, 'Санек', 21, b'0', '2016-11-21 00:00:00'),
	(10, 'Иваныч', 44, b'0', '2016-11-15 00:00:00'),
	(11, 'Igor', 30, b'1', '2016-11-14 00:00:00'),
	(12, 'Игрок', 29, b'0', '2015-08-03 00:00:00'),
	(13, 'Amigo', 13, b'0', '2010-11-08 00:00:00'),
	(14, 'Hubert', 35, b'1', '2016-11-04 00:55:24'),
	(15, 'Леха', 20, b'0', '2012-05-07 00:00:00'),
	(16, 'Professor', 45, b'1', '2006-11-13 00:00:00'),
	(17, 'Silver', 24, b'0', '2013-07-08 00:00:00'),
	(18, 'Robocop', 13, b'0', '2007-11-26 00:00:00'),
	(19, 'Elena84', 23, b'0', '2007-11-19 00:00:00'),
	(20, 'Boss', 33, b'1', '2007-05-07 00:00:00'),
	(21, 'Bill Gates', 50, b'1', '2017-01-01 00:00:00'),
	(22, 'River', 33, b'0', '2007-11-05 00:00:00'),
	(23, 'Yurik', 12, b'0', '2018-11-22 00:00:00'),
	(24, 'Peter', 31, b'0', '2016-11-14 00:00:00'),
	(25, 'Simon', 40, b'0', '2018-11-15 00:00:00'),
	(26, 'Davis', 20, b'0', '2011-05-02 00:00:00'),
	(27, 'Cooper', 39, b'1', '2009-12-23 00:00:00'),
	(28, 'Hacker', 15, b'0', '2016-10-10 00:00:00'),
	(29, 'Slon', 21, b'0', '2015-12-01 00:00:00'),
	(30, 'Kaa', 99, b'0', '2010-09-06 00:00:00'),
	(31, 'Пилигрим', 31, b'0', '2013-07-08 00:00:00'),
	(32, 'Студент', 19, b'0', '2013-11-18 00:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
