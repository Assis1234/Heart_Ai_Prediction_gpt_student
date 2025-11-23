-- MySQL dump 10.13  Distrib 9.3.0, for macos15 (arm64)
--
-- Host: localhost    Database: heart_patient
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `doctor_shared_data`
--

DROP TABLE IF EXISTS `doctor_shared_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_shared_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(255) DEFAULT NULL,
  `doctor_name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `cp` int DEFAULT NULL,
  `trestbps` int DEFAULT NULL,
  `chol` int DEFAULT NULL,
  `fbs` int DEFAULT NULL,
  `restecg` int DEFAULT NULL,
  `thalach` int DEFAULT NULL,
  `exang` int DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_shared_data`
--

LOCK TABLES `doctor_shared_data` WRITE;
/*!40000 ALTER TABLE `doctor_shared_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_shared_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'John','Doe','doctor@gmail.com','doctor123','2025-11-22 05:35:24');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `age` int NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `chest_pain_type` varchar(50) DEFAULT NULL,
  `resting_bp` int DEFAULT NULL,
  `cholesterol` int DEFAULT NULL,
  `fbs` varchar(30) DEFAULT NULL,
  `ecg` varchar(50) DEFAULT NULL,
  `max_hr` int DEFAULT NULL,
  `ex_angina` enum('Yes','No') DEFAULT NULL,
  `result` varchar(70) DEFAULT NULL,
  `appointment_date` datetime DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  UNIQUE KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,NULL,NULL,45,'Male','Typical Angina',130,220,'0','Normal',150,'No','Normal','2025-11-25 10:30:00',NULL),(2,NULL,2,17,'Male','Typical Angina',107,144,'Fasting BP > 120 mg/dl','Normal',177,'Yes','You have Symptoms of heart disease. Please consult the Doctor',NULL,NULL),(3,NULL,2,17,'Male','Typical Angina',101,125,'Fasting BP > 120 mg/dl','Normal',175,'Yes','You have Symptoms of heart disease. Please consult the Doctor',NULL,NULL),(4,NULL,2,17,'Male','Typical Angina',101,125,'Fasting BP > 120 mg/dl','Normal',175,'Yes','You have Symptoms of heart disease. Please consult the Doctor',NULL,NULL),(5,NULL,2,17,'Male','Typical Angina',100,145,'Fasting BP > 120 mg/dl','Normal',154,'Yes','You have Symptoms of heart disease. Please consult the Doctor',NULL,NULL),(6,NULL,2,17,'Male','Typical Angina',100,145,'Fasting BP > 120 mg/dl','Normal',154,'Yes','You have Symptoms of heart disease. Please consult the Doctor',NULL,NULL),(7,NULL,2,17,'Male','Typical Angina',100,145,'Fasting BP > 120 mg/dl','Normal',154,'Yes','You have Symptoms of heart disease. Please consult the Doctor',NULL,NULL),(8,NULL,2,17,'Male','Typical Angina',102,145,'Fasting BP > 120 mg/dl','Normal',175,'No','You have Symptoms of heart disease. Please consult the Doctor','2025-12-01 13:00:00',1),(9,NULL,NULL,17,'Male','Typical Angina',80,100,'Fasting BP > 120 mg/dl','Normal',60,'No','You do not have any Symptoms of heart disease',NULL,1),(100,NULL,NULL,17,'Male','Typical Angina',80,100,'Fasting BP > 120 mg/dl','Normal',60,'No','You do not have any Symptoms of heart disease',NULL,1),(110,'muhammad',NULL,17,'Male','Typical Angina',80,100,'Fasting BP > 120 mg/dl','Normal',60,'No','You do not have any Symptoms of heart disease','2025-11-30 04:30:00',1),(111,'muhammad',NULL,17,'Male','Typical Angina',80,100,'Fasting BP > 120 mg/dl','Normal',60,'No','You do not have any Symptoms of heart disease',NULL,1),(112,'muhammad',NULL,17,'Male','Typical Angina',80,100,'Fasting BP > 120 mg/dl','Normal',60,'No','You do not have any Symptoms of heart disease',NULL,1),(113,'muhammad',NULL,17,'Male','Typical Angina',80,100,'Fasting BP > 120 mg/dl','Normal',60,'No','You do not have any Symptoms of heart disease',NULL,1),(114,'muhammad',NULL,17,'Male','Typical Angina',80,100,'Fasting BP > 120 mg/dl','Normal',60,'No','You do not have any Symptoms of heart disease',NULL,1),(115,'muhammad',NULL,17,'Male','Typical Angina',80,100,'Fasting BP > 120 mg/dl','Normal',60,'No','You do not have any Symptoms of heart disease','2025-11-30 18:48:00',1),(116,'muhammad',NULL,17,'Male','Typical Angina',81,100,'Fasting BP > 120 mg/dl','Normal',60,'No','You do not have any Symptoms of heart disease','2025-12-01 15:00:00',1),(117,'muhammad',NULL,17,'Male','Typical Angina',109,127,'Fasting BP > 120 mg/dl','Normal',175,'No','You have Symptoms of heart disease. Please consult the Doctor','2025-12-01 12:30:00',1);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_shared_data`
--

DROP TABLE IF EXISTS `patient_shared_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_shared_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `sent_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cp` varchar(50) NOT NULL,
  `trestbps` float NOT NULL,
  `chol` float NOT NULL,
  `fbs` varchar(50) NOT NULL,
  `restecg` varchar(50) NOT NULL,
  `thalach` float NOT NULL,
  `exang` varchar(10) NOT NULL,
  `result` varchar(255) NOT NULL,
  `appointment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `fk_doctor` (`doctor_id`),
  CONSTRAINT `fk_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `patient_shared_data_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_shared_data`
