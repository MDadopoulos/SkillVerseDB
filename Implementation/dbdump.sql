-- DROP SCHEMA skillversedb;
CREATE SCHEMA skillversedb;
USE skillversedb;

-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: skillversedb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_Id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `contact_info` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`company_Id`),
  UNIQUE KEY `company_Id_UNIQUE` (`company_Id`),
  KEY `company_Id` (`company_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1001,'Google','1600 Amphitheatre Pkwy, Mountain View, CA, 94043','Tech','google@info.com'),(1002,'Microsoft','One Microsoft Way, Redmond, WA 98052','Tech','microsoft@info.com'),(1003,'Apple','Apple Park Way, Cupertino, CA 95014','Tech','apple@info.com'),(1004,'Tesla','1 Apple Park Way, Cupertino, CA 95014','Tech','tesla@info.com');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `event_id` int NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `description` mediumtext,
  `location` varchar(255) DEFAULT NULL,
  `event_name` varchar(50) NOT NULL,
  `duration` decimal(3,0) NOT NULL,
  `date` datetime NOT NULL,
  `company_company_Id` int NOT NULL,
  PRIMARY KEY (`event_id`,`company_company_Id`),
  UNIQUE KEY `event_id_UNIQUE` (`event_id`),
  KEY `event_id` (`event_id`),
  KEY `fk_event_company1_idx` (`company_company_Id`),
  CONSTRAINT `fk_event_company1` FOREIGN KEY (`company_company_Id`) REFERENCES `company` (`company_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Hackathon','A collaborative computer programming event where participants create software solutions.','Tech Hub','Hack the Future',54,'2024-08-01 00:00:00',1001),(2,'Seminar','A lecture or presentation delivered to an audience on a particular topic or set of topics.','Innovation Center','Design Thinking',41,'2024-08-02 00:00:00',1001),(3,'Workshop','A brief intensive course, a seminar or a series of meetings emphasizing interaction and exchange of information among a usually small number of participants.','Startup Loft','Agile Methodologies',21,'2024-08-03 00:00:00',1001),(4,'Conference','A formal meeting where participants exchange their views on various topics.','Convention Center','Tech Leaders 2023',11,'2024-08-04 00:00:00',1001);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `event_BEFORE_INSERT` BEFORE INSERT ON `event` FOR EACH ROW BEGIN
	IF (NEW.duration <= 0) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `event_BEFORE_UPDATE` BEFORE UPDATE ON `event` FOR EACH ROW BEGIN
	IF (NEW.duration <= 0) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `job_id` int NOT NULL,
  `job_type` varchar(50) NOT NULL,
  `application_deadline` datetime NOT NULL,
  `requirements` mediumtext NOT NULL,
  `description` mediumtext,
  `title` varchar(50) NOT NULL,
  `company_company_Id` int NOT NULL,
  PRIMARY KEY (`job_id`,`company_company_Id`),
  UNIQUE KEY `job_id_UNIQUE` (`job_id`),
  KEY `job_id` (`job_id`),
  KEY `fk_job_company1_idx` (`company_company_Id`),
  CONSTRAINT `fk_job_company1` FOREIGN KEY (`company_company_Id`) REFERENCES `company` (`company_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (100001,'Full-time','2024-11-26 00:00:00','Requirement details for Full-time.','Full-time position with competitive benefits and growth opportunities.','Software Developer',1001),(100002,'Part-time','2024-01-08 00:00:00','Requirement details for Part-time.','Flexible part-time role suitable for students or those seeking work-life balance.','Graphic Designer',1002),(100003,'Internship','2024-12-20 00:00:00','Requirement details for Internship.','Internship offering hands-on experience in industry projects and professional mentorship.','Marketing Intern',1003),(100004,'Full-time','2024-01-07 00:00:00','Requirement details for Contract.','Contractual work focusing on specific projects with possibilities for extension.','Data Analyst',1004);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `job_BEFORE_INSERT` BEFORE INSERT ON `job` FOR EACH ROW BEGIN
    IF (NEW.application_deadline < CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data: application_deadline must be after today';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `job_requires_skill`
--

DROP TABLE IF EXISTS `job_requires_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_requires_skill` (
  `skill_id` int NOT NULL,
  `job_id` int NOT NULL,
  `skill_proficiency` varchar(45) NOT NULL,
  PRIMARY KEY (`skill_id`,`job_id`),
  KEY `skill_id_idx` (`skill_id`),
  KEY `job_id_idx` (`job_id`),
  CONSTRAINT `job_jrs_id` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `skill_jrs_id` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_requires_skill`
--

LOCK TABLES `job_requires_skill` WRITE;
/*!40000 ALTER TABLE `job_requires_skill` DISABLE KEYS */;
INSERT INTO `job_requires_skill` VALUES (1,100001,'80'),(2,100002,'75'),(3,100003,'40'),(4,100004,'85');
/*!40000 ALTER TABLE `job_requires_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `jobs_description`
--

DROP TABLE IF EXISTS `jobs_description`;
/*!50001 DROP VIEW IF EXISTS `jobs_description`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `jobs_description` AS SELECT 
 1 AS `company_name`,
 1 AS `job_title`,
 1 AS `job_description`,
 1 AS `job_requirements`,
 1 AS `skill_require_name`,
 1 AS `skill_category`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL,
  `team_id` int NOT NULL,
  `project_name` varchar(50) NOT NULL,
  `description` mediumtext,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `project_status` enum('Completed','In Progress','Not Started') DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `project_id_UNIQUE` (`project_id`),
  KEY `team_id_uhs_idx` (`team_id`),
  CONSTRAINT `team_id_uhs` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (228258,282483,'Project Mercury','Space exploration project.','2024-01-10 00:00:00','2024-12-31 00:00:00','Completed'),(295162,601985,'Project Mars','Mars colonization research.','2024-07-25 00:00:00','2024-09-30 00:00:00','Not Started'),(754503,601980,'Project Venus','Climate study initiative.','2024-03-15 00:00:00','2024-11-30 00:00:00','In Progress'),(761553,691808,'Project Earth','Sustainable energy development.','2024-05-20 00:00:00','2024-10-15 00:00:00','Completed');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `project_BEFORE_INSERT` BEFORE INSERT ON `project` FOR EACH ROW BEGIN
    IF (NEW.start_date < CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data: start_date must be after today';
    END IF;
    
    IF (NEW.end_date < NEW.start_date) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data: end_date must be after today';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `project_BEFORE_UPDATE` BEFORE UPDATE ON `project` FOR EACH ROW BEGIN
    IF (NEW.end_date < CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data: end_date must be after today';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `project_associated_skill`
--

DROP TABLE IF EXISTS `project_associated_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_associated_skill` (
  `project_id` int NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`project_id`,`skill_id`),
  KEY `skill_id_idx` (`skill_id`),
  CONSTRAINT `project_sp_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `skill_sp_id` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_associated_skill`
--

LOCK TABLES `project_associated_skill` WRITE;
/*!40000 ALTER TABLE `project_associated_skill` DISABLE KEYS */;
INSERT INTO `project_associated_skill` VALUES (228258,1),(754503,2),(761553,3),(295162,4);
/*!40000 ALTER TABLE `project_associated_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `skill_id` int NOT NULL,
  `skill_category` varchar(50) DEFAULT NULL,
  `skill_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`skill_id`),
  UNIQUE KEY `skill_id_UNIQUE` (`skill_id`),
  KEY `skill_id` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'Frontend','HTML'),(2,'Backend','PHP'),(3,'Frontend','React'),(4,'Backend','Node'),(5,'Data Science','Python'),(6,'Backend','DJango'),(7,'Frontend','Css'),(8,'Frontend','JavaScript');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `team_leader` varchar(50) NOT NULL,
  `time_created` datetime NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `team_id_UNIQUE` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (282483,'Trash Team','760765','2024-01-01 00:00:00'),(601980,'Gamma Group','377584','2024-03-20 00:00:00'),(601985,'Delta Squad','61584','2024-04-25 00:00:00'),(691808,'Beta Squad','389239','2024-02-15 00:00:00');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `team_BEFORE_INSERT` BEFORE INSERT ON `team` FOR EACH ROW BEGIN
    IF (NEW.time_created < CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data: time_created must be after today';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `teams_on_project`
--

DROP TABLE IF EXISTS `teams_on_project`;
/*!50001 DROP VIEW IF EXISTS `teams_on_project`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `teams_on_project` AS SELECT 
 1 AS `Project_Name`,
 1 AS `Project_Description`,
 1 AS `Project_Status`,
 1 AS `Team_Name`,
 1 AS `Username`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(80) NOT NULL,
  `user_rating` decimal(3,0) DEFAULT NULL,
  `Passion_Indicator` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`) /*!80000 INVISIBLE */,
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (61584,'Anonymous','Anonymous@skillversedb.com','12345678',1,1),(377584,'dkombit','dkombit@skillversedb.com','p@ssw0rd3',99,99),(389239,'chrysostk','chrysostk@skillversedb.com','p@ssw0rd2',99,99),(760765,'mdadopoul','mdadopoul@skillversedb.com','p@ssw0rd1',99,99);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_contribute_to_project`
--

DROP TABLE IF EXISTS `user_contribute_to_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_contribute_to_project` (
  `contribution_id` int NOT NULL,
  `user_id` int NOT NULL,
  `project_id` int NOT NULL,
  `contribution_details` mediumtext,
  `contribution_date` datetime NOT NULL,
  `contibution_rating` decimal(3,0) DEFAULT NULL,
  `contribution_state` enum('Accepted','Pending','Decline') NOT NULL,
  PRIMARY KEY (`contribution_id`,`user_id`,`project_id`),
  UNIQUE KEY `contribution_id_UNIQUE` (`contribution_id`) /*!80000 INVISIBLE */,
  KEY `project_id_idx` (`project_id`),
  KEY `user_uctp_id` (`user_id`),
  CONSTRAINT `project_uctp_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `user_uctp_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_contribute_to_project`
--

LOCK TABLES `user_contribute_to_project` WRITE;
/*!40000 ALTER TABLE `user_contribute_to_project` DISABLE KEYS */;
INSERT INTO `user_contribute_to_project` VALUES (284678,377584,761553,'Implemented energy solution B.','2024-07-22 00:00:00',61,'Accepted'),(595508,389239,754503,'Researched climate patterns.','2024-06-11 00:00:00',88,'Decline'),(941710,760765,228258,'Developed module A.','2024-05-01 00:00:00',67,'Accepted');
/*!40000 ALTER TABLE `user_contribute_to_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_contribute_to_project_BEFORE_INSERT` BEFORE INSERT ON `user_contribute_to_project` FOR EACH ROW BEGIN
    IF (NEW.contribution_date < CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data: contribution_date must be after today';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `user_contribution_detail`
--

DROP TABLE IF EXISTS `user_contribution_detail`;
/*!50001 DROP VIEW IF EXISTS `user_contribution_detail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_contribution_detail` AS SELECT 
 1 AS `Username`,
 1 AS `User_Email`,
 1 AS `Project_Name`,
 1 AS `Contribution_Rating`,
 1 AS `Contribution_Details`,
 1 AS `contribution_state`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_has_skill`
--

DROP TABLE IF EXISTS `user_has_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_skill` (
  `user_id` int NOT NULL,
  `skill_id` int NOT NULL,
  `skill_proficiency` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`skill_id`),
  KEY `skill_uhs_id_idx` (`skill_id`),
  CONSTRAINT `skill_uhs_id` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`),
  CONSTRAINT `user_uhs_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_skill`
--

LOCK TABLES `user_has_skill` WRITE;
/*!40000 ALTER TABLE `user_has_skill` DISABLE KEYS */;
INSERT INTO `user_has_skill` VALUES (389239,2,40),(389239,3,95),(760765,2,70),(760765,4,20);
/*!40000 ALTER TABLE `user_has_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_join_events`
--

DROP TABLE IF EXISTS `user_join_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_join_events` (
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`event_id`),
  KEY `event_uje_id` (`event_id`),
  CONSTRAINT `event_uje_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  CONSTRAINT `user_uje_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_join_events`
--

LOCK TABLES `user_join_events` WRITE;
/*!40000 ALTER TABLE `user_join_events` DISABLE KEYS */;
INSERT INTO `user_join_events` VALUES (760765,1),(389239,2),(377584,3),(61584,4);
/*!40000 ALTER TABLE `user_join_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_member_of_team`
--

DROP TABLE IF EXISTS `user_member_of_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_member_of_team` (
  `user_id` int NOT NULL,
  `team_id` int NOT NULL,
  `join_date` datetime DEFAULT NULL,
  `  role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`team_id`),
  KEY `team_umot_id` (`team_id`),
  CONSTRAINT `team_umot_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `user_umot_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_member_of_team`
--

LOCK TABLES `user_member_of_team` WRITE;
/*!40000 ALTER TABLE `user_member_of_team` DISABLE KEYS */;
INSERT INTO `user_member_of_team` VALUES (61584,601985,'2024-01-18 00:00:00','Data Analyst'),(377584,601980,'2024-01-17 00:00:00','Project Manager'),(389239,691808,'2024-01-16 00:00:00','Junior Designer'),(760765,282483,'2024-01-15 00:00:00','Developer');
/*!40000 ALTER TABLE `user_member_of_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_skill_proficiency`
--

DROP TABLE IF EXISTS `user_skill_proficiency`;
/*!50001 DROP VIEW IF EXISTS `user_skill_proficiency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_skill_proficiency` AS SELECT 
 1 AS `Username`,
 1 AS `Email`,
 1 AS `Skill`,
 1 AS `Proficiency`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `jobs_description`
--

/*!50001 DROP VIEW IF EXISTS `jobs_description`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jobs_description` AS select `c`.`name` AS `company_name`,`j`.`title` AS `job_title`,`j`.`description` AS `job_description`,`j`.`requirements` AS `job_requirements`,`sk`.`skill_name` AS `skill_require_name`,`sk`.`skill_category` AS `skill_category` from (((`company` `c` join `job` `j` on((`c`.`company_Id` = `j`.`company_company_Id`))) join `job_requires_skill` `jrs` on((`j`.`job_id` = `jrs`.`job_id`))) join `skill` `sk` on((`jrs`.`skill_id` = `sk`.`skill_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teams_on_project`
--

/*!50001 DROP VIEW IF EXISTS `teams_on_project`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teams_on_project` AS select `p`.`project_name` AS `Project_Name`,`p`.`description` AS `Project_Description`,`p`.`project_status` AS `Project_Status`,`t`.`team_name` AS `Team_Name`,`u`.`username` AS `Username` from (((`project` `p` join `team` `t` on((`p`.`team_id` = `t`.`team_id`))) join `user_member_of_team` `umot` on((`t`.`team_id` = `umot`.`team_id`))) join `user` `u` on((`umot`.`user_id` = `u`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_contribution_detail`
--

/*!50001 DROP VIEW IF EXISTS `user_contribution_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_contribution_detail` AS select `u`.`username` AS `Username`,`u`.`user_email` AS `User_Email`,`p`.`project_name` AS `Project_Name`,`uc`.`contibution_rating` AS `Contribution_Rating`,`uc`.`contribution_details` AS `Contribution_Details`,`uc`.`contribution_state` AS `contribution_state` from ((`user` `u` join `user_contribute_to_project` `uc` on((`u`.`user_id` = `uc`.`user_id`))) join `project` `p` on((`uc`.`project_id` = `p`.`project_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_skill_proficiency`
--

/*!50001 DROP VIEW IF EXISTS `user_skill_proficiency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_skill_proficiency` AS select `u`.`username` AS `Username`,`u`.`user_email` AS `Email`,`s`.`skill_name` AS `Skill`,`uhs`.`skill_proficiency` AS `Proficiency` from ((`user` `u` join `user_has_skill` `uhs` on((`u`.`user_id` = `uhs`.`user_id`))) join `skill` `s` on((`uhs`.`skill_id` = `s`.`skill_id`))) */;
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

-- Dump completed on 2023-12-21 18:51:02
