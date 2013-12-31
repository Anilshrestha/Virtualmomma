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
-- Table structure for table `favoriterecipe`
--

DROP TABLE IF EXISTS `favoriterecipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favoriterecipe` (
  `favoriterecipeid` int(11) NOT NULL auto_increment,
  `recipeid` int(11) default NULL,
  `friendid` int(11) default NULL,
  `userid` int(11) default NULL,
  PRIMARY KEY  (`favoriterecipeid`),
  KEY `recipeid` (`recipeid`),
  KEY `friendid` (`friendid`),
  KEY `userid` (`userid`),
  CONSTRAINT `favoriterecipe_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `favoriterecipe_ibfk_1` FOREIGN KEY (`recipeid`) REFERENCES `recipe` (`recipeid`),
  CONSTRAINT `favoriterecipe_ibfk_2` FOREIGN KEY (`friendid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoriterecipe`
--

LOCK TABLES `favoriterecipe` WRITE;
/*!40000 ALTER TABLE `favoriterecipe` DISABLE KEYS */;
INSERT INTO `favoriterecipe` VALUES (12,20,3,1),(13,20,3,1),(14,19,2,1);
/*!40000 ALTER TABLE `favoriterecipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `imageid` int(11) NOT NULL auto_increment,
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
INSERT INTO `image` VALUES (1,'alu.jpg',1),(2,'alu_fry.jpg',2),(3,'alu_kauli.jpg',3),(4,'momo.jpg',4),(5,'mushroom.jpg',5),(6,'malpuwa.jpg',6),(7,'yomari.jpg',7),(8,'sel.jpg',8),(9,'tama_tarkari.jpg',9),(10,'laddu.jpg',10),(11,'aduwako_achar.jpg',11),(12,'chukauni.jpg',12),(13,'gundruk.jpg',13),(14,'lapsi.jpg',14),(15,'farsi_ko_achar.jpg',15),(18,'pancakes.jpg',18),(19,'barfi.jpg',19),(20,'lalmohan.jpg',20);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `ingredientid` int(11) NOT NULL auto_increment,
  `ingredientname` varchar(30) default NULL,
  `quantity` decimal(4,2) default NULL,
  `unit` enum('kg','gm','litre','pieces','spoon') default NULL,
  `recipeid` int(11) default NULL,
  PRIMARY KEY  (`ingredientid`),
  KEY `recipeid` (`recipeid`),
  CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`recipeid`) REFERENCES `recipe` (`recipeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (4,'Egg ','2.00','pieces',18),(5,'Maida','10.00','gm',18),(6,'Sugar','1.00','gm',18),(7,'Salt ','1.00','spoon',18),(8,'Cashew Nuts','2.00','gm',19),(9,'Sugar powdered','2.00','spoon',19),(10,'Ghee ','2.00','spoon',19),(11,'Cardamom powder  ','1.00','spoon',19),(12,'flour','10.00','gm',20),(13,'Milk Powder','10.00','gm',20),(14,'a','2.00','kg',21),(15,'a','2.00','kg',21);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe` (
  `recipeid` int(11) NOT NULL auto_increment,
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
INSERT INTO `recipe` VALUES (1,'Alu_Tarkari','public',1,'1)Boil potatoes,peel it and chop into quarters.<br/>\n\r\n\"\n\"2)Roast sesame seeds'),(2,'Alu_fry','public',2,NULL),(3,'Alu_Kauli','public',3,NULL),(4,'momo','public',4,'NULL'),(5,'mushroom','public',5,'NULL'),(6,'malpuwa','public',6,'NULL'),(7,'yomari','public',7,'NULL'),(8,'sel','public',8,'NULL'),(9,'Tama_tarkari','public',9,'NULL'),(10,'Laddu','public',10,'NULL'),(11,'Aduwako_Achar','public',11,'NULL'),(12,'Chukauni','public',12,'NULL'),(13,'Gundruk','public',13,'NULL'),(14,'lapsi_Achar','public',14,'NULL'),(15,'Farsi_ko_Achar','public',15,'NULL'),(17,'Jhaneko Tarkari','public',1,'1)Alu usinne.\r\n2)Ani pakaune.\r\n3)Ani khane.'),(18,'Pan Cake','public',1,'1)Mix flour and baking powder well.\r\n\r\n2)Add sugar and salt and stir well. \r\n\r\n3)Add eggs and stir. \r\n\r\n4)Now add water and mix well. \r\n\r\n5)Heat a pan and add some butter.\r\n\r\n6)With the help of round spatula slowly spread the mixture in the pan. \r\n\r\n7)Cover the pan for a while.Watch carefully, when one side turns golden brown turn on to other side.Let the pan cake to cook properly for about 3 minutes \r\n'),(19,'Barfi','public',2,'1)Drain and blend the cashews to fine paste (use less water as you can while blending )\r\n\r\n2)In saucepan make syrup (chasni) of sugar and water and cook slowly on medium heat\r\n\r\n3)Cook stirring continuously till a soft lump is formed\r\n\r\n4)Add cashew paste to the sugar syrup (chasni) and mix well\r\n\r\n5)Add ghee and cardamom powder to the mixture and stir well\r\n\r\n6)Take out off the heat put on to a smooth surface and roll it with a rolling pan (belna)\r\n\r\n7)Cut it into 12-14 square/ diamond shapes.\r\n \r\n\r\nYour Kaju barfi is ready to serve.....!\r\n'),(20,'Lalmohan','public',3,'1)Make the dough by combining the milk powder, all-purpose flour and butter.\r\n \r\n2)Add milk to make medium-hard dough\r\n \r\n3)Make balls by gently rolling each portion between your palms into a smooth ball.(put ghee in your plam so the dough won?t stick to it.)\r\n \r\n4)Place the balls on a plate and Cover with a damp yet dry kitchen towel.\r\n \r\n5)Heat the oil on high and then lower the heat to medium.\r\n \r\n6)Slip in the balls into the hot oil from the side of the pan, one by one.\r\n \r\n7)They will sink to the bottom of the pan, but do not try to move them. Instead, gently shake the pan to keep the balls from browning on just one side.\r\n \r\n'),(21,'abc','public',1,'djnbjds\r\njkdnkjsn\r\njd'),(22,'xyz','public',1,'ndsnds\r\nnjndjd\r\nndlnsd'),(23,'ddf','public',1,'dfd'),(24,'c','public',1,'dd\r\ndd'),(25,'d','public',1,'dd'),(26,'d','public',1,'dd'),(27,'g','public',1,'a');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sharedrecipe`
--

DROP TABLE IF EXISTS `sharedrecipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sharedrecipe` (
  `recipeid` int(11) default NULL,
  `userid` int(11) default NULL,
  KEY `userid` (`userid`),
  CONSTRAINT `sharedrecipe_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sharedrecipe`
--

LOCK TABLES `sharedrecipe` WRITE;
/*!40000 ALTER TABLE `sharedrecipe` DISABLE KEYS */;
INSERT INTO `sharedrecipe` VALUES (18,1),(19,2),(20,3),(21,1);
/*!40000 ALTER TABLE `sharedrecipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL auto_increment,
  `fname` varchar(20) default NULL,
  `lname` varchar(20) default NULL,
  `email` varchar(30) default NULL,
  `password` varchar(20) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Anil','Shrestha','anil@dwit.edu.np','abc'),(2,'Sunil','Shrestha','sunil@dwit.edu.np','abc'),(3,'Swapnil','Shrestha','swapnil@dwit.edu.np','abc'),(4,'Pratibh','Acharya','pratibh@dwit.edu.np','abc'),(5,'Arun','Amatya','arun@dwit.edu.np','abc'),(6,'Sameer','Shrestha','sameer@dwit.edu.np','abc'),(7,'Shankar','Khatri','shankar@dwit.edu.np','abc'),(8,'Keshab','Bajagain','keshab@dwit.edu.np','abc'),(9,'Susmit','Singh','susmit@dwit.edu.np','abc'),(10,'Surendra','Adhikari','surendra@dwit.edu.np','abc'),(11,'Mohan','Adhikari','mohan@dwit.edu.np','abc'),(12,'Roshan','Shrestha','roshan@dwit.edu.np','abc'),(13,'Suresh','Shrestha','suresh@dwit.edu.np','abc'),(14,'Mahesh','Shrestha','mahesh@dwit.edu.np','abc'),(15,'Sandesh','Shrestha','sandesh@dwit.edu.np','abc'),(18,'Sani','Shrestha','sani@dwit.edu.np','abc'),(26,'Suman','Karanjit','suman@dwit.edu.np','abc');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userfriends`
--

DROP TABLE IF EXISTS `userfriends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userfriends` (
  `userid` int(11) default NULL,
  `friendid` int(11) default NULL,
  KEY `friendid` (`friendid`),
  CONSTRAINT `userfriends_ibfk_1` FOREIGN KEY (`friendid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userfriends`
--

LOCK TABLES `userfriends` WRITE;
/*!40000 ALTER TABLE `userfriends` DISABLE KEYS */;
INSERT INTO `userfriends` VALUES (1,2),(1,3);
/*!40000 ALTER TABLE `userfriends` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-31  1:21:20
