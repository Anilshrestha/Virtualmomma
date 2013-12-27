-- MySQL dump 10.13  Distrib 5.1.33, for Win32 (ia32)
--
-- Host: localhost    Database: javaproject
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `imageid` int(11) NOT NULL,
  `imagename` varchar(20) default NULL,
  `recipeid` int(11) default NULL,
  PRIMARY KEY  (`imageid`),
  KEY `recipeid` (`recipeid`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`recipeid`) REFERENCES `recipe` (`recipeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'alu.jpg',1),(2,'alu_fry.jpg',2),(3,'alu_kauli.jpg',3),(4,'momo.jpg',4),(5,'mushroom.jpg',5),(6,'malpuwa.jpg',6),(7,'yomari.jpg',7),(8,'sel.jpg',8);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe` (
  `recipeid` int(11) NOT NULL,
  `recipename` varchar(20) default NULL,
  `recipestatus` enum('public','friend') default NULL,
  `userid` int(11) default NULL,
  `description` varchar(1000) default NULL,
  PRIMARY KEY  (`recipeid`),
  KEY `userid` (`userid`),
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'Alu_Tarkari','public',1,NULL),(2,'Alu_fry','public',2,NULL),(3,'Alu_Kauli','public',3,NULL),(4,'momo','public',4,'NULL'),(5,'mushroom','public',5,'NULL'),(6,'malpuwa','public',6,'NULL'),(7,'yomari','public',7,'NULL'),(8,'sel','public',8,'NULL');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `fname` varchar(20) default NULL,
  `lname` varchar(20) default NULL,
  `email` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Anil','Shrestha','anil@dwit.edu.np','abc'),(2,'Sunil','Shrestha','sunil@dwit.edu.np','abc'),(3,'Swapnil','Shrestha','swapnil@dwit.edu.np','abc'),(4,'Pratibh','Acharya','pratibh@dwit.edu.np','abc'),(5,'Arun','Amatya','arun@dwit.edu.np','abc'),(6,'Sameer','Shrestha','sameer@dwit.edu.np','abc'),(7,'Shankar','Khatri','shankar@dwit.edu.np','abc'),(8,'Keshab','Bajagain','keshab@dwit.edu.np','abc'),(9,'Susmit','Singh','susmit@dwit.edu.np','abc'),(10,'Surendra','Adhikari','surendra@dwit.edu.np','abc'),(11,'Mohan','Adhikari','mohan@dwit.edu.np','abc'),(12,'Roshan','Shrestha','roshan@dwit.edu.np','abc');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-27 10:54:16