--

LOCK TABLES `patient_shared_data` WRITE;
/*!40000 ALTER TABLE `patient_shared_data` DISABLE KEYS */;
INSERT INTO `patient_shared_data` VALUES (1,1,1,'2025-11-22 06:40:28','3',120,230,'0','1',150,'0','Test result: No heart disease','2025-11-30T12:30'),(2,1,1,'2025-11-22 06:45:04','Typical Angina',120,230,'Normal','ST-T Abnormality',150,'No','Patient seems stable','2025-11-30T12:30'),(7,1,1,'2025-11-22 09:46:48','Typical Angina',120,230,'False','Normal',150,'No','You do not have any Symptoms of heart disease',NULL);
/*!40000 ALTER TABLE `patient_shared_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `second_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(10) NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `diabetic` varchar(5) NOT NULL,
  `alcoholic` varchar(5) NOT NULL,
  `exercise` varchar(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Test','Patient','1990-01-01',33,'Male',175,70,'No','No','Yes','testuser','test123'),(2,'muhammad ','saad','2007-12-11',17,'Male',166,65,'Yes','Yes','Yes','muhammad','87654321'),(3,'srishanth','babu','2007-06-06',18,'Male',159,45,'No','No','Yes','srishanth','1234234');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PREDICTIONS`
--

DROP TABLE IF EXISTS `PREDICTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PREDICTIONS` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `cp` varchar(50) DEFAULT NULL,
  `trestbps` varchar(50) DEFAULT NULL,
  `chol` varchar(50) DEFAULT NULL,
  `fbs` varchar(50) DEFAULT NULL,
  `restecg` varchar(50) DEFAULT NULL,
  `thalach` varchar(50) DEFAULT NULL,
  `exang` varchar(10) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `predictions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PREDICTIONS`
--

LOCK TABLES `PREDICTIONS` WRITE;
/*!40000 ALTER TABLE `PREDICTIONS` DISABLE KEYS */;
INSERT INTO `PREDICTIONS` VALUES (1,2,'1','8390','234253','0','0','354','1','You dont have any Symptoms of the heart disease','2025-11-22 04:59:33'),(2,2,'3','85','120','0','0','60','0','You have Symptoms of getting heart disease. Please consult the Doctor','2025-11-22 05:04:18'),(3,2,'3','81','120','0','0','180','0','You have Symptoms of getting heart disease. Please consult the Doctor','2025-11-22 05:05:04'),(4,2,'1','97','163','0','0','150','1','You have Symptoms of getting heart disease. Please consult the Doctor','2025-11-22 05:37:31'),(5,2,'0','81','134','1','1','175','1','You do not have any Symptoms of heart disease','2025-11-22 08:35:51'),(6,2,'0','81','134','1','1','175','1','You do not have any Symptoms of heart disease','2025-11-22 08:41:04'),(7,2,'0','81','134','1','1','175','1','You do not have any Symptoms of heart disease','2025-11-22 08:41:06'),(8,2,'1','101','134','1','1','175','1','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 08:50:38'),(9,2,'1','101','134','1','1','175','1','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 08:50:40'),(10,2,'Atypical Angina','101','134','Fasting BP < 120 mg/dl','ST-T Abnormality','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 08:55:54'),(11,2,'Atypical Angina','101','134','Fasting BP < 120 mg/dl','ST-T Abnormality','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 08:56:19'),(12,2,'Atypical Angina','101','134','Fasting BP < 120 mg/dl','ST-T Abnormality','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 08:56:36'),(13,2,'Typical Angina','102','134','Fasting BP < 120 mg/dl','ST-T Abnormality','175','Yes','You do not have any Symptoms of heart disease','2025-11-22 09:06:18'),(14,2,'Typical Angina','102','134','Fasting BP < 120 mg/dl','ST-T Abnormality','175','Yes','You do not have any Symptoms of heart disease','2025-11-22 09:17:33'),(15,2,'Typical Angina','102','134','Fasting BP < 120 mg/dl','ST-T Abnormality','175','Yes','You do not have any Symptoms of heart disease','2025-11-22 09:19:33'),(16,2,'Typical Angina','102','134','Fasting BP < 120 mg/dl','ST-T Abnormality','175','Yes','You do not have any Symptoms of heart disease','2025-11-22 09:19:35'),(17,2,'Typical Angina','102','134','Fasting BP < 120 mg/dl','ST-T Abnormality','175','Yes','You do not have any Symptoms of heart disease','2025-11-22 09:19:43'),(18,2,'Typical Angina','102','134','Fasting BP < 120 mg/dl','ST-T Abnormality','175','Yes','You do not have any Symptoms of heart disease','2025-11-22 09:20:11'),(19,2,'Typical Angina','102','134','Fasting BP < 120 mg/dl','ST-T Abnormality','175','Yes','You do not have any Symptoms of heart disease','2025-11-22 10:39:44'),(20,2,'1','102','134','1','1','175','1','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 10:53:49'),(21,2,'1','102','134','1','1','175','1','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 10:53:54'),(22,2,'1','102','134','1','1','175','1','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 10:55:38'),(23,2,'1','102','134','1','1','174','1','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:01:10'),(24,2,'1','102','134','1','1','174','1','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:01:12'),(25,2,'1','102','134','1','1','174','1','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:04:36'),(26,2,'1','102','134','1','1','174','1','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:04:38'),(27,2,'Typical Angina','120','134','Fasting BP > 120 mg/dl','Normal','175','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:19:07'),(28,2,'Typical Angina','120','134','Fasting BP > 120 mg/dl','Normal','175','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:19:09'),(29,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','175','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:20:32'),(30,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','175','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:20:37'),(31,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:23:39'),(32,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:30:14'),(33,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:30:21'),(34,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:31:53'),(35,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:32:46'),(36,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:32:52'),(37,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:33:02'),(38,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:34:02'),(39,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:34:30'),(40,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:35:07'),(41,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:35:16'),(42,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:35:35'),(43,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:36:08'),(44,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','180','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 11:36:23'),(45,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 12:14:13'),(46,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 12:14:21'),(47,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 12:14:32'),(48,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 12:27:48'),(49,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 13:08:17'),(50,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 13:21:35'),(51,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','No','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 13:21:40'),(52,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 13:23:21'),(53,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 13:23:23'),(54,2,'Typical Angina','102','134','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 13:26:23'),(55,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:00:28'),(56,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:02:25'),(57,2,'Typical Angina','102','134','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:17:17'),(58,2,'Typical Angina','102','134','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:22:03'),(59,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:25:41'),(60,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:25:44'),(61,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:26:39'),(62,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:26:41'),(63,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:29:53'),(64,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:32:04'),(65,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:32:09'),(66,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:32:13'),(67,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:35:40'),(68,2,'Typical Angina','102','134','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:40:22'),(69,2,'Typical Angina','102','134','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:40:57'),(70,2,'Typical Angina','102','134','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:41:01'),(71,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:45:17'),(72,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:45:24'),(73,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:45:52'),(74,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:50:15'),(75,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:55:35'),(76,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:56:42'),(77,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:56:45'),(78,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:56:50'),(79,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 14:59:20'),(80,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 15:12:59'),(81,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 15:14:31'),(82,2,'Typical Angina','102','134','Fasting BP > 120 mg/dl','Normal','185','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 15:20:33'),(83,2,'Typical Angina','102','134','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 15:35:35'),(84,2,'Typical Angina','102','134','Fasting BP > 120 mg/dl','Normal','185','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 15:37:55'),(85,2,'Typical Angina','102','134','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 15:47:00'),(86,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:42:03'),(87,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:45:49'),(88,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:46:24'),(89,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:46:38'),(90,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:46:53'),(91,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:49:42'),(92,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:50:27'),(93,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:50:33'),(94,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:50:38'),(95,2,'Typical Angina','102','134','Fasting BP > 120 mg/dl','Normal','185','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:51:04'),(96,2,'Typical Angina','102','134','Fasting BP > 120 mg/dl','Normal','185','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:51:15'),(97,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:52:36'),(98,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:53:52'),(99,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','185','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:58:27'),(100,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','185','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:58:33'),(101,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','185','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:59:07'),(102,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','185','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 16:59:59'),(103,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','185','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:03:17'),(104,2,'Typical Angina','102','135','Fasting BP > 120 mg/dl','Normal','185','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:05:15'),(105,2,'Typical Angina','107','147','Fasting BP > 120 mg/dl','Normal','177','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:23:22'),(106,2,'Typical Angina','107','147','Fasting BP > 120 mg/dl','Normal','177','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:24:20'),(107,2,'Typical Angina','107','144','Fasting BP > 120 mg/dl','Normal','177','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:25:38'),(108,2,'Typical Angina','107','144','Fasting BP > 120 mg/dl','Normal','177','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:28:04'),(109,2,'Typical Angina','107','144','Fasting BP > 120 mg/dl','Normal','177','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:28:38'),(110,2,'Typical Angina','107','144','Fasting BP > 120 mg/dl','Normal','177','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:29:10'),(111,2,'Typical Angina','101','125','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:42:32'),(112,2,'Typical Angina','101','125','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:43:26'),(113,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:53:23'),(114,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:54:38'),(115,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:54:48'),(116,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:54:51'),(117,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:55:01'),(118,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:56:16'),(119,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:56:27'),(120,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:58:11'),(121,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:58:31'),(122,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 17:59:19'),(123,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 18:03:33'),(124,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 18:05:02'),(125,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 18:05:18'),(126,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 18:06:24'),(127,2,'Typical Angina','100','145','Fasting BP > 120 mg/dl','Normal','154','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 18:06:46'),(128,2,'Typical Angina','102','145','Fasting BP > 120 mg/dl','Normal','165','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 18:08:34'),(129,2,'Typical Angina','102','145','Fasting BP > 120 mg/dl','Normal','165','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 18:13:42'),(130,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 18:57:01'),(131,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 18:57:10'),(132,2,'Typical Angina','102','145','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-22 19:08:03'),(133,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 20:05:09'),(134,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 20:07:09'),(135,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 20:10:22'),(136,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 20:21:55'),(137,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 20:33:15'),(138,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 20:45:22'),(139,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 20:50:18'),(140,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 20:53:35'),(141,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 20:55:11'),(142,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 20:58:27'),(143,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 21:07:25'),(144,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 21:33:29'),(145,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 21:42:09'),(146,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 21:45:47'),(147,2,'Typical Angina','80','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 23:05:49'),(148,2,'Typical Angina','81','100','Fasting BP > 120 mg/dl','Normal','60','Yes','You do not have any Symptoms of heart disease','2025-11-22 23:07:15'),(149,2,'Typical Angina','109','127','Fasting BP > 120 mg/dl','Normal','175','Yes','You have Symptoms of heart disease. Please consult the Doctor','2025-11-23 05:34:57');
/*!40000 ALTER TABLE `PREDICTIONS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-23 12:37:39
