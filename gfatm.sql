-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: gfatm
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `data_log`
--

DROP TABLE IF EXISTS `data_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` char(6) NOT NULL,
  `entity_name` varchar(45) NOT NULL,
  `record` text,
  `description` text,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_data_log_users1_idx` (`created_by`),
  KEY `fk_data_log_location1_idx` (`created_at`),
  CONSTRAINT `fk_data_log_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_data_log_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_log`
--

LOCK TABLES `data_log` WRITE;
/*!40000 ALTER TABLE `data_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `definition`
--

DROP TABLE IF EXISTS `definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `definition` (
  `definition_id` int(11) NOT NULL AUTO_INCREMENT,
  `definition_type_id` int(11) NOT NULL,
  `definition` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_default` bit(1) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`definition_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_definition_definition_type1_idx` (`definition_type_id`),
  KEY `fk_definition_users1_idx` (`created_by`),
  KEY `fk_definition_users2_idx` (`changed_by`),
  KEY `fk_definition_location1_idx` (`created_at`),
  KEY `fk_definition_location2_idx` (`changed_at`),
  CONSTRAINT `fk_definition_definition_type1` FOREIGN KEY (`definition_type_id`) REFERENCES `definition_type` (`definition_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_definition_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_definition_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_definition_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_definition_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `definition`
--

LOCK TABLES `definition` WRITE;
/*!40000 ALTER TABLE `definition` DISABLE KEYS */;
INSERT INTO `definition` VALUES (1,1,'M','Male','','2015-12-11 12:16:31',1,NULL,NULL,NULL,NULL,'bc813860-83cc-11e6-aa9c-28d24461cf90'),(2,1,'F','Female','\0','2015-12-11 12:16:58',1,NULL,NULL,NULL,NULL,'bc8159b0-83cc-11e6-aa9c-28d24461cf90'),(3,2,'O-','O-','\0','2015-12-15 17:38:57',1,NULL,NULL,NULL,NULL,'bc815a5f-83cc-11e6-aa9c-28d24461cf90'),(4,2,'O+','O+','\0','2015-12-15 17:38:57',1,NULL,NULL,NULL,NULL,'bc815ab0-83cc-11e6-aa9c-28d24461cf90'),(5,2,'A-','A-','\0','2015-12-15 17:38:57',1,NULL,NULL,NULL,NULL,'bc815af0-83cc-11e6-aa9c-28d24461cf90'),(6,2,'A+','A+','','2015-12-15 17:38:57',1,NULL,NULL,NULL,NULL,'bc815b24-83cc-11e6-aa9c-28d24461cf90'),(7,2,'B-','B-','\0','2015-12-15 17:38:57',1,NULL,NULL,NULL,NULL,'bc815b57-83cc-11e6-aa9c-28d24461cf90'),(8,2,'B+','B+','\0','2015-12-15 17:38:57',1,NULL,NULL,NULL,NULL,'bc815b86-83cc-11e6-aa9c-28d24461cf90'),(9,2,'AB-','AB-','\0','2015-12-15 17:38:57',1,NULL,NULL,NULL,NULL,'bc815bb5-83cc-11e6-aa9c-28d24461cf90'),(10,2,'AB+','AB+','\0','2015-12-15 17:38:57',1,NULL,NULL,NULL,NULL,'bc815c18-83cc-11e6-aa9c-28d24461cf90'),(11,3,'White','White American/European/Other','\0','2015-12-16 09:27:07',1,NULL,NULL,NULL,NULL,'bc815c7a-83cc-11e6-aa9c-28d24461cf90'),(12,3,'Black','Black American/African','\0','2015-12-16 09:27:37',1,NULL,NULL,NULL,NULL,'bc815cd4-83cc-11e6-aa9c-28d24461cf90'),(13,3,'Asian','Pakistani, Chinese, Middle eastern, Afghani and other','','2015-12-16 09:27:37',1,NULL,NULL,NULL,NULL,'bc815d8c-83cc-11e6-aa9c-28d24461cf90'),(14,3,'Indian','American Indian, Alaska Native, Asian Indian','\0','2015-12-16 09:27:37',1,NULL,NULL,NULL,NULL,'bc815dc7-83cc-11e6-aa9c-28d24461cf90'),(15,3,'Pacific','Hawaii, Guam, Samoa, or other Pacific island','\0','2015-12-16 09:27:37',1,NULL,NULL,NULL,NULL,'bc815df7-83cc-11e6-aa9c-28d24461cf90'),(16,3,'Spanish','Hispanic or Latino:  Cuban, Mexican, South/Central American or other Spanish','\0','2015-12-16 09:27:37',1,NULL,NULL,NULL,NULL,'bc815e21-83cc-11e6-aa9c-28d24461cf90'),(17,3,'Other','Unlisted Ethnicity','\0','2015-12-16 09:27:37',1,NULL,NULL,NULL,NULL,'bc815e50-83cc-11e6-aa9c-28d24461cf90'),(18,4,'Atheism','Atheism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc815e7b-83cc-11e6-aa9c-28d24461cf90'),(19,4,'Babism','Babism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc815eae-83cc-11e6-aa9c-28d24461cf90'),(20,4,'Bahai','Bahai','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc815edd-83cc-11e6-aa9c-28d24461cf90'),(21,4,'Batuque','Batuque','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc815f08-83cc-11e6-aa9c-28d24461cf90'),(22,4,'Buddhism','Buddhism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc815f37-83cc-11e6-aa9c-28d24461cf90'),(23,4,'Candomble','Candomble','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc815f66-83cc-11e6-aa9c-28d24461cf90'),(24,4,'Cao Dai','Cao Dai','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc815f95-83cc-11e6-aa9c-28d24461cf90'),(25,4,'Chinese folk','Chinese folk','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc815fc0-83cc-11e6-aa9c-28d24461cf90'),(26,4,'Chinese mythology','Chinese mythology','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc815fef-83cc-11e6-aa9c-28d24461cf90'),(27,4,'Christianity','Christianity','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc81601e-83cc-11e6-aa9c-28d24461cf90'),(28,4,'Confucianism','Confucianism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc816049-83cc-11e6-aa9c-28d24461cf90'),(29,4,'Falun Gong','Falun Gong','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc816078-83cc-11e6-aa9c-28d24461cf90'),(30,4,'Finnish mythology','Finnish mythology','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8160a3-83cc-11e6-aa9c-28d24461cf90'),(31,4,'Gnosticism','Gnosticism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8160ce-83cc-11e6-aa9c-28d24461cf90'),(32,4,'Hellenistic','Hellenistic','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8160fd-83cc-11e6-aa9c-28d24461cf90'),(33,4,'Hinduism','Hinduism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc816127-83cc-11e6-aa9c-28d24461cf90'),(34,4,'Islam','Islam','','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc816152-83cc-11e6-aa9c-28d24461cf90'),(35,4,'Jainism','Jainism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc81618a-83cc-11e6-aa9c-28d24461cf90'),(36,4,'Japanese mythology','Japanese mythology','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8161b4-83cc-11e6-aa9c-28d24461cf90'),(37,4,'Judaism','Judaism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8161ec-83cc-11e6-aa9c-28d24461cf90'),(38,4,'Macumba','Macumba','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc816217-83cc-11e6-aa9c-28d24461cf90'),(39,4,'Magic','Magic','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc816242-83cc-11e6-aa9c-28d24461cf90'),(40,4,'Manichaesim','Manichaesim','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc81626c-83cc-11e6-aa9c-28d24461cf90'),(41,4,'Other','Other','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc816297-83cc-11e6-aa9c-28d24461cf90'),(42,4,'Other monotheism','Other monotheism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8162c2-83cc-11e6-aa9c-28d24461cf90'),(43,4,'Other polytheism','Other polytheism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8162f1-83cc-11e6-aa9c-28d24461cf90'),(44,4,'Pantheism','Pantheism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc816320-83cc-11e6-aa9c-28d24461cf90'),(45,4,'Samaritanism','Samaritanism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc81634b-83cc-11e6-aa9c-28d24461cf90'),(46,4,'Satanism','Satanism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc816376-83cc-11e6-aa9c-28d24461cf90'),(47,4,'Shinto','Shinto','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8163a0-83cc-11e6-aa9c-28d24461cf90'),(48,4,'Sikhism','Sikhism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8163cb-83cc-11e6-aa9c-28d24461cf90'),(49,4,'Taoism','Taoism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8163f6-83cc-11e6-aa9c-28d24461cf90'),(50,4,'Tenrikyo','Tenrikyo','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc816421-83cc-11e6-aa9c-28d24461cf90'),(51,4,'Umbanda','Umbanda','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc81644b-83cc-11e6-aa9c-28d24461cf90'),(52,4,'Vodou','Vodou','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc816476-83cc-11e6-aa9c-28d24461cf90'),(53,4,'Winti','Winti','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8164a1-83cc-11e6-aa9c-28d24461cf90'),(54,4,'Yazidi','Yazidi','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8164cc-83cc-11e6-aa9c-28d24461cf90'),(55,4,'Zoroastrianism','Zoroastrianism','\0','2015-12-16 09:49:46',1,NULL,NULL,NULL,NULL,'bc8164fb-83cc-11e6-aa9c-28d24461cf90'),(56,5,'Afghanistan','Afghanistan','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc816525-83cc-11e6-aa9c-28d24461cf90'),(57,5,'Albania','Albania','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc816550-83cc-11e6-aa9c-28d24461cf90'),(58,5,'Algeria','Algeria','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc81657b-83cc-11e6-aa9c-28d24461cf90'),(59,5,'Andorra','Andorra','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc8165a6-83cc-11e6-aa9c-28d24461cf90'),(60,5,'Angola','Angola','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc8165d0-83cc-11e6-aa9c-28d24461cf90'),(61,5,'Argentina','Argentina','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc8165fb-83cc-11e6-aa9c-28d24461cf90'),(62,5,'Armenia','Armenia','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc816626-83cc-11e6-aa9c-28d24461cf90'),(63,5,'Australia','Australia','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc816651-83cc-11e6-aa9c-28d24461cf90'),(64,5,'Austria','Austria','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc81667c-83cc-11e6-aa9c-28d24461cf90'),(65,5,'Azerbaijan','Azerbaijan','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc8166a6-83cc-11e6-aa9c-28d24461cf90'),(66,5,'Bahamas','Bahamas','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc8166d1-83cc-11e6-aa9c-28d24461cf90'),(67,5,'Bangladesh','Bangladesh','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc8166fc-83cc-11e6-aa9c-28d24461cf90'),(68,5,'Barbados','Barbados','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc81672b-83cc-11e6-aa9c-28d24461cf90'),(69,5,'Belarus','Belarus','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc816756-83cc-11e6-aa9c-28d24461cf90'),(70,5,'Belgium','Belgium','\0','2016-09-26 13:00:55',1,NULL,NULL,NULL,NULL,'bc816780-83cc-11e6-aa9c-28d24461cf90'),(71,5,'Benin','Benin','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc8167ab-83cc-11e6-aa9c-28d24461cf90'),(72,5,'Bhutan','Bhutan','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc8167d6-83cc-11e6-aa9c-28d24461cf90'),(73,5,'Bolivia','Bolivia','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816801-83cc-11e6-aa9c-28d24461cf90'),(74,5,'Bosnia-Herzegovina','Bosnia-Herzegovina','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc81682b-83cc-11e6-aa9c-28d24461cf90'),(75,5,'Brazil','Brazil','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816856-83cc-11e6-aa9c-28d24461cf90'),(76,5,'Britain','Britain','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816881-83cc-11e6-aa9c-28d24461cf90'),(77,5,'Brunei','Brunei','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc8168ac-83cc-11e6-aa9c-28d24461cf90'),(78,5,'Bulgaria','Bulgaria','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc8168d7-83cc-11e6-aa9c-28d24461cf90'),(79,5,'Burma','Burma','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816901-83cc-11e6-aa9c-28d24461cf90'),(80,5,'Burundi','Burundi','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc81692c-83cc-11e6-aa9c-28d24461cf90'),(81,5,'Cambodia','Cambodia','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc81696c-83cc-11e6-aa9c-28d24461cf90'),(82,5,'Cameroon','Cameroon','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc81699b-83cc-11e6-aa9c-28d24461cf90'),(83,5,'Canada','Canada','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc8169c6-83cc-11e6-aa9c-28d24461cf90'),(84,5,'Chad','Chad','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc8169f1-83cc-11e6-aa9c-28d24461cf90'),(85,5,'Chile','Chile','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816a1c-83cc-11e6-aa9c-28d24461cf90'),(86,5,'China','China','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816a46-83cc-11e6-aa9c-28d24461cf90'),(87,5,'Colombia','Colombia','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816a71-83cc-11e6-aa9c-28d24461cf90'),(88,5,'Congo','Congo','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816a9c-83cc-11e6-aa9c-28d24461cf90'),(89,5,'Croatia','Croatia','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816ac7-83cc-11e6-aa9c-28d24461cf90'),(90,5,'Cuba','Cuba','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816af1-83cc-11e6-aa9c-28d24461cf90'),(91,5,'Cyprus','Cyprus','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816b1c-83cc-11e6-aa9c-28d24461cf90'),(92,5,'CzechRepublic','CzechRepublic','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816b47-83cc-11e6-aa9c-28d24461cf90'),(93,5,'Denmark','Denmark','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816b72-83cc-11e6-aa9c-28d24461cf90'),(94,5,'Dominica','Dominica','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816b9c-83cc-11e6-aa9c-28d24461cf90'),(95,5,'Ecuador','Ecuador','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816bc7-83cc-11e6-aa9c-28d24461cf90'),(96,5,'Egypt','Egypt','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816bf2-83cc-11e6-aa9c-28d24461cf90'),(97,5,'ElSalvador','ElSalvador','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816c1d-83cc-11e6-aa9c-28d24461cf90'),(98,5,'England','England','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816c48-83cc-11e6-aa9c-28d24461cf90'),(99,5,'Eritrea','Eritrea','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816c72-83cc-11e6-aa9c-28d24461cf90'),(100,5,'Estonia','Estonia','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816c99-83cc-11e6-aa9c-28d24461cf90'),(101,5,'Ethiopia','Ethiopia','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816cc4-83cc-11e6-aa9c-28d24461cf90'),(102,5,'Fiji','Fiji','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816cee-83cc-11e6-aa9c-28d24461cf90'),(103,5,'Finland','Finland','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816d19-83cc-11e6-aa9c-28d24461cf90'),(104,5,'France','France','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816d44-83cc-11e6-aa9c-28d24461cf90'),(105,5,'Gabon','Gabon','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816d6f-83cc-11e6-aa9c-28d24461cf90'),(106,5,'Gambia','Gambia','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816d95-83cc-11e6-aa9c-28d24461cf90'),(107,5,'Georgia','Georgia','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816dc0-83cc-11e6-aa9c-28d24461cf90'),(108,5,'Germany','Germany','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816deb-83cc-11e6-aa9c-28d24461cf90'),(109,5,'Ghana','Ghana','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816e15-83cc-11e6-aa9c-28d24461cf90'),(110,5,'Greece','Greece','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816e40-83cc-11e6-aa9c-28d24461cf90'),(111,5,'Grenada','Grenada','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816e67-83cc-11e6-aa9c-28d24461cf90'),(112,5,'Guatemala','Guatemala','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816e91-83cc-11e6-aa9c-28d24461cf90'),(113,5,'Guinea','Guinea','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816ebc-83cc-11e6-aa9c-28d24461cf90'),(114,5,'Guyana','Guyana','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816ee7-83cc-11e6-aa9c-28d24461cf90'),(115,5,'Haiti','Haiti','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816f12-83cc-11e6-aa9c-28d24461cf90'),(116,5,'Holland','Holland','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816f3c-83cc-11e6-aa9c-28d24461cf90'),(117,5,'Honduras','Honduras','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816f67-83cc-11e6-aa9c-28d24461cf90'),(118,5,'Hungary','Hungary','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816f92-83cc-11e6-aa9c-28d24461cf90'),(119,5,'Iceland','Iceland','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816fbd-83cc-11e6-aa9c-28d24461cf90'),(120,5,'India','India','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc816fe8-83cc-11e6-aa9c-28d24461cf90'),(121,5,'Indonesia','Indonesia','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc817012-83cc-11e6-aa9c-28d24461cf90'),(122,5,'Iran','Iran','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc81703d-83cc-11e6-aa9c-28d24461cf90'),(123,5,'Iraq','Iraq','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc817068-83cc-11e6-aa9c-28d24461cf90'),(124,5,'Ireland','Ireland','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc817093-83cc-11e6-aa9c-28d24461cf90'),(125,5,'Israel','Israel','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc8170bd-83cc-11e6-aa9c-28d24461cf90'),(126,5,'Italy','Italy','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc8170e8-83cc-11e6-aa9c-28d24461cf90'),(127,5,'Jamaica','Jamaica','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc817113-83cc-11e6-aa9c-28d24461cf90'),(128,5,'Japan','Japan','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc81713e-83cc-11e6-aa9c-28d24461cf90'),(129,5,'Jordan','Jordan','\0','2016-09-26 13:00:56',1,NULL,NULL,NULL,NULL,'bc817164-83cc-11e6-aa9c-28d24461cf90'),(130,5,'Kazakhstan','Kazakhstan','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81718f-83cc-11e6-aa9c-28d24461cf90'),(131,5,'Kenya','Kenya','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8171be-83cc-11e6-aa9c-28d24461cf90'),(132,5,'Korea','Korea','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8171e4-83cc-11e6-aa9c-28d24461cf90'),(133,5,'Kuwait','Kuwait','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81720f-83cc-11e6-aa9c-28d24461cf90'),(134,5,'Laos','Laos','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81723a-83cc-11e6-aa9c-28d24461cf90'),(135,5,'Latvia','Latvia','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817265-83cc-11e6-aa9c-28d24461cf90'),(136,5,'Lebanon','Lebanon','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81728f-83cc-11e6-aa9c-28d24461cf90'),(137,5,'Liberia','Liberia','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8172ba-83cc-11e6-aa9c-28d24461cf90'),(138,5,'Libya','Libya','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8172e5-83cc-11e6-aa9c-28d24461cf90'),(139,5,'Liechtenstein','Liechtenstein','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817310-83cc-11e6-aa9c-28d24461cf90'),(140,5,'Lithuania','Lithuania','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81733b-83cc-11e6-aa9c-28d24461cf90'),(141,5,'Luxembourg','Luxembourg','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817365-83cc-11e6-aa9c-28d24461cf90'),(142,5,'Macedonia','Macedonia','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817390-83cc-11e6-aa9c-28d24461cf90'),(143,5,'Madagascar','Madagascar','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8173bb-83cc-11e6-aa9c-28d24461cf90'),(144,5,'Malawi','Malawi','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8173e6-83cc-11e6-aa9c-28d24461cf90'),(145,5,'Malaysia','Malaysia','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81740c-83cc-11e6-aa9c-28d24461cf90'),(146,5,'Maldives','Maldives','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817437-83cc-11e6-aa9c-28d24461cf90'),(147,5,'Mali','Mali','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817462-83cc-11e6-aa9c-28d24461cf90'),(148,5,'Malta','Malta','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81748c-83cc-11e6-aa9c-28d24461cf90'),(149,5,'Mauritania','Mauritania','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8174b7-83cc-11e6-aa9c-28d24461cf90'),(150,5,'Mauritius','Mauritius','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8174e2-83cc-11e6-aa9c-28d24461cf90'),(151,5,'Mexico','Mexico','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81750d-83cc-11e6-aa9c-28d24461cf90'),(152,5,'Moldova','Moldova','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817537-83cc-11e6-aa9c-28d24461cf90'),(153,5,'Monaco','Monaco','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817562-83cc-11e6-aa9c-28d24461cf90'),(154,5,'Mongolia','Mongolia','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81758d-83cc-11e6-aa9c-28d24461cf90'),(155,5,'Montenegro','Montenegro','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8175b8-83cc-11e6-aa9c-28d24461cf90'),(156,5,'Morocco','Morocco','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8175e3-83cc-11e6-aa9c-28d24461cf90'),(157,5,'Mozambique','Mozambique','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81760d-83cc-11e6-aa9c-28d24461cf90'),(158,5,'Namibia','Namibia','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817638-83cc-11e6-aa9c-28d24461cf90'),(159,5,'Nepal','Nepal','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817663-83cc-11e6-aa9c-28d24461cf90'),(160,5,'Nicaragua','Nicaragua','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81768e-83cc-11e6-aa9c-28d24461cf90'),(161,5,'Niger','Niger','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8176b4-83cc-11e6-aa9c-28d24461cf90'),(162,5,'Nigeria','Nigeria','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8176df-83cc-11e6-aa9c-28d24461cf90'),(163,5,'Norway','Norway','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81770a-83cc-11e6-aa9c-28d24461cf90'),(164,5,'Pakistan','Pakistan','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817734-83cc-11e6-aa9c-28d24461cf90'),(165,5,'Panama','Panama','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81775f-83cc-11e6-aa9c-28d24461cf90'),(166,5,'Paraguay','Paraguay','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81778a-83cc-11e6-aa9c-28d24461cf90'),(167,5,'Peru','Peru','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8177b5-83cc-11e6-aa9c-28d24461cf90'),(168,5,'Philippines','Philippines','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8177df-83cc-11e6-aa9c-28d24461cf90'),(169,5,'Poland','Poland','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817806-83cc-11e6-aa9c-28d24461cf90'),(170,5,'Portugal','Portugal','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817831-83cc-11e6-aa9c-28d24461cf90'),(171,5,'Qatar','Qatar','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81785b-83cc-11e6-aa9c-28d24461cf90'),(172,5,'Romania','Romania','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817886-83cc-11e6-aa9c-28d24461cf90'),(173,5,'Russia','Russia','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8178b1-83cc-11e6-aa9c-28d24461cf90'),(174,5,'Rwanda','Rwanda','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8178dc-83cc-11e6-aa9c-28d24461cf90'),(175,5,'SaudiArabia','SaudiArabia','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817902-83cc-11e6-aa9c-28d24461cf90'),(176,5,'Scotland','Scotland','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc81792d-83cc-11e6-aa9c-28d24461cf90'),(177,5,'Senegal','Senegal','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817958-83cc-11e6-aa9c-28d24461cf90'),(178,5,'Serbia','Serbia','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817983-83cc-11e6-aa9c-28d24461cf90'),(179,5,'Singapore','Singapore','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8179ad-83cc-11e6-aa9c-28d24461cf90'),(180,5,'Slovakia','Slovakia','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc8179d8-83cc-11e6-aa9c-28d24461cf90'),(181,5,'Slovenia','Slovenia','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817a03-83cc-11e6-aa9c-28d24461cf90'),(182,5,'Somalia','Somalia','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817a2e-83cc-11e6-aa9c-28d24461cf90'),(183,5,'Spain','Spain','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817a58-83cc-11e6-aa9c-28d24461cf90'),(184,5,'SriLanka','SriLanka','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817a7f-83cc-11e6-aa9c-28d24461cf90'),(185,5,'Sudan','Sudan','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817aae-83cc-11e6-aa9c-28d24461cf90'),(186,5,'Suriname','Suriname','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817ad9-83cc-11e6-aa9c-28d24461cf90'),(187,5,'Swaziland','Swaziland','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817aff-83cc-11e6-aa9c-28d24461cf90'),(188,5,'Sweden','Sweden','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817b2e-83cc-11e6-aa9c-28d24461cf90'),(189,5,'Switzerland','Switzerland','\0','2016-09-26 13:00:57',1,NULL,NULL,NULL,NULL,'bc817b59-83cc-11e6-aa9c-28d24461cf90'),(190,5,'Syria','Syria','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817b84-83cc-11e6-aa9c-28d24461cf90'),(191,5,'Taiwan','Taiwan','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817bae-83cc-11e6-aa9c-28d24461cf90'),(192,5,'Tajikistan','Tajikistan','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817bd9-83cc-11e6-aa9c-28d24461cf90'),(193,5,'Tanzania','Tanzania','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817c04-83cc-11e6-aa9c-28d24461cf90'),(194,5,'Thailand','Thailand','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817c2f-83cc-11e6-aa9c-28d24461cf90'),(195,5,'Togo','Togo','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817c5a-83cc-11e6-aa9c-28d24461cf90'),(196,5,'Trinidad','Trinidad','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817c84-83cc-11e6-aa9c-28d24461cf90'),(197,5,'Tunisia','Tunisia','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817caf-83cc-11e6-aa9c-28d24461cf90'),(198,5,'Turkey','Turkey','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817cda-83cc-11e6-aa9c-28d24461cf90'),(199,5,'Uganda','Uganda','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817d00-83cc-11e6-aa9c-28d24461cf90'),(200,5,'Ukraine','Ukraine','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817d2b-83cc-11e6-aa9c-28d24461cf90'),(201,5,'UnitedKingdom','UnitedKingdom','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817d56-83cc-11e6-aa9c-28d24461cf90'),(202,5,'UnitedStates','UnitedStates','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817d81-83cc-11e6-aa9c-28d24461cf90'),(203,5,'Uruguay','Uruguay','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817dab-83cc-11e6-aa9c-28d24461cf90'),(204,5,'Uzbekistan','Uzbekistan','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817dd6-83cc-11e6-aa9c-28d24461cf90'),(205,5,'Venezuela','Venezuela','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817e01-83cc-11e6-aa9c-28d24461cf90'),(206,5,'Vietnam','Vietnam','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817e2c-83cc-11e6-aa9c-28d24461cf90'),(207,5,'Wales','Wales','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817e56-83cc-11e6-aa9c-28d24461cf90'),(208,5,'Yemen','Yemen','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817e81-83cc-11e6-aa9c-28d24461cf90'),(209,5,'Yugoslavia','Yugoslavia','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817ea8-83cc-11e6-aa9c-28d24461cf90'),(210,5,'Zambia','Zambia','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817ed2-83cc-11e6-aa9c-28d24461cf90'),(211,5,'Zimbabwe','Zimbabwe','\0','2016-09-26 13:00:58',1,NULL,NULL,NULL,NULL,'bc817efd-83cc-11e6-aa9c-28d24461cf90'),(212,6,'Afghan','Afghan','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc817f2c-83cc-11e6-aa9c-28d24461cf90'),(213,6,'Albanian','Albanian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc817f57-83cc-11e6-aa9c-28d24461cf90'),(214,6,'Algerian','Algerian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc817f7e-83cc-11e6-aa9c-28d24461cf90'),(215,6,'Andorran','Andorran','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc817fa8-83cc-11e6-aa9c-28d24461cf90'),(216,6,'Angolan','Angolan','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc817fd3-83cc-11e6-aa9c-28d24461cf90'),(217,6,'Argentinian','Argentinian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc817ffe-83cc-11e6-aa9c-28d24461cf90'),(218,6,'Armenian','Armenian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818029-83cc-11e6-aa9c-28d24461cf90'),(219,6,'Australian','Australian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818053-83cc-11e6-aa9c-28d24461cf90'),(220,6,'Austrian','Austrian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc81807e-83cc-11e6-aa9c-28d24461cf90'),(221,6,'Azerbaijani','Azerbaijani','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8180a5-83cc-11e6-aa9c-28d24461cf90'),(222,6,'Bahamian','Bahamian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8180cf-83cc-11e6-aa9c-28d24461cf90'),(223,6,'Bangladeshi','Bangladeshi','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8180fa-83cc-11e6-aa9c-28d24461cf90'),(224,6,'Barbadian','Barbadian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818125-83cc-11e6-aa9c-28d24461cf90'),(225,6,'Belorussian','Belorussian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818150-83cc-11e6-aa9c-28d24461cf90'),(226,6,'Belgian','Belgian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc81817a-83cc-11e6-aa9c-28d24461cf90'),(227,6,'Beninese','Beninese','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8181a1-83cc-11e6-aa9c-28d24461cf90'),(228,6,'Bhutanese','Bhutanese','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8181cc-83cc-11e6-aa9c-28d24461cf90'),(229,6,'Bolivian','Bolivian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8182b7-83cc-11e6-aa9c-28d24461cf90'),(230,6,'Bosnian','Bosnian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8182ea-83cc-11e6-aa9c-28d24461cf90'),(231,6,'Brazilian','Brazilian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818315-83cc-11e6-aa9c-28d24461cf90'),(232,6,'Briton','Briton','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818340-83cc-11e6-aa9c-28d24461cf90'),(233,6,'Bruneian','Bruneian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc81836b-83cc-11e6-aa9c-28d24461cf90'),(234,6,'Bulgarian','Bulgarian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818395-83cc-11e6-aa9c-28d24461cf90'),(235,6,'Burmese','Burmese','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818416-83cc-11e6-aa9c-28d24461cf90'),(236,6,'Burundian','Burundian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818440-83cc-11e6-aa9c-28d24461cf90'),(237,6,'Cambodian','Cambodian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818463-83cc-11e6-aa9c-28d24461cf90'),(238,6,'Cameroonian','Cameroonian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818489-83cc-11e6-aa9c-28d24461cf90'),(239,6,'Canadian','Canadian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8184b0-83cc-11e6-aa9c-28d24461cf90'),(240,6,'Chadian','Chadian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8184d6-83cc-11e6-aa9c-28d24461cf90'),(241,6,'Chilean','Chilean','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8184fd-83cc-11e6-aa9c-28d24461cf90'),(242,6,'Chinese','Chinese','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818523-83cc-11e6-aa9c-28d24461cf90'),(243,6,'Colombian','Colombian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc81854a-83cc-11e6-aa9c-28d24461cf90'),(244,6,'Congolese','Congolese','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc81857d-83cc-11e6-aa9c-28d24461cf90'),(245,6,'Croatian','Croatian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8185a3-83cc-11e6-aa9c-28d24461cf90'),(246,6,'Cuban','Cuban','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8185ca-83cc-11e6-aa9c-28d24461cf90'),(247,6,'Cypriot','Cypriot','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8185f0-83cc-11e6-aa9c-28d24461cf90'),(248,6,'Czech','Czech','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818617-83cc-11e6-aa9c-28d24461cf90'),(249,6,'Dane','Dane','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc81863d-83cc-11e6-aa9c-28d24461cf90'),(250,6,'Dominican','Dominican','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818664-83cc-11e6-aa9c-28d24461cf90'),(251,6,'Ecuadorean','Ecuadorean','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc81868a-83cc-11e6-aa9c-28d24461cf90'),(252,6,'Egyptian','Egyptian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8186b1-83cc-11e6-aa9c-28d24461cf90'),(253,6,'Salvadorean','Salvadorean','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8186dc-83cc-11e6-aa9c-28d24461cf90'),(254,6,'Englishman','Englishman','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818702-83cc-11e6-aa9c-28d24461cf90'),(255,6,'Eritrean','Eritrean','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818728-83cc-11e6-aa9c-28d24461cf90'),(256,6,'Estonian','Estonian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc81874f-83cc-11e6-aa9c-28d24461cf90'),(257,6,'Ethiopian','Ethiopian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818775-83cc-11e6-aa9c-28d24461cf90'),(258,6,'Fijian','Fijian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc81879c-83cc-11e6-aa9c-28d24461cf90'),(259,6,'Finn','Finn','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8187c7-83cc-11e6-aa9c-28d24461cf90'),(260,6,'Frenchman','Frenchman','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8187ed-83cc-11e6-aa9c-28d24461cf90'),(261,6,'Gabonese','Gabonese','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818814-83cc-11e6-aa9c-28d24461cf90'),(262,6,'Gambian','Gambian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc81883a-83cc-11e6-aa9c-28d24461cf90'),(263,6,'Georgian','Georgian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818861-83cc-11e6-aa9c-28d24461cf90'),(264,6,'German','German','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818887-83cc-11e6-aa9c-28d24461cf90'),(265,6,'Ghanaian','Ghanaian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8188ae-83cc-11e6-aa9c-28d24461cf90'),(266,6,'Greek','Greek','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8188d4-83cc-11e6-aa9c-28d24461cf90'),(267,6,'Grenadian','Grenadian','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc8188fb-83cc-11e6-aa9c-28d24461cf90'),(268,6,'Guatemalan','Guatemalan','\0','2016-09-26 13:01:11',1,NULL,NULL,NULL,NULL,'bc818921-83cc-11e6-aa9c-28d24461cf90'),(269,6,'Guinean','Guinean','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818948-83cc-11e6-aa9c-28d24461cf90'),(270,6,'Guyanese','Guyanese','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc81896e-83cc-11e6-aa9c-28d24461cf90'),(271,6,'Haitian','Haitian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818995-83cc-11e6-aa9c-28d24461cf90'),(272,6,'Dutchman','Dutchman','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc8189b7-83cc-11e6-aa9c-28d24461cf90'),(273,6,'Honduran','Honduran','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc8189dd-83cc-11e6-aa9c-28d24461cf90'),(274,6,'Hungarian','Hungarian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818a04-83cc-11e6-aa9c-28d24461cf90'),(275,6,'Icelander','Icelander','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818a2a-83cc-11e6-aa9c-28d24461cf90'),(276,6,'Indian','Indian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818a51-83cc-11e6-aa9c-28d24461cf90'),(277,6,'Indonesian','Indonesian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818a77-83cc-11e6-aa9c-28d24461cf90'),(278,6,'Iranian','Iranian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818a9e-83cc-11e6-aa9c-28d24461cf90'),(279,6,'Iraqi','Iraqi','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818ac4-83cc-11e6-aa9c-28d24461cf90'),(280,6,'Irishman','Irishman','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818aeb-83cc-11e6-aa9c-28d24461cf90'),(281,6,'Israeli','Israeli','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818b11-83cc-11e6-aa9c-28d24461cf90'),(282,6,'Italian','Italian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818b33-83cc-11e6-aa9c-28d24461cf90'),(283,6,'Jamaican','Jamaican','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818b5e-83cc-11e6-aa9c-28d24461cf90'),(284,6,'Japanese','Japanese','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818b85-83cc-11e6-aa9c-28d24461cf90'),(285,6,'Jordanian','Jordanian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818bab-83cc-11e6-aa9c-28d24461cf90'),(286,6,'Kazakh','Kazakh','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818bd2-83cc-11e6-aa9c-28d24461cf90'),(287,6,'Kenyan','Kenyan','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818bf8-83cc-11e6-aa9c-28d24461cf90'),(288,6,'Korean','Korean','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818c1f-83cc-11e6-aa9c-28d24461cf90'),(289,6,'Kuwaiti','Kuwaiti','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818c45-83cc-11e6-aa9c-28d24461cf90'),(290,6,'Laotian','Laotian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818c67-83cc-11e6-aa9c-28d24461cf90'),(291,6,'Latvian','Latvian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818c8e-83cc-11e6-aa9c-28d24461cf90'),(292,6,'Lebanese','Lebanese','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818cb4-83cc-11e6-aa9c-28d24461cf90'),(293,6,'Liberian','Liberian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818cdf-83cc-11e6-aa9c-28d24461cf90'),(294,6,'Libyan','Libyan','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818d06-83cc-11e6-aa9c-28d24461cf90'),(295,6,'Liechtensteiner','Liechtensteiner','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818d2c-83cc-11e6-aa9c-28d24461cf90'),(296,6,'Lithuanian','Lithuanian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818d53-83cc-11e6-aa9c-28d24461cf90'),(297,6,'Luxembourger','Luxembourger','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818d79-83cc-11e6-aa9c-28d24461cf90'),(298,6,'Macedonian','Macedonian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818da0-83cc-11e6-aa9c-28d24461cf90'),(299,6,'Madagascan','Madagascan','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818dc6-83cc-11e6-aa9c-28d24461cf90'),(300,6,'Malawian','Malawian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818dec-83cc-11e6-aa9c-28d24461cf90'),(301,6,'Malaysian','Malaysian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818e13-83cc-11e6-aa9c-28d24461cf90'),(302,6,'Maldivian','Maldivian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818e35-83cc-11e6-aa9c-28d24461cf90'),(303,6,'Malian','Malian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818e5c-83cc-11e6-aa9c-28d24461cf90'),(304,6,'Maltese','Maltese','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818e82-83cc-11e6-aa9c-28d24461cf90'),(305,6,'Mauritanian','Mauritanian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818ea9-83cc-11e6-aa9c-28d24461cf90'),(306,6,'Mauritian','Mauritian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818ecf-83cc-11e6-aa9c-28d24461cf90'),(307,6,'Mexican','Mexican','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818efa-83cc-11e6-aa9c-28d24461cf90'),(308,6,'Moldovan','Moldovan','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818f20-83cc-11e6-aa9c-28d24461cf90'),(309,6,'Monacan','Monacan','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818f47-83cc-11e6-aa9c-28d24461cf90'),(310,6,'Mongolian','Mongolian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818f6d-83cc-11e6-aa9c-28d24461cf90'),(311,6,'Montenegrin','Montenegrin','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818f94-83cc-11e6-aa9c-28d24461cf90'),(312,6,'Moroccan','Moroccan','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818fba-83cc-11e6-aa9c-28d24461cf90'),(313,6,'Mozambican','Mozambican','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc818fe1-83cc-11e6-aa9c-28d24461cf90'),(314,6,'Namibian','Namibian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc819007-83cc-11e6-aa9c-28d24461cf90'),(315,6,'Nepalese','Nepalese','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc81902e-83cc-11e6-aa9c-28d24461cf90'),(316,6,'Nicaraguan','Nicaraguan','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc819054-83cc-11e6-aa9c-28d24461cf90'),(317,6,'Nigerien','Nigerien','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc81907b-83cc-11e6-aa9c-28d24461cf90'),(318,6,'Nigerian','Nigerian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc8190a1-83cc-11e6-aa9c-28d24461cf90'),(319,6,'Norwegian','Norwegian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc8190c8-83cc-11e6-aa9c-28d24461cf90'),(320,6,'Pakistani','Pakistani','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc8190ee-83cc-11e6-aa9c-28d24461cf90'),(321,6,'Panamanian','Panamanian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc819115-83cc-11e6-aa9c-28d24461cf90'),(322,6,'Paraguayan','Paraguayan','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc81913b-83cc-11e6-aa9c-28d24461cf90'),(323,6,'Peruvian','Peruvian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc819162-83cc-11e6-aa9c-28d24461cf90'),(324,6,'Filipino','Filipino','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc819188-83cc-11e6-aa9c-28d24461cf90'),(325,6,'Pole','Pole','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc8191af-83cc-11e6-aa9c-28d24461cf90'),(326,6,'Portuguese','Portuguese','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc8191d1-83cc-11e6-aa9c-28d24461cf90'),(327,6,'Qatari','Qatari','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc8191f7-83cc-11e6-aa9c-28d24461cf90'),(328,6,'Romanian','Romanian','\0','2016-09-26 13:01:12',1,NULL,NULL,NULL,NULL,'bc81921e-83cc-11e6-aa9c-28d24461cf90'),(329,6,'Russian','Russian','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819244-83cc-11e6-aa9c-28d24461cf90'),(330,6,'Rwandan','Rwandan','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc81926b-83cc-11e6-aa9c-28d24461cf90'),(331,6,'Saudi','Saudi','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819296-83cc-11e6-aa9c-28d24461cf90'),(332,6,'Scot','Scot','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8192bc-83cc-11e6-aa9c-28d24461cf90'),(333,6,'Senegalese','Senegalese','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8192e3-83cc-11e6-aa9c-28d24461cf90'),(334,6,'Serbian','Serbian','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819309-83cc-11e6-aa9c-28d24461cf90'),(335,6,'Singaporean','Singaporean','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819330-83cc-11e6-aa9c-28d24461cf90'),(336,6,'Slovak','Slovak','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819352-83cc-11e6-aa9c-28d24461cf90'),(337,6,'Slovenian','Slovenian','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819378-83cc-11e6-aa9c-28d24461cf90'),(338,6,'Somali','Somali','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc81939f-83cc-11e6-aa9c-28d24461cf90'),(339,6,'Spaniard','Spaniard','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8193c5-83cc-11e6-aa9c-28d24461cf90'),(340,6,'SriLankan','SriLankan','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8193ec-83cc-11e6-aa9c-28d24461cf90'),(341,6,'Sudanese','Sudanese','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819412-83cc-11e6-aa9c-28d24461cf90'),(342,6,'Surinamese','Surinamese','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819439-83cc-11e6-aa9c-28d24461cf90'),(343,6,'Swazi','Swazi','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc81945f-83cc-11e6-aa9c-28d24461cf90'),(344,6,'Swede','Swede','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819481-83cc-11e6-aa9c-28d24461cf90'),(345,6,'Swiss','Swiss','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8194a8-83cc-11e6-aa9c-28d24461cf90'),(346,6,'Syrian','Syrian','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8194ce-83cc-11e6-aa9c-28d24461cf90'),(347,6,'Taiwanese','Taiwanese','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8194f5-83cc-11e6-aa9c-28d24461cf90'),(348,6,'Tadzhik','Tadzhik','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc81951b-83cc-11e6-aa9c-28d24461cf90'),(349,6,'Tanzanian','Tanzanian','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819542-83cc-11e6-aa9c-28d24461cf90'),(350,6,'Thai','Thai','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819568-83cc-11e6-aa9c-28d24461cf90'),(351,6,'Togolese','Togolese','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc81958f-83cc-11e6-aa9c-28d24461cf90'),(352,6,'Trinidadian','Trinidadian','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8195b5-83cc-11e6-aa9c-28d24461cf90'),(353,6,'Tunisian','Tunisian','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8195dc-83cc-11e6-aa9c-28d24461cf90'),(354,6,'Turk','Turk','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819602-83cc-11e6-aa9c-28d24461cf90'),(355,6,'Ugandan','Ugandan','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819629-83cc-11e6-aa9c-28d24461cf90'),(356,6,'Ukrainian','Ukrainian','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc81964f-83cc-11e6-aa9c-28d24461cf90'),(357,6,'British','British','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819676-83cc-11e6-aa9c-28d24461cf90'),(358,6,'American','American','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc81969c-83cc-11e6-aa9c-28d24461cf90'),(359,6,'Uruguayan','Uruguayan','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8196c3-83cc-11e6-aa9c-28d24461cf90'),(360,6,'Uzbek','Uzbek','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8196e9-83cc-11e6-aa9c-28d24461cf90'),(361,6,'Venezuelan','Venezuelan','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819710-83cc-11e6-aa9c-28d24461cf90'),(362,6,'Vietnamese','Vietnamese','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819732-83cc-11e6-aa9c-28d24461cf90'),(363,6,'Welshman','Welshman','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc819758-83cc-11e6-aa9c-28d24461cf90'),(364,6,'Yemeni','Yemeni','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc81977f-83cc-11e6-aa9c-28d24461cf90'),(365,6,'Yugoslav','Yugoslav','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8197a5-83cc-11e6-aa9c-28d24461cf90'),(366,6,'Zambian','Zambian','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8197cc-83cc-11e6-aa9c-28d24461cf90'),(367,6,'Zimbabwean','Zimbabwean','\0','2016-09-26 13:01:13',1,NULL,NULL,NULL,NULL,'bc8197f2-83cc-11e6-aa9c-28d24461cf90'),(368,7,'Waiting Area (WA)','Waiting Area (WA)','','2016-10-23 15:57:57',1,NULL,NULL,NULL,NULL,'337116c5-36df-4d50-ae03-3e30b8f5b01b'),(369,7,'Dispensary (DIS)','Dispensary (DIS)','\0','2016-10-23 15:57:57',1,NULL,NULL,NULL,NULL,'df2afd61-0e66-4ca8-a06f-66754bf4a75c'),(370,7,'Corridor (COR)','Corridor (COR)','\0','2016-10-23 15:57:58',1,NULL,NULL,NULL,NULL,'ac32c6fe-8a2b-4b46-8c83-1ba4c431221b'),(371,7,'Reception (REC)','Reception (REC)','\0','2016-10-23 15:57:58',1,NULL,NULL,NULL,NULL,'d0b3b516-6abf-45ac-9815-84562e72c4db'),(372,7,'Cafeteria (CAF)','Cafeteria (CAF)','\0','2016-10-23 15:57:59',1,NULL,NULL,NULL,NULL,'345bc64f-c8b2-40a2-822e-623ea8221b88'),(373,8,'TB Clinic (TBC)','TB Clinic (TBC)','\0','2016-10-23 14:07:15',1,NULL,NULL,NULL,NULL,'3e30fc6d-b4db-4e3b-9987-2ea2f1369bd4'),(374,8,'Accidents and Emergency (A&E)','Accidents and Emergency (A&E)','\0','2016-10-23 14:07:15',1,NULL,NULL,NULL,NULL,'37af885d-c5a2-4c42-b9c2-004cae583b1b'),(375,8,'Casualty (CAS)','Casualty (CAS)','\0','2016-10-23 14:07:15',1,NULL,NULL,NULL,NULL,'eae904cd-10d6-484c-ace3-556b01cb5075'),(376,8,'Cardiology (CARD) ','Cardiology (CARD) ','\0','2016-10-23 14:07:15',1,NULL,NULL,NULL,NULL,'47a9a082-bd13-4660-92e9-6b2932cd2258'),(377,8,'Chest X-Ray (CXR) ','Chest X-Ray (CXR) ','\0','2016-10-23 14:07:15',1,NULL,NULL,NULL,NULL,'29550797-6caa-48ca-adcc-03d94bb39bfc'),(378,8,'Critical Care (CC)','Critical Care (CC)','\0','2016-10-23 14:07:15',1,NULL,NULL,NULL,NULL,'bbc3a71f-ac0e-4c49-9815-ba49af7b8232'),(379,8,'Dermatology (DERM)','Dertmatology (DERM)','\0','2016-10-23 14:07:15',1,NULL,NULL,NULL,NULL,'b985904d-fa40-471a-9bae-6cd6b2d90ce8'),(380,8,'Diabetology (DIAB) ','Diabetology (DIAB) ','\0','2016-10-23 14:07:15',1,NULL,NULL,NULL,NULL,'b1dd59f2-88d3-4fa1-8484-7ab9af330fe4'),(381,8,'Endocrinology (ENDO) ','Endocrinology (ENDO) ','\0','2016-10-23 14:13:15',1,NULL,NULL,NULL,NULL,'913be317-618a-4e44-a1b4-6676e8a2f45e'),(382,8,'Family Medicine (FAMM)','Family Medicine (FAMM)','\0','2016-10-23 14:13:15',1,NULL,NULL,NULL,NULL,'e6602618-ff91-4ecd-84bc-fd95dbbbfa44'),(383,8,'Gastrology/ Hepatology (GAST)','Gastrology/ Hepatology (GAST)','\0','2016-10-23 14:13:15',1,NULL,NULL,NULL,NULL,'0ce5561a-8354-4d47-a7b6-1ac424aff61f'),(384,8,'General (GEN)','General (GEN)','\0','2016-10-23 14:13:15',1,NULL,NULL,NULL,NULL,'a70020f0-c155-4dbf-a0ad-68239b81c78c'),(385,8,'Gyneacology/ Obstetrics (GYNE)','Gyneacology/ Obstetrics (GYNE)','\0','2016-10-23 14:13:15',1,NULL,NULL,NULL,NULL,'8c8434de-7f5e-4a5d-a9b0-29029dc5c49f'),(386,8,'Hematology (HEMA)','Hematology (HEMA)','\0','2016-10-23 14:13:15',1,NULL,NULL,NULL,NULL,'d065c4fa-e48b-4fce-8360-e5e5a75e75be'),(387,8,'Infectious Diseases (INFD)','Infectious Diseases (INFD)','\0','2016-10-23 14:13:15',1,NULL,NULL,NULL,NULL,'51e55c5c-eb19-46a8-9491-29809a7d7f40'),(388,8,'Internal Medicine (INTM)','Internal Medicine (INTM)','\0','2016-10-23 14:13:15',1,NULL,NULL,NULL,NULL,'abd4703d-adea-4db8-81e2-803a781915ab'),(389,8,'Isolation Room (IR)','Isolation Room (IR)','\0','2016-10-23 14:13:15',1,NULL,NULL,NULL,NULL,'40b73d60-362f-40bd-9235-aa8144ce7754'),(390,8,'Maternity (MAT)','Maternity (MAT)','\0','2016-10-23 14:28:23',1,NULL,NULL,NULL,NULL,'c1a49653-275f-4c1c-96dd-0af02d5d143a'),(391,8,'Neonatal (NEON)','Neonatal (NEON)','\0','2016-10-23 14:28:23',1,NULL,NULL,NULL,NULL,'eeebbb84-9ac4-4979-9619-c72a9d0c0e5c'),(392,8,'Nephrology (NEPH)','Nephrology (NEPH)','\0','2016-10-23 14:28:23',1,NULL,NULL,NULL,NULL,'380922fa-2809-4571-9c57-2e8562083a7e'),(393,8,'Neurology (NEUR)','Neurology (NEUR)','\0','2016-10-23 14:28:23',1,NULL,NULL,NULL,NULL,'08cef749-87b7-4270-9ad0-43579f71f8fe'),(394,8,'Nurtition/Dietetics (NUT)','Nurtition/Dietetics (NUT)','\0','2016-10-23 14:28:23',1,NULL,NULL,NULL,NULL,'6366e49b-7264-43bf-909e-c3e75055e9c1'),(395,8,'Oncology (ONCO)','Oncology (ONCO)','\0','2016-10-23 14:28:23',1,NULL,NULL,NULL,NULL,'47b1f8da-11dd-4829-8ac3-9ad1cb4cf67d'),(396,8,'Orthopedics/Trauma (ORTHO)','Orthopedics/Trauma (ORTHO)','\0','2016-10-23 14:34:53',1,NULL,NULL,NULL,NULL,'a02846f2-3b5c-4b2f-9af8-8e50a6b7ad75'),(397,8,'Ophthalmology (OPHT)','Ophthalmology (OPHT)','\0','2016-10-23 14:34:53',1,NULL,NULL,NULL,NULL,'2e984adb-a68e-4314-b3b4-4c6ceb6b6c2a'),(398,8,'Pathology (PATH)','Pathology (PATH)','\0','2016-10-23 14:34:53',1,NULL,NULL,NULL,NULL,'dc909897-cd88-44b5-bae1-f6261bebb99e'),(399,8,'Pediatrics (PED)','Pediatrics (PED)','\0','2016-10-23 14:34:53',1,NULL,NULL,NULL,NULL,'4f7a6d07-e00d-4db6-858b-3bd7ec55ea15'),(400,8,'Physiotherapy (PHYS)','Physiotherapy (PHYS)','\0','2016-10-23 14:34:53',1,NULL,NULL,NULL,NULL,'bbb99325-f30a-4a70-9baa-da6404c961f7'),(401,8,'Pulmonology/ Chest (PULM)','Pulmonology/ Chest (PULM)','\0','2016-10-23 14:34:53',1,NULL,NULL,NULL,NULL,'058796eb-738f-4ea2-8670-dedfc88f45ac'),(402,8,'Psychiatry (PSYC)','Psychiatry (PSYC)','\0','2016-10-23 14:34:53',1,NULL,NULL,NULL,NULL,'5f816a70-fe06-4a7e-97ac-85f03a7a4cdb'),(403,8,'Radiology (RADI)','Radiology (RADI)','\0','2016-10-23 14:34:53',1,NULL,NULL,NULL,NULL,'abff76c3-12a6-4b9f-a201-144e84238667'),(404,8,'Sexual Health (SEH)','Sexual Health (SEH)','\0','2016-10-23 14:34:53',1,NULL,NULL,NULL,NULL,'7b0d6eed-c9f5-4410-a63d-99fb00a25763'),(405,8,'Surgery/OR (OR)','Surgery/OR (OR)','\0','2016-10-23 14:34:53',1,NULL,NULL,NULL,NULL,'6e881a4a-2a5a-400f-a861-371ff7e54378'),(406,8,'Urology (URO)','Urology (URO)','\0','2016-10-23 14:34:53',1,NULL,NULL,NULL,NULL,'61324a6b-46e0-42ab-9c1c-424755ca2543');
/*!40000 ALTER TABLE `definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `definition_type`
--

DROP TABLE IF EXISTS `definition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `definition_type` (
  `definition_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `definition_type` varchar(45) NOT NULL,
  PRIMARY KEY (`definition_type_id`),
  UNIQUE KEY `definition_type_UNIQUE` (`definition_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `definition_type`
--

LOCK TABLES `definition_type` WRITE;
/*!40000 ALTER TABLE `definition_type` DISABLE KEYS */;
INSERT INTO `definition_type` VALUES (2,'BLOOD_GROUP'),(5,'COUNTRY'),(3,'ETHNICITY'),(1,'GENDER'),(6,'NATIONALITY'),(8,'OPD'),(7,'OPD_AREA'),(4,'RELIGION');
/*!40000 ALTER TABLE `definition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element` (
  `element_id` int(11) NOT NULL AUTO_INCREMENT,
  `element_name` varchar(45) NOT NULL,
  `validation_regex` varchar(255) DEFAULT NULL,
  `data_type` varchar(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  UNIQUE KEY `element_name_UNIQUE` (`element_name`),
  KEY `fk_element_users1_idx` (`created_by`),
  KEY `fk_element_users2_idx` (`changed_by`),
  KEY `fk_element_location1_idx` (`created_at`),
  KEY `fk_element_location2_idx` (`changed_at`),
  CONSTRAINT `fk_element_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_element_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_element_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_element_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
INSERT INTO `element` VALUES (1,'F_DATE',NULL,'DateTime','Form Date','2015-12-28 12:19:00',2,1,'2015-12-29 12:19:00',2,1,'e3cf117a-9fd7-11e5-9028-28d24461cf90'),(2,'SITE_CODE',NULL,'String','Site codes','2015-12-28 12:19:00',3,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cf91'),(3,'SERIAL_NO',NULL,'Integer','Serial Number of records','2015-12-28 12:19:00',2,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cf92'),(4,'PATIENT_ID','regex=^[0-9]{10}-[0-9]{1}','String','Patient ID of a patient','2015-12-28 12:19:00',4,2,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cf93'),(5,'PATIENT_NAME','regex=^[A-Za-z_]+','String','Patient Name','2015-12-28 12:19:00',2,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cf94'),(6,'AGE','range=0-130','Integer','Age of Patient','2015-12-28 12:19:00',2,2,'2015-12-29 13:23:00',2,1,'e3cf117a-9fd7-11e5-9028-28d24461cf95'),(7,'GENDER','list=M,F,MALE,FEMALE','String','Gender of Patient','2015-12-28 12:29:00',3,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cf96'),(8,'ADDRESS','regex=^[A-Za-z_,.]+','String','Address of Patient','2015-12-28 12:29:00',5,NULL,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cf97'),(9,'OPD','regex=^[A-Za-z0-9_,.()\\s]+','String','Title of OPD','2015-08-22 06:16:00',4,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cf98'),(10,'FIXTURENUMBER','^[0-9]{1,2}','Integer','Number of OPD','2016-07-27 12:58:00',2,2,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cf99'),(11,'UV_READING_3FT',NULL,'Double','Reading after 3ft','2016-06-27 00:57:23',3,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg01'),(12,'UV_READING_6FT',NULL,'Double','Reading after 6ft','2015-02-16 02:23:00',2,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg02'),(13,'UV_READING_7FT',NULL,'Double','Reading after 7ft','2015-04-08 04:27:00',1,2,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg03'),(15,'UV_BEFORE_CLEAN_3FT',NULL,'Double','3ft Reading before Cleaning','2016-02-02 06:26:00',5,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg04'),(16,'UV_BEFORE_CLEAN_6FT',NULL,'Double','6ft Reading before Cleaning','2016-03-13 00:12:53',4,2,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg05'),(17,'UV_BEFORE_CLEAN_7FT',NULL,'Double','7ft Reading before Cleaning','2015-12-20 12:12:00',1,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg06'),(18,'POWER_DISCONNECTED','list=Y,N','String','Power Disconnected','2015-02-15 06:36:30',3,2,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg07'),(19,'LOUVER_OPENED','list=Y,N','String','Louver Panel Opened','2016-04-04 05:44:25',4,2,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg08'),(20,'LAMPS_REMOVED','list=Y,N','String','Lamp removed ','2015-06-12 01:12:00',1,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg09'),(21,'LAMPS_CLEANED','list=Y,N','String','Lamp Cleaned ','2015-06-12 01:12:00',2,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg10'),(22,'INTERIOR_CLEANED','list=Y,N','String','Interior of fixture Cleaned','2014-08-16 08:42:00',4,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg11'),(23,'UV_PART_REPLACED','list=Y,N','String','Replacement of lamp','2015-05-25 12:06:00',3,2,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg12'),(24,'PARTS_REPLACED_NAME',NULL,'String','Replacement of any other part','2015-05-25 12:06:00',5,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg13'),(25,'LAMPS_REINSTALLED','list=Y,N','String','Lamp Reinstall Correctly','2016-01-12 22:04:24',4,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg14'),(26,'LOUVER_CLOSED','list=Y,N','String','Louver Closed','2016-01-13 00:06:20',3,2,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg15'),(27,'POWER_CONNECTED','list=Y,N','String','Power Fixture on','2016-03-02 16:16:00',2,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg16'),(28,'UV_LIGHT_WORKING','list=Y,N','String','Fixture Working','2015-04-02 00:06:06',4,2,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg17'),(29,'UV_AFTER_CLEAN_3FT',NULL,'Double','3ft Reading after Clean','2015-07-06 00:06:06',1,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg18'),(30,'UV_AFTER_CLEAN_6FT',NULL,'Double','6ft Reading after Clean','2015-07-06 00:06:06',2,1,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg19'),(31,'UV_AFTER_CLEAN_7FT',NULL,'Double','7ft Reading after Clean','2016-08-06 00:06:06',3,2,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg20'),(32,'MAINTAINER_FNAME',NULL,'String','Maintainer First Name','2015-07-07 08:04:06',4,2,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg21'),(33,'MAINTAINER_NAME',NULL,'String','Maintainer Name','2015-07-07 08:04:07',NULL,NULL,NULL,NULL,NULL,'e3cf117a-9fd7-11e5-9028-28d24461cg22'),(34,'ID','regex=^[A-Za-z0-9-]+','String','Unique identifier of UVGI installation','2016-08-02 18:28:14',2,1,NULL,NULL,NULL,'2b2a205d-41f0-4a7e-9baf-5ce9f96588eb'),(35,'STARTTIME',NULL,'Datetime','Internal clock to maintian when form has been started','2016-08-03 12:35:46',2,1,NULL,NULL,NULL,'7b618840-6650-4434-ae33-37fef09b4fd6'),(41,'ENDTIME',NULL,'Datetime','Internal clock to maintain when form has been finished','2016-08-03 12:35:46',2,1,NULL,NULL,NULL,'7b618840-6650-4434-ae33-37fef09b4fd9'),(42,'UVGI_INSTALL_LOCATION','regex=^[A-Za-z0-9_,.()\\s]+','String','Facility where UVGI light was installed','2016-08-02 18:28:13',2,1,NULL,NULL,NULL,'2efe5763-b499-4880-9f47-012860370cc2'),(43,'OPD_AREA','regex=^[A-Za-z0-9_,.()\\s]+','String','Area of the OPD where UVGI light was installed','2016-08-02 18:28:14',2,1,NULL,NULL,NULL,'badd8eb2-26d0-451d-9fba-2c6c6407b6a1'),(47,'UVGI_INSTALLED','list=Y,N','Boolean','Installation of UVGI light completed','2016-08-02 18:28:15',2,1,NULL,NULL,NULL,'79497be6-793a-40aa-ba2a-9c0f08cafe50'),(48,'REASON_UVGI_NOT_INSTALLED',NULL,'String','Reason UVGI wasn\'t successfully installed','2016-09-29 11:06:15',2,1,NULL,NULL,NULL,'e428348c-5174-4be7-b538-25ac7b7fdd81'),(49,'MAINTAINER_CONTACT',NULL,'String','Maintainer Mobile Number','2016-09-29 12:23:14',2,1,NULL,NULL,NULL,'3222ba8f-5068-4560-887a-aa8f1c204d2c'),(50,'PROBLEM',NULL,'String','Detail about the problem beiing reported','2016-09-29 14:23:14',2,1,NULL,NULL,NULL,'e6915bdd-9630-4740-8ec3-a916b6b80947'),(51,'MOBILE_NUMBER',NULL,'String','Mobile Number','2016-09-29 14:23:30',2,1,NULL,NULL,NULL,'380a67b4-08dc-4758-9c56-13a293025e40'),(52,'TROUBLESHOOT_NUMBER',NULL,'String','Id assigned to reported problem via app','2016-09-29 14:47:11',2,1,NULL,NULL,NULL,'70cb7330-73cb-40c1-91ac-4d8b6c965bf0'),(53,'PROBLEM_RESOLVED','list=Y,N','Boolean','Is the reported problem resolved?','2016-09-29 15:11:12',2,1,NULL,NULL,NULL,'6795e7ad-788b-4b67-b690-0b51db0e3dde'),(54,'REASON_PROBLEM_UNRESOLVED',NULL,'String','Detail about why the problem was not troubleshooted successfully','2016-09-29 15:12:20',2,1,NULL,NULL,NULL,'29590cb9-1f42-4641-8396-8175d345617e'),(55,'TROUBLESHOOTER_NAME',NULL,'String','Name of the troubleshooter','2016-09-29 15:13:25',2,1,NULL,NULL,NULL,'42387b8a-d6f4-4ffc-a662-d63167ef5728'),(56,'TROUBLESHOOTER_CONTACT',NULL,'String','Contact number of the troubleshooter','2016-09-29 15:14:09',2,1,NULL,NULL,NULL,'632c444f-ea5c-484f-9aa3-9fcb4766406b'),(57,'STATUS',NULL,'String','Status of the Issue logged','2016-10-03 10:03:20',2,1,NULL,NULL,NULL,'a6fc47bb-4a7e-4ebf-8c5f-92510687862d'),(58,'STATUS_DATE',NULL,'DateTime','Date of status issue changes','2016-10-03 10:05:02',2,1,NULL,NULL,NULL,'e1ce2798-0181-48e1-b51c-ff4a5c4ec861'),(59,'NAME',NULL,'String','Name of the Guest login','2016-10-18 14:44:01',2,1,NULL,NULL,NULL,'c91bb243-779e-4ff4-b175-59f4db6627f7'),(60,'EMAIL',NULL,'String','Email address for guest login','2016-10-18 14:44:02',2,1,NULL,NULL,NULL,'4b7e3b2e-027e-4936-969d-224273335779'),(61,'SCREENING_LOCATION',NULL,'String','SCREENING_LOCATION','2017-04-20 16:11:22',1,NULL,NULL,NULL,NULL,'1ca6013e-640d-40b9-9148-6d30434c9e4f'),(62,'HOSPITAL_FACILITY_NAME',NULL,'String','HOSPITAL_FACILITY_NAME','2017-04-20 16:13:05',1,NULL,NULL,NULL,NULL,'ea02e51b-768b-4137-a72e-cb0ab5a3f36a'),(63,'HOSPITAL_SECTION',NULL,'String','HOSPITAL_SECTION','2017-04-20 16:13:33',1,NULL,NULL,NULL,NULL,'dee17e33-e09e-4159-92fa-ec77c23a7cbe'),(64,'HOSPITAL_SECTION_OTHER',NULL,'String','HOSPITAL_SECTION_OTHER','2017-04-20 16:13:50',1,NULL,NULL,NULL,NULL,'b10e2827-c11b-4946-a7b8-20a476f01171'),(65,'OPD_WARD_SECTION',NULL,'String','OPD_WARD_SECTION','2017-04-20 16:14:02',1,NULL,NULL,NULL,NULL,'cdbd7ce9-0630-42cf-b3cc-d6d02f8b4576'),(66,'PATIENT_OR_ATTENDANT',NULL,'String','PATIENT_OR_ATTENDANT','2017-04-20 16:14:18',1,NULL,NULL,NULL,NULL,'ca2fdf4e-69c8-4ad5-a24f-5ef7c306bbe3'),(67,'AGE_RANGE',NULL,'String','AGE_RANGE','2017-04-20 16:14:29',1,NULL,NULL,NULL,NULL,'1b8b1efa-8ccd-493d-9f65-22de31151f27'),(69,'TWO_WEEKS_COUGH',NULL,'String','TWO_WEEKS_COUGH','2017-04-20 16:14:58',1,NULL,NULL,NULL,NULL,'d3c75534-9dac-4efc-bb1e-4bf339215a67'),(70,'TUBERCULOSIS_CONTACT',NULL,'String','TUBERCULOSIS_CONTACT','2017-04-20 16:15:23',1,NULL,NULL,NULL,NULL,'cbf40414-3f3f-4935-a673-c49229e3ff22'),(71,'HISTORY_OF_TUBERCULOSIS',NULL,'String','HISTORY_OF_TUBERCULOSIS','2017-04-20 16:15:37',1,NULL,NULL,NULL,NULL,'b263acb0-160e-46c7-9c36-6f2e4e36f421');
/*!40000 ALTER TABLE `element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter`
--

DROP TABLE IF EXISTS `encounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter` (
  `encounter_id` int(11) NOT NULL AUTO_INCREMENT,
  `encounter_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `duration_seconds` int(11) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_encounter_encounter_type1_idx` (`encounter_type_id`),
  KEY `fk_encounter_users1_idx` (`user_id`),
  KEY `fk_encounter_patient1_idx` (`person_id`),
  KEY `fk_encounter_users2_idx` (`created_by`),
  KEY `fk_encounter_users3_idx` (`changed_by`),
  KEY `fk_encounter_location1_idx` (`created_at`),
  KEY `fk_encounter_location2_idx` (`changed_at`),
  CONSTRAINT `fk_encounter_encounter_type1` FOREIGN KEY (`encounter_type_id`) REFERENCES `encounter_type` (`encounter_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_users2` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_users3` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter`
--

LOCK TABLES `encounter` WRITE;
/*!40000 ALTER TABLE `encounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `encounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_prerequisite`
--

DROP TABLE IF EXISTS `encounter_prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_prerequisite` (
  `encounter_prerequisite_id` int(11) NOT NULL AUTO_INCREMENT,
  `encounter_type_id` int(11) NOT NULL,
  `prerequisite_encounter_type_id` int(11) DEFAULT NULL,
  `element_id` int(11) DEFAULT NULL,
  `should_be_regex` varchar(255) DEFAULT NULL,
  `should_not_be_regex` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_prerequisite_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_encounter_prerequisite_users1_idx` (`created_by`),
  KEY `fk_encounter_prerequisite_users2_idx` (`changed_by`),
  KEY `fk_encounter_prerequisite_location1_idx` (`created_at`),
  KEY `fk_encounter_prerequisite_location2_idx` (`changed_at`),
  KEY `fk_encounter_prerequisite_element1_idx` (`element_id`),
  KEY `fk_encounter_prerequisite_encounter_type_idx` (`encounter_type_id`),
  KEY `fk_encounter_prerequisite_encounter_type2_idx` (`prerequisite_encounter_type_id`),
  CONSTRAINT `fk_encounter_prerequisite_element1` FOREIGN KEY (`element_id`) REFERENCES `element` (`element_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_prerequisite_encounter_type` FOREIGN KEY (`encounter_type_id`) REFERENCES `encounter_type` (`encounter_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_prerequisite_encounter_type2` FOREIGN KEY (`prerequisite_encounter_type_id`) REFERENCES `encounter_type` (`encounter_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_prerequisite_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_prerequisite_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_prerequisite_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_prerequisite_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_prerequisite`
--

LOCK TABLES `encounter_prerequisite` WRITE;
/*!40000 ALTER TABLE `encounter_prerequisite` DISABLE KEYS */;
INSERT INTO `encounter_prerequisite` VALUES (1,2,1,7,'list=M,F',NULL,'Gender','2015-12-11 12:19:00',1,2,NULL,NULL,NULL,'ad34fb0c-83cc-11e6-aa9c-28d24461cf90'),(2,2,1,6,NULL,'range=0-5','Age should be 5+','2015-12-11 12:19:00',3,2,NULL,NULL,NULL,'ad35170b-83cc-11e6-aa9c-28d24461cf90'),(3,3,1,7,'list=M,F',NULL,'Form Date','2015-12-23 12:19:00',1,2,NULL,NULL,NULL,'ad351814-83cc-11e6-aa9c-28d24461cf90'),(4,3,1,6,NULL,'range=0-5','Age should be 5+','2015-12-23 12:19:00',3,2,NULL,NULL,NULL,'ad351877-83cc-11e6-aa9c-28d24461cf90'),(5,2,1,1,'regex=[0-9-:]*',NULL,'Form Date','2015-12-11 12:19:00',3,2,NULL,NULL,NULL,'ad3518c8-83cc-11e6-aa9c-28d24461cf90');
/*!40000 ALTER TABLE `encounter_prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_result`
--

DROP TABLE IF EXISTS `encounter_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_result` (
  `encounter_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `encounter_id` int(11) NOT NULL,
  `element_id` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`encounter_result_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_encounter_result_encounter1_idx` (`encounter_id`),
  KEY `fk_encounter_result_element1_idx` (`element_id`),
  KEY `fk_encounter_result_users1_idx` (`created_by`),
  KEY `fk_encounter_result_users2_idx` (`changed_by`),
  KEY `fk_encounter_result_location1_idx` (`created_at`),
  KEY `fk_encounter_result_location2_idx` (`changed_at`),
  KEY `FKB9292CA9BCCAE8D4` (`parent`),
  CONSTRAINT `FKB9292CA9BCCAE8D4` FOREIGN KEY (`parent`) REFERENCES `encounter_result` (`encounter_result_id`),
  CONSTRAINT `fk_encounter_element1` FOREIGN KEY (`element_id`) REFERENCES `element` (`element_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_result_encounter1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_result_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_result_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_result_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_result_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_result`
--

LOCK TABLES `encounter_result` WRITE;
/*!40000 ALTER TABLE `encounter_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `encounter_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_type`
--

DROP TABLE IF EXISTS `encounter_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_type` (
  `encounter_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `encounter_type` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_type_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  UNIQUE KEY `encounter_type_UNIQUE` (`encounter_type`),
  KEY `fk_encounter_type_users1_idx` (`created_by`),
  KEY `fk_encounter_type_users2_idx` (`changed_by`),
  KEY `fk_encounter_type_location1_idx` (`created_at`),
  KEY `fk_encounter_type_location2_idx` (`changed_at`),
  CONSTRAINT `fk_encounter_type_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_type_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_type_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_encounter_type_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_type`
--

LOCK TABLES `encounter_type` WRITE;
/*!40000 ALTER TABLE `encounter_type` DISABLE KEYS */;
INSERT INTO `encounter_type` VALUES (1,'Screening','2015-12-11 12:19:00',1,1,NULL,NULL,NULL,'736fe18d-9fd7-11e5-9028-28d24461cf90'),(2,'PPM Treatment','2015-12-12 12:19:00',3,1,NULL,NULL,NULL,'736fe18d-9fd7-11e5-9028-28d24461cf91'),(3,'SBM Treatment','2015-12-12 12:19:00',4,2,NULL,NULL,NULL,'736fe18d-9fd7-11e5-9028-28d24461cf93');
/*!40000 ALTER TABLE `encounter_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(45) NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `city_village` varchar(45) DEFAULT NULL,
  `state_province` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `landmark1` varchar(45) DEFAULT NULL,
  `landmark2` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `primary_contact` varchar(20) DEFAULT NULL,
  `secondary_contact` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `parent_location` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  UNIQUE KEY `location_name_UNIQUE` (`location_name`),
  KEY `fk_location_location1_idx` (`parent_location`),
  KEY `fk_location_location2_idx` (`created_at`),
  KEY `fk_location_location3_idx` (`changed_at`),
  KEY `fk_location_users1_idx` (`created_by`),
  KEY `fk_location_users2_idx` (`changed_by`),
  CONSTRAINT `fk_location_location1` FOREIGN KEY (`parent_location`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_location_location2` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_location_location3` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_location_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_location_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Unknown Location','Hospital',NULL,'','',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2005-09-22 00:00:00',1,NULL,NULL,NULL,NULL,'8d6c993e-c2cc-11de-8d13-0010c6dffd0f'),(2,'IHK-KHI','Hospital','Indus Hospital Korangi','Indus Hospital','Korangi Crossing',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-08-02 04:48:37',1,NULL,NULL,NULL,NULL,'7f65d926-57d6-4402-ae10-a5b3bcbf7986'),(3,'IHS','Hospital','Interactive Health Solutions','503, Ibrahim Trade Towers','PECHS, Shahra-e-Faisal',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,'2013-08-02 04:48:51',1,NULL,NULL,NULL,NULL,'7fdfa2cb-bc95-405a-88c6-32b7673c0453'),(4,'JPMC-KHI','Hospital','Jinnah Post-graduate Medical College','Rafiqui Shaheed Road',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-08-02 04:48:19',1,NULL,NULL,NULL,NULL,'2131aff8-2e2a-480a-b7ab-4ac53250262b'),(5,'CH-KHI','Hospital','Civil Hospital Karachi','Baba-e-Urdu Road','Nanakwara',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-08-02 04:49:07',1,NULL,NULL,NULL,NULL,'6351fcf4-e311-4a19-90f9-35667d99a8af'),(6,'NICH-KHI','Hospital','National Institute of Child Health','Rafiqui S.J Shaheed Road',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-08-02 04:47:29',1,NULL,NULL,NULL,NULL,'b1a8b05e-3542-4037-bbd3-998ee9c40574'),(7,'ASH-KHI','Hospital','Abbasi Shaheed Hospital','Tabish Dehlavi Road',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-08-02 04:47:12',1,NULL,NULL,NULL,NULL,'58c57d25-8d39-41ab-8422-108a0c277d98'),(8,'IRD-PK','Hospital','Interactive Research and Development','508, Ibrahim Trade Towers','PECHS, Shahra-e-Faisal',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-08-02 04:46:15',1,NULL,NULL,NULL,NULL,'aff27d58-a15c-49a6-9beb-d30dcfc0c66e'),(9,'NICVD-KHI','Hospital','National Institute of Cardio-vasular Diseases','Raffique Shaheed Rd','Bizerta Lines, Cantt',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-22 10:33:12',1,NULL,NULL,NULL,NULL,'de561805-51b0-4afc-81df-0af5c2a39a12'),(10,'LGH-KHI','Hospital','Lyari General Hospital','Lyari',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-22 10:35:40',1,NULL,NULL,NULL,NULL,'f10fdc40-9652-454a-acbb-f79a56dd0c1f'),(11,'SGHNK-KHI','Hospital','Sindh Government Hospital New Karachi',NULL,NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-22 10:37:07',1,NULL,NULL,NULL,NULL,'89ba099c-5a0c-435d-aa2c-f4011c6d1ee1'),(12,'BAK-KHI','Hospital','Behbud Association Karachi','Block I, Scheme 5','Kehkashan, Clifton',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-22 10:38:14',1,NULL,NULL,NULL,NULL,'b72303ba-45c3-45db-ae88-4a8d610e0bb5'),(13,'SZC-KNG','Hospital','Sehatmand Zindagi Center - Korangi','Korangi',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,'2016-08-22 10:38:52',1,NULL,NULL,NULL,NULL,'b1724459-e2ec-4faa-b400-2982ec5e860f'),(14,'SZC-NN','Hospital','Sehatmand Zindagi Center - North Nazimabad','North Nazimabad',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,'2016-08-22 10:41:41',1,NULL,NULL,NULL,NULL,'1045386e-16e0-4498-89a6-fe20478acf38'),(15,'SZC-MLR','Hospital','Sehatmand Zindagi Center - Malir','Malir',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,'2016-08-22 10:42:13',1,NULL,NULL,NULL,NULL,'9d6b8886-fea9-40a2-9440-00b3e99c0cc4'),(16,'SGHKO-KHI','Hospital','Sindh Government Hospital Korangi','Korangi',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-22 10:57:20',1,NULL,NULL,NULL,NULL,'75d6e8a0-f1d9-47e5-bf01-71fe58bacd6b'),(17,'SGHLQ-KHI','Hospital','Sindh Government Hospital Liaqatabad','Liaqatabad',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-22 10:58:09',1,NULL,NULL,NULL,NULL,'e743ab51-06ae-49a9-ba59-a95d8425f99d'),(18,'SGOQH-KHI','Hospital','Sindh Government Orangi Qatar Hospital','Orangi',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-22 11:00:23',1,NULL,NULL,NULL,NULL,'89eac0b8-b459-40dc-8635-dbea38dd0732'),(19,'DAP-KHI','Hospital','Diabetes Association Karachi Pakistan','5-E/3 Nazimabad',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-24 15:16:03',1,NULL,NULL,NULL,NULL,'ef3ec91c-015a-4bc9-b609-55c1117bc6f5'),(20,'BIDE-KHI','Hospital','Baqai Institute of Diabetology and Endocrinology','1-2, II-B','Block 2 Nazimabad',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-24 15:18:19',1,NULL,NULL,NULL,NULL,'0bd86a91-e11d-412b-bfcd-320c827381bc'),(21,'CCH-KHI','Hospital','Children\'s Cancer Hospital',NULL,NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-24 15:19:56',1,NULL,NULL,NULL,NULL,'87371a38-c483-4bb5-b079-83496460c062'),(22,'SIUT-KHI','Hospital','Sindh Institute of Urology and Transplantation','Chand Bibi Road',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-24 15:21:44',1,NULL,NULL,NULL,NULL,'00718ad7-bfc2-44a0-b519-645bb56a0308'),(23,'KCPTI-KHI','Hospital','The Kidney Centre Postgraduate Training Institute','197/9','Rafiqui Shaheed Road',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-24 15:23:51',1,NULL,NULL,NULL,NULL,'b4fd59e6-383b-46b8-8d58-56f42437b976'),(24,'CHS','Hospital','Community Health Services','508, Ibrahim Trade Towers','Shahra-e-Faisal',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-21 17:42:58',1,NULL,NULL,NULL,NULL,'611618c2-7550-40ec-a0c6-786f711a9143'),(25,'OICD-KHI','Hospital','Ojha Institute of Chest Diseases','DUHS, Gulzar-e-HijrI','Suparco Road',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-21 17:44:41',1,NULL,NULL,NULL,NULL,'2921cc22-9fbb-49df-b562-c5eefd3a06d4'),(26,'KGH-KHI','Hospital','Kharadar General Hospital','Aga Khan Road','Kharadar, Karachi',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-21 17:49:02',1,NULL,NULL,NULL,NULL,'d994a1d3-efd3-4c85-ba06-11342aa174d9'),(27,'SGHLD-KHI','Hospital','Sindh Government Hospital Landhi','Landhi',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-21 17:50:32',1,NULL,NULL,NULL,NULL,'5e2eecf8-8e8d-4726-a76b-68b0f0d26544'),(28,'ATSNK-KHI','Hospital','Aiwan-e-Sanat-o-Tijarat','New Karachi',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-21 17:52:37',1,NULL,NULL,NULL,NULL,'3910a0a2-98cf-44cc-9cd5-626754deaad0'),(29,'CH-BDN','Hospital','Civil Hospital Badin','Civil Hospital Road',NULL,NULL,'Badin','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-01-11 18:27:13',1,NULL,NULL,NULL,NULL,'ea684cae-6274-497f-bc25-87df5d2bf0cd'),(30,'FH-KHI','Hospital','Fatima Hospital - Teaching hospital of Baqai Medical University','51, Deh Tor, Gadap Road','Near Toll Plaza, Super Highway',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-01-11 18:32:09',1,NULL,NULL,NULL,NULL,'6e4faddb-ca58-42e8-b3d6-132d573a7030'),(31,'ICD-KTR','Hospital','Institute of Chest Diseases Kotri','Khanzada Colony',NULL,NULL,'Kotri','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-01-11 18:33:32',1,NULL,NULL,NULL,NULL,'012bccc9-a68f-42b7-8042-043dd7ef4828'),(32,'KPT-KHI','Hospital','Karachi Port Trust Hospital and Nursing Home','Napier Mole Road','Near Ziauddin Hospital, Kemari',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-01-11 18:37:17',1,NULL,NULL,NULL,NULL,'66a3c619-69a2-40dc-8a71-c74070873472'),(33,'MHHCC-KHI','Hospital','Murshid Hospital & Health Care Centre','Hub River Road','Mujahidabad',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-01-11 18:40:05',1,NULL,NULL,NULL,NULL,'e607c4fe-6fbd-4abc-90b6-b4a3623a82eb'),(34,'SGHIH-KHI','Hospital','Sindh Government Hospital Ibrahim Hydri','Ibrahim Hydri, Korangi Creek Road','Shahra-e-Faisal',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-01-11 18:46:14',1,NULL,NULL,NULL,NULL,'84a42f06-a636-4766-8353-6f92ec429b31'),(35,'SGHSA-KHI','Hospital','Sindh Goverment Hospital Saudabad','Saudabad','Shahra-e-Faisal',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-01-11 18:49:50',1,NULL,NULL,NULL,NULL,'8083c98f-a2d0-42a2-938a-748504fc2162'),(36,'SMSMH-KHI','Hospital','Sheikh Muhammad Saeed Memorial Hospital','Gulshan-e-Sikander, Korangi Crossing','Korangi',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-01-11 19:00:36',1,NULL,NULL,NULL,NULL,'a4100d4f-4795-411b-a5a0-4b3764059f6f'),(37,'CMCH-LRK','Hospital','Chandka Medical College Hospital, Larkana','Larkana High Court, SP Chowk,','Aliabad Mohallah, Shah Nawaz Bhutto Road',NULL,'Larkana','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 21:32:26',1,NULL,NULL,NULL,NULL,'eb1034f1-19bc-43e6-a561-7ecb71bcf474'),(38,'FJCH-QTA','Hospital','Fatima Jinnah Chest Hospital, Quetta',NULL,NULL,NULL,'Quetta','Balochistan','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 21:34:30',1,NULL,NULL,NULL,NULL,'c8138efd-5914-4f8e-b145-c9615b53ecd9'),(39,'PMCH-NWB','Hospital','Peoples Medical College & Hospital, Nawabshah','eoples University of Medical & Health Sciences for women','Shaheed Benazirabad',NULL,'Nawabshah','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 21:38:55',1,NULL,NULL,NULL,NULL,'69e2daa1-4b04-4763-8ef1-29980e1b4a88'),(40,'GMMH-SUK','Hospital','Ghulam Muhammad Mahar Medical College & Hospital',NULL,NULL,NULL,'Sukkur','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 21:42:13',1,NULL,NULL,NULL,NULL,'103c6d80-c4d6-4709-b5ec-a3f33ed58f78'),(41,'DHQH-LRL','Hospital','District Head Quarter Hospital, Loralai',NULL,NULL,NULL,'Loralai','Balochistan','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 21:45:19',1,NULL,NULL,NULL,NULL,'f7e8202f-af2c-4fcf-8e37-63a2f3b9c680'),(42,'GDCH-LHR','Hospital','Gulab Devi Chest Hospital','Ferozepur Road',NULL,NULL,'Lahore','Punjab','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 21:46:36',1,NULL,NULL,NULL,NULL,'7673948a-8547-4c09-8e6b-f8fa6d98704a'),(43,'CH-MPK','Hospital','Civil Hospital, Mirpurkhas',NULL,NULL,NULL,'Mirpurkhas','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 21:50:18',1,NULL,NULL,NULL,NULL,'3f96cd79-206b-43c8-8dfb-d672a8aadc75'),(44,'DHH-GLT','Hospital','District Headquarter Hospital, Gilgit',NULL,NULL,NULL,'Gilgit','Gilgit Baltistan','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 21:52:20',1,NULL,NULL,NULL,NULL,'0db9ddae-c019-4c4e-877d-f68ee7d66816'),(45,'SMC-SWT','Hospital','Swat Medical College','Saidu Sharif, Swat District',NULL,NULL,'Swat','Khyber Pakhtunkhwa','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 21:54:51',1,NULL,NULL,NULL,NULL,'0f9163a1-6b5f-4b4d-bcfc-f87def03dcd2'),(46,'LRH-PSW','Hospital','Lady Reading Hospital, Peshawar','Soekarno Road',NULL,NULL,'Peshawar','Khyber Pakhtunkhwa','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 21:56:42',1,NULL,NULL,NULL,NULL,'ee7674fc-abc7-4422-94d6-183d2d8eb9b8'),(47,'DHH-MUZ','Hospital','District Headquarter Hospital, Muzaffarabad','Hattian Bala, Chakothi Road',NULL,NULL,'Muzaffarabad','Azad Kashmir','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 21:59:02',1,NULL,NULL,NULL,NULL,'683c3e25-38ef-4c71-9545-9b021c6cd1d2'),(48,'PIMS-ISL','Hospital','Pakistan Institute of Medical Sciences, Islamabad','Ibn-e-Sina Road',NULL,NULL,'Islamabad','Punjab','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 22:01:24',1,NULL,NULL,NULL,NULL,'1767268d-8a05-4414-bb09-6a12fd652434'),(49,'LH-RWP','Hospital','Leprosy Hospital, Rawalpindi','Zafar-ul-Haq Road',NULL,NULL,'Rawalpindi','Punjab','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-02 22:07:05',1,NULL,NULL,NULL,NULL,'e15c5efe-e921-4f0f-8a29-5c0e5c53b188'),(50,'GTBHSS-MUR','Hospital','Govt. TB Hospital Samli Sanatorium','Samli Sanatorium',NULL,NULL,'Murree','Punjab','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-06 16:34:47',1,NULL,NULL,NULL,NULL,'6ef4c08e-5ee0-4737-aeb7-d53a2a4f3700'),(51,'HFH-RWP','Hospital','Holy Family Hospital, Rawalpindi','Satellite Town',NULL,NULL,'Rawalpindi','Punjab','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-06 16:37:46',1,NULL,NULL,NULL,NULL,'c643bca4-3fd4-476a-8801-39a988534b9b'),(52,'DHH-SLK','Hospital','District Headquarter Hospital',NULL,NULL,NULL,'Sialkot','Punjab','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-06 16:39:31',1,NULL,NULL,NULL,NULL,'6e4879ca-375c-4cb9-bcc1-8080a48ff7ac'),(53,'MH-LHR','Hospital','Mayo Hospital, Lahore','Hospital Road',NULL,NULL,'Lahore','Punjab','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-06 17:34:21',1,NULL,NULL,NULL,NULL,'de963736-9e8a-4a34-97f9-79cdacfa7677'),(54,'JH-LHR','Hospital','Jinnah Hospital, Lahore','Hospital Road',NULL,NULL,'Lahore','Punjab','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-06 17:36:32',1,NULL,NULL,NULL,NULL,'bcff705e-2119-4b95-b7bc-b60a92c47c45'),(55,'AH-FSB','Hospital','Allied Hospital, Faisalabad','Jail road',NULL,NULL,'Faisalabad','Punjab','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-06 17:40:47',1,NULL,NULL,NULL,NULL,'4f40109d-3129-4f86-b283-02a6abaf441d'),(56,'NH-MUL','Hospital','Nishter Hospital, Multan','Nishtar Road',NULL,NULL,'Multan','Punjab','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-06 17:45:40',1,NULL,NULL,NULL,NULL,'122d151d-3fb1-4d2b-9bd0-ceda616880f8'),(57,'BVH-BWP','Hospital','Bhawalpur Victoria Hospital','Circular Road',NULL,NULL,'Bahawalpur','Punjab','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-06 17:47:36',1,NULL,NULL,NULL,NULL,'10fab16a-ea66-4f3c-840a-5a6644e0300c'),(58,'SZH-RYK','Hospital','Sheikh Zayed Hospital, Rahimyar Khan','Sheikh Zayed Medical College/Hospital',NULL,NULL,'Rahimyar Khan','Punjab','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-06 17:50:44',1,NULL,NULL,NULL,NULL,'21af21f4-903c-4d69-9711-b3f24a92c23f'),(59,'DHH-KZD','Hospital','District Headquarter Hospital, Khuzdar',NULL,NULL,NULL,'Khuzdar','Balochistan','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-06 17:55:22',1,NULL,NULL,NULL,NULL,'4229393b-eb7d-454f-8db5-559aa31d7b85'),(60,'DHH-TRB','Hospital','District Headquarter Hospital, Turbat',NULL,NULL,NULL,'Turbat','Balochistan','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-06 17:57:51',1,NULL,NULL,NULL,NULL,'e8e1d4cd-ec9b-4edb-9329-9b9a42db121e'),(61,'LRBKNG-KHI','Hospital','Layton Rehmatullah Benevolent Trust Eye Hospital Korangi','37-C, Sunset Lane 4','24th Commercial Street',NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-15 11:42:23',1,NULL,NULL,NULL,NULL,'1e72a4d8-99ec-4c09-8550-51e101d45fd9'),(62,'IHNK-KHI','Hospital','Indus Hospital New Karachi','New Karachi',NULL,NULL,'Karachi','Sindh','Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2017-03-10 11:18:21',1,NULL,NULL,NULL,NULL,'43307598-a468-49d0-bca4-d8a23074fc7d'),(63,'OTHER','Hospital','Other unlisted location',NULL,NULL,NULL,NULL,NULL,'Pakistan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-24 11:28:34',1,NULL,NULL,NULL,NULL,'0e749083-ce8e-4cbe-be6a-c082d0fc5015'),(64,'I23','Block',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-06 15:28:20',10,2,NULL,NULL,NULL,'5271747d-7e29-4188-9bdc-04288b411414'),(65,'I67','Block',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-06 15:57:18',10,2,NULL,NULL,NULL,'56506e62-6a6a-4343-8b7f-b68ac97c71d1'),(66,'I34','Block',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-06 16:01:22',10,2,NULL,NULL,NULL,'87c1329c-8164-432a-95ee-fefedfd43583'),(67,'I','Block',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-06 16:28:32',10,2,NULL,NULL,NULL,'34fe9dba-e2d5-450f-b886-8e2216995ac0'),(68,'I89','Block',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-06 16:34:01',10,2,NULL,NULL,NULL,'dbc3879e-b747-4872-9a54-43b37c7b1297'),(69,'I88','Block',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-06 16:40:31',10,2,NULL,NULL,NULL,'e818face-a4b2-4d82-adbf-cf31a6a17d65'),(72,'I80','Block',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-06 16:43:30',10,2,NULL,NULL,NULL,'d1bc60de-f98b-49c0-96e7-29d09a0aaa7a'),(73,'22','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,72,'2018-02-06 20:40:15',10,2,NULL,NULL,NULL,'7af276f3-3ea3-43ab-9420-79af9f76a25d'),(74,'I80-55','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,72,'2018-02-06 20:47:29',10,2,NULL,NULL,NULL,'ce91476a-b7ce-41d1-9fa7-0eedd5f83247'),(75,'I88-12','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 20:55:07',10,2,NULL,NULL,NULL,'7de1b1e8-8d04-4c70-81fd-35e03a7d6e16'),(76,'I88-14','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 21:05:36',10,2,NULL,NULL,NULL,'161d5a29-c667-4740-a21e-88cf96031b12'),(77,'I88-092','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 21:22:30',10,2,NULL,NULL,NULL,'7444f806-7755-46f5-a9a6-25e2913e78df'),(78,'I88-098','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 21:26:20',10,2,NULL,NULL,NULL,'4e4ee99b-4342-4f99-b5c7-aa14500b2637'),(79,'I88-097','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 21:27:25',10,2,NULL,NULL,NULL,'5b7897e8-a152-4949-a502-9f34fd4ef16a'),(80,'I88-147','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 21:38:16',10,2,NULL,NULL,NULL,'980df709-91cc-403f-bb6b-6f34e47fd060'),(81,'I88-147-147-01','Dwelling',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80,'2018-02-06 21:38:16',10,2,NULL,NULL,NULL,'2c4d6821-70c9-4999-9bbb-e132ab8cef83'),(82,'I88-147-147-02','Dwelling',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,80,'2018-02-06 21:38:16',10,2,NULL,NULL,NULL,'92e089d0-6d45-447b-9ffe-94ce7d97a497'),(83,'I88-258','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 21:49:33',10,2,NULL,NULL,NULL,'505e2da6-c7a3-4a12-9f4f-0f00024bd4d1'),(84,'I88-21','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 21:50:36',10,2,NULL,NULL,NULL,'ab4f7689-1296-4e54-a675-4a9ddffdaa2d'),(85,'I88-11','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 21:54:25',10,2,NULL,NULL,NULL,'2bbabec6-83e0-475d-bffb-ddf75d6b03eb'),(86,'I88-11-01','Dwelling',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,85,'2018-02-06 21:54:26',10,2,NULL,NULL,NULL,'f47b4a8a-28c5-4467-9f81-706a63fa5141'),(87,'I88-11-01-01','Household',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,86,'2018-02-06 21:54:26',10,2,NULL,NULL,NULL,'b9ed6a77-8371-4b9c-81ab-902949525f91'),(89,'I88-74','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 22:00:48',10,2,NULL,NULL,NULL,'5367a26f-00aa-4281-82d3-079b61f3bb27'),(90,'I88-74-01','Dwelling',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,89,'2018-02-06 22:00:48',10,2,NULL,NULL,NULL,'dd06e99c-f5d2-48a9-8ecc-5778c727c10c'),(91,'I88-74-01-01','Household',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90,'2018-02-06 22:00:48',10,2,NULL,NULL,NULL,'4cafd5bb-61a7-405d-b8e1-c80206d30cef'),(92,'I88-74-02','Dwelling',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,89,'2018-02-06 22:00:48',10,2,NULL,NULL,NULL,'bcedb1a0-1bbc-42f1-818d-f37571f9eef3'),(93,'I88-74-02-01','Household',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,92,'2018-02-06 22:00:48',10,2,NULL,NULL,NULL,'3bc06828-869b-4295-b080-bb3f882e4139'),(94,'I88-215','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 22:06:44',10,2,NULL,NULL,NULL,'d72512fa-4e1d-4463-9c3e-08e2868ab325'),(95,'I88-215-01','Dwelling',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,94,'2018-02-06 22:06:44',10,2,NULL,NULL,NULL,'094ad6ca-b519-46cf-96e6-ec8807b884a6'),(96,'I88-215-01-01','Household',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,95,'2018-02-06 22:06:44',10,2,NULL,NULL,NULL,'34aaeb57-0d62-4bad-bbf5-6486e2b53c2c'),(98,'I88-805','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 22:38:48',10,2,NULL,NULL,NULL,'9152bd01-59e7-460d-b8de-3f707fecb5e7'),(99,'I88-805-01','Dwelling',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,98,'2018-02-06 22:38:48',10,2,NULL,NULL,NULL,'799c9849-66c3-4756-97a3-3227e52bf5e6'),(100,'I88-805-01-01','Household',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,99,'2018-02-06 22:38:48',10,2,NULL,NULL,NULL,'6375fa68-4cb9-4ff0-b441-eb328edef6b8'),(101,'I88-805-02','Dwelling',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,98,'2018-02-06 22:38:48',10,2,NULL,NULL,NULL,'18ebfd89-6e8d-44d7-9012-bcc00462692d'),(102,'I88-805-02-01','Household',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,101,'2018-02-06 22:38:48',10,2,NULL,NULL,NULL,'514105b9-173d-4b7c-9932-c1824a6f1884'),(103,'I88-222','Building',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,69,'2018-02-06 22:47:22',10,2,NULL,NULL,NULL,'87d74e65-09d6-463c-a8a4-47d4078dd91e'),(104,'I88-222-01','Dwelling',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,103,'2018-02-06 22:47:22',10,2,NULL,NULL,NULL,'fff8454a-62e9-45e8-a2c0-07640f768da2'),(105,'I88-222-01-01','Household',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,104,'2018-02-06 22:47:22',10,2,NULL,NULL,NULL,'79993d47-bc50-4f5c-8dd7-09d31b33660b');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_attribute`
--

DROP TABLE IF EXISTS `location_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attribute` (
  `location_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_type_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `attribute_value` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`location_attribute_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_location_attribute_location_attribute_type1_idx` (`attribute_type_id`),
  KEY `fk_location_attribute_location1_idx` (`location_id`),
  KEY `fk_location_attribute_users1_idx` (`created_by`),
  KEY `fk_location_attribute_users2_idx` (`changed_by`),
  KEY `fk_location_attribute_location2_idx` (`created_at`),
  KEY `fk_location_attribute_location3_idx` (`changed_at`),
  CONSTRAINT `fk_location_attribute_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_location_attribute_location2` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_location_attribute_location3` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_location_attribute_location_attribute_type1` FOREIGN KEY (`attribute_type_id`) REFERENCES `location_attribute_type` (`location_attribute_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_location_attribute_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_location_attribute_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_attribute`
--

LOCK TABLES `location_attribute` WRITE;
/*!40000 ALTER TABLE `location_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_attribute_type`
--

DROP TABLE IF EXISTS `location_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attribute_type` (
  `location_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(255) NOT NULL,
  `validation_regex` varchar(255) DEFAULT NULL,
  `required` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `data_type` varchar(10) NOT NULL,
  PRIMARY KEY (`location_attribute_type_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  UNIQUE KEY `attribute_name_UNIQUE` (`attribute_name`),
  KEY `fk_location_attribute_type_users1_idx` (`created_by`),
  KEY `fk_location_attribute_type_users2_idx` (`changed_by`),
  KEY `fk_location_attribute_type_location1_idx` (`created_at`),
  KEY `fk_location_attribute_type_location2_idx` (`changed_at`),
  CONSTRAINT `fk_location_attribute_type_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_location_attribute_type_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_location_attribute_type_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_location_attribute_type_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_attribute_type`
--

LOCK TABLES `location_attribute_type` WRITE;
/*!40000 ALTER TABLE `location_attribute_type` DISABLE KEYS */;
INSERT INTO `location_attribute_type` VALUES (1,'Opening Time','regex=[0-2][0-9]:[0-5][0-9]','\0','Time of location opening in 23H clock','2015-12-15 12:26:51',1,NULL,NULL,NULL,NULL,'40cb2cab-a2fd-11e5-9028-28d24461cf90',''),(2,'Closing Time','regex=[0-2][0-9]:[0-5][0-9]','\0','Time of location closure in 23H clock','2015-12-15 12:27:07',1,NULL,NULL,NULL,NULL,'4a16d27e-a2fd-11e5-9028-28d24461cf90',''),(3,'AIC Location','regex=true|false','\0','Airborne Infection Control','2017-05-03 10:43:25',1,3,NULL,NULL,NULL,'c6e086a4-1086-436e-8204-a09dcacda943',''),(4,'Total Number of Building Block',NULL,'\0','Block level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'5d965d5e-0b29-11e8-ba89-0ed5f89f718b','String'),(5,'Number of empty plots',NULL,'\0','Block level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'2b70f262-0b2e-11e8-ba89-0ed5f89f718b','String'),(6,'Number of School',NULL,'\0','Block level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'2b70f618-0b2e-11e8-ba89-0ed5f89f718b','String'),(7,'Number of Commercial',NULL,'\0','Block level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'2b70fba4-0b2e-11e8-ba89-0ed5f89f718b','String'),(8,'Number of Other Not Applicable Buildings',NULL,'\0','Block level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'2b70fa50-0b2e-11e8-ba89-0ed5f89f718b','String'),(9,'Total Number of Building Not Applicable',NULL,'\0','Block level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'2b71002c-0b2e-11e8-ba89-0ed5f89f718b','String'),(10,'Number of Building refused access',NULL,'\0','Block level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'2b710180-0b2e-11e8-ba89-0ed5f89f718b','String'),(11,'Total Number of Building accessed',NULL,'\0','Block level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'2b7102a2-0b2e-11e8-ba89-0ed5f89f718b','String'),(12,'Total Number of Dwellings',NULL,'\0','Building level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'55a21ce0-0b52-11e8-ba89-0ed5f89f718b','String'),(13,'Total Number of Households',NULL,'\0','Building level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'55a2219a-0b52-11e8-ba89-0ed5f89f718b','String'),(14,'Dwelling Refused',NULL,'\0','Dwelling level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'29fb4388-0b5b-11e8-ba89-0ed5f89f718b','String'),(15,'Total Number of Males',NULL,'\0','Household level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'99c9de40-0b60-11e8-ba89-0ed5f89f718b','String'),(16,'Total Number of Females',NULL,'\0','Household level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'99c9e0c0-0b60-11e8-ba89-0ed5f89f718b','String'),(17,'Number of Males greater than 15',NULL,'\0','Household level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'eab40b50-0b60-11e8-ba89-0ed5f89f718b','String'),(18,'Number of Females greater than 15',NULL,'\0','Household level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'eab40e8e-0b60-11e8-ba89-0ed5f89f718b','String'),(19,'Number of Males between 2 and 4',NULL,'\0','Household level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'373e17ea-0b61-11e8-ba89-0ed5f89f718b','String'),(20,'Number of Females between 2 and 4',NULL,'\0','Household level info','2018-02-06 10:43:25',1,NULL,NULL,NULL,NULL,'373e1b5a-0b61-11e8-ba89-0ed5f89f718b','String');
/*!40000 ALTER TABLE `location_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `person_id` int(11) NOT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  `external_id1` varchar(20) DEFAULT NULL,
  `external_id2` varchar(20) DEFAULT NULL,
  `blood_group` char(5) DEFAULT NULL,
  `weight` decimal(10,5) DEFAULT NULL,
  `weight_unit` char(5) DEFAULT NULL,
  `height` decimal(10,5) DEFAULT NULL,
  `height_unit` char(5) DEFAULT NULL,
  `date_closed` datetime DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `reason_closed` varchar(255) DEFAULT NULL,
  `died` bit(1) DEFAULT NULL,
  `date_died` datetime DEFAULT NULL,
  `death_cause` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  UNIQUE KEY `patient_id_UNIQUE` (`patient_id`),
  KEY `fk_patient_users1_idx` (`closed_by`),
  KEY `fk_patient_users2_idx` (`created_by`),
  KEY `fk_patient_users3_idx` (`changed_by`),
  KEY `fk_patient_location1_idx` (`created_at`),
  KEY `fk_patient_location2_idx` (`changed_at`),
  CONSTRAINT `fk_patient_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_patient_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_patient_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_patient_users1` FOREIGN KEY (`closed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_patient_users2` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_patient_users3` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(5) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `family_name` varchar(45) DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `dob` datetime DEFAULT NULL,
  `dob_estimated` bit(1) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_person_users1_idx` (`created_by`),
  KEY `fk_person_users2_idx` (`changed_by`),
  KEY `fk_person_location1_idx` (`created_at`),
  KEY `fk_person_location2_idx` (`changed_at`),
  CONSTRAINT `fk_person_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Mr.','Owais','Ahmed','Hussain','Shaikh','M','1984-05-26 00:00:00','\0','2015-12-16 09:18:04',1,1,NULL,NULL,NULL,'0fed899d-a3ac-11e5-9028-28d24461cf90'),(2,'Mr.','Draco',NULL,'Malfoy',NULL,'M','1980-06-06 00:00:00','\0','2015-12-16 09:18:04',1,1,NULL,NULL,NULL,'0fefc960-a3ac-11e5-9028-28d24461cf90'),(3,'Lord','Tom','Marvolo','Riddle','Voldemort','M','1926-12-16 00:00:00','','2015-12-16 09:18:04',1,1,NULL,NULL,NULL,'0ff19950-a3ac-11e5-9028-28d24461cf90'),(4,'Prof.','Albus',NULL,'Dumbledore',NULL,'M','1881-12-16 00:00:00','','2015-12-16 09:18:04',1,1,NULL,NULL,NULL,'0ff35a9a-a3ac-11e5-9028-28d24461cf90'),(5,'Prof.','Minerva',NULL,'McGonagall',NULL,'F','1935-12-16 00:00:00','','2015-12-16 09:18:04',1,1,NULL,NULL,NULL,'0ff50acd-a3ac-11e5-9028-28d24461cf90'),(6,'Ms.','Ginevra','Molly','Potter','Weasley','F','1981-08-11 00:00:00','\0','2015-12-16 09:18:04',1,1,NULL,NULL,NULL,'0ff6d25f-a3ac-11e5-9028-28d24461cf90');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_attribute`
--

DROP TABLE IF EXISTS `person_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute` (
  `person_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_type_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `attribute_value` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `person_attribute_type_id` int(11) NOT NULL,
  PRIMARY KEY (`person_attribute_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_person_attribute_users1_idx` (`created_by`),
  KEY `fk_person_attribute_users2_idx` (`changed_by`),
  KEY `fk_person_attribute_location1_idx` (`created_at`),
  KEY `fk_person_attribute_location2_idx` (`changed_at`),
  KEY `fk_person_attribute_person_attribute_type1_idx` (`attribute_type_id`),
  KEY `fk_person_attribute_person1_idx` (`person_id`),
  KEY `FKD555DA329A171DCE` (`person_attribute_type_id`),
  CONSTRAINT `FKD555DA329A171DCE` FOREIGN KEY (`person_attribute_type_id`) REFERENCES `person_attribute_type` (`person_attribute_type_id`),
  CONSTRAINT `fk_person_attribute_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_attribute_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_attribute_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_attribute_person_attribute_type1` FOREIGN KEY (`attribute_type_id`) REFERENCES `person_attribute_type` (`person_attribute_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_attribute_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_attribute_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_attribute`
--

LOCK TABLES `person_attribute` WRITE;
/*!40000 ALTER TABLE `person_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_attribute_type`
--

DROP TABLE IF EXISTS `person_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute_type` (
  `person_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(45) NOT NULL,
  `data_type` varchar(10) DEFAULT NULL,
  `validation_regex` varchar(255) DEFAULT NULL,
  `required` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`person_attribute_type_id`),
  UNIQUE KEY `attribute_name_UNIQUE` (`attribute_name`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_person_attribute_type_users1_idx` (`created_by`),
  KEY `fk_person_attribute_type_users2_idx` (`changed_by`),
  KEY `fk_person_attribute_type_location1_idx` (`created_at`),
  KEY `fk_person_attribute_type_location2_idx` (`changed_at`),
  CONSTRAINT `fk_person_attribute_type_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_attribute_type_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_attribute_type_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_attribute_type_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_attribute_type`
--

LOCK TABLES `person_attribute_type` WRITE;
/*!40000 ALTER TABLE `person_attribute_type` DISABLE KEYS */;
INSERT INTO `person_attribute_type` VALUES (1,'Ethnicity','String','definition.definition','\0','Ethnical background of person','2015-12-16 08:55:42',1,1,NULL,NULL,NULL,'effd81e4-a3a8-11e5-9028-28d24461cf90'),(2,'Religion','String','definition.definition','\0','Religion','2015-12-16 08:55:42',1,1,NULL,NULL,NULL,'efff8a07-a3a8-11e5-9028-28d24461cf90'),(3,'Place of Birth','String',NULL,'\0','City/Country of birth','2015-12-16 08:55:42',1,1,NULL,NULL,NULL,'f0014f86-a3a8-11e5-9028-28d24461cf90'),(4,'Nationality','String','definition.definition','','Nationality of person','2015-12-16 08:55:42',1,1,NULL,NULL,NULL,'f002e201-a3a8-11e5-9028-28d24461cf90'),(5,'National ID','String','regex=[0-9]*','\0','National ID number without special characters','2015-12-16 08:55:42',1,1,NULL,NULL,NULL,'f00477a8-a3a8-11e5-9028-28d24461cf90'),(6,'Mother Name','String',NULL,'\0','Complete name of mother','2015-12-16 08:55:42',1,1,NULL,NULL,NULL,'f0067440-a3a8-11e5-9028-28d24461cf90'),(7,'Father Name','String',NULL,'','Complete name of father','2015-12-16 08:55:42',1,1,NULL,NULL,NULL,'f0089952-a3a8-11e5-9028-28d24461cf90');
/*!40000 ALTER TABLE `person_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_contact`
--

DROP TABLE IF EXISTS `person_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `address3` varchar(45) DEFAULT NULL,
  `city_village` varchar(45) DEFAULT NULL,
  `state_province` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `landmark1` varchar(45) DEFAULT NULL,
  `landmark2` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `primary_contact` varchar(20) DEFAULT NULL,
  `secondary_contact` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `preferred` bit(1) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_person_contact_person1_idx` (`person_id`),
  KEY `fk_person_contact_users1_idx` (`created_by`),
  KEY `fk_person_contact_users2_idx` (`changed_by`),
  KEY `fk_person_contact_location1_idx` (`created_at`),
  KEY `fk_person_contact_location2_idx` (`changed_at`),
  CONSTRAINT `fk_person_contact_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_contact_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_contact_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_contact_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_person_contact_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_contact`
--

LOCK TABLES `person_contact` WRITE;
/*!40000 ALTER TABLE `person_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `privilege` varchar(45) NOT NULL,
  PRIMARY KEY (`privilege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES ('CREATE DATA_LOG'),('CREATE DEFINITION'),('CREATE DEFINITION_TYPE'),('CREATE ELEMENT'),('CREATE ENCOUNTER'),('CREATE ENCOUNTER_PREREQUISITE'),('CREATE ENCOUNTER_RESULT'),('CREATE ENCOUNTER_TYPE'),('CREATE LOCATION'),('CREATE LOCATION_ATTRIBUTE'),('CREATE LOCATION_ATTRIBUTE_TYPE'),('CREATE PATIENT'),('CREATE PERSON'),('CREATE PERSON_ATTRIBUTE'),('CREATE PERSON_ATTRIBUTE_TYPE'),('CREATE PERSON_CONTACT'),('CREATE PRIVILEGE'),('CREATE ROLE'),('CREATE ROLE_PRIVILEGE'),('CREATE USERS'),('CREATE USER_ATTRIBUTE'),('CREATE USER_ATTRIBUTE_TYPE'),('CREATE USER_FORM'),('CREATE USER_FORM_RESULT'),('CREATE USER_FORM_TYPE'),('CREATE USER_LOCATION'),('CREATE USER_ROLE'),('DELETE DATA_LOG'),('DELETE DEFINITION'),('DELETE DEFINITION_TYPE'),('DELETE ELEMENT'),('DELETE ENCOUNTER'),('DELETE ENCOUNTER_PREREQUISITE'),('DELETE ENCOUNTER_RESULT'),('DELETE ENCOUNTER_TYPE'),('DELETE LOCATION'),('DELETE LOCATION_ATTRIBUTE'),('DELETE LOCATION_ATTRIBUTE_TYPE'),('DELETE PATIENT'),('DELETE PERSON'),('DELETE PERSON_ATTRIBUTE'),('DELETE PERSON_ATTRIBUTE_TYPE'),('DELETE PERSON_CONTACT'),('DELETE PRIVILEGE'),('DELETE ROLE'),('DELETE ROLE_PRIVILEGE'),('DELETE USERS'),('DELETE USER_ATTRIBUTE'),('DELETE USER_ATTRIBUTE_TYPE'),('DELETE USER_FORM'),('DELETE USER_FORM_RESULT'),('DELETE USER_FORM_TYPE'),('DELETE USER_LOCATION'),('DELETE USER_ROLE'),('EDIT DATA_LOG'),('EDIT DEFINITION'),('EDIT DEFINITION_TYPE'),('EDIT ELEMENT'),('EDIT ENCOUNTER'),('EDIT ENCOUNTER_PREREQUISITE'),('EDIT ENCOUNTER_RESULT'),('EDIT ENCOUNTER_TYPE'),('EDIT LOCATION'),('EDIT LOCATION_ATTRIBUTE'),('EDIT LOCATION_ATTRIBUTE_TYPE'),('EDIT PATIENT'),('EDIT PERSON'),('EDIT PERSON_ATTRIBUTE'),('EDIT PERSON_ATTRIBUTE_TYPE'),('EDIT PERSON_CONTACT'),('EDIT PRIVILEGE'),('EDIT ROLE'),('EDIT ROLE_PRIVILEGE'),('EDIT USERS'),('EDIT USER_ATTRIBUTE'),('EDIT USER_ATTRIBUTE_TYPE'),('EDIT USER_FORM'),('EDIT USER_FORM_RESULT'),('EDIT USER_FORM_TYPE'),('EDIT USER_LOCATION'),('EDIT USER_ROLE'),('MANAGE AIC_UVGI_FORMS'),('MANAGE AIC_UVGI_STATUS'),('VIEW DATA_LOG'),('VIEW DEFINITION'),('VIEW DEFINITION_TYPE'),('VIEW ELEMENT'),('VIEW ENCOUNTER'),('VIEW ENCOUNTER_PREREQUISITE'),('VIEW ENCOUNTER_RESULT'),('VIEW ENCOUNTER_TYPE'),('VIEW LOCATION'),('VIEW LOCATION_ATTRIBUTE'),('VIEW LOCATION_ATTRIBUTE_TYPE'),('VIEW PATIENT'),('VIEW PERSON'),('VIEW PERSON_ATTRIBUTE'),('VIEW PERSON_ATTRIBUTE_TYPE'),('VIEW PERSON_CONTACT'),('VIEW PRIVILEGE'),('VIEW ROLE'),('VIEW ROLE_PRIVILEGE'),('VIEW USERS'),('VIEW USER_ATTRIBUTE'),('VIEW USER_ATTRIBUTE_TYPE'),('VIEW USER_FORM'),('VIEW USER_FORM_RESULT'),('VIEW USER_FORM_TYPE'),('VIEW USER_LOCATION'),('VIEW USER_ROLE');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  UNIQUE KEY `role_name_UNIQUE` (`role_name`),
  KEY `fk_role_users1_idx` (`created_by`),
  KEY `fk_role_users2_idx` (`changed_by`),
  KEY `fk_role_location1_idx` (`created_at`),
  KEY `fk_role_location2_idx` (`changed_at`),
  CONSTRAINT `fk_role_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_role_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_role_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_role_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Developer','2015-12-10 12:52:44',1,NULL,NULL,NULL,NULL,'3e221e76-e671-445e-995f-99103b1dee33'),(2,'Implementer','2015-12-10 12:52:46',1,NULL,NULL,NULL,NULL,'b3a6812b-af64-4151-be0e-9a36bd500351'),(3,'Auditor','2015-12-10 12:52:47',1,NULL,NULL,NULL,NULL,'179f6358-c992-4eff-92a0-ab796d27b6fc'),(4,'Guest','2015-12-10 12:52:48',1,NULL,NULL,NULL,NULL,'b4df347a-4cd7-4d84-9d51-f0417ffd803a'),(5,'Site Supervisor','2016-09-30 16:02:11',1,NULL,NULL,NULL,NULL,'a7e88158-1f6c-43f7-8379-9239f7e7b341'),(6,'Senior Site Manager','2016-09-30 16:09:25',1,NULL,NULL,NULL,NULL,'cb1db578-1a0c-41a3-9461-2117238f73a8'),(7,'AIC Program Manager','2016-09-30 16:11:21',1,NULL,NULL,NULL,NULL,'ee02473e-ca5d-466d-9bcd-2e7fc17b2587'),(8,'FAST Program Manager ','2016-09-30 16:12:01',1,NULL,NULL,NULL,NULL,'2eb898d2-7745-44a2-93a5-159974621b85');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_privilege`
--

DROP TABLE IF EXISTS `role_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_privilege` (
  `role_id` int(11) NOT NULL,
  `privilege` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`role_id`,`privilege`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_role_privilege_users1_idx` (`created_by`),
  KEY `fk_role_privilege_location1_idx` (`created_at`),
  KEY `fk_role_privilege_privilege_idx` (`privilege`),
  CONSTRAINT `fk_role_privilege_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_role_privilege_privilege` FOREIGN KEY (`privilege`) REFERENCES `privilege` (`privilege`) ON UPDATE CASCADE,
  CONSTRAINT `fk_role_privilege_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_role_privilege_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_privilege`
--

LOCK TABLES `role_privilege` WRITE;
/*!40000 ALTER TABLE `role_privilege` DISABLE KEYS */;
INSERT INTO `role_privilege` VALUES (1,'CREATE DATA_LOG','2015-12-17 08:54:49',1,NULL,'65bb25ed-2a5b-4711-806f-448a7d992878'),(1,'CREATE DEFINITION','2015-12-16 14:58:15',1,NULL,'98d19459-a3db-11e5-9028-28d24461cf90'),(1,'CREATE DEFINITION_TYPE','2015-12-16 14:58:15',1,NULL,'98d1954d-a3db-11e5-9028-28d24461cf90'),(1,'CREATE ELEMENT','2015-12-16 14:58:15',1,NULL,'98d1966b-a3db-11e5-9028-28d24461cf90'),(1,'CREATE ENCOUNTER','2015-12-16 14:58:15',1,NULL,'98d19716-a3db-11e5-9028-28d24461cf90'),(1,'CREATE ENCOUNTER_PREREQUISITE','2015-12-16 14:58:15',1,NULL,'98d197d3-a3db-11e5-9028-28d24461cf90'),(1,'CREATE ENCOUNTER_RESULT','2015-12-16 14:58:15',1,NULL,'98d2bd62-a3db-11e5-9028-28d24461cf90'),(1,'CREATE ENCOUNTER_TYPE','2015-12-16 14:58:15',1,NULL,'98d2beec-a3db-11e5-9028-28d24461cf90'),(1,'CREATE LOCATION','2015-12-16 14:58:15',1,NULL,'98d2bf8e-a3db-11e5-9028-28d24461cf90'),(1,'CREATE LOCATION_ATTRIBUTE','2015-12-16 14:58:15',1,NULL,'98d2c013-a3db-11e5-9028-28d24461cf90'),(1,'CREATE LOCATION_ATTRIBUTE_TYPE','2015-12-16 14:58:15',1,NULL,'98d2c093-a3db-11e5-9028-28d24461cf90'),(1,'CREATE PATIENT','2015-12-16 14:58:15',1,NULL,'98d2c11c-a3db-11e5-9028-28d24461cf90'),(1,'CREATE PERSON','2015-12-16 14:58:15',1,NULL,'98d2c1a1-a3db-11e5-9028-28d24461cf90'),(1,'CREATE PERSON_ATTRIBUTE','2015-12-16 14:58:15',1,NULL,'98d2c221-a3db-11e5-9028-28d24461cf90'),(1,'CREATE PERSON_ATTRIBUTE_TYPE','2015-12-16 14:58:15',1,NULL,'98d2c2a1-a3db-11e5-9028-28d24461cf90'),(1,'CREATE PERSON_CONTACT','2015-12-16 14:58:15',1,NULL,'98d2c326-a3db-11e5-9028-28d24461cf90'),(1,'CREATE PRIVILEGE','2015-12-16 14:58:15',1,NULL,'98d2c3af-a3db-11e5-9028-28d24461cf90'),(1,'CREATE ROLE','2015-12-16 14:58:15',1,NULL,'98d2c42b-a3db-11e5-9028-28d24461cf90'),(1,'CREATE ROLE_PRIVILEGE','2015-12-16 14:58:15',1,NULL,'98d2c4a7-a3db-11e5-9028-28d24461cf90'),(1,'CREATE USERS','2015-12-16 14:58:15',1,NULL,'98d2c523-a3db-11e5-9028-28d24461cf90'),(1,'CREATE USER_LOCATION','2015-12-16 14:58:15',1,NULL,'98d2c5a3-a3db-11e5-9028-28d24461cf90'),(1,'CREATE USER_ROLE','2015-12-16 14:58:15',1,NULL,'98d2c61f-a3db-11e5-9028-28d24461cf90'),(1,'DELETE DATA_LOG','2015-12-16 14:58:15',1,NULL,'98d2c69b-a3db-11e5-9028-28d24461cf90'),(1,'DELETE DEFINITION','2015-12-16 14:58:15',1,NULL,'98d2c70f-a3db-11e5-9028-28d24461cf90'),(1,'DELETE DEFINITION_TYPE','2015-12-16 14:58:15',1,NULL,'98d2c793-a3db-11e5-9028-28d24461cf90'),(1,'DELETE ELEMENT','2015-12-16 14:58:15',1,NULL,'98d2c82d-a3db-11e5-9028-28d24461cf90'),(1,'DELETE ENCOUNTER','2015-12-16 14:58:15',1,NULL,'98d2c8a5-a3db-11e5-9028-28d24461cf90'),(1,'DELETE ENCOUNTER_PREREQUISITE','2015-12-16 14:58:15',1,NULL,'98d2c925-a3db-11e5-9028-28d24461cf90'),(1,'DELETE ENCOUNTER_RESULT','2015-12-16 14:58:15',1,NULL,'98d2c9d0-a3db-11e5-9028-28d24461cf90'),(1,'DELETE ENCOUNTER_TYPE','2015-12-16 14:58:15',1,NULL,'98d2ca55-a3db-11e5-9028-28d24461cf90'),(1,'DELETE LOCATION','2015-12-16 14:58:15',1,NULL,'98d2cad1-a3db-11e5-9028-28d24461cf90'),(1,'DELETE LOCATION_ATTRIBUTE','2015-12-16 14:58:15',1,NULL,'98d2cb48-a3db-11e5-9028-28d24461cf90'),(1,'DELETE LOCATION_ATTRIBUTE_TYPE','2015-12-16 14:58:15',1,NULL,'98d2cbc9-a3db-11e5-9028-28d24461cf90'),(1,'DELETE PATIENT','2015-12-16 14:58:15',1,NULL,'98d2cc45-a3db-11e5-9028-28d24461cf90'),(1,'DELETE PERSON','2015-12-16 14:58:15',1,NULL,'98d2ccc1-a3db-11e5-9028-28d24461cf90'),(1,'DELETE PERSON_ATTRIBUTE','2015-12-16 14:58:15',1,NULL,'98d2cd3d-a3db-11e5-9028-28d24461cf90'),(1,'DELETE PERSON_ATTRIBUTE_TYPE','2015-12-16 14:58:15',1,NULL,'98d2cdc1-a3db-11e5-9028-28d24461cf90'),(1,'DELETE PERSON_CONTACT','2015-12-16 14:58:15',1,NULL,'98d2ce42-a3db-11e5-9028-28d24461cf90'),(1,'DELETE PRIVILEGE','2015-12-16 14:58:15',1,NULL,'98d2cebe-a3db-11e5-9028-28d24461cf90'),(1,'DELETE ROLE','2015-12-16 14:58:15',1,NULL,'98d2cf3a-a3db-11e5-9028-28d24461cf90'),(1,'DELETE ROLE_PRIVILEGE','2015-12-16 14:58:15',1,NULL,'98d2cfba-a3db-11e5-9028-28d24461cf90'),(1,'DELETE USERS','2015-12-16 14:58:15',1,NULL,'98d2d036-a3db-11e5-9028-28d24461cf90'),(1,'DELETE USER_LOCATION','2015-12-16 14:58:15',1,NULL,'98d2d0ae-a3db-11e5-9028-28d24461cf90'),(1,'DELETE USER_ROLE','2015-12-16 14:58:15',1,NULL,'98d2d126-a3db-11e5-9028-28d24461cf90'),(1,'EDIT DATA_LOG','2015-12-16 14:58:15',1,NULL,'98d2d1a2-a3db-11e5-9028-28d24461cf90'),(1,'EDIT DEFINITION','2015-12-16 14:58:15',1,NULL,'98d2d219-a3db-11e5-9028-28d24461cf90'),(1,'EDIT DEFINITION_TYPE','2015-12-16 14:58:15',1,NULL,'98d2d291-a3db-11e5-9028-28d24461cf90'),(1,'EDIT ELEMENT','2015-12-16 14:58:15',1,NULL,'98d2d30d-a3db-11e5-9028-28d24461cf90'),(1,'EDIT ENCOUNTER','2015-12-16 14:58:15',1,NULL,'98d2d389-a3db-11e5-9028-28d24461cf90'),(1,'EDIT ENCOUNTER_PREREQUISITE','2015-12-16 14:58:15',1,NULL,'98d2d401-a3db-11e5-9028-28d24461cf90'),(1,'EDIT ENCOUNTER_RESULT','2015-12-16 14:58:15',1,NULL,'98d2d47d-a3db-11e5-9028-28d24461cf90'),(1,'EDIT ENCOUNTER_TYPE','2015-12-16 14:58:15',1,NULL,'98d2d4f9-a3db-11e5-9028-28d24461cf90'),(1,'EDIT LOCATION','2015-12-16 14:58:15',1,NULL,'98d2d575-a3db-11e5-9028-28d24461cf90'),(1,'EDIT LOCATION_ATTRIBUTE','2015-12-16 14:58:15',1,NULL,'98d2d5ed-a3db-11e5-9028-28d24461cf90'),(1,'EDIT LOCATION_ATTRIBUTE_TYPE','2015-12-16 14:58:15',1,NULL,'98d2d669-a3db-11e5-9028-28d24461cf90'),(1,'EDIT PATIENT','2015-12-16 14:58:15',1,NULL,'98d2d6e5-a3db-11e5-9028-28d24461cf90'),(1,'EDIT PERSON','2015-12-16 14:58:15',1,NULL,'98d2d761-a3db-11e5-9028-28d24461cf90'),(1,'EDIT PERSON_ATTRIBUTE','2015-12-16 14:58:15',1,NULL,'98d2d7d8-a3db-11e5-9028-28d24461cf90'),(1,'EDIT PERSON_ATTRIBUTE_TYPE','2015-12-16 14:58:15',1,NULL,'98d2d854-a3db-11e5-9028-28d24461cf90'),(1,'EDIT PERSON_CONTACT','2015-12-16 14:58:15',1,NULL,'98d2d8d0-a3db-11e5-9028-28d24461cf90'),(1,'EDIT PRIVILEGE','2015-12-16 14:58:15',1,NULL,'98d2d94d-a3db-11e5-9028-28d24461cf90'),(1,'EDIT ROLE','2015-12-16 14:58:15',1,NULL,'98d2d9e2-a3db-11e5-9028-28d24461cf90'),(1,'EDIT ROLE_PRIVILEGE','2015-12-16 14:58:15',1,NULL,'98d2da67-a3db-11e5-9028-28d24461cf90'),(1,'EDIT USERS','2015-12-16 14:58:15',1,NULL,'98d2dae3-a3db-11e5-9028-28d24461cf90'),(1,'EDIT USER_LOCATION','2015-12-16 14:58:15',1,NULL,'98d2db5f-a3db-11e5-9028-28d24461cf90'),(1,'EDIT USER_ROLE','2015-12-16 14:58:15',1,NULL,'98d2dbdb-a3db-11e5-9028-28d24461cf90'),(1,'MANAGE AIC_UVGI_FORMS','2015-12-16 14:58:37',1,NULL,'4c5ff96a-01c8-4917-9918-1b4178360b28'),(1,'VIEW DATA_LOG','2015-12-16 14:58:15',1,NULL,'98d2dc53-a3db-11e5-9028-28d24461cf90'),(1,'VIEW DEFINITION','2015-12-16 14:58:15',1,NULL,'98d2dce8-a3db-11e5-9028-28d24461cf90'),(1,'VIEW DEFINITION_TYPE','2015-12-16 14:58:15',1,NULL,'98d2dd69-a3db-11e5-9028-28d24461cf90'),(1,'VIEW ELEMENT','2015-12-16 14:58:15',1,NULL,'98d2dde0-a3db-11e5-9028-28d24461cf90'),(1,'VIEW ENCOUNTER','2015-12-16 14:58:15',1,NULL,'98d2de58-a3db-11e5-9028-28d24461cf90'),(1,'VIEW ENCOUNTER_PREREQUISITE','2015-12-16 14:58:15',1,NULL,'98d2ded0-a3db-11e5-9028-28d24461cf90'),(1,'VIEW ENCOUNTER_RESULT','2015-12-16 14:58:15',1,NULL,'98d2df48-a3db-11e5-9028-28d24461cf90'),(1,'VIEW ENCOUNTER_TYPE','2015-12-16 14:58:15',1,NULL,'98d2dfc4-a3db-11e5-9028-28d24461cf90'),(1,'VIEW LOCATION','2015-12-16 14:58:15',1,NULL,'98d2e040-a3db-11e5-9028-28d24461cf90'),(1,'VIEW LOCATION_ATTRIBUTE','2015-12-16 14:58:15',1,NULL,'98d2e0b3-a3db-11e5-9028-28d24461cf90'),(1,'VIEW LOCATION_ATTRIBUTE_TYPE','2015-12-16 14:58:15',1,NULL,'98d2e138-a3db-11e5-9028-28d24461cf90'),(1,'VIEW PATIENT','2015-12-16 14:58:15',1,NULL,'98d2e1b4-a3db-11e5-9028-28d24461cf90'),(1,'VIEW PERSON','2015-12-16 14:58:15',1,NULL,'98d2e22b-a3db-11e5-9028-28d24461cf90'),(1,'VIEW PERSON_ATTRIBUTE','2015-12-16 14:58:15',1,NULL,'98d2e2a3-a3db-11e5-9028-28d24461cf90'),(1,'VIEW PERSON_ATTRIBUTE_TYPE','2015-12-16 14:58:15',1,NULL,'98d2e31b-a3db-11e5-9028-28d24461cf90'),(1,'VIEW PERSON_CONTACT','2015-12-16 14:58:15',1,NULL,'98d2e39f-a3db-11e5-9028-28d24461cf90'),(1,'VIEW PRIVILEGE','2015-12-16 14:58:15',1,NULL,'98d2e41b-a3db-11e5-9028-28d24461cf90'),(1,'VIEW ROLE','2015-12-16 14:58:15',1,NULL,'98d2e48f-a3db-11e5-9028-28d24461cf90'),(1,'VIEW ROLE_PRIVILEGE','2015-12-16 14:58:15',1,NULL,'98d2e507-a3db-11e5-9028-28d24461cf90'),(1,'VIEW USERS','2015-12-16 14:58:15',1,NULL,'98d2e57e-a3db-11e5-9028-28d24461cf90'),(1,'VIEW USER_LOCATION','2015-12-16 14:58:15',1,NULL,'98d2e5fa-a3db-11e5-9028-28d24461cf90'),(1,'VIEW USER_ROLE','2015-12-16 14:58:15',1,NULL,'98d2e676-a3db-11e5-9028-28d24461cf90'),(2,'CREATE DATA_LOG','2015-12-16 14:58:20',1,NULL,'9c2286a7-a3db-11e5-9028-28d24461cf90'),(2,'CREATE DEFINITION','2015-12-16 14:58:20',1,NULL,'9c2288e8-a3db-11e5-9028-28d24461cf90'),(2,'CREATE DEFINITION_TYPE','2015-12-16 14:58:20',1,NULL,'9c22899c-a3db-11e5-9028-28d24461cf90'),(2,'CREATE ELEMENT','2015-12-16 14:58:20',1,NULL,'9c228a3a-a3db-11e5-9028-28d24461cf90'),(2,'CREATE ENCOUNTER','2015-12-16 14:58:20',1,NULL,'9c228ad4-a3db-11e5-9028-28d24461cf90'),(2,'CREATE ENCOUNTER_PREREQUISITE','2015-12-16 14:58:20',1,NULL,'9c228b5d-a3db-11e5-9028-28d24461cf90'),(2,'CREATE ENCOUNTER_RESULT','2015-12-16 14:58:20',1,NULL,'9c228bee-a3db-11e5-9028-28d24461cf90'),(2,'CREATE ENCOUNTER_TYPE','2015-12-16 14:58:20',1,NULL,'9c228c84-a3db-11e5-9028-28d24461cf90'),(2,'CREATE LOCATION','2015-12-16 14:58:20',1,NULL,'9c228d15-a3db-11e5-9028-28d24461cf90'),(2,'CREATE LOCATION_ATTRIBUTE','2015-12-16 14:58:20',1,NULL,'9c228d9a-a3db-11e5-9028-28d24461cf90'),(2,'CREATE LOCATION_ATTRIBUTE_TYPE','2015-12-16 14:58:20',1,NULL,'9c228e23-a3db-11e5-9028-28d24461cf90'),(2,'CREATE PATIENT','2015-12-16 14:58:20',1,NULL,'9c228eb0-a3db-11e5-9028-28d24461cf90'),(2,'CREATE PERSON','2015-12-16 14:58:20',1,NULL,'9c228f39-a3db-11e5-9028-28d24461cf90'),(2,'CREATE PERSON_ATTRIBUTE','2015-12-16 14:58:20',1,NULL,'9c228fbd-a3db-11e5-9028-28d24461cf90'),(2,'CREATE PERSON_ATTRIBUTE_TYPE','2015-12-16 14:58:20',1,NULL,'9c22904f-a3db-11e5-9028-28d24461cf90'),(2,'CREATE PERSON_CONTACT','2015-12-16 14:58:20',1,NULL,'9c2290dc-a3db-11e5-9028-28d24461cf90'),(2,'CREATE PRIVILEGE','2015-12-16 14:58:20',1,NULL,'9c229169-a3db-11e5-9028-28d24461cf90'),(2,'CREATE ROLE','2015-12-16 14:58:20',1,NULL,'9c2291ed-a3db-11e5-9028-28d24461cf90'),(2,'CREATE ROLE_PRIVILEGE','2015-12-16 14:58:20',1,NULL,'9c229276-a3db-11e5-9028-28d24461cf90'),(2,'CREATE USERS','2015-12-16 14:58:20',1,NULL,'9c229303-a3db-11e5-9028-28d24461cf90'),(2,'CREATE USER_LOCATION','2015-12-16 14:58:20',1,NULL,'9c229384-a3db-11e5-9028-28d24461cf90'),(2,'CREATE USER_ROLE','2015-12-16 14:58:20',1,NULL,'9c229408-a3db-11e5-9028-28d24461cf90'),(2,'DELETE DATA_LOG','2015-12-16 14:58:20',1,NULL,'9c22948d-a3db-11e5-9028-28d24461cf90'),(2,'DELETE DEFINITION','2015-12-16 14:58:20',1,NULL,'9c22950d-a3db-11e5-9028-28d24461cf90'),(2,'DELETE DEFINITION_TYPE','2015-12-16 14:58:20',1,NULL,'9c229592-a3db-11e5-9028-28d24461cf90'),(2,'DELETE ELEMENT','2015-12-16 14:58:20',1,NULL,'9c22961b-a3db-11e5-9028-28d24461cf90'),(2,'DELETE ENCOUNTER','2015-12-16 14:58:20',1,NULL,'9c2296a3-a3db-11e5-9028-28d24461cf90'),(2,'DELETE ENCOUNTER_PREREQUISITE','2015-12-16 14:58:20',1,NULL,'9c229728-a3db-11e5-9028-28d24461cf90'),(2,'DELETE ENCOUNTER_RESULT','2015-12-16 14:58:20',1,NULL,'9c2297b1-a3db-11e5-9028-28d24461cf90'),(2,'DELETE ENCOUNTER_TYPE','2015-12-16 14:58:20',1,NULL,'9c229a7b-a3db-11e5-9028-28d24461cf90'),(2,'DELETE LOCATION','2015-12-16 14:58:20',1,NULL,'9c229b7c-a3db-11e5-9028-28d24461cf90'),(2,'DELETE LOCATION_ATTRIBUTE','2015-12-16 14:58:20',1,NULL,'9c229c04-a3db-11e5-9028-28d24461cf90'),(2,'DELETE LOCATION_ATTRIBUTE_TYPE','2015-12-16 14:58:20',1,NULL,'9c229c92-a3db-11e5-9028-28d24461cf90'),(2,'DELETE PATIENT','2015-12-16 14:58:20',1,NULL,'9c229d1f-a3db-11e5-9028-28d24461cf90'),(2,'DELETE PERSON','2015-12-16 14:58:20',1,NULL,'9c229da3-a3db-11e5-9028-28d24461cf90'),(2,'DELETE PERSON_ATTRIBUTE','2015-12-16 14:58:20',1,NULL,'9c229e2c-a3db-11e5-9028-28d24461cf90'),(2,'DELETE PERSON_ATTRIBUTE_TYPE','2015-12-16 14:58:20',1,NULL,'9c229eb5-a3db-11e5-9028-28d24461cf90'),(2,'DELETE PERSON_CONTACT','2015-12-16 14:58:20',1,NULL,'9c229f42-a3db-11e5-9028-28d24461cf90'),(2,'DELETE PRIVILEGE','2015-12-16 14:58:20',1,NULL,'9c229fcb-a3db-11e5-9028-28d24461cf90'),(2,'DELETE ROLE','2015-12-16 14:58:20',1,NULL,'9c22a058-a3db-11e5-9028-28d24461cf90'),(2,'DELETE ROLE_PRIVILEGE','2015-12-16 14:58:20',1,NULL,'9c22a0d8-a3db-11e5-9028-28d24461cf90'),(2,'DELETE USERS','2015-12-16 14:58:20',1,NULL,'9c22a165-a3db-11e5-9028-28d24461cf90'),(2,'DELETE USER_LOCATION','2015-12-16 14:58:20',1,NULL,'9c22a304-a3db-11e5-9028-28d24461cf90'),(2,'DELETE USER_ROLE','2015-12-16 14:58:20',1,NULL,'9c22a38d-a3db-11e5-9028-28d24461cf90'),(2,'EDIT DATA_LOG','2015-12-16 14:58:20',1,NULL,'9c22a412-a3db-11e5-9028-28d24461cf90'),(2,'EDIT DEFINITION','2015-12-16 14:58:20',1,NULL,'9c22a718-a3db-11e5-9028-28d24461cf90'),(2,'EDIT DEFINITION_TYPE','2015-12-16 14:58:20',1,NULL,'9c22a7ad-a3db-11e5-9028-28d24461cf90'),(2,'EDIT ELEMENT','2015-12-16 14:58:20',1,NULL,'9c22a829-a3db-11e5-9028-28d24461cf90'),(2,'EDIT ENCOUNTER','2015-12-16 14:58:20',1,NULL,'9c22a8a1-a3db-11e5-9028-28d24461cf90'),(2,'EDIT ENCOUNTER_PREREQUISITE','2015-12-16 14:58:20',1,NULL,'9c22a915-a3db-11e5-9028-28d24461cf90'),(2,'EDIT ENCOUNTER_RESULT','2015-12-16 14:58:20',1,NULL,'9c22a98c-a3db-11e5-9028-28d24461cf90'),(2,'EDIT ENCOUNTER_TYPE','2015-12-16 14:58:20',1,NULL,'9c22aa04-a3db-11e5-9028-28d24461cf90'),(2,'EDIT LOCATION','2015-12-16 14:58:20',1,NULL,'9c22aa78-a3db-11e5-9028-28d24461cf90'),(2,'EDIT LOCATION_ATTRIBUTE','2015-12-16 14:58:20',1,NULL,'9c22aae7-a3db-11e5-9028-28d24461cf90'),(2,'EDIT LOCATION_ATTRIBUTE_TYPE','2015-12-16 14:58:20',1,NULL,'9c22ab5f-a3db-11e5-9028-28d24461cf90'),(2,'EDIT PATIENT','2015-12-16 14:58:20',1,NULL,'9c22abd2-a3db-11e5-9028-28d24461cf90'),(2,'EDIT PERSON','2015-12-16 14:58:20',1,NULL,'9c22ac41-a3db-11e5-9028-28d24461cf90'),(2,'EDIT PERSON_ATTRIBUTE','2015-12-16 14:58:20',1,NULL,'9c22acb5-a3db-11e5-9028-28d24461cf90'),(2,'EDIT PERSON_ATTRIBUTE_TYPE','2015-12-16 14:58:20',1,NULL,'9c22ad28-a3db-11e5-9028-28d24461cf90'),(2,'EDIT PERSON_CONTACT','2015-12-16 14:58:20',1,NULL,'9c22ada0-a3db-11e5-9028-28d24461cf90'),(2,'EDIT PRIVILEGE','2015-12-16 14:58:20',1,NULL,'9c22ae13-a3db-11e5-9028-28d24461cf90'),(2,'EDIT ROLE','2015-12-16 14:58:20',1,NULL,'9c22ae83-a3db-11e5-9028-28d24461cf90'),(2,'EDIT ROLE_PRIVILEGE','2015-12-16 14:58:20',1,NULL,'9c22aef6-a3db-11e5-9028-28d24461cf90'),(2,'EDIT USERS','2015-12-16 14:58:20',1,NULL,'9c22af65-a3db-11e5-9028-28d24461cf90'),(2,'EDIT USER_LOCATION','2015-12-16 14:58:20',1,NULL,'9c22afd9-a3db-11e5-9028-28d24461cf90'),(2,'EDIT USER_ROLE','2015-12-16 14:58:20',1,NULL,'9c22b048-a3db-11e5-9028-28d24461cf90'),(2,'VIEW DATA_LOG','2015-12-16 14:58:20',1,NULL,'9c22b0b7-a3db-11e5-9028-28d24461cf90'),(2,'VIEW DEFINITION','2015-12-16 14:58:20',1,NULL,'9c22b126-a3db-11e5-9028-28d24461cf90'),(2,'VIEW DEFINITION_TYPE','2015-12-16 14:58:20',1,NULL,'9c22b195-a3db-11e5-9028-28d24461cf90'),(2,'VIEW ELEMENT','2015-12-16 14:58:20',1,NULL,'9c22b209-a3db-11e5-9028-28d24461cf90'),(2,'VIEW ENCOUNTER','2015-12-16 14:58:20',1,NULL,'9c22b278-a3db-11e5-9028-28d24461cf90'),(2,'VIEW ENCOUNTER_PREREQUISITE','2015-12-16 14:58:20',1,NULL,'9c22b2e7-a3db-11e5-9028-28d24461cf90'),(2,'VIEW ENCOUNTER_RESULT','2015-12-16 14:58:20',1,NULL,'9c22b35b-a3db-11e5-9028-28d24461cf90'),(2,'VIEW ENCOUNTER_TYPE','2015-12-16 14:58:20',1,NULL,'9c22b3ce-a3db-11e5-9028-28d24461cf90'),(2,'VIEW LOCATION','2015-12-16 14:58:20',1,NULL,'9c22b442-a3db-11e5-9028-28d24461cf90'),(2,'VIEW LOCATION_ATTRIBUTE','2015-12-16 14:58:20',1,NULL,'9c22b4b1-a3db-11e5-9028-28d24461cf90'),(2,'VIEW LOCATION_ATTRIBUTE_TYPE','2015-12-16 14:58:20',1,NULL,'9c22b529-a3db-11e5-9028-28d24461cf90'),(2,'VIEW PATIENT','2015-12-16 14:58:20',1,NULL,'9c22b59c-a3db-11e5-9028-28d24461cf90'),(2,'VIEW PERSON','2015-12-16 14:58:20',1,NULL,'9c22b60b-a3db-11e5-9028-28d24461cf90'),(2,'VIEW PERSON_ATTRIBUTE','2015-12-16 14:58:20',1,NULL,'9c22b67a-a3db-11e5-9028-28d24461cf90'),(2,'VIEW PERSON_ATTRIBUTE_TYPE','2015-12-16 14:58:20',1,NULL,'9c22e0b6-a3db-11e5-9028-28d24461cf90'),(2,'VIEW PERSON_CONTACT','2015-12-16 14:58:20',1,NULL,'9c22e1b6-a3db-11e5-9028-28d24461cf90'),(2,'VIEW PRIVILEGE','2015-12-16 14:58:20',1,NULL,'9c22e259-a3db-11e5-9028-28d24461cf90'),(2,'VIEW ROLE','2015-12-16 14:58:20',1,NULL,'9c22e2e2-a3db-11e5-9028-28d24461cf90'),(2,'VIEW ROLE_PRIVILEGE','2015-12-16 14:58:20',1,NULL,'9c22e362-a3db-11e5-9028-28d24461cf90'),(2,'VIEW USERS','2015-12-16 14:58:20',1,NULL,'9c22e3de-a3db-11e5-9028-28d24461cf90'),(2,'VIEW USER_LOCATION','2015-12-16 14:58:20',1,NULL,'9c22e456-a3db-11e5-9028-28d24461cf90'),(2,'VIEW USER_ROLE','2015-12-16 14:58:20',1,NULL,'9c22e4d2-a3db-11e5-9028-28d24461cf90'),(3,'VIEW DATA_LOG','2015-12-16 14:58:37',1,NULL,'a64668cd-a3db-11e5-9028-28d24461cf90'),(3,'VIEW DEFINITION','2015-12-16 14:58:37',1,NULL,'a6466aec-a3db-11e5-9028-28d24461cf90'),(3,'VIEW DEFINITION_TYPE','2015-12-16 14:58:37',1,NULL,'a6466bad-a3db-11e5-9028-28d24461cf90'),(3,'VIEW ELEMENT','2015-12-16 14:58:37',1,NULL,'a6466c43-a3db-11e5-9028-28d24461cf90'),(3,'VIEW ENCOUNTER','2015-12-16 14:58:37',1,NULL,'a6466d7f-a3db-11e5-9028-28d24461cf90'),(3,'VIEW ENCOUNTER_PREREQUISITE','2015-12-16 14:58:37',1,NULL,'a6466e55-a3db-11e5-9028-28d24461cf90'),(3,'VIEW ENCOUNTER_RESULT','2015-12-16 14:58:37',1,NULL,'a6466f5e-a3db-11e5-9028-28d24461cf90'),(3,'VIEW ENCOUNTER_TYPE','2015-12-16 14:58:37',1,NULL,'a64670b8-a3db-11e5-9028-28d24461cf90'),(3,'VIEW LOCATION','2015-12-16 14:58:37',1,NULL,'a6467175-a3db-11e5-9028-28d24461cf90'),(3,'VIEW LOCATION_ATTRIBUTE','2015-12-16 14:58:37',1,NULL,'a64671fd-a3db-11e5-9028-28d24461cf90'),(3,'VIEW LOCATION_ATTRIBUTE_TYPE','2015-12-16 14:58:37',1,NULL,'a6467282-a3db-11e5-9028-28d24461cf90'),(3,'VIEW PATIENT','2015-12-16 14:58:37',1,NULL,'a646730b-a3db-11e5-9028-28d24461cf90'),(3,'VIEW PERSON','2015-12-16 14:58:37',1,NULL,'a646738b-a3db-11e5-9028-28d24461cf90'),(3,'VIEW PERSON_ATTRIBUTE','2015-12-16 14:58:37',1,NULL,'a646740b-a3db-11e5-9028-28d24461cf90'),(3,'VIEW PERSON_ATTRIBUTE_TYPE','2015-12-16 14:58:37',1,NULL,'a6467494-a3db-11e5-9028-28d24461cf90'),(3,'VIEW PERSON_CONTACT','2015-12-16 14:58:37',1,NULL,'a6467519-a3db-11e5-9028-28d24461cf90'),(3,'VIEW PRIVILEGE','2015-12-16 14:58:37',1,NULL,'a64675a2-a3db-11e5-9028-28d24461cf90'),(3,'VIEW ROLE','2015-12-16 14:58:37',1,NULL,'a646761e-a3db-11e5-9028-28d24461cf90'),(3,'VIEW ROLE_PRIVILEGE','2015-12-16 14:58:37',1,NULL,'a646769a-a3db-11e5-9028-28d24461cf90'),(3,'VIEW USERS','2015-12-16 14:58:37',1,NULL,'a6467716-a3db-11e5-9028-28d24461cf90'),(3,'VIEW USER_LOCATION','2015-12-16 14:58:37',1,NULL,'a6467792-a3db-11e5-9028-28d24461cf90'),(3,'VIEW USER_ROLE','2015-12-16 14:58:37',1,NULL,'a646782c-a3db-11e5-9028-28d24461cf90'),(4,'CREATE LOCATION','2018-02-06 15:55:37',1,NULL,'6880bc38-0b28-11e8-ba89-0ed5f89f718b'),(4,'CREATE LOCATION_ATTRIBUTE','2015-10-17 15:55:37',1,NULL,'efd06fea-0b2c-11e8-ba89-0ed5f89f718b'),(4,'CREATE USERS','2015-10-17 15:55:37',1,NULL,'df58200a-0ca2-11e8-ba89-0ed5f89f718b'),(4,'CREATE USER_FORM','2015-10-17 15:55:37',1,NULL,'2f4fd6e5-8be9-457f-afe5-c6d3dcdc7ca2'),(4,'CREATE USER_FORM_RESULT','2015-10-17 15:55:37',1,NULL,'7bf228a0-7faf-4b02-94e2-82bb4400bfe1'),(4,'VIEW PRIVILEGE','2015-10-17 15:55:37',1,NULL,'dd859b82-181d-42b6-bdff-ffd00cad4d8d'),(5,'CREATE USER_FORM','2015-10-17 15:55:37',1,NULL,'40b2e5f3-3af5-40ff-a4ce-e4b98c13a2cd'),(5,'CREATE USER_FORM_RESULT','2015-10-17 15:55:37',1,NULL,'98a863bb-da2e-4be7-911c-38eb0d2b3715'),(5,'MANAGE AIC_UVGI_FORMS','2015-10-17 15:55:37',1,NULL,'f5acad02-6ae0-46b1-b020-2ecc8dc4b720'),(5,'VIEW PRIVILEGE','2015-10-17 15:55:37',1,NULL,'2320a9df-c17e-4e14-9405-3b31f75bc0e9');
/*!40000 ALTER TABLE `role_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_attribute`
--

DROP TABLE IF EXISTS `user_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_attribute` (
  `user_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_value` varchar(255) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `user_attribute_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `uuid` varchar(38) NOT NULL,
  PRIMARY KEY (`user_attribute_id`),
  UNIQUE KEY `user_attribute_id` (`user_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `uuid_2` (`uuid`),
  KEY `fk_user_attribute_user1_idx` (`user_id`),
  KEY `fk_user_attribute_user2_idx` (`created_by`),
  KEY `fk_user_attribute_location1_idx` (`created_at`),
  KEY `fk_user_attribute_user3_idx` (`changed_by`),
  KEY `fk_user_attribute_location2_idx` (`changed_at`),
  KEY `fk_user_attribute_user_attribute_type_idx` (`user_attribute_type_id`),
  CONSTRAINT `fk_user_attribute_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_user_attribute_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_user_attribute_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_user_attribute_user2` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_user_attribute_user3` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_user_attribute_user_attribute_type` FOREIGN KEY (`user_attribute_type_id`) REFERENCES `user_attribute_type` (`user_attribute_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_attribute`
--

LOCK TABLES `user_attribute` WRITE;
/*!40000 ALTER TABLE `user_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_attribute_type`
--

DROP TABLE IF EXISTS `user_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_attribute_type` (
  `user_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(45) NOT NULL,
  `data_type` varchar(10) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `required` bit(1) NOT NULL,
  `uuid` varchar(38) NOT NULL,
  `validation_regex` varchar(255) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_attribute_type_id`),
  UNIQUE KEY `user_attribute_type_id` (`user_attribute_type_id`),
  UNIQUE KEY `attribute_name` (`attribute_name`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `uuid_2` (`uuid`),
  KEY `fk_user_attribute_type_user1_idx` (`created_by`),
  KEY `fk_user_attribute_type_location1_idx` (`created_at`),
  KEY `fk_user_attribute_type_user2_idx` (`changed_by`),
  KEY `fk_user_attribute_type_location2_idx` (`changed_at`),
  CONSTRAINT `fk_user_attribute_type_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_user_attribute_type_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_user_attribute_type_user1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_user_attribute_type_user2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_attribute_type`
--

LOCK TABLES `user_attribute_type` WRITE;
/*!40000 ALTER TABLE `user_attribute_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_form`
--

DROP TABLE IF EXISTS `user_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_form` (
  `user_form_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_form_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `duration_seconds` int(11) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`user_form_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_user_form_user_form_type1_idx` (`user_form_type_id`),
  KEY `fk_user_form_users1_idx` (`user_id`),
  KEY `fk_user_form_users2_idx` (`created_by`),
  KEY `fk_user_form_users3_idx` (`changed_by`),
  KEY `fk_user_form_location1_idx` (`created_at`),
  KEY `fk_user_form_location2_idx` (`changed_at`),
  CONSTRAINT `fk_user_form_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_form_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_form_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_form_users2` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_form_users3` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_form_user_form_type1` FOREIGN KEY (`user_form_type_id`) REFERENCES `user_form_type` (`user_form_type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_form`
--

LOCK TABLES `user_form` WRITE;
/*!40000 ALTER TABLE `user_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_form_result`
--

DROP TABLE IF EXISTS `user_form_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_form_result` (
  `user_form_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_form_id` int(11) NOT NULL,
  `element_id` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_form_result_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_user_form_result_user_form1_idx` (`element_id`),
  KEY `fk_user_form_result_location1_idx` (`created_at`),
  KEY `fk_user_form_result_location2_idx` (`changed_at`),
  KEY `fk_user_form_result_users1_idx` (`created_by`),
  KEY `fk_user_form_result_users2_idx` (`changed_by`),
  KEY `fk_user_form_result_user_form_idx` (`user_form_id`),
  KEY `FK8D0F85846301B09C` (`parent`),
  CONSTRAINT `FK8D0F85846301B09C` FOREIGN KEY (`parent`) REFERENCES `user_form_result` (`user_form_result_id`),
  CONSTRAINT `fk_user_form_result_element` FOREIGN KEY (`element_id`) REFERENCES `element` (`element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_form_result_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_form_result_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_form_result_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_form_result_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_form_result_user_form` FOREIGN KEY (`user_form_id`) REFERENCES `user_form` (`user_form_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_form_result`
--

LOCK TABLES `user_form_result` WRITE;
/*!40000 ALTER TABLE `user_form_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_form_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_form_type`
--

DROP TABLE IF EXISTS `user_form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_form_type` (
  `user_form_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_form_type` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_form_type_id`),
  UNIQUE KEY `user_form_type_UNIQUE` (`user_form_type`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_user_form_type_location1_idx` (`created_at`),
  KEY `fk_user_form_type_location2_idx` (`changed_at`),
  KEY `fk_user_form_type_users1_idx` (`created_by`),
  KEY `fk_user_form_type_users1_idx1` (`changed_by`),
  KEY `FKC9467A6187F9F544` (`changed_by`),
  CONSTRAINT `FKC9467A6187F9F544` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_user_form_type_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_form_type_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_form_type_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_form_type`
--

LOCK TABLES `user_form_type` WRITE;
/*!40000 ALTER TABLE `user_form_type` DISABLE KEYS */;
INSERT INTO `user_form_type` VALUES (1,'UVGI_INSTALLATION','2016-07-28 00:00:00',1,1,NULL,NULL,NULL,'4235c245-5489-11e6-a7be-0a0027000000','Installation form for Ultra-violet germicidal irradiation lights'),(2,'UVGI_MAINTENANCE','2015-06-16 04:26:15',2,1,NULL,NULL,NULL,'4235c245-5489-11e6-a7be-0a0027000001','Maintenance form for Ultra-violet germicidal irradiation lights'),(3,'UVGI_TROUBLESHOOTING','2016-08-02 18:24:21',2,1,NULL,NULL,NULL,'85525fda-11fa-40a2-8a7b-454d1f92e3f7','Troubleshooting log form for Ultra-violet germicidal irradiation lights'),(4,'UVGI_RESOLUTION','2016-08-02 18:24:21',2,1,NULL,NULL,NULL,'bc26155f-6566-4bb7-bf73-1f6432d13f00','Troubleshooting resolution log form for Ultra-violet germicidal irradiation lights'),(5,'UVGI_TROUBLESHOOT_STATUS','2016-10-03 10:26:19',2,1,NULL,NULL,NULL,'4cd6826d-e0ef-4458-b98a-b0696cac7e28','Troubleshootig Status log form for Ultra-violet germicidal irradiation lights'),(7,'fast_screening','2017-04-20 16:26:59',1,NULL,NULL,NULL,NULL,'d0757ade-766d-4bc0-9c4f-2476321acf17',NULL);
/*!40000 ALTER TABLE `user_form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_location`
--

DROP TABLE IF EXISTS `user_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_location` (
  `user_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`user_id`,`location_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_user_location_location1_idx` (`location_id`),
  KEY `fk_user_location_users1_idx` (`created_by`),
  KEY `fk_user_location_users3_idx` (`changed_by`),
  KEY `fk_user_location_location2_idx` (`created_at`),
  KEY `fk_user_location_location3_idx` (`changed_at`),
  CONSTRAINT `fk_user_location_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_location_location2` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_location_location3` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_location_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_location_users2` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_location_users3` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_location`
--

LOCK TABLES `user_location` WRITE;
/*!40000 ALTER TABLE `user_location` DISABLE KEYS */;
INSERT INTO `user_location` VALUES (1,1,'2015-12-17 08:54:49',1,NULL,NULL,NULL,NULL,'0dbfd483-c1e2-48ec-95b9-88bbe999391a'),(2,1,'2015-12-15 17:31:29',1,NULL,NULL,NULL,NULL,'cf4046fe-a327-11e5-9028-28d24461cf90'),(8,1,'2017-04-21 11:11:04',1,NULL,NULL,NULL,NULL,'cc0ecc3f-074f-49dc-97ad-b12067d83409'),(8,2,'2017-04-21 11:11:05',1,NULL,NULL,NULL,NULL,'08238786-fd87-4393-9b8b-32ac16fbb143'),(9,1,'2017-04-21 11:13:38',8,NULL,NULL,NULL,NULL,'9a5c99d9-8a5c-423f-92d9-676b18aa6915'),(9,2,'2017-04-21 11:13:38',8,NULL,NULL,NULL,NULL,'55cd92a9-e867-4903-96a1-ff2068f6a950');
/*!40000 ALTER TABLE `user_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_user_role_role1_idx` (`role_id`),
  KEY `fk_user_role_users2_idx` (`created_by`),
  KEY `fk_user_role_users3_idx` (`changed_by`),
  KEY `fk_user_role_location1_idx` (`created_at`),
  KEY `fk_user_role_location2_idx` (`changed_at`),
  CONSTRAINT `fk_user_role_location1` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_location2` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_users2` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_users3` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,'2015-12-11 11:55:13',NULL,NULL,NULL,NULL,NULL,'20f664a9-9fd4-11e5-9028-28d24461cf90'),(2,1,'2015-12-11 11:01:42',1,1,NULL,NULL,NULL,'847826e6-5a44-4242-9d57-56267e2301bf'),(3,2,'2015-12-11 11:55:37',1,1,NULL,NULL,NULL,'2f04046f-9fd4-11e5-9028-28d24461cf90'),(4,3,'2015-12-11 11:55:59',1,1,NULL,NULL,NULL,'3be38218-9fd4-11e5-9028-28d24461cf90'),(6,4,'2016-10-17 15:55:44',1,1,NULL,NULL,NULL,'3d7434c3-ef74-455a-8ef5-568e539691b8'),(7,5,'2016-10-24 09:45:44',1,1,NULL,NULL,NULL,'42a77839-9830-40f2-b764-f1a6f73f9b9a'),(8,1,'2017-04-21 11:11:04',1,NULL,NULL,NULL,NULL,'f445766f-9e91-49e9-8e07-32620ce50a0c'),(8,2,'2017-04-21 11:11:04',1,NULL,NULL,NULL,NULL,'f57fa23d-77dd-4c20-a27d-b95ebea2dace'),(8,3,'2017-04-21 11:11:05',1,NULL,NULL,NULL,NULL,'918bdbfe-5575-43ee-8787-e350bf79c5c4'),(8,4,'2017-04-21 11:11:05',1,NULL,NULL,NULL,NULL,'5f12e7b5-cb5b-4787-bac3-b5103e46988a'),(8,5,'2017-04-21 11:11:05',1,NULL,NULL,NULL,NULL,'50da785e-6755-4ce5-98c5-02cd37d4af39'),(8,6,'2017-04-21 11:11:05',1,NULL,NULL,NULL,NULL,'46c9a9c8-2577-4dcd-8129-8cfd17f3fbb6'),(8,7,'2017-04-21 11:11:05',1,NULL,NULL,NULL,NULL,'1a2ec061-d2a3-4ebd-ba9d-efc7de65943f'),(8,8,'2017-04-21 11:11:05',1,NULL,NULL,NULL,NULL,'69863671-afc0-49bf-a3ee-439a1dd003b8'),(9,1,'2017-04-21 11:13:38',8,NULL,NULL,NULL,NULL,'e9535d1a-ecd4-4018-ae52-dad8fc5b22aa'),(9,2,'2017-04-21 11:13:38',8,NULL,NULL,NULL,NULL,'304ac111-495c-4aa3-82ad-a6e977265730'),(9,3,'2017-04-21 11:13:38',8,NULL,NULL,NULL,NULL,'73a08d62-27cb-4c60-9531-73c542d24874'),(9,4,'2017-04-21 11:13:39',8,NULL,NULL,NULL,NULL,'dce0d211-2840-4168-a37e-eb57b7d941e4'),(9,5,'2017-04-21 11:13:39',8,NULL,NULL,NULL,NULL,'ecc4a664-b29d-4394-b80e-4167b86c119f'),(9,6,'2017-04-21 11:13:39',8,NULL,NULL,NULL,NULL,'e7956971-8182-43a5-bd77-d057c08ad827'),(9,7,'2017-04-21 11:13:39',8,NULL,NULL,NULL,NULL,'7cb62d77-30a2-49d1-94f3-aa875b655252'),(9,8,'2017-04-21 11:13:39',8,NULL,NULL,NULL,NULL,'699b049b-442d-4269-b3d3-7535cf6b7d2a'),(10,1,'2017-04-21 11:13:38',8,NULL,NULL,NULL,NULL,'b3f06d6a-2fcf-11e7-93ae-92361f002671');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `global_data_access` bit(1) DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `reason_disabled` varchar(255) DEFAULT NULL,
  `password_hash` varchar(512) DEFAULT NULL,
  `password_salt` varchar(512) DEFAULT NULL,
  `secret_question` varchar(255) DEFAULT NULL,
  `secret_answer_hash` varchar(512) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_users_location_idx` (`created_at`),
  KEY `fk_users_location1_idx` (`changed_at`),
  KEY `fk_users_user1_idx` (`created_by`),
  KEY `fk_users_users2_idx` (`changed_by`),
  CONSTRAINT `fk_users_location` FOREIGN KEY (`created_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_users_location1` FOREIGN KEY (`changed_at`) REFERENCES `location` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_users_users1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_users_users2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','Administrator','','\0',NULL,'1222422091111517112421624631471271181512039522850199255',NULL,'Dexter said: That number again is...','2191831962519017590304654193246402381779617073140137','2015-12-10 12:52:36',NULL,NULL,NULL,NULL,NULL,'53035a6e-c08a-4921-9f18-9437cb5987d5'),(2,'owais','Owais Hussain','','',NULL,'1204522834112471741812181522341581631862164057234250213',NULL,'Dexter said: That number again is...','2191831962519017590304654193246402381779617073140137','2015-12-11 10:41:35',1,1,NULL,NULL,NULL,'5473db18-52fd-41d2-82c6-ef5a214ed3b8'),(3,'harry','Harry Potter','','',NULL,'118917250131122225185694711917924126161138120140131180',NULL,'Dexter said: That number again is...','2191831962519017590304654193246402381779617073140137','2015-12-11 10:41:35',1,1,NULL,NULL,NULL,'345b36b1-c3c0-446d-9da0-a18c06ecfd69'),(4,'ron','Ronald Weasley','','','He broke his wand. We don\'t need Baboons brandishing with their wands.','6417520819412112264252147204170144802262213111558146',NULL,'Dexter said: That number again is...','2191831962519017590304654193246402381779617073140137','2015-12-11 10:41:35',1,1,'2015-12-26 16:50:15',1,NULL,'b17bb23f-508f-4bd0-93cc-db9f0a36a05b'),(5,'hermione','Hermione Granger','','',NULL,'22205198214127985018213071100582617691611436181',NULL,'Dexter said: That number again is...','2191831962519017590304654193246402381779617073140137','2015-12-11 10:41:35',1,1,NULL,NULL,NULL,'96d4c03f-60f0-4eae-92f2-1f22b739c6ef'),(6,'guest','Guest Login','','\0',NULL,'1222422091111517112421624631471271181512039522850199255',NULL,'Dexter said: That number again is...','2191831962519017590304654193246402381779617073140137','2016-10-17 13:23:55',1,1,NULL,NULL,NULL,'9686e6e4-c65b-4118-85bb-7648e58b0ed0'),(7,'supervisor','Site Superisor','','\0',NULL,'1222422091111517112421624631471271181512039522850199255',NULL,'Dexter said: That number again is...','2191831962519017590304654193246402381779617073140137','2016-10-24 09:23:55',1,1,NULL,NULL,NULL,'b1aa1ef1-a4ff-4681-824a-e3b147246e00'),(8,'haris.asif1','H A','','\0',NULL,'1222422091111517112421624631471271181512039522850199255',NULL,'WHO IS YOUR FAVOURITE NATIONAL HERO?','1001801779817716415018545173239165202281961465010119654','2017-04-21 11:11:02',1,NULL,NULL,NULL,NULL,'9022b8fa-aa48-4c46-968b-6de9ff8fa229'),(9,'haris.asif','Haris','','\0',NULL,'2326516141248462141711801441889913541228221748047191',NULL,'WHO IS YOUR FAVOURITE NATIONAL HERO?','59246234162539722915231601492722521613957307120064','2017-04-21 11:13:36',8,NULL,NULL,NULL,NULL,'c83b5ce2-c27b-406c-b355-37bfc97a362e'),(10,'rabbia.hassan','Rabbia',NULL,NULL,NULL,'2326516141248462141711801441889913541228221748047191',NULL,'WHO IS YOUR FAVOURITE NATIONAL HERO?','59246234162539722915231601492722521613957307120064','2017-04-21 11:13:36',8,NULL,NULL,NULL,NULL,'59a0e2b8-1b3a-43c3-803b-d349ec495738'),(11,'m.waqas','','','\0',NULL,'9a2f8e835dde13fec8f0d8267b45d5a2fb78ce1b6299a7531e08114039e957fe1d90ae80f1b10923264f8679913e9fa6e51b568553ccbd8dbd2263ee6556ca7d','46b3bbf0ff3d9da2ad738e79832d61feffebf364ae79bb2c908aa115aa18c385df557c424ff28f1216f5a6e43cfae91c5a9506b0e252c6e2e48b25071c0cf44f',NULL,NULL,'2018-01-18 00:00:00',6,5,'2018-01-18 00:00:00',NULL,NULL,'08700e01-6a4d-4300-96e9-c0b3721613c9');
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

-- Dump completed on 2018-04-08 19:06:11
