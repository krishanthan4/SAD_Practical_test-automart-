-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.36-0ubuntu0.22.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for automart
CREATE DATABASE IF NOT EXISTS `automart` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `automart`;

-- Dumping structure for table automart.address
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `line1` varchar(45) DEFAULT NULL,
  `line2` varchar(45) DEFAULT NULL,
  `city_city_id` int NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_address_city1_idx` (`city_city_id`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.address: ~4 rows (approximately)
INSERT INTO `address` (`address_id`, `line1`, `line2`, `city_city_id`) VALUES
	(1, 'main street', 'temple road', 3),
	(2, 'sub street', 'white house street', 2),
	(3, 'iuhi', 'uii', 1),
	(4, 'First lane', 'second lane', 2);

-- Dumping structure for table automart.city
CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `district_district_id` int NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_city_district_idx` (`district_district_id`),
  CONSTRAINT `fk_city_district` FOREIGN KEY (`district_district_id`) REFERENCES `district` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.city: ~3 rows (approximately)
INSERT INTO `city` (`city_id`, `name`, `district_district_id`) VALUES
	(1, 'dehiwala', 1),
	(2, 'minuwangoda', 2),
	(3, 'gampaha', 2);

-- Dumping structure for table automart.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `mobile` varchar(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `customer_type_id` int NOT NULL,
  `gender_id` int NOT NULL,
  PRIMARY KEY (`mobile`),
  KEY `fk_customer_customer_type1_idx` (`customer_type_id`),
  KEY `fk_customer_gender1_idx` (`gender_id`),
  CONSTRAINT `fk_customer_customer_type1` FOREIGN KEY (`customer_type_id`) REFERENCES `customer_type` (`id`),
  CONSTRAINT `fk_customer_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.customer: ~8 rows (approximately)
INSERT INTO `customer` (`mobile`, `firstname`, `lastname`, `customer_type_id`, `gender_id`) VALUES
	('0758233502', 'Kamal', 'Rathnayaka', 1, 1),
	('0758233603', 'test', 'test', 1, 1),
	('0758233604', 'Gihan', 'Gunathilaka', 2, 1),
	('897987', 'kjkj', 'KJJ', 1, 2),
	('8iu', 'lklk', 'hkjhkjh', 2, 2),
	('kjh', 'kjhj', 'kjh', 1, 1),
	('lkjj', 'lklj', 'lkjlj', 2, 2),
	('lkjlj989', 'lkjl', 'lkjlkj', 1, 2),
	('lkk', 'dsldkfl', 'lkl', 2, 2);

-- Dumping structure for table automart.customer_has_address
CREATE TABLE IF NOT EXISTS `customer_has_address` (
  `customer_mobile` varchar(10) NOT NULL,
  `address_address_id` int NOT NULL,
  PRIMARY KEY (`customer_mobile`,`address_address_id`),
  KEY `fk_customer_has_address_address1_idx` (`address_address_id`),
  KEY `fk_customer_has_address_customer1_idx` (`customer_mobile`),
  CONSTRAINT `fk_customer_has_address_address1` FOREIGN KEY (`address_address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fk_customer_has_address_customer1` FOREIGN KEY (`customer_mobile`) REFERENCES `customer` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.customer_has_address: ~4 rows (approximately)
INSERT INTO `customer_has_address` (`customer_mobile`, `address_address_id`) VALUES
	('0758233502', 1),
	('0758233604', 2),
	('kjh', 3),
	('0758233603', 4);

-- Dumping structure for table automart.customer_has_vehicle
CREATE TABLE IF NOT EXISTS `customer_has_vehicle` (
  `customer_mobile` varchar(10) NOT NULL,
  `vehicle_vehicle_number` varchar(30) NOT NULL,
  PRIMARY KEY (`customer_mobile`,`vehicle_vehicle_number`),
  KEY `fk_customer_has_vehicle_vehicle1_idx` (`vehicle_vehicle_number`),
  KEY `fk_customer_has_vehicle_customer1_idx` (`customer_mobile`),
  CONSTRAINT `fk_customer_has_vehicle_customer1` FOREIGN KEY (`customer_mobile`) REFERENCES `customer` (`mobile`),
  CONSTRAINT `fk_customer_has_vehicle_vehicle1` FOREIGN KEY (`vehicle_vehicle_number`) REFERENCES `vehicle` (`vehicle_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.customer_has_vehicle: ~0 rows (approximately)

-- Dumping structure for table automart.customer_type
CREATE TABLE IF NOT EXISTS `customer_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.customer_type: ~2 rows (approximately)
INSERT INTO `customer_type` (`id`, `type`) VALUES
	(1, 'regular'),
	(2, 'not regular');

-- Dumping structure for table automart.district
CREATE TABLE IF NOT EXISTS `district` (
  `district_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `province_province_id` int NOT NULL,
  PRIMARY KEY (`district_id`),
  KEY `fk_district_province1_idx` (`province_province_id`),
  CONSTRAINT `fk_district_province1` FOREIGN KEY (`province_province_id`) REFERENCES `province` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.district: ~3 rows (approximately)
INSERT INTO `district` (`district_id`, `name`, `province_province_id`) VALUES
	(1, 'colombo', 1),
	(2, 'gampaha', 1),
	(3, 'kaluthara', 1);

-- Dumping structure for table automart.fuel_type
CREATE TABLE IF NOT EXISTS `fuel_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.fuel_type: ~4 rows (approximately)
INSERT INTO `fuel_type` (`id`, `type`) VALUES
	(1, 'petrol'),
	(2, 'Diesel'),
	(3, 'Electric'),
	(4, 'Hybrid');

-- Dumping structure for table automart.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.gender: ~2 rows (approximately)
INSERT INTO `gender` (`id`, `name`) VALUES
	(1, 'male'),
	(2, 'female');

-- Dumping structure for table automart.province
CREATE TABLE IF NOT EXISTS `province` (
  `province_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.province: ~0 rows (approximately)
INSERT INTO `province` (`province_id`, `name`) VALUES
	(1, 'western province');

-- Dumping structure for table automart.service
CREATE TABLE IF NOT EXISTS `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_from` datetime NOT NULL,
  `date_to` datetime DEFAULT NULL,
  `service_type_id` int NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `vehicle_vehicle_number` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_service_service_type1_idx` (`service_type_id`),
  KEY `fk_service_customer1_idx` (`customer_mobile`),
  KEY `fk_service_vehicle1_idx` (`vehicle_vehicle_number`),
  CONSTRAINT `fk_service_customer1` FOREIGN KEY (`customer_mobile`) REFERENCES `customer` (`mobile`),
  CONSTRAINT `fk_service_service_type1` FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`id`),
  CONSTRAINT `fk_service_vehicle1` FOREIGN KEY (`vehicle_vehicle_number`) REFERENCES `vehicle` (`vehicle_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.service: ~0 rows (approximately)
INSERT INTO `service` (`id`, `date_from`, `date_to`, `service_type_id`, `customer_mobile`, `vehicle_vehicle_number`) VALUES
	(1, '2024-06-30 09:44:28', '2024-06-30 09:44:31', 3, '0758233604', 'wp354');

-- Dumping structure for table automart.service_type
CREATE TABLE IF NOT EXISTS `service_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `fees` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.service_type: ~3 rows (approximately)
INSERT INTO `service_type` (`id`, `type`, `fees`) VALUES
	(1, 'water wash', 2000),
	(2, 'engine change check', 1000),
	(3, 'full service', 3000);

-- Dumping structure for table automart.vehicle
CREATE TABLE IF NOT EXISTS `vehicle` (
  `vehicle_number` varchar(30) NOT NULL,
  `chassis_number` varchar(45) NOT NULL,
  `fuel_type_id` int NOT NULL,
  PRIMARY KEY (`vehicle_number`),
  KEY `fk_vehicle_fuel_type1_idx` (`fuel_type_id`),
  CONSTRAINT `fk_vehicle_fuel_type1` FOREIGN KEY (`fuel_type_id`) REFERENCES `fuel_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table automart.vehicle: ~4 rows (approximately)
INSERT INTO `vehicle` (`vehicle_number`, `chassis_number`, `fuel_type_id`) VALUES
	('335', '4354', 2),
	('34', 'kjklj', 2),
	('lkl', 'kjlk', 1),
	('wp3243', '4354', 3),
	('wp354', '3544', 4);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
