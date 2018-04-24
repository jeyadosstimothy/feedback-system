-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: webprog
-- ------------------------------------------------------
-- Server version	5.7.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'Timothy','jeyadosstimothy@gmail.com','9677207736','pass',20,'student'),(2,'Gowtham','gowthamv441@gmail.com','1234567890','1234',25,'alumni'),(3,'Vikraman','vikikkdi@gmail.com',NULL,'mypass',17,'student'),(6,'Darwin','darwin.thamil@gmail.com',NULL,'pass123',30,'parent'),(7,'Akshay','aks@gmail.com','9677207736','password',35,'parent'),(8,'Ashfaaq',NULL,NULL,'1234',28,'student'),(9,'Rahul',NULL,NULL,'pass',20,NULL);
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `qno` int(11) DEFAULT NULL,
  `choice` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (44,1,1,1),(45,1,0,0),(46,1,3,3),(47,1,2,2),(48,1,5,1),(49,1,4,1),(50,1,6,2),(51,1,1,2),(52,1,0,3),(53,1,3,0),(54,1,2,1),(55,1,5,2),(56,1,4,1),(57,1,6,3),(58,1,1,1),(59,1,0,1),(60,1,3,1),(61,1,2,1),(62,1,5,1),(63,1,4,1),(64,1,6,1),(65,1,1,3),(66,1,0,3),(67,1,3,3),(68,1,2,3),(69,1,5,3),(70,1,4,3),(71,1,6,3),(72,1,1,1),(73,1,0,0),(74,1,3,3),(75,1,2,2),(76,1,5,1),(77,1,4,2),(78,1,6,0),(79,6,1,3),(80,6,0,3),(81,6,3,2),(82,6,2,1),(83,6,5,2),(84,6,4,1),(85,6,6,0),(92,7,1,2),(93,7,0,2),(94,7,3,1),(95,7,2,2),(96,7,5,1),(97,7,4,1),(98,7,6,1),(99,8,1,1),(100,8,0,0),(101,8,3,1),(102,8,2,1),(103,8,5,2),(104,8,4,0),(105,8,6,3);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-24 12:07:19
