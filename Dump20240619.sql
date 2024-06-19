CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Мясные блюда'),(2,'Пиццы'),(3,'Супы и салаты'),(4,'Роллы и суши'),(5,'Десерты');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_has_product`
--

DROP TABLE IF EXISTS `category_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_has_product` (
  `category_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`category_id`,`product_id`),
  KEY `fk_Category_has_product_product1_idx` (`product_id`),
  KEY `fk_Category_has_product_Category1_idx` (`category_id`),
  CONSTRAINT `fk_Category_has_product_Category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_Category_has_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_has_product`
--

LOCK TABLES `category_has_product` WRITE;
/*!40000 ALTER TABLE `category_has_product` DISABLE KEYS */;
INSERT INTO `category_has_product` VALUES (1,1),(2,2),(3,3),(1,4),(3,4),(4,5),(4,6),(5,6);
/*!40000 ALTER TABLE `category_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryman`
--

DROP TABLE IF EXISTS `deliveryman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryman` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `orders_mouth` int DEFAULT NULL,
  `salary_mouth` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryman`
--

LOCK TABLES `deliveryman` WRITE;
/*!40000 ALTER TABLE `deliveryman` DISABLE KEYS */;
INSERT INTO `deliveryman` VALUES (1,'Алексей','Смирнов','+79992223311','ул. Рабочая, д.15',25,50000.00),(2,'Елена','Петрова','+79997778899','пр. Победы, д.30',30,55000.00),(3,'Дмитрий','Иванов','+79994445566','ул. Лесная, д.5',28,52000.00),(4,'Олег','Петровиц','+79823453452','ул Королева, д.4',1,225.00);
/*!40000 ALTER TABLE `deliveryman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!50001 DROP VIEW IF EXISTS `order_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_details` AS SELECT 
 1 AS `order_id`,
 1 AS `order_price`,
 1 AS `order_status`,
 1 AS `order_address`,
 1 AS `order_payment`,
 1 AS `order_time`,
 1 AS `delivery_time`,
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `user_surname`,
 1 AS `user_address`,
 1 AS `deliveryman_id`,
 1 AS `deliveryman_name`,
 1 AS `deliveryman_surname`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `product_price`,
 1 AS `product_description`,
 1 AS `product_weight`,
 1 AS `restaurant_id`,
 1 AS `restaurant_name`,
 1 AS `restaurant_address`,
 1 AS `restaurant_number`,
 1 AS `product_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `status` enum('in the basket','accepted','rejected','prepare','transferred for delivery','in delivery','delivered') NOT NULL,
  `address` varchar(255) NOT NULL,
  `payment` enum('Online',' Cash') NOT NULL,
  `order_time` datetime NOT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  `deliveryman_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user1_idx` (`user_id`),
  KEY `fk_order_deliveryman1_idx` (`deliveryman_id`),
  CONSTRAINT `fk_order_deliveryman1` FOREIGN KEY (`deliveryman_id`) REFERENCES `deliveryman` (`id`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1750.00,'in the basket','ул. Пушкина, д.1, кв. 5','Online','2024-06-18 14:30:00','2024-06-18 15:15:00',1,1),(2,1450.00,'accepted','ул. Лермонтова, д.10',' Cash','2024-06-18 15:00:00','2024-06-18 16:00:00',2,2),(3,1800.00,'rejected','пр. Ленина, д.25, кв. 15','Online','2024-06-18 16:45:00','2024-06-18 17:30:00',3,3),(6,3250.00,'delivered','ул. Пушкина, д.1, кв. 5','Online','2024-06-19 11:41:11','2024-06-19 14:20:25',1,4),(8,3250.00,'delivered','ул. Пушкина, д.1, кв. 5','Online','2024-06-19 11:45:33','2024-06-19 14:22:20',1,4),(9,1650.00,'accepted','пр. Ленина, д.25, кв. 15','Online','2024-06-19 15:41:44',NULL,3,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_has_product`
--

DROP TABLE IF EXISTS `orders_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_has_product` (
  `orders_id` int NOT NULL,
  `product_id` int NOT NULL,
  `Count` int NOT NULL,
  PRIMARY KEY (`orders_id`,`product_id`),
  KEY `fk_order_has_product_product1_idx` (`product_id`),
  KEY `fk_order_has_product_order1_idx` (`orders_id`),
  CONSTRAINT `fk_order_has_product_order1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_has_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_has_product`
--

LOCK TABLES `orders_has_product` WRITE;
/*!40000 ALTER TABLE `orders_has_product` DISABLE KEYS */;
INSERT INTO `orders_has_product` VALUES (1,1,1),(1,3,2),(2,2,1),(2,4,1),(3,1,2),(3,5,1),(3,6,1),(6,1,2),(6,2,1),(8,1,2),(8,2,1),(9,3,1),(9,4,2);
/*!40000 ALTER TABLE `orders_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `weight` float NOT NULL,
  `restaurant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_restaurant1_idx` (`restaurant_id`),
  CONSTRAINT `fk_product_restaurant1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Стейк из говядины',1200.00,'Нежный стейк с картофелем и овощами',300,2),(2,'Пицца Маргарита',850.00,'Традиционная пицца с томатным соусом и сыром',600,3),(3,'Суп Крем-суп',450.00,'Картофельный крем-суп с грибами',250,1),(4,'Салат Цезарь',600.00,'Салат с куриной грудкой, листовым салатом и пармезаном',350,2),(5,'Суши Калифорния',950.00,'Роллы с крабовым мясом, авокадо и огурцом',400,3),(6,'Десерт Тирамису',400.00,'Классический итальянский десерт',200,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `number` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Ресторан \"У моря\"','ул. Морская, д.10','+79990001122'),(2,'Кафе \"Гриль Хаус\"','пр. Солнечный, д.5','+79998889900'),(3,'Пиццерия \"Маргарита\"','ул. Итальянская, д.7','+79996667788');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `number` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Иван','Иванов','hashed_password_1','ул. Пушкина, д.1, кв. 5','+79991234567'),(2,'Петр','Петров','hashed_password_2','ул. Лермонтова, д.10','+79998887766'),(3,'Мария','Сидорова','hashed_password_3','пр. Ленина, д.25, кв. 15','+79995554433');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_orders_accepted`
--

DROP TABLE IF EXISTS `view_orders_accepted`;
/*!50001 DROP VIEW IF EXISTS `view_orders_accepted`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_orders_accepted` AS SELECT 
 1 AS `id`,
 1 AS `price`,
 1 AS `status`,
 1 AS `address`,
 1 AS `payment`,
 1 AS `order_time`,
 1 AS `delivery_time`,
 1 AS `user_id`,
 1 AS `deliveryman_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `order_details`
--

/*!50001 DROP VIEW IF EXISTS `order_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `order_details` AS select `orders`.`id` AS `order_id`,`orders`.`price` AS `order_price`,`orders`.`status` AS `order_status`,`orders`.`address` AS `order_address`,`orders`.`payment` AS `order_payment`,`orders`.`order_time` AS `order_time`,`orders`.`delivery_time` AS `delivery_time`,`user`.`id` AS `user_id`,`user`.`name` AS `user_name`,`user`.`surname` AS `user_surname`,`user`.`address` AS `user_address`,`deliveryman`.`id` AS `deliveryman_id`,`deliveryman`.`name` AS `deliveryman_name`,`deliveryman`.`surname` AS `deliveryman_surname`,`product`.`id` AS `product_id`,`product`.`name` AS `product_name`,`product`.`price` AS `product_price`,`product`.`description` AS `product_description`,`product`.`weight` AS `product_weight`,`restaurant`.`id` AS `restaurant_id`,`restaurant`.`name` AS `restaurant_name`,`restaurant`.`adress` AS `restaurant_address`,`restaurant`.`number` AS `restaurant_number`,`orders_has_product`.`Count` AS `product_count` from (((((`orders` join `user` on((`orders`.`user_id` = `user`.`id`))) left join `deliveryman` on((`orders`.`deliveryman_id` = `deliveryman`.`id`))) join `orders_has_product` on((`orders`.`id` = `orders_has_product`.`orders_id`))) join `product` on((`orders_has_product`.`product_id` = `product`.`id`))) join `restaurant` on((`product`.`restaurant_id` = `restaurant`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_orders_accepted`
--

/*!50001 DROP VIEW IF EXISTS `view_orders_accepted`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_orders_accepted` AS select `orders`.`id` AS `id`,`orders`.`price` AS `price`,`orders`.`status` AS `status`,`orders`.`address` AS `address`,`orders`.`payment` AS `payment`,`orders`.`order_time` AS `order_time`,`orders`.`delivery_time` AS `delivery_time`,`orders`.`user_id` AS `user_id`,`orders`.`deliveryman_id` AS `deliveryman_id` from `orders` where (`orders`.`status` <> 'rejected') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 23:59:56
