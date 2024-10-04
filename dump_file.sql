-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: authectication
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `authectication`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `authectication` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `authectication`;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `locality` varchar(100) NOT NULL,
  `address_line1` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `alternate_phone` varchar(15) DEFAULT NULL,
  `location_type_tag` enum('HOME','WORK') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,8,'poojitha','9742655735','560070','Kadirenahalli',',,,,','bangalore','karnataka','near sweet sagar','9964162898','HOME','2024-09-23 06:18:25','2024-09-23 06:18:25'),(2,8,'poojitha','9742655735','560070','Kadirenahalli',',,,,,','bangalore','karnataka','near sweet sagar','9964162898','HOME','2024-09-23 06:24:31','2024-09-23 06:24:31'),(3,8,'poojitha','9742655735','560070','Kadirenahalli',',,,,,','bangalore','karnataka','near sweet sagar','9964162898','HOME','2024-09-23 06:29:20','2024-09-23 06:29:20'),(4,7,'poojitha','9742655735','560070','Kadirenahalli','....','bangalore','karnataka','near sweet sagar','9964162898','HOME','2024-09-23 06:36:20','2024-09-23 06:36:20'),(5,7,'poojitha','9742655735','560070','Kadirenahalli','....','bangalore','karnataka','near sweet sagar','9964162898','HOME','2024-09-23 06:45:14','2024-09-23 06:45:14'),(6,7,'poojitha','9742655735','560070','Kadirenahalli','....','bangalore','karnataka','near sweet sagar','9964162898','HOME','2024-09-23 06:48:54','2024-09-23 06:48:54'),(7,7,'abc','1111111111','560070','Kadirenahalli','.....','bangalore','karnataka','saxaS','1231231233','HOME','2024-09-23 06:55:30','2024-09-23 06:55:30'),(8,7,'abc','1111111111','560070','Kadirenahalli','...','bangalore','karnataka','saxaS','1231231233','HOME','2024-09-23 07:10:21','2024-09-23 07:10:21'),(9,7,'abc','1111111111','560070','Kadirenahalli','.....','bangalore','karnataka','saxaS','1231231233','HOME','2024-09-23 07:22:36','2024-09-23 07:22:36'),(10,7,'abc','1111111111','560070','Kadirenahalli','.....','bangalore','karnataka','saxaS','1231231233','HOME','2024-09-23 07:31:16','2024-09-23 07:31:16'),(11,7,'abc','1111111111','560070','Kadirenahalli','...','bangalore','karnataka','saxaS','1231231233','HOME','2024-09-23 08:07:10','2024-09-23 08:07:10'),(12,7,'abc','1111111111','560070','Kadirenahalli','...','bangalore','karnataka','saxaS','1231231233','HOME','2024-09-23 08:08:44','2024-09-23 08:08:44'),(13,7,'abc','1111111111','560070','Kadirenahalli','...','bangalore','karnataka','saxaS','1231231233','HOME','2024-09-23 08:49:59','2024-09-23 08:49:59'),(14,7,'abc','1111111111','560070','Kadirenahalli','....','bangalore','karnataka','saxaS','1231231233','HOME','2024-09-23 08:57:31','2024-09-23 08:57:31'),(15,7,'abc','1111111111','560070','Kadirenahalli','....','bangalore','karnataka','saxaS','1231231233','HOME','2024-09-23 09:08:42','2024-09-23 09:08:42'),(16,7,'abc','1111111111','560078','JP Nagar','Shakambari Nagar, JP Nagar 1st Phase, JP Nagar, Bangalore South, Bengaluru Urban, Karnataka, 560078, India','Bengaluru Urban','Karnataka','Shakambari Nagar','1231231233','HOME','2024-09-23 09:17:12','2024-09-23 09:17:12'),(17,7,'abc','1111111111','560078','JP Nagar','Shakambari Nagar, JP Nagar 1st Phase, JP Nagar, Bangalore South, Bengaluru Urban, Karnataka, 560078, India','Bengaluru Urban','Karnataka','Shakambari Nagar','1231231233','HOME','2024-09-23 09:24:41','2024-09-23 09:24:41'),(18,7,'abc','1111111111','560070','Kadirenahalli','JHBCS Layout, Kadirenahalli, Bangalore South, Bengaluru Urban, Karnataka, 560070, India','Bengaluru Urban','Karnataka','JHBCS Layout','1231231233','HOME','2024-09-23 09:31:50','2024-09-23 09:31:50'),(19,7,'Vishwas AM','1111111111','560078','JP Nagar','Shakambari Nagar, JP Nagar 1st Phase, JP Nagar, Bangalore South, Bengaluru Urban, Karnataka, 560078, India','Bengaluru Urban','Karnataka','Shakambari Nagar','','HOME','2024-09-23 09:33:45','2024-09-23 09:33:45'),(20,7,'abc','1111111111','560078','JP Nagar','Shakambari Nagar, JP Nagar 1st Phase, JP Nagar, Bangalore South, Bengaluru Urban, Karnataka, 560078, India','Bengaluru Urban','Karnataka','Shakambari Nagar','1231231231','HOME','2024-09-23 09:39:20','2024-09-23 09:39:20'),(21,7,'abc','1111111111','560078','JP Nagar','Shakambari Nagar, JP Nagar 1st Phase, JP Nagar, Bangalore South, Bengaluru Urban, Karnataka, 560078, India','Bengaluru Urban','Karnataka','Shakambari Nagar','1231231231','HOME','2024-09-23 09:56:58','2024-09-23 09:56:58'),(22,8,'poojitha','9742655735','560070','Kadirenahalli','....','bangalore','karnataka','saxaS','9964162898','HOME','2024-09-23 10:04:02','2024-09-23 10:04:02'),(23,8,'poojitha','9742655735','560070','Kadirenahalli','...............','bangalore','karnataka','saxaS','9964162898','HOME','2024-09-24 04:34:31','2024-09-24 04:34:31'),(24,8,'poojitha','9742655735','560070','Kadirenahalli','JHBCS Layout, Kadirenahalli, Bangalore South, Bengaluru Urban, Karnataka, 560070, India','Bengaluru Urban','Karnataka','JHBCS Layout','9964162898','HOME','2024-09-24 04:50:01','2024-09-24 04:50:01'),(25,7,'abc','1111111111','560070','Kadirenahalli','Muscle Mechanic, \" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India','Bengaluru','Karnataka','Teacher\'s Colony','1231231231','HOME','2024-09-24 05:02:32','2024-09-24 05:02:32'),(26,7,'abc','1111111111','560029','BTM Layout','10th Main Road, BTM Layout 2nd Stage, BTM Layout, Bangalore South, Bengaluru Urban, Karnataka, 560029, India','Bengaluru Urban','Karnataka','BTM Layout 2nd Stage','1231231231','HOME','2024-09-24 05:10:58','2024-09-24 05:10:58'),(27,7,'abc','1111111111','560029','BTM Layout','10th Main Road, BTM Layout 2nd Stage, BTM Layout, Bangalore South, Bengaluru Urban, Karnataka, 560029, India','Bengaluru Urban','Karnataka','BTM Layout 2nd Stage','1231231231','HOME','2024-09-24 05:23:05','2024-09-24 05:23:05'),(28,7,'abc','1111111111','560070','Kadirenahalli','Muscle Mechanic, \" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India','Bengaluru','Karnataka','Teacher\'s Colony','1231231231','HOME','2024-09-24 05:38:09','2024-09-24 05:38:09'),(29,7,'abc','1111111111','560070','Kadirenahalli','Muscle Mechanic, \" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India','Bengaluru','Karnataka','Teacher\'s Colony','1231231231','HOME','2024-09-24 05:41:43','2024-09-24 05:41:43'),(30,8,'poojitha','9742655735','560070','Kadirenahalli','JHBCS Layout, Kadirenahalli, Bangalore South, Bengaluru Urban, Karnataka, 560070, India','Bengaluru Urban','Karnataka','JHBCS Layout','9964162898','HOME','2024-09-24 05:56:35','2024-09-24 05:56:35'),(31,8,'poojitha','9742655735','560070','Kadirenahalli','Muscle Mechanic, \" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India','Bengaluru','Karnataka','Teacher\'s Colony','9964162898','HOME','2024-09-24 06:20:55','2024-09-24 06:20:55'),(32,8,'poojitha','9742655735','560070','Kadirenahalli','Muscle Mechanic, \" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India','Bengaluru','Karnataka','Teacher\'s Colony','9964162898','HOME','2024-09-24 06:24:36','2024-09-24 06:24:36'),(33,8,'pooojitha','9742655735','560070','Kadirenahalli','Muscle Mechanic, \" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India','Bengaluru','Karnataka','Teacher\'s Colony','','HOME','2024-09-24 10:03:31','2024-09-24 10:03:31'),(34,8,'poojitha','9742655735','560070','Kadirenahalli','Muscle Mechanic, \" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India','Bengaluru','Karnataka','Teacher\'s Colony','9964162898','HOME','2024-09-25 13:19:00','2024-09-25 13:19:00'),(35,8,'poojitha','9742655735','560070','Kadirenahalli','JHBCS Layout, Kadirenahalli, Bangalore South, Bengaluru Urban, Karnataka, 560070, India','Bengaluru Urban','Karnataka','JHBCS Layout','9964162898','HOME','2024-09-26 05:06:47','2024-09-26 05:06:47');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES (1,'poojitha19','2024-09-17 13:12:50',NULL,NULL),(2,'poojitha19','2024-09-17 13:18:11',NULL,NULL),(3,'poojitha19','2024-09-17 13:18:11',NULL,NULL),(4,'poojitha19','2024-09-17 13:20:06',NULL,NULL),(5,'poojitha19','2024-09-17 13:20:06',NULL,NULL),(6,'poojitha19','2024-09-17 13:22:07',NULL,NULL),(7,'poojitha19','2024-09-17 13:22:08',NULL,NULL),(8,'poojitha19','2024-09-17 13:23:38',NULL,NULL),(9,'poojitha19','2024-09-17 13:23:38',NULL,NULL),(10,'poojitha19','2024-09-17 13:31:37',NULL,NULL),(11,'poojitha19','2024-09-17 13:31:37',NULL,NULL),(12,'poojitha19','2024-09-17 13:39:34',NULL,NULL),(13,'poojitha19','2024-09-17 13:39:35',NULL,NULL),(14,'poojitha19','2024-09-17 13:48:23',NULL,NULL),(15,'poojitha19','2024-09-17 13:48:23',NULL,NULL),(16,'poojitha19','2024-09-17 13:53:28',NULL,NULL),(17,'poojitha19','2024-09-17 13:53:28',NULL,NULL),(18,'poojitha19','2024-09-17 14:16:39',NULL,NULL),(19,'poojitha19','2024-09-17 14:16:39',NULL,NULL),(20,'poojitha19','2024-09-17 14:21:25',NULL,NULL),(21,'poojitha19','2024-09-17 14:23:22',NULL,NULL),(22,'poojitha19','2024-09-17 14:35:50',NULL,NULL),(23,'poojitha19','2024-09-17 14:35:50',NULL,NULL),(24,'poojitha19','2024-09-17 14:43:09',NULL,NULL),(25,'poojitha19','2024-09-17 14:43:09',NULL,NULL),(26,'poojitha19','2024-09-17 14:44:58',NULL,NULL),(27,'poojitha19','2024-09-17 14:44:58',NULL,NULL),(28,'poojitha19','2024-09-17 15:50:38',NULL,NULL),(29,'poojitha19','2024-09-17 15:56:57',NULL,NULL),(30,'poojitha19','2024-09-17 15:56:57',NULL,NULL),(31,'poojitha19','2024-09-17 16:21:05',NULL,NULL),(32,'poojitha19','2024-09-17 16:21:05',NULL,NULL),(33,'poojitha19','2024-09-17 16:26:54',NULL,NULL),(34,'poojitha19','2024-09-17 16:42:28',NULL,NULL),(35,'poojitha19','2024-09-17 16:42:48',NULL,NULL),(36,'poojitha19','2024-09-17 16:47:40',NULL,NULL),(37,'abc1','2024-09-19 17:24:48',NULL,7),(38,'abc1','2024-09-19 17:28:47',NULL,7),(39,'abc1','2024-09-19 17:32:24',NULL,7),(40,'poojitha1907','2024-09-19 17:34:35',NULL,8),(41,'poojitha1907','2024-09-19 17:38:10',NULL,8),(42,'poojitha1907','2024-09-19 17:38:19',NULL,8),(43,'poojitha1907','2024-09-19 17:43:07',NULL,8),(44,'abc1','2024-09-20 10:19:54',NULL,7),(45,'poojitha1907','2024-09-20 10:22:36',NULL,8),(46,'poojitha1907','2024-09-20 10:29:05',NULL,8),(47,'poojitha1907','2024-09-20 10:30:53',NULL,8),(48,'poojitha1907','2024-09-20 10:36:51',NULL,8),(49,'poojitha1907','2024-09-20 10:37:58',NULL,8),(50,'poojitha1907','2024-09-20 10:46:24',NULL,8),(51,'poojitha1907','2024-09-20 10:47:29',NULL,8),(52,'poojitha1907','2024-09-20 10:54:36',NULL,8),(53,'poojitha1907','2024-09-20 12:25:05',NULL,8),(54,'poojitha1907','2024-09-20 15:24:58',NULL,8),(55,'poojitha1907','2024-09-20 16:02:04',NULL,8),(56,'poojitha1907','2024-09-20 17:21:12',NULL,8),(57,'poojitha1907','2024-09-20 21:07:37',NULL,8),(58,'abc1','2024-09-20 21:10:08',NULL,7),(59,'abc1','2024-09-21 16:06:15',NULL,7),(60,'poojitha1907','2024-09-21 16:44:15',NULL,8),(61,'poojitha1907','2024-09-21 20:59:58',NULL,8),(62,'abc1','2024-09-21 21:00:36',NULL,7),(63,'poojitha1907','2024-09-21 21:14:54',NULL,8),(64,'abc1','2024-09-21 21:15:18',NULL,7),(65,'abc1','2024-09-21 21:52:56',NULL,7),(66,'poojitha1907','2024-09-22 08:30:24',NULL,8),(67,'poojitha1907','2024-09-22 09:00:55',NULL,8),(68,'poojitha1907','2024-09-22 09:21:40',NULL,8),(69,'poojitha1907','2024-09-22 19:07:53',NULL,8),(70,'poojitha1907','2024-09-22 20:23:03',NULL,8),(71,'poojitha1907','2024-09-22 20:40:13',NULL,8),(72,'poojitha1907','2024-09-22 20:46:34',NULL,8),(73,'poojitha1907','2024-09-22 20:48:41',NULL,8),(74,'poojitha1907','2024-09-22 20:51:57',NULL,8),(75,'poojitha1907','2024-09-22 20:59:18',NULL,8),(76,'poojitha1907','2024-09-22 21:07:09',NULL,8),(77,'poojitha1907','2024-09-22 21:12:42',NULL,8),(78,'poojitha1907','2024-09-22 21:13:06',NULL,8),(79,'poojitha1907','2024-09-22 21:13:34',NULL,8),(80,'poojitha1907','2024-09-22 21:14:28',NULL,8),(81,'poojitha1907','2024-09-22 21:23:12',NULL,8),(82,'poojitha1907','2024-09-22 21:30:18',NULL,8),(83,'poojitha1907','2024-09-22 21:32:50',NULL,8),(84,'poojitha1907','2024-09-23 09:29:42',NULL,8),(85,'poojitha1907','2024-09-23 09:52:49',NULL,8),(86,'abc1','2024-09-23 10:06:33',NULL,7),(87,'poojitha1907','2024-09-23 10:36:49',NULL,8),(88,'poojitha1907','2024-09-23 11:00:33',NULL,8),(89,'poojitha1907','2024-09-23 11:04:41',NULL,8),(90,'poojitha1907','2024-09-23 11:18:39',NULL,8),(91,'poojitha1907','2024-09-23 11:22:00',NULL,8),(92,'abc1','2024-09-23 12:05:28',NULL,7),(93,'abc1','2024-09-23 12:24:35',NULL,7),(94,'abc1','2024-09-23 12:51:45',NULL,7),(95,'abc1','2024-09-23 13:00:08',NULL,7),(96,'abc1','2024-09-23 13:07:17',NULL,7),(97,'abc1','2024-09-23 13:09:55',NULL,7),(98,'abc1','2024-09-23 13:15:16',NULL,7),(99,'abc1','2024-09-23 13:19:17',NULL,7),(100,'abc1','2024-09-23 13:22:55',NULL,7),(101,'abc1','2024-09-23 13:24:23',NULL,7),(102,'abc1','2024-09-23 13:29:18',NULL,7),(103,'abc1','2024-09-23 14:37:33',NULL,7),(104,'abc1','2024-09-23 14:45:58',NULL,7),(105,'poojitha1907','2024-09-23 15:32:15',NULL,8),(106,'poojitha1907','2024-09-23 16:01:23',NULL,8),(107,'poojitha1907','2024-09-23 16:36:28',NULL,8),(108,'poojitha1907','2024-09-23 16:43:53',NULL,8),(109,'poojitha1907','2024-09-23 16:47:20',NULL,8),(110,'poojitha1907','2024-09-23 16:54:06',NULL,8),(111,'poojitha1907','2024-09-23 17:03:06',NULL,8),(112,'poojitha1907','2024-09-23 17:07:58',NULL,8),(113,'poojitha1907','2024-09-23 17:25:37',NULL,8),(114,'poojitha1907','2024-09-23 17:44:20',NULL,8),(115,'poojitha1907','2024-09-23 17:44:54',NULL,8),(116,'poojitha1907','2024-09-23 17:46:14',NULL,8),(117,'poojitha1907','2024-09-23 17:46:16',NULL,8),(118,'poojitha1907','2024-09-24 09:48:41',NULL,8),(119,'poojitha1907','2024-09-24 09:55:53',NULL,8),(120,'abc1','2024-09-24 10:31:35',NULL,7),(121,'abc1','2024-09-24 10:40:11',NULL,7),(122,'poojitha1907','2024-09-24 11:25:35',NULL,8),(123,'poojitha1907','2024-09-24 11:29:10',NULL,8),(124,'poojitha1907','2024-09-24 11:29:52',NULL,8),(125,'poojitha1907','2024-09-24 11:29:53',NULL,8),(126,'poojitha1907','2024-09-24 11:29:55',NULL,8),(127,'abc1','2024-09-24 11:30:15',NULL,7),(128,'poojitha1907','2024-09-24 14:36:07',NULL,8),(129,'poojitha1907','2024-09-24 16:56:54',NULL,8),(130,'poojitha1907','2024-09-24 17:06:57',NULL,8),(131,'poojitha1907','2024-09-25 09:57:20',NULL,8),(132,'poojitha1907','2024-09-25 13:09:39',NULL,8),(133,'poojitha1907','2024-09-25 13:46:45',NULL,8),(134,'poojitha1907','2024-09-25 16:22:57',NULL,8),(135,'poojitha1907','2024-09-25 18:43:24',NULL,8),(136,'poojitha1907','2024-09-25 18:47:26',NULL,8),(137,'poojitha1907','2024-09-26 10:34:44',NULL,8);
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `address` text,
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `products` text,
  `razorpay_payment_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `logins` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,8,460.00,'COD','{\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-20 11:51:48','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"460\",\"quantity\":1}]',NULL,'2024-09-22 16:22:01'),(4,8,460.00,'COD','{\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-21 11:14:58','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"460\",\"quantity\":1}]',NULL,'2024-09-22 16:22:01'),(5,8,460.00,'COD','{\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-21 11:18:20','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"460\",\"quantity\":1}]',NULL,'2024-09-22 16:22:01'),(6,8,460.00,'COD','{\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-21 11:19:24','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"460\",\"quantity\":1}]',NULL,'2024-09-22 16:22:01'),(7,8,460.00,'COD','{\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-21 11:22:31','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"460\",\"quantity\":1}]',NULL,'2024-09-22 16:22:01'),(8,8,460.00,'COD','{\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-21 11:25:56','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"460\",\"quantity\":1}]',NULL,'2024-09-22 16:22:01'),(9,7,500.00,'COD','{\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-21 16:00:56','[{\"id\":7,\"name\":\"Breathable Large Adult Diapers Pack Of 30\",\"price\":\"500\",\"quantity\":1}]',NULL,'2024-09-22 16:22:01'),(10,7,500.00,'COD','{\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-21 16:01:45','[{\"id\":7,\"name\":\"Breathable Large Adult Diapers Pack Of 30\",\"price\":\"500\",\"quantity\":1}]',NULL,'2024-09-22 16:22:01'),(11,7,500.00,'COD','{\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-21 16:03:28','[{\"id\":7,\"name\":\"Breathable Large Adult Diapers Pack Of 30\",\"price\":\"500\",\"quantity\":1}]',NULL,'2024-09-22 16:22:01'),(12,7,500.00,'COD','{\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-21 16:05:49','[{\"id\":7,\"name\":\"Breathable Large Adult Diapers Pack Of 30\",\"price\":\"500\",\"quantity\":1}]',NULL,'2024-09-22 16:22:01'),(13,7,500.00,'COD','{\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-21 16:12:21','[{\"id\":7,\"name\":\"Breathable Large Adult Diapers Pack Of 30\",\"price\":\"500\",\"quantity\":1}]',NULL,'2024-09-22 16:22:01'),(14,7,500.00,'COD','{\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-21 16:13:11','[{\"id\":7,\"name\":\"Breathable Large Adult Diapers Pack Of 30\",\"price\":\"500\",\"quantity\":1}]',NULL,'2024-09-22 16:22:01'),(15,8,1.00,'COD','{\"id\":1,\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-23 04:08:55','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"1\",\"quantity\":1}]',NULL,'2024-09-23 04:08:55'),(16,8,1.00,'COD','{\"id\":1,\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-23 04:28:34','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"1\",\"quantity\":1}]',NULL,'2024-09-23 04:28:34'),(17,8,1.00,'Razorpay','{\"id\":1,\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','completed','2024-09-23 04:29:51','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"1\",\"quantity\":1}]',NULL,'2024-09-23 04:29:51'),(18,8,1.00,'COD','{\"id\":1,\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-23 04:31:14','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"1\",\"quantity\":1}]',NULL,'2024-09-23 04:31:14'),(19,7,1.00,'Razorpay','{\"id\":1,\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','completed','2024-09-23 04:37:50','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"1\",\"quantity\":1}]','pay_P0Tj6bEfrFcHdv','2024-09-23 04:37:50'),(20,7,3120.00,'COD','{\"id\":1,\"name\":\"Aisha\",\"phone\":\"9999999999\",\"pincode\":\"567890\",\"locality\":\"Kadrinahaali\",\"addressLine1\":\"Subramannya Road\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Near gas station\",\"alternatePhone\":\"8888888888\"}','pending','2024-09-23 04:42:08','[{\"id\":10,\"name\":\"Dignity Overnight Pull Up Adult Diapers\",\"price\":\"520\",\"quantity\":6}]',NULL,'2024-09-23 04:42:08'),(21,8,500.00,'COD','{\"name\":\"\"}','pending','2024-09-23 06:29:32','[{\"id\":7,\"name\":\"Breathable Large Adult Diapers Pack Of 30\",\"price\":\"500\",\"quantity\":1}]',NULL,'2024-09-23 06:29:32'),(22,8,500.00,'COD','{\"savedAddresses\":[{\"index\":1,\"id\":23,\"user_id\":8,\"name\":\"poojitha\",\"phone\":\"9742655735\",\"pincode\":\"560070\",\"locality\":\"Kadirenahalli\",\"address_line1\":\"...............\",\"city\":\"bangalore\",\"state\":\"karnataka\",\"landmark\":\"saxaS\",\"alternate_phone\":\"9964162898\",\"location_type_tag\":\"HOME\"}]}','pending','2024-09-24 04:48:09','[{\"id\":7,\"name\":\"Breathable Large Adult Diapers Pack Of 30\",\"price\":\"500\",\"quantity\":1}]',NULL,'2024-09-24 04:48:09'),(23,8,1.00,'COD','{\"savedAddresses\":[{\"index\":1,\"id\":24,\"user_id\":8,\"name\":\"poojitha\",\"phone\":\"9742655735\",\"pincode\":\"560070\",\"locality\":\"Kadirenahalli\",\"address_line1\":\"JHBCS Layout, Kadirenahalli, Bangalore South, Bengaluru Urban, Karnataka, 560070, India\",\"city\":\"Bengaluru Urban\",\"state\":\"Karnataka\",\"landmark\":\"JHBCS Layout\",\"alternate_phone\":\"9964162898\",\"location_type_tag\":\"HOME\"}]}','pending','2024-09-24 04:50:29','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"1\",\"quantity\":1}]',NULL,'2024-09-24 04:50:29'),(24,7,1.00,'COD','{\"savedAddresses\":[{\"index\":1,\"id\":28,\"user_id\":7,\"name\":\"abc\",\"phone\":\"1111111111\",\"pincode\":\"560070\",\"locality\":\"Kadirenahalli\",\"address_line1\":\"Muscle Mechanic, \\\" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Teacher\'s Colony\",\"alternate_phone\":\"1231231231\",\"location_type_tag\":\"HOME\"}]}','pending','2024-09-24 05:38:24','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"1\",\"quantity\":1}]',NULL,'2024-09-24 05:38:24'),(25,7,1.00,'COD','{\"savedAddresses\":[{\"index\":1,\"id\":29,\"user_id\":7,\"name\":\"abc\",\"phone\":\"1111111111\",\"pincode\":\"560070\",\"locality\":\"Kadirenahalli\",\"address_line1\":\"Muscle Mechanic, \\\" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Teacher\'s Colony\",\"alternate_phone\":\"1231231231\",\"location_type_tag\":\"HOME\"}]}','pending','2024-09-24 05:41:58','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"1\",\"quantity\":1}]',NULL,'2024-09-24 05:41:58'),(26,8,1.00,'Razorpay','{\"savedAddresses\":[{\"index\":1,\"id\":30,\"user_id\":8,\"name\":\"poojitha\",\"phone\":\"9742655735\",\"pincode\":\"560070\",\"locality\":\"Kadirenahalli\",\"address_line1\":\"JHBCS Layout, Kadirenahalli, Bangalore South, Bengaluru Urban, Karnataka, 560070, India\",\"city\":\"Bengaluru Urban\",\"state\":\"Karnataka\",\"landmark\":\"JHBCS Layout\",\"alternate_phone\":\"9964162898\",\"location_type_tag\":\"HOME\"}]}','completed','2024-09-24 06:13:54','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"1\",\"quantity\":1}]','pay_P0ttixZtYoT2nZ','2024-09-24 06:13:54'),(27,8,1.00,'COD','{\"savedAddresses\":[{\"index\":1,\"id\":31,\"user_id\":8,\"name\":\"poojitha\",\"phone\":\"9742655735\",\"pincode\":\"560070\",\"locality\":\"Kadirenahalli\",\"address_line1\":\"Muscle Mechanic, \\\" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Teacher\'s Colony\",\"alternate_phone\":\"9964162898\",\"location_type_tag\":\"HOME\"}]}','pending','2024-09-24 06:21:12','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"1\",\"quantity\":1}]',NULL,'2024-09-24 06:21:12'),(28,8,1.00,'COD','{\"savedAddresses\":[{\"index\":1,\"id\":32,\"user_id\":8,\"name\":\"poojitha\",\"phone\":\"9742655735\",\"pincode\":\"560070\",\"locality\":\"Kadirenahalli\",\"address_line1\":\"Muscle Mechanic, \\\" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Teacher\'s Colony\",\"alternate_phone\":\"9964162898\",\"location_type_tag\":\"HOME\"}]}','pending','2024-09-24 06:25:11','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"1\",\"quantity\":1}]',NULL,'2024-09-24 06:25:11'),(29,8,1.00,'COD','{\"savedAddresses\":[{\"index\":1,\"id\":33,\"user_id\":8,\"name\":\"pooojitha\",\"phone\":\"9742655735\",\"pincode\":\"560070\",\"locality\":\"Kadirenahalli\",\"address_line1\":\"Muscle Mechanic, \\\" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Teacher\'s Colony\",\"alternate_phone\":\"\",\"location_type_tag\":\"HOME\"}]}','pending','2024-09-24 10:03:45','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":\"1\",\"quantity\":1}]',NULL,'2024-09-24 10:03:45'),(30,8,460.00,'COD','{\"savedAddresses\":[{\"index\":1,\"id\":34,\"user_id\":8,\"name\":\"poojitha\",\"phone\":\"9742655735\",\"pincode\":\"560070\",\"locality\":\"Kadirenahalli\",\"address_line1\":\"Muscle Mechanic, \\\" #219,, Subramaniapura Road, Teacher\'s Colony, Kadirenahalli, Bengaluru, Bangalore South, Bengaluru Urban, Karnataka, 560070, India\",\"city\":\"Bengaluru\",\"state\":\"Karnataka\",\"landmark\":\"Teacher\'s Colony\",\"alternate_phone\":\"9964162898\",\"location_type_tag\":\"HOME\"}]}','pending','2024-09-25 13:19:30','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":460,\"quantity\":1}]',NULL,'2024-09-25 13:19:30'),(31,8,460.00,'COD','{\"savedAddresses\":[{\"index\":1,\"id\":35,\"user_id\":8,\"name\":\"poojitha\",\"phone\":\"9742655735\",\"pincode\":\"560070\",\"locality\":\"Kadirenahalli\",\"address_line1\":\"JHBCS Layout, Kadirenahalli, Bangalore South, Bengaluru Urban, Karnataka, 560070, India\",\"city\":\"Bengaluru Urban\",\"state\":\"Karnataka\",\"landmark\":\"JHBCS Layout\",\"alternate_phone\":\"9964162898\",\"location_type_tag\":\"HOME\"}]}','pending','2024-09-26 05:07:03','[{\"id\":1,\"name\":\"Eco Pants XXL Adult choice diaper pant\",\"price\":460,\"quantity\":1}]',NULL,'2024-09-26 05:07:03');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_method` enum('COD','UPI','Credit Card') DEFAULT NULL,
  `order_status` enum('pending','completed','cancelled') DEFAULT NULL,
  `address` text,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `otp` varchar(6) DEFAULT NULL,
  `otp_expiry` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'vishwa20','vishwa20@gmail.com','$2b$10$5mpkps0WHKAWgk1mCJQV8OITTl2crBKZ/Pl2Xe2eoUcep7uAdn05.','0990099009','+91',NULL,NULL),(3,'vish11','vish11@gmail.com','$2b$10$ERp7OVHixtR0WjmJgdxJqe2A1lJmI9AvQRVrFYGergsYwNKsGLPNm','0909090909','+91',NULL,NULL),(4,'poojitha19','poojitha@gmail.com','$2b$10$7JCsKljlZi.9q/OsXcgxGOa1ArIoA5EWFtvd/5ZY80jaxJztK19Cq','9876543298','+91',NULL,NULL),(6,'poojitha1907','poojitha1907@gmail.com','$2b$10$MIZqJ1fw8io6qTdFDpIweufhyPGXaa9bihbCsOu8V0si1yccYj.XG','9964162898','+91',NULL,NULL),(7,'abc1','abc@gmail.com','Abc@1234','9898765432','+91',NULL,NULL),(8,'poojitha1907','poojitha.unnam@gmail.com','Pooj@1234','9964162898','+91','610992','2024-09-24 15:44:57'),(9,'vishwa20','vishwas7265@gmail.com','Vishwa@2001','6362244300','+91',NULL,NULL),(10,'vishwa20','vishwas7265@gmail.com','Vishwa@2001','6362244300','+91',NULL,NULL),(11,'vishwa20','vishwas7265@gmail.com','Vishwa@2001','6362244300','+91',NULL,NULL),(12,'vishwa20','vishwas7265@gmail.com','Vishwa@2001','6362244300','+91',NULL,NULL),(13,'vishwa20','vishwas7265@gmail.com','Vishwa@2001','6362244300','+91',NULL,NULL),(14,'vishwa20','vishwas7265@gmail.com','Vishwa@2001','6362244300','+91',NULL,NULL),(15,'abc12','abc@gmail.com','Abc@1234','9876543287','+91',NULL,NULL),(16,'poojitha12','poojitha@gmail.com','Pooj@1234','9876543298','+91',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-27 14:34:23
