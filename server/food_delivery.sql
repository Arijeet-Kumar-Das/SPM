-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: food_delivery
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(50) DEFAULT 'Home',
  `details` text NOT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (6,6,'Home','adasd',0),(7,2,'Home','bla bla bla testing testing',1),(10,2,'Home','bul bula ',0),(11,7,'Home','New york street',0),(13,8,'Home','bengaluru bull temple road ',1),(14,9,'Home','bmsce ',1),(15,10,'Home','bengaluru 123',0),(16,11,'Home','Bengaluru ',1),(17,12,'Home','Bengaluru',1),(18,13,'Home','Bihar',1),(19,14,'Home','bengaluru ',1),(20,15,'Home','ghy',1),(21,16,'Home','bengaluru ',1),(22,17,'Home','karnataka',1),(23,19,'Home','mangalore',1);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Signature','2025-06-27 14:27:52'),(2,'Vegetarian','2025-06-27 14:27:52'),(3,'Protein','2025-06-27 14:27:52'),(4,'Vegan','2025-06-27 14:27:52'),(5,'Seasonal','2025-06-27 14:27:52');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_ratings`
--

DROP TABLE IF EXISTS `food_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_ratings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `rating` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_food_unique` (`user_id`,`food_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `food_ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `food_ratings_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `food_ratings_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_ratings`
--

LOCK TABLES `food_ratings` WRITE;
/*!40000 ALTER TABLE `food_ratings` DISABLE KEYS */;
INSERT INTO `food_ratings` VALUES (1,2,2,4,'2025-07-11 17:43:16'),(2,2,3,4,'2025-07-11 17:43:18'),(3,2,1,4,'2025-07-11 19:23:41'),(4,13,1,3,'2025-07-11 19:25:45'),(5,13,3,3,'2025-07-11 19:25:46'),(6,13,2,3,'2025-07-11 19:25:47'),(7,2,7,4,'2025-07-12 06:56:15'),(8,2,8,4,'2025-07-12 06:56:16');
/*!40000 ALTER TABLE `food_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `rating_average` float DEFAULT '0',
  `rating_count` int DEFAULT '0',
  `category_id` int NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'Mediterranean Power Bowl','Quinoa, kale, roasted veggies, feta, lemon-tahini dressing',350.00,3.5,2,1,'food-2.jpg',1,'2025-06-27 14:29:12'),(2,'Paneer Tikka Salad','Grilled paneer, mixed greens, bell peppers, mint yogurt dressing',350.00,3.5,2,2,'food-1.jpg',1,'2025-06-27 14:29:12'),(3,'Protein Powerhouse','Grilled chicken, quinoa, chickpeas, tahini dressing',450.00,3.5,2,3,'food-3.jpg',1,'2025-06-27 14:29:12'),(4,'Avocado & Berry Bliss','Mixed greens, avocado, berries, almonds, balsamic glaze',500.00,0,0,4,'food-4.jpg',1,'2025-06-27 14:29:12'),(5,'Summer Harvest Bowl','Seasonal fruits, goat cheese, honey-lime dressing',340.00,0,0,5,'food-5.jpg',1,'2025-06-27 14:29:12'),(6,'Greek Goddess Bowl','Chickpeas, cucumber, olives, tomatoes, tzatziki',200.00,0,0,1,'food-6.jpg',1,'2025-06-27 14:29:12'),(7,'Thai Peanut Salad','Rice noodles, veggies, tofu, peanut sauce',400.00,4,1,4,'food-7.jpg',1,'2025-06-27 14:29:12'),(8,'Caprese Salad','Fresh mozzarella, tomatoes, basil, balsamic glaze',600.00,4,1,2,'food-8.jpg',1,'2025-06-27 14:29:12'),(10,'random food ',NULL,1000.00,0,0,1,'food-1.jpg',1,'2025-07-12 06:58:20');
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `food_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price_at_order` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,300.00),(2,1,2,1,350.00),(3,2,5,1,340.00),(4,2,4,1,500.00),(5,2,6,1,200.00),(6,3,2,1,350.00),(7,3,3,1,450.00),(8,4,2,1,350.00),(9,4,3,1,450.00),(10,5,2,1,350.00),(11,5,3,1,450.00),(12,6,1,1,300.00),(13,6,2,1,350.00),(14,7,1,1,300.00),(15,7,2,1,350.00),(16,8,1,1,300.00),(17,8,2,1,350.00),(18,9,1,1,300.00),(19,9,2,1,350.00),(20,10,1,1,300.00),(21,10,2,1,350.00),(22,11,2,1,350.00),(23,11,3,1,450.00),(24,12,3,1,450.00),(25,12,2,1,350.00),(26,13,2,1,350.00),(27,13,3,1,450.00),(28,14,1,1,300.00),(29,14,2,1,350.00),(30,15,2,1,350.00),(31,15,3,1,450.00),(32,16,2,1,350.00),(33,16,3,1,450.00),(34,17,5,1,340.00),(35,17,6,1,200.00),(36,18,1,1,300.00),(37,18,2,1,350.00),(38,19,1,1,300.00),(39,19,2,1,350.00),(40,20,1,1,300.00),(41,20,2,1,350.00),(42,21,2,1,350.00),(43,21,3,1,450.00),(44,22,2,1,350.00),(45,22,3,1,450.00),(46,23,2,1,350.00),(47,23,3,1,450.00),(48,24,2,1,350.00),(49,24,3,1,450.00),(50,25,1,2,300.00),(51,25,2,1,350.00),(52,26,2,1,350.00),(53,26,3,1,450.00),(54,27,2,1,350.00),(55,27,3,1,450.00),(56,28,1,1,300.00),(57,28,2,1,350.00),(58,29,1,1,300.00),(59,29,2,1,350.00),(60,30,1,1,300.00),(61,30,2,1,350.00),(62,31,1,1,300.00),(63,31,2,1,350.00),(64,32,1,2,300.00),(65,32,2,1,350.00),(66,33,1,3,300.00),(67,33,2,1,350.00),(68,34,1,3,300.00),(69,34,2,1,350.00),(70,35,2,1,350.00),(71,35,3,1,450.00),(72,36,2,1,350.00),(73,36,3,1,450.00),(74,37,2,1,350.00),(75,37,3,1,450.00),(76,38,3,1,450.00),(77,39,2,1,350.00),(78,39,3,1,450.00),(79,40,2,1,350.00),(80,40,3,1,450.00),(81,41,2,1,350.00),(82,41,3,1,450.00),(83,42,2,1,350.00),(84,42,3,1,450.00),(85,43,1,1,350.00),(86,43,3,1,450.00),(87,43,2,1,350.00),(88,44,1,1,350.00),(89,44,2,1,350.00),(90,45,1,1,350.00),(91,45,2,1,350.00),(92,46,1,1,350.00),(93,46,2,1,350.00),(94,47,1,1,350.00),(95,47,2,1,350.00),(96,48,1,1,350.00),(97,48,2,1,350.00),(98,49,1,1,350.00),(99,49,2,1,350.00),(100,50,1,1,350.00),(101,50,2,1,350.00),(102,51,7,1,400.00),(103,51,8,1,600.00),(104,52,1,1,350.00),(105,52,2,1,350.00),(106,53,3,4,450.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
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
  `delivery_address_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_id` varchar(255) DEFAULT NULL,
  `payment_status` enum('pending','completed','failed') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `fk_delivery_address` (`delivery_address_id`),
  CONSTRAINT `fk_delivery_address` FOREIGN KEY (`delivery_address_id`) REFERENCES `addresses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,7,650.00,'pending','2025-07-03 18:07:44',NULL,'pending'),(2,2,7,1040.00,'pending','2025-07-04 13:42:29',NULL,'pending'),(3,2,7,800.00,'pending','2025-07-04 18:28:48',NULL,'pending'),(4,2,7,800.00,'pending','2025-07-04 18:38:04',NULL,'pending'),(5,2,7,800.00,'pending','2025-07-04 18:38:05',NULL,'pending'),(6,2,7,650.00,'pending','2025-07-04 18:38:27',NULL,'pending'),(7,2,7,650.00,'pending','2025-07-04 18:49:09',NULL,'pending'),(8,2,7,650.00,'pending','2025-07-04 18:53:27',NULL,'pending'),(9,2,7,650.00,'pending','2025-07-04 18:55:06',NULL,'pending'),(10,2,7,650.00,'pending','2025-07-04 19:07:15',NULL,'pending'),(11,2,7,800.00,'pending','2025-07-04 19:48:12',NULL,'pending'),(12,2,7,800.00,'pending','2025-07-04 19:53:27',NULL,'pending'),(13,2,7,800.00,'pending','2025-07-04 19:57:16',NULL,'pending'),(14,2,7,650.00,'pending','2025-07-04 20:16:32',NULL,'pending'),(15,2,7,800.00,'pending','2025-07-04 20:18:07',NULL,'pending'),(16,2,7,800.00,'pending','2025-07-04 20:20:29',NULL,'pending'),(17,2,7,540.00,'pending','2025-07-05 04:56:22',NULL,'pending'),(18,2,7,650.00,'confirmed','2025-07-05 05:30:53',NULL,'pending'),(19,2,7,650.00,'confirmed','2025-07-05 05:31:35',NULL,'pending'),(20,2,7,650.00,'confirmed','2025-07-05 05:32:26',NULL,'pending'),(21,2,7,800.00,'delivered','2025-07-05 05:34:25',NULL,'pending'),(22,2,7,800.00,'delivered','2025-07-05 05:34:43',NULL,'pending'),(23,2,7,800.00,'delivered','2025-07-05 05:36:15',NULL,'pending'),(24,2,7,800.00,'delivered','2025-07-05 05:36:45',NULL,'pending'),(25,2,7,950.00,'delivered','2025-07-05 07:25:57',NULL,'pending'),(26,2,7,800.00,'delivered','2025-07-07 16:11:51',NULL,'pending'),(27,13,18,800.00,'confirmed','2025-07-07 16:12:21',NULL,'pending'),(28,13,18,650.00,'confirmed','2025-07-07 16:12:43',NULL,'pending'),(29,13,18,650.00,'confirmed','2025-07-07 16:13:09',NULL,'pending'),(30,13,18,650.00,'confirmed','2025-07-07 16:14:52',NULL,'pending'),(31,13,18,650.00,'confirmed','2025-07-07 16:28:47',NULL,'pending'),(32,13,18,950.00,'confirmed','2025-07-07 16:31:28',NULL,'pending'),(33,13,18,1250.00,'confirmed','2025-07-07 16:34:20',NULL,'pending'),(34,13,18,1250.00,'confirmed','2025-07-07 16:37:50',NULL,'pending'),(35,2,7,800.00,'confirmed','2025-07-07 16:40:24','pay_QqFMIPYJ3725sz','completed'),(36,13,18,800.00,'failed','2025-07-07 16:42:53',NULL,'failed'),(37,13,18,800.00,'confirmed','2025-07-07 16:43:08','pay_QqFPBFzYhKmeJU','completed'),(38,14,19,450.00,'confirmed','2025-07-07 16:49:32',NULL,'failed'),(39,15,20,800.00,'confirmed','2025-07-07 17:41:19',NULL,'failed'),(40,16,21,800.00,'confirmed','2025-07-09 15:51:43',NULL,'failed'),(41,17,22,800.00,'confirmed','2025-07-09 15:53:01',NULL,'failed'),(42,16,21,800.00,'delivered','2025-07-09 15:53:42',NULL,'pending'),(43,13,18,1150.00,'delivered','2025-07-11 19:24:36','pay_QrsIKVsXYGQTRm','completed'),(44,2,7,700.00,'pending','2025-07-12 06:10:28',NULL,'pending'),(45,2,7,700.00,'pending','2025-07-12 06:10:35',NULL,'pending'),(46,2,7,700.00,'pending','2025-07-12 06:11:48',NULL,'pending'),(47,2,7,700.00,'pending','2025-07-12 06:21:15',NULL,'pending'),(48,2,7,700.00,'delivered','2025-07-12 06:21:17',NULL,'pending'),(49,2,7,700.00,'delivered','2025-07-12 06:21:37','pay_Qs3ULCvn1GmPi7','completed'),(50,13,18,700.00,'failed','2025-07-12 06:39:08',NULL,'failed'),(51,2,7,1000.00,'delivered','2025-07-12 06:54:49','pay_Qs43RMZYvYuL3T','completed'),(52,2,7,700.00,'confirmed','2025-07-12 09:14:47','pay_Qs6RJvDQYpk6NH','completed'),(53,19,23,1800.00,'delivered','2025-07-25 05:55:03','pay_QxBzGflo4jtzbL','completed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_messages`
--

DROP TABLE IF EXISTS `support_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `support_messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_messages`
--

LOCK TABLES `support_messages` WRITE;
/*!40000 ALTER TABLE `support_messages` DISABLE KEYS */;
INSERT INTO `support_messages` VALUES (1,2,'no subject ','very big complaint','2025-07-11 15:25:32'),(3,2,'a complaint for food','food quality was very bad ','2025-07-12 06:53:35');
/*!40000 ALTER TABLE `support_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Arijeet ','arijeet@gmail.com','8402064033','$2b$12$2tVH8xqgOSiSEM9X/TI8Ae7TJ0TVRgvUFN/svjxE9Pth7L5O2Yd9W','2025-06-26 15:10:39'),(3,'Abhishek','abhishek@gmail.com','1231233123','$2b$12$l99HCSyXsRn/4LaLoUyajOXnA9E7lrTNe0FI/0JbnGGfEdyzHCoEW','2025-06-27 06:08:57'),(4,'John Doe','bla@gmail.com','123123123','$2b$12$cbz3RSGn9P001ExWh.tIneiUM0wJEbBzB41DjOelz0qCDTyg79kBC','2025-06-27 12:38:16'),(5,'testing ','testing@gmail.com','123132132','$2b$12$NMotAPQ1zOdsBk/WBA8ChOnx1wl.JyM5jSfb/wtiWsVtutyrPtzHa','2025-06-27 12:44:57'),(6,'qwe','qwe@gmail.com','41234123','$2b$12$SSKQ5Se9kQB/v7/gWUGNA.WfyIGzDCG0wDsR5tBf/GQDx6eufC0Lu','2025-06-27 12:55:29'),(7,'Rahul','rahul@gmail.com','3534553465','$2b$12$neF2pLJ6PE.SiGCp1ibm9.T.RP4GmlrRuUcfPqdbh8CbnRbpt0yAS','2025-06-27 18:54:40'),(8,'krishna raman','krishnaraman@gmail.com','8210620418','$2b$12$LCAy2ak21tDzEEbEiuMKFO63shvUI95OtrOfkcnMAUlBG3WfOa8zC','2025-06-28 05:37:17'),(9,'madhu','madhu@gmail.com','7842569845','$2b$12$3yvzsH5K03AFOnLdFUOUI.AxoH9vfhvlhecDyFGlrf72hK7vDK/Z2','2025-06-28 07:29:57'),(10,'testing ','testing@yahoo.com','123312333','$2b$12$4HB9UtDTUr9aKK16zwoCuOM/5clyZQQdLhAq9DtPQvbnTqUH55kDO','2025-06-28 08:00:46'),(11,'Chirag ','chirag@gmail.com','3453554345','$2b$12$9jiA6HMCxJcP53Wiu9trAeRwIUU98paltEHXzjDiWXITC0RVyHPtq','2025-06-28 18:34:43'),(12,'goutham ','goutham@gmail.com','234234234','$2b$12$O2avQR/1XQqdzVWWt93Z3eyd0D2Z7GR8G.GoNdNNz4.7e.OPDrHSy','2025-06-30 08:39:28'),(13,'Krishna','krishna@gmail.com','3121231233','$2b$12$8GgpNH9CQmrvMJZ41XGKm.B2fYQx1urJNuUDJAP9iF05q4yiksw/y','2025-07-05 04:58:32'),(14,'rakesh','rakesh@gmail.com','1323123123','$2b$12$P7fSUQpZLfrk08gJKny0IOIbBbN8xQc3m9YlrchEUwQFURUU3mLHe','2025-07-07 16:46:31'),(15,'john','john@gmail.com','13414123412','$2b$12$DH0rDfZLE6iX2GI0WsLuvukjLuVg/UhoRBsj4saTai0Y2mfaU4ui.','2025-07-07 17:40:37'),(16,'Samir','samir@gmail.com','1321231233','$2b$12$P7h/eD6noSK6N9L4i8F8uuPPgmP6N4hCAtHyA/OmY2AzMKJhpBmCO','2025-07-09 15:51:02'),(17,'deep ','deep@gmail.com','1231231233','$2b$12$FYiYqdd.B1vf05vuYdOZrOVWyG5HU1mOvuwuAiUQ/piq3v0I6vt9y','2025-07-09 15:52:31'),(18,'Admin','admin@gmail.com','0000000000','$2a$12$zys8i4JVXu2fLG3gNsYchOeYRqpMfrQa.MzlmKCNt2uQ6Xo8XzYxG','2025-07-11 16:37:44'),(19,'Abhishek AM','abhishekAM@gmail.com','1123132123','$2b$12$1suPnawLD9VU9RVwOnO.qO2nX.zhH33DoqifojwRSSN8FdhHreP0W','2025-07-25 05:51:03');
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

-- Dump completed on 2025-07-25 12:27:51
