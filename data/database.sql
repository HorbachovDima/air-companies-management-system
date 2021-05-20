CREATE DATABASE  IF NOT EXISTS `air_companies_management_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `air_companies_management_system`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: air_companies_management_system
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `air_company`
--

DROP TABLE IF EXISTS `air_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `air_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `company_type` varchar(255) NOT NULL,
  `founded_at` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `air_company`
--

LOCK TABLES `air_company` WRITE;
/*!40000 ALTER TABLE `air_company` DISABLE KEYS */;
INSERT INTO `air_company` VALUES (1,'Emirates Airline','Air Company',1985),(2,'Qatar Airways','Air Company',1993),(3,'Saudia','Air Company',1945),(4,'SkyUp','Air Company',2017);
/*!40000 ALTER TABLE `air_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `factory_serial_number` int NOT NULL,
  `air_company_id` int DEFAULT NULL,
  `number_of_flights` int DEFAULT NULL,
  `flight_distance` double DEFAULT NULL,
  `fuel_capacity` double NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `factory_serail_number_UNIQUE` (`factory_serial_number`),
  KEY `airplane_air_company_FK_idx` (`air_company_id`),
  CONSTRAINT `airplane_air_company_FK` FOREIGN KEY (`air_company_id`) REFERENCES `air_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane`
--

LOCK TABLES `airplane` WRITE;
/*!40000 ALTER TABLE `airplane` DISABLE KEYS */;
INSERT INTO `airplane` VALUES (1,'Boeing 737',11111,1,98,17000,125.5,'Passenger plane',1967),(2,'Boeing 787 Dreamliner',22222,1,23,18000,233.5,'Passenger plane',2009),(3,'Boeing 737',33333,2,123,40000,124.5,'Passenger plane',1967),(4,'Boeing 787 Dreamliner',44444,2,323,100000,123,'Passenger plane',2009),(5,'Boeing 737',55555,3,12,10000,100,'Passenger plane',1967),(6,'Boeing 787 Dreamliner',66666,3,500,500000,250,'Passenger plane',2009),(7,'Boeing 737',77777,4,700,900000,342.5,'Passenger plane',1967),(8,'Boeing 787 Dreamliner',88888,4,1000,300000,321.5,'Passenger plane',2009);
/*!40000 ALTER TABLE `airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `id` int NOT NULL AUTO_INCREMENT,
  `flight_status` enum('ACTIVE','COMPLETED','DELAYED','PENDING') NOT NULL,
  `air_company_id` int DEFAULT NULL,
  `airplane_id` int DEFAULT NULL,
  `departure_country` varchar(255) NOT NULL,
  `destination_country` varchar(255) NOT NULL,
  `distance` double NOT NULL,
  `estimated_flight_time` time NOT NULL,
  `ended_at` time DEFAULT NULL,
  `delay_started_at` time DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flight_air_company_FK_idx` (`air_company_id`),
  KEY `flight_airplane_FK_idx` (`airplane_id`),
  CONSTRAINT `flight_air_company_FK` FOREIGN KEY (`air_company_id`) REFERENCES `air_company` (`id`),
  CONSTRAINT `flight_airplane_FK` FOREIGN KEY (`airplane_id`) REFERENCES `airplane` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'ACTIVE',1,1,'Italy','Ukraine',1677,'02:15:00',NULL,NULL,'2021-05-17 16:10:00'),(2,'COMPLETED',1,2,'Ukraine','Germany',1354.4,'02:13:00','19:30:00',NULL,'2021-05-16 17:41:00'),(3,'ACTIVE',2,3,'Italy','Ukraine',1677,'02:15:00',NULL,NULL,'2021-05-18 13:30:00'),(4,'COMPLETED',2,4,'Ukraine','Germany',1354.4,'02:13:00','20:30:00',NULL,'2021-05-14 18:41:00'),(5,'ACTIVE',3,5,'Italy','Ukraine',1677,'02:15:00',NULL,NULL,'2021-05-18 10:30:00'),(6,'COMPLETED',3,6,'Ukraine','Germany',1354.4,'02:13:00','21:30:00',NULL,'2021-05-19 19:41:00'),(7,'ACTIVE',4,7,'Italy','Ukraine',1677,'02:15:00',NULL,NULL,'2021-05-19 22:30:00'),(8,'COMPLETED',4,8,'Ukraine','Germany',1354.4,'02:13:00','22:30:00',NULL,'2021-05-19 20:41:00');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20 12:31:26
