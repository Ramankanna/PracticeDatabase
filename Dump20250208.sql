-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: practicefibrecat
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Temporary view structure for view `highestmarkstudent`
--

DROP TABLE IF EXISTS `highestmarkstudent`;
/*!50001 DROP VIEW IF EXISTS `highestmarkstudent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `highestmarkstudent` AS SELECT 
 1 AS `Id`,
 1 AS `StudentName`,
 1 AS `Department`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `studaddress`
--

DROP TABLE IF EXISTS `studaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studaddress` (
  `ID` int NOT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `Pincode` int DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `studaddress_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `students` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studaddress`
--

LOCK TABLES `studaddress` WRITE;
/*!40000 ALTER TABLE `studaddress` DISABLE KEYS */;
INSERT INTO `studaddress` VALUES (101,'14 Avenue Street Chennai',600044,'9260789090'),(104,'10 Baskar Street Tirunelveli',627006,'9260786090'),(109,'13 Loyal Street Vilupuram',605044,'5660789090'),(201,'78 RockStreet Chennai',600044,'9260789090');
/*!40000 ALTER TABLE `studaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentmark`
--

DROP TABLE IF EXISTS `studentmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentmark` (
  `tam` int DEFAULT NULL,
  `eng` int DEFAULT NULL,
  `maths` int DEFAULT NULL,
  `Total` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_ID` FOREIGN KEY (`ID`) REFERENCES `students` (`ID`),
  CONSTRAINT `check_marks` CHECK (((`tam` <= 100) and (`eng` <= 100) and (`maths` <= 100)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentmark`
--

LOCK TABLES `studentmark` WRITE;
/*!40000 ALTER TABLE `studentmark` DISABLE KEYS */;
INSERT INTO `studentmark` VALUES (89,90,98,277,92.33,101),(93,87,98,278,92.67,102),(79,60,58,197,65.67,104),(59,60,98,217,72.33,109),(99,87,78,264,88.00,111),(99,90,88,277,92.33,201);
/*!40000 ALTER TABLE `studentmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `StudentName` varchar(20) DEFAULT NULL,
  `Department` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=702 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (101,'Ramesh','computer'),(102,'Jamal','Physics'),(104,'Harish','computer'),(109,'Donald Trump','Mech'),(111,'Ravi','Physical'),(201,'Kaviya','ECE'),(204,'leo dass','computer'),(301,'rajesh','EEE'),(701,'dinesh','EEE');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `highestmarkstudent`
--

/*!50001 DROP VIEW IF EXISTS `highestmarkstudent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `highestmarkstudent` AS select `a`.`ID` AS `Id`,`a`.`StudentName` AS `StudentName`,`a`.`Department` AS `Department`,`b`.`Total` AS `Total` from (`students` `a` join `studentmark` `b` on((`a`.`ID` = `b`.`ID`))) order by `b`.`Total` desc limit 0,1 */;
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

-- Dump completed on 2025-02-08 13:54:11
