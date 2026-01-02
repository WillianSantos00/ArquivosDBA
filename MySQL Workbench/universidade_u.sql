-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: universidade_u
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `idaluno` int NOT NULL AUTO_INCREMENT,
  `sexo` char(1) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `nome` varchar(25) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `ativo_sn` int DEFAULT '1',
  PRIMARY KEY (`idaluno`),
  UNIQUE KEY `uc_aluno_cpf` (`cpf`),
  UNIQUE KEY `uc_aluno_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'M','jose@teste.com.br','José','222.222.222-22','1985-06-01',1),(2,'F','maria@teste.com.br','Maria','111.111.111-11','1979-12-10',1),(3,'F','rosa@teste.com.br','Rosa','333.333.333-33','1990-12-22',1),(4,'M','joao@teste.com.br','João','444.444.444-44','1970-08-05',1),(5,'M','pedro@teste.com.br','Pedro','555.555.555-55','1967-07-02',1),(6,'F','bianca@teste.com.br','Bianca','666.666.666-66','1995-11-22',1),(7,'M','jorge@teste.com.br','Jorge','777.777.777-77','1989-01-06',1),(8,'F','mariana@teste.com.br','Mariana','888.888.888-88','1980-01-30',1),(9,'M','antonio@teste.com.br','Antônio','999.999.999-99','1991-12-03',1);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_curso`
--

DROP TABLE IF EXISTS `aluno_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_curso` (
  `fk_idaluno` int NOT NULL,
  `fk_idcurso` int NOT NULL,
  `data_inscricao_curso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_pago_curso` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`fk_idaluno`,`fk_idcurso`,`data_inscricao_curso`),
  KEY `fk_curso_aluno` (`fk_idcurso`),
  CONSTRAINT `fk_aluno_curso` FOREIGN KEY (`fk_idaluno`) REFERENCES `aluno` (`idaluno`),
  CONSTRAINT `fk_curso_aluno` FOREIGN KEY (`fk_idcurso`) REFERENCES `curso` (`idcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_curso`
--

LOCK TABLES `aluno_curso` WRITE;
/*!40000 ALTER TABLE `aluno_curso` DISABLE KEYS */;
INSERT INTO `aluno_curso` VALUES (1,2,'2019-01-07 12:00:00',NULL),(2,3,'2019-01-12 17:30:00',NULL),(3,1,'2019-01-09 09:45:00',NULL),(4,4,'2019-02-01 13:20:00',NULL);
/*!40000 ALTER TABLE `aluno_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boleto`
--

DROP TABLE IF EXISTS `boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boleto` (
  `idboleto` int NOT NULL AUTO_INCREMENT,
  `fk_idcontrato` int DEFAULT NULL,
  `data_vencimento` date NOT NULL,
  `valor` float NOT NULL,
  `numero_parcela` int NOT NULL,
  PRIMARY KEY (`idboleto`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleto`
--

LOCK TABLES `boleto` WRITE;
/*!40000 ALTER TABLE `boleto` DISABLE KEYS */;
INSERT INTO `boleto` VALUES (1,1,'2019-02-07',125,1),(2,1,'2019-03-07',125,2),(3,1,'2019-04-07',125,3),(4,1,'2019-05-07',125,4),(5,1,'2019-06-07',125,5),(6,1,'2019-07-07',125,6),(7,1,'2019-08-07',125,7),(8,1,'2019-09-07',125,8),(9,1,'2019-10-07',125,9),(10,1,'2019-11-07',125,10),(11,1,'2019-12-07',125,11),(12,1,'2020-01-07',125,12),(13,2,'2019-02-12',108.333,1),(14,2,'2019-03-12',108.333,2),(15,2,'2019-04-12',108.333,3),(16,2,'2019-05-12',108.333,4),(17,2,'2019-06-12',108.333,5),(18,2,'2019-07-12',108.333,6),(19,2,'2019-08-12',108.333,7),(20,2,'2019-09-12',108.333,8),(21,2,'2019-10-12',108.333,9),(22,2,'2019-11-12',108.333,10),(23,2,'2019-12-12',108.333,11),(24,2,'2020-01-12',108.333,12),(25,3,'2019-02-09',90,1),(26,3,'2019-03-09',90,2),(27,3,'2019-04-09',90,3),(28,3,'2019-05-09',90,4),(29,3,'2019-06-09',90,5),(30,3,'2019-07-09',90,6),(31,3,'2019-08-09',90,7),(32,3,'2019-09-09',90,8),(33,3,'2019-10-09',90,9),(34,3,'2019-11-09',90,10),(35,4,'2019-03-01',200,1),(36,4,'2019-04-01',200,2),(37,4,'2019-05-01',200,3),(38,4,'2019-06-01',200,4),(39,4,'2019-07-01',200,5),(40,4,'2019-08-01',200,6),(41,4,'2019-09-01',200,7),(42,4,'2019-10-01',200,8),(43,4,'2019-11-01',200,9),(44,4,'2019-12-01',200,10);
/*!40000 ALTER TABLE `boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendario` (
  `idcalendario` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `dia` int NOT NULL,
  `mes` int NOT NULL,
  `ano` int NOT NULL,
  `feriado` enum('s','n') DEFAULT NULL,
  `nome_feriado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcalendario`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
INSERT INTO `calendario` VALUES (1,'2025-01-01',1,1,2025,'s','Confraternização Universal'),(2,'2025-01-02',2,1,2025,'n',NULL),(3,'2025-01-03',3,1,2025,'n',NULL),(4,'2025-01-04',4,1,2025,'n',NULL),(5,'2025-01-05',5,1,2025,'n',NULL),(6,'2025-01-06',6,1,2025,'n',NULL),(7,'2025-01-07',7,1,2025,'n',NULL),(8,'2025-01-08',8,1,2025,'n',NULL),(9,'2025-01-09',9,1,2025,'n',NULL),(10,'2025-01-10',10,1,2025,'n',NULL),(11,'2025-01-11',11,1,2025,'n',NULL),(12,'2025-01-12',12,1,2025,'n',NULL),(13,'2025-01-13',13,1,2025,'n',NULL),(14,'2025-01-14',14,1,2025,'n',NULL),(15,'2025-01-15',15,1,2025,'n',NULL),(16,'2025-01-16',16,1,2025,'n',NULL),(17,'2025-01-17',17,1,2025,'n',NULL),(18,'2025-01-18',18,1,2025,'n',NULL),(19,'2025-01-19',19,1,2025,'n',NULL),(20,'2025-01-20',20,1,2025,'n',NULL),(21,'2025-01-21',21,1,2025,'n',NULL),(22,'2025-01-22',22,1,2025,'n',NULL),(23,'2025-01-23',23,1,2025,'n',NULL),(24,'2025-01-24',24,1,2025,'n',NULL),(25,'2025-01-25',25,1,2025,'n',NULL),(26,'2025-01-26',26,1,2025,'n',NULL),(27,'2025-01-27',27,1,2025,'n',NULL),(28,'2025-01-28',28,1,2025,'n',NULL),(29,'2025-01-29',29,1,2025,'n',NULL),(30,'2025-01-30',30,1,2025,'n',NULL),(31,'2025-01-31',31,1,2025,'n',NULL),(32,'2025-02-01',1,2,2025,'n',NULL),(33,'2025-02-02',2,2,2025,'n',NULL),(34,'2025-02-03',3,2,2025,'n',NULL),(35,'2025-02-04',4,2,2025,'n',NULL),(36,'2025-02-05',5,2,2025,'n',NULL),(37,'2025-02-06',6,2,2025,'n',NULL),(38,'2025-02-07',7,2,2025,'n',NULL),(39,'2025-02-08',8,2,2025,'n',NULL),(40,'2025-02-09',9,2,2025,'n',NULL),(41,'2025-02-10',10,2,2025,'n',NULL),(42,'2025-02-11',11,2,2025,'n',NULL),(43,'2025-02-12',12,2,2025,'n',NULL),(44,'2025-02-13',13,2,2025,'n',NULL),(45,'2025-02-14',14,2,2025,'n',NULL),(46,'2025-02-15',15,2,2025,'n',NULL),(47,'2025-02-16',16,2,2025,'n',NULL),(48,'2025-02-17',17,2,2025,'n',NULL),(49,'2025-02-18',18,2,2025,'n',NULL),(50,'2025-02-19',19,2,2025,'n',NULL),(51,'2025-02-20',20,2,2025,'n',NULL),(52,'2025-02-21',21,2,2025,'n',NULL),(53,'2025-02-22',22,2,2025,'n',NULL),(54,'2025-02-23',23,2,2025,'n',NULL),(55,'2025-02-24',24,2,2025,'n',NULL),(56,'2025-02-25',25,2,2025,'n',NULL),(57,'2025-02-26',26,2,2025,'n',NULL),(58,'2025-02-27',27,2,2025,'n',NULL),(59,'2025-02-28',28,2,2025,'n',NULL),(60,'2025-03-01',1,3,2025,'n',NULL),(61,'2025-03-02',2,3,2025,'n',NULL),(62,'2025-03-03',3,3,2025,'s','Carnaval'),(63,'2025-03-04',4,3,2025,'s','Carnaval'),(64,'2025-03-05',5,3,2025,'s','Quarta-Feira de Cinzas'),(65,'2025-03-06',6,3,2025,'n',NULL),(66,'2025-03-07',7,3,2025,'n',NULL),(67,'2025-03-08',8,3,2025,'n',NULL),(68,'2025-03-09',9,3,2025,'n',NULL),(69,'2025-03-10',10,3,2025,'n',NULL),(70,'2025-03-11',11,3,2025,'n',NULL),(71,'2025-03-12',12,3,2025,'n',NULL),(72,'2025-03-13',13,3,2025,'n',NULL),(73,'2025-03-14',14,3,2025,'n',NULL),(74,'2025-03-15',15,3,2025,'n',NULL),(75,'2025-03-16',16,3,2025,'n',NULL),(76,'2025-03-17',17,3,2025,'n',NULL),(77,'2025-03-18',18,3,2025,'n',NULL),(78,'2025-03-19',19,3,2025,'n',NULL),(79,'2025-03-20',20,3,2025,'n',NULL),(80,'2025-03-21',21,3,2025,'n',NULL),(81,'2025-03-22',22,3,2025,'n',NULL),(82,'2025-03-23',23,3,2025,'n',NULL),(83,'2025-03-24',24,3,2025,'n',NULL),(84,'2025-03-25',25,3,2025,'n',NULL),(85,'2025-03-26',26,3,2025,'n',NULL),(86,'2025-03-27',27,3,2025,'n',NULL),(87,'2025-03-28',28,3,2025,'n',NULL),(88,'2025-03-29',29,3,2025,'n',NULL),(89,'2025-03-30',30,3,2025,'n',NULL),(90,'2025-03-31',31,3,2025,'n',NULL),(91,'2025-04-01',1,4,2025,'n',NULL),(92,'2025-04-02',2,4,2025,'n',NULL),(93,'2025-04-03',3,4,2025,'n',NULL),(94,'2025-04-04',4,4,2025,'n',NULL),(95,'2025-04-05',5,4,2025,'n',NULL),(96,'2025-04-06',6,4,2025,'n',NULL),(97,'2025-04-07',7,4,2025,'n',NULL),(98,'2025-04-08',8,4,2025,'n',NULL),(99,'2025-04-09',9,4,2025,'n',NULL),(100,'2025-04-10',10,4,2025,'n',NULL),(101,'2025-04-11',11,4,2025,'n',NULL),(102,'2025-04-12',12,4,2025,'n',NULL),(103,'2025-04-13',13,4,2025,'n',NULL),(104,'2025-04-14',14,4,2025,'n',NULL),(105,'2025-04-15',15,4,2025,'n',NULL),(106,'2025-04-16',16,4,2025,'n',NULL),(107,'2025-04-17',17,4,2025,'n',NULL),(108,'2025-04-18',18,4,2025,'s','Sexta-feira Santa'),(109,'2025-04-19',19,4,2025,'n',NULL),(110,'2025-04-20',20,4,2025,'s','Páscoa'),(111,'2025-04-21',21,4,2025,'s','Tiradentes'),(112,'2025-04-22',22,4,2025,'n',NULL),(113,'2025-04-23',23,4,2025,'n',NULL),(114,'2025-04-24',24,4,2025,'n',NULL),(115,'2025-04-25',25,4,2025,'n',NULL),(116,'2025-04-26',26,4,2025,'n',NULL),(117,'2025-04-27',27,4,2025,'n',NULL),(118,'2025-04-28',28,4,2025,'n',NULL),(119,'2025-04-29',29,4,2025,'n',NULL),(120,'2025-04-30',30,4,2025,'n',NULL),(121,'2025-05-01',1,5,2025,'s','Dia do Trabalho'),(122,'2025-05-02',2,5,2025,'n',NULL),(123,'2025-05-03',3,5,2025,'n',NULL),(124,'2025-05-04',4,5,2025,'n',NULL),(125,'2025-05-05',5,5,2025,'n',NULL),(126,'2025-05-06',6,5,2025,'n',NULL),(127,'2025-05-07',7,5,2025,'n',NULL),(128,'2025-05-08',8,5,2025,'n',NULL),(129,'2025-05-09',9,5,2025,'n',NULL),(130,'2025-05-10',10,5,2025,'n',NULL),(131,'2025-05-11',11,5,2025,'n',NULL),(132,'2025-05-12',12,5,2025,'n',NULL),(133,'2025-05-13',13,5,2025,'n',NULL),(134,'2025-05-14',14,5,2025,'n',NULL),(135,'2025-05-15',15,5,2025,'n',NULL),(136,'2025-05-16',16,5,2025,'n',NULL),(137,'2025-05-17',17,5,2025,'n',NULL),(138,'2025-05-18',18,5,2025,'n',NULL),(139,'2025-05-19',19,5,2025,'n',NULL),(140,'2025-05-20',20,5,2025,'n',NULL),(141,'2025-05-21',21,5,2025,'n',NULL),(142,'2025-05-22',22,5,2025,'n',NULL),(143,'2025-05-23',23,5,2025,'n',NULL),(144,'2025-05-24',24,5,2025,'n',NULL),(145,'2025-05-25',25,5,2025,'n',NULL),(146,'2025-05-26',26,5,2025,'n',NULL),(147,'2025-05-27',27,5,2025,'n',NULL),(148,'2025-05-28',28,5,2025,'n',NULL),(149,'2025-05-29',29,5,2025,'n',NULL),(150,'2025-05-30',30,5,2025,'n',NULL),(151,'2025-05-31',31,5,2025,'n',NULL),(152,'2025-06-01',1,6,2025,'n',NULL),(153,'2025-06-02',2,6,2025,'n',NULL),(154,'2025-06-03',3,6,2025,'n',NULL),(155,'2025-06-04',4,6,2025,'n',NULL),(156,'2025-06-05',5,6,2025,'n',NULL),(157,'2025-06-06',6,6,2025,'n',NULL),(158,'2025-06-07',7,6,2025,'n',NULL),(159,'2025-06-08',8,6,2025,'n',NULL),(160,'2025-06-09',9,6,2025,'n',NULL),(161,'2025-06-10',10,6,2025,'n',NULL),(162,'2025-06-11',11,6,2025,'n',NULL),(163,'2025-06-12',12,6,2025,'n',NULL),(164,'2025-06-13',13,6,2025,'n',NULL),(165,'2025-06-14',14,6,2025,'n',NULL),(166,'2025-06-15',15,6,2025,'n',NULL),(167,'2025-06-16',16,6,2025,'n',NULL),(168,'2025-06-17',17,6,2025,'n',NULL),(169,'2025-06-18',18,6,2025,'n',NULL),(170,'2025-06-19',19,6,2025,'s','Corpus Chirsti'),(171,'2025-06-20',20,6,2025,'n',NULL),(172,'2025-06-21',21,6,2025,'n',NULL),(173,'2025-06-22',22,6,2025,'n',NULL),(174,'2025-06-23',23,6,2025,'n',NULL),(175,'2025-06-24',24,6,2025,'n',NULL),(176,'2025-06-25',25,6,2025,'n',NULL),(177,'2025-06-26',26,6,2025,'n',NULL),(178,'2025-06-27',27,6,2025,'n',NULL),(179,'2025-06-28',28,6,2025,'n',NULL),(180,'2025-06-29',29,6,2025,'n',NULL),(181,'2025-06-30',30,6,2025,'n',NULL),(182,'2025-07-01',1,7,2025,'n',NULL),(183,'2025-07-02',2,7,2025,'n',NULL),(184,'2025-07-03',3,7,2025,'n',NULL),(185,'2025-07-04',4,7,2025,'n',NULL),(186,'2025-07-05',5,7,2025,'n',NULL),(187,'2025-07-06',6,7,2025,'n',NULL),(188,'2025-07-07',7,7,2025,'n',NULL),(189,'2025-07-08',8,7,2025,'n',NULL),(190,'2025-07-09',9,7,2025,'n',NULL),(191,'2025-07-10',10,7,2025,'n',NULL),(192,'2025-07-11',11,7,2025,'n',NULL),(193,'2025-07-12',12,7,2025,'n',NULL),(194,'2025-07-13',13,7,2025,'n',NULL),(195,'2025-07-14',14,7,2025,'n',NULL),(196,'2025-07-15',15,7,2025,'n',NULL),(197,'2025-07-16',16,7,2025,'n',NULL),(198,'2025-07-17',17,7,2025,'n',NULL),(199,'2025-07-18',18,7,2025,'n',NULL),(200,'2025-07-19',19,7,2025,'n',NULL),(201,'2025-07-20',20,7,2025,'n',NULL),(202,'2025-07-21',21,7,2025,'n',NULL),(203,'2025-07-22',22,7,2025,'n',NULL),(204,'2025-07-23',23,7,2025,'n',NULL),(205,'2025-07-24',24,7,2025,'n',NULL),(206,'2025-07-25',25,7,2025,'n',NULL),(207,'2025-07-26',26,7,2025,'n',NULL),(208,'2025-07-27',27,7,2025,'n',NULL),(209,'2025-07-28',28,7,2025,'n',NULL),(210,'2025-07-29',29,7,2025,'n',NULL),(211,'2025-07-30',30,7,2025,'n',NULL),(212,'2025-07-31',31,7,2025,'n',NULL),(213,'2025-08-01',1,8,2025,'n',NULL),(214,'2025-08-02',2,8,2025,'n',NULL),(215,'2025-08-03',3,8,2025,'n',NULL),(216,'2025-08-04',4,8,2025,'n',NULL),(217,'2025-08-05',5,8,2025,'n',NULL),(218,'2025-08-06',6,8,2025,'n',NULL),(219,'2025-08-07',7,8,2025,'n',NULL),(220,'2025-08-08',8,8,2025,'n',NULL),(221,'2025-08-09',9,8,2025,'n',NULL),(222,'2025-08-10',10,8,2025,'n',NULL),(223,'2025-08-11',11,8,2025,'n',NULL),(224,'2025-08-12',12,8,2025,'n',NULL),(225,'2025-08-13',13,8,2025,'n',NULL),(226,'2025-08-14',14,8,2025,'n',NULL),(227,'2025-08-15',15,8,2025,'n',NULL),(228,'2025-08-16',16,8,2025,'n',NULL),(229,'2025-08-17',17,8,2025,'n',NULL),(230,'2025-08-18',18,8,2025,'n',NULL),(231,'2025-08-19',19,8,2025,'n',NULL),(232,'2025-08-20',20,8,2025,'n',NULL),(233,'2025-08-21',21,8,2025,'n',NULL),(234,'2025-08-22',22,8,2025,'n',NULL),(235,'2025-08-23',23,8,2025,'n',NULL),(236,'2025-08-24',24,8,2025,'n',NULL),(237,'2025-08-25',25,8,2025,'n',NULL),(238,'2025-08-26',26,8,2025,'n',NULL),(239,'2025-08-27',27,8,2025,'n',NULL),(240,'2025-08-28',28,8,2025,'n',NULL),(241,'2025-08-29',29,8,2025,'n',NULL),(242,'2025-08-30',30,8,2025,'n',NULL),(243,'2025-08-31',31,8,2025,'n',NULL),(244,'2025-09-01',1,9,2025,'n',NULL),(245,'2025-09-02',2,9,2025,'n',NULL),(246,'2025-09-03',3,9,2025,'n',NULL),(247,'2025-09-04',4,9,2025,'n',NULL),(248,'2025-09-05',5,9,2025,'n',NULL),(249,'2025-09-06',6,9,2025,'n',NULL),(250,'2025-09-07',7,9,2025,'s','Dia da Independência'),(251,'2025-09-08',8,9,2025,'n',NULL),(252,'2025-09-09',9,9,2025,'n',NULL),(253,'2025-09-10',10,9,2025,'n',NULL),(254,'2025-09-11',11,9,2025,'n',NULL),(255,'2025-09-12',12,9,2025,'n',NULL),(256,'2025-09-13',13,9,2025,'n',NULL),(257,'2025-09-14',14,9,2025,'n',NULL),(258,'2025-09-15',15,9,2025,'n',NULL),(259,'2025-09-16',16,9,2025,'n',NULL),(260,'2025-09-17',17,9,2025,'n',NULL),(261,'2025-09-18',18,9,2025,'n',NULL),(262,'2025-09-19',19,9,2025,'n',NULL),(263,'2025-09-20',20,9,2025,'n',NULL),(264,'2025-09-21',21,9,2025,'n',NULL),(265,'2025-09-22',22,9,2025,'n',NULL),(266,'2025-09-23',23,9,2025,'n',NULL),(267,'2025-09-24',24,9,2025,'n',NULL),(268,'2025-09-25',25,9,2025,'n',NULL),(269,'2025-09-26',26,9,2025,'n',NULL),(270,'2025-09-27',27,9,2025,'n',NULL),(271,'2025-09-28',28,9,2025,'n',NULL),(272,'2025-09-29',29,9,2025,'n',NULL),(273,'2025-09-30',30,9,2025,'n',NULL),(274,'2025-10-01',1,10,2025,'n',NULL),(275,'2025-10-02',2,10,2025,'n',NULL),(276,'2025-10-03',3,10,2025,'n',NULL),(277,'2025-10-04',4,10,2025,'n',NULL),(278,'2025-10-05',5,10,2025,'n',NULL),(279,'2025-10-06',6,10,2025,'n',NULL),(280,'2025-10-07',7,10,2025,'n',NULL),(281,'2025-10-08',8,10,2025,'n',NULL),(282,'2025-10-09',9,10,2025,'n',NULL),(283,'2025-10-10',10,10,2025,'n',NULL),(284,'2025-10-11',11,10,2025,'n',NULL),(285,'2025-10-12',12,10,2025,'s','Nossa Senhora Aparecida'),(286,'2025-10-13',13,10,2025,'n',NULL),(287,'2025-10-14',14,10,2025,'n',NULL),(288,'2025-10-15',15,10,2025,'n',NULL),(289,'2025-10-16',16,10,2025,'n',NULL),(290,'2025-10-17',17,10,2025,'n',NULL),(291,'2025-10-18',18,10,2025,'n',NULL),(292,'2025-10-19',19,10,2025,'n',NULL),(293,'2025-10-20',20,10,2025,'n',NULL),(294,'2025-10-21',21,10,2025,'n',NULL),(295,'2025-10-22',22,10,2025,'n',NULL),(296,'2025-10-23',23,10,2025,'n',NULL),(297,'2025-10-24',24,10,2025,'n',NULL),(298,'2025-10-25',25,10,2025,'n',NULL),(299,'2025-10-26',26,10,2025,'n',NULL),(300,'2025-10-27',27,10,2025,'n',NULL),(301,'2025-10-28',28,10,2025,'n',NULL),(302,'2025-10-29',29,10,2025,'n',NULL),(303,'2025-10-30',30,10,2025,'n',NULL),(304,'2025-10-31',31,10,2025,'n',NULL),(305,'2025-11-01',1,11,2025,'n',NULL),(306,'2025-11-02',2,11,2025,'s','Finados'),(307,'2025-11-03',3,11,2025,'n',NULL),(308,'2025-11-04',4,11,2025,'n',NULL),(309,'2025-11-05',5,11,2025,'n',NULL),(310,'2025-11-06',6,11,2025,'n',NULL),(311,'2025-11-07',7,11,2025,'n',NULL),(312,'2025-11-08',8,11,2025,'n',NULL),(313,'2025-11-09',9,11,2025,'n',NULL),(314,'2025-11-10',10,11,2025,'n',NULL),(315,'2025-11-11',11,11,2025,'n',NULL),(316,'2025-11-12',12,11,2025,'n',NULL),(317,'2025-11-13',13,11,2025,'n',NULL),(318,'2025-11-14',14,11,2025,'n',NULL),(319,'2025-11-15',15,11,2025,'s','Proclamação da República'),(320,'2025-11-16',16,11,2025,'n',NULL),(321,'2025-11-17',17,11,2025,'n',NULL),(322,'2025-11-18',18,11,2025,'n',NULL),(323,'2025-11-19',19,11,2025,'n',NULL),(324,'2025-11-20',20,11,2025,'s','Consciência Negra'),(325,'2025-11-21',21,11,2025,'n',NULL),(326,'2025-11-22',22,11,2025,'n',NULL),(327,'2025-11-23',23,11,2025,'n',NULL),(328,'2025-11-24',24,11,2025,'n',NULL),(329,'2025-11-25',25,11,2025,'n',NULL),(330,'2025-11-26',26,11,2025,'n',NULL),(331,'2025-11-27',27,11,2025,'n',NULL),(332,'2025-11-28',28,11,2025,'n',NULL),(333,'2025-11-29',29,11,2025,'n',NULL),(334,'2025-11-30',30,11,2025,'n',NULL),(335,'2025-12-01',1,12,2025,'n',NULL),(336,'2025-12-02',2,12,2025,'n',NULL),(337,'2025-12-03',3,12,2025,'n',NULL),(338,'2025-12-04',4,12,2025,'n',NULL),(339,'2025-12-05',5,12,2025,'n',NULL),(340,'2025-12-06',6,12,2025,'n',NULL),(341,'2025-12-07',7,12,2025,'n',NULL),(342,'2025-12-08',8,12,2025,'n',NULL),(343,'2025-12-09',9,12,2025,'n',NULL),(344,'2025-12-10',10,12,2025,'n',NULL),(345,'2025-12-11',11,12,2025,'n',NULL),(346,'2025-12-12',12,12,2025,'n',NULL),(347,'2025-12-13',13,12,2025,'n',NULL),(348,'2025-12-14',14,12,2025,'n',NULL),(349,'2025-12-15',15,12,2025,'n',NULL),(350,'2025-12-16',16,12,2025,'n',NULL),(351,'2025-12-17',17,12,2025,'n',NULL),(352,'2025-12-18',18,12,2025,'n',NULL),(353,'2025-12-19',19,12,2025,'n',NULL),(354,'2025-12-20',20,12,2025,'n',NULL),(355,'2025-12-21',21,12,2025,'n',NULL),(356,'2025-12-22',22,12,2025,'n',NULL),(357,'2025-12-23',23,12,2025,'n',NULL),(358,'2025-12-24',24,12,2025,'n',NULL),(359,'2025-12-25',25,12,2025,'s','Natal'),(360,'2025-12-26',26,12,2025,'n',NULL),(361,'2025-12-27',27,12,2025,'n',NULL),(362,'2025-12-28',28,12,2025,'n',NULL),(363,'2025-12-29',29,12,2025,'n',NULL),(364,'2025-12-30',30,12,2025,'n',NULL),(365,'2025-12-31',31,12,2025,'n',NULL);
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `idcontrato` int NOT NULL AUTO_INCREMENT,
  `fk_idaluno` int NOT NULL,
  `fk_idcurso` int NOT NULL,
  `fk_data_inscricao_curso` datetime NOT NULL,
  `valor_total_curso` float NOT NULL,
  `desconto` float NOT NULL DEFAULT '0',
  `numero_parcelas` int NOT NULL,
  `processado` enum('n','s') DEFAULT 'n',
  PRIMARY KEY (`idcontrato`),
  KEY `fk_contrato_aluno_curso` (`fk_idaluno`,`fk_idcurso`,`fk_data_inscricao_curso`),
  CONSTRAINT `fk_contrato_aluno_curso` FOREIGN KEY (`fk_idaluno`, `fk_idcurso`, `fk_data_inscricao_curso`) REFERENCES `aluno_curso` (`fk_idaluno`, `fk_idcurso`, `data_inscricao_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,1,2,'2019-01-07 12:00:00',1500,0,12,'s'),(2,2,3,'2019-01-12 17:30:00',1300,0,12,'s'),(3,3,1,'2019-01-09 09:45:00',900,0,10,'s'),(4,4,4,'2019-02-01 13:20:00',2000,0,10,'s');
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `idcurso` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'NodeJS e MongoDB'),(2,'Web Completo 2019'),(3,'ES6, TypeScript e Angular'),(4,'React Native'),(5,'Bancos de Dados Relacionais');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `iddisciplina` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `carga_horaria` int DEFAULT NULL,
  `fk_idprofessor` int DEFAULT NULL,
  `fk_idcurso` int DEFAULT NULL,
  PRIMARY KEY (`iddisciplina`),
  KEY `fk_curso_disciplina` (`fk_idcurso`),
  KEY `fk_disciplina_professor` (`fk_idprofessor`),
  CONSTRAINT `fk_curso_disciplina` FOREIGN KEY (`fk_idcurso`) REFERENCES `curso` (`idcurso`),
  CONSTRAINT `fk_disciplina_professor` FOREIGN KEY (`fk_idprofessor`) REFERENCES `professor` (`idprofessor`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'HTML',4,5,2),(2,'CSS',3,NULL,2),(3,'Bootstrap',5,5,2),(4,'JavaScript',10,NULL,2),(5,'PHP',15,NULL,2),(6,'NodeJS',8,3,1),(7,'MongoDB',6,3,1),(8,'Express',4,3,NULL),(9,'ES6',7,3,3),(10,'TypeScript',4,3,3),(11,'Orientada a Objetos',5,NULL,3),(12,'Angular',20,4,3),(13,'ES6',7,3,NULL),(14,'Ract Native',7,8,4),(15,'Redux',4,8,4),(16,'MySQL',7,NULL,5);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `idendereco` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `fk_idaluno` int DEFAULT NULL,
  PRIMARY KEY (`idendereco`),
  UNIQUE KEY `uc_endereco_fkidaluno` (`fk_idaluno`),
  CONSTRAINT `fk_aluno_endereco` FOREIGN KEY (`fk_idaluno`) REFERENCES `aluno` (`idaluno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Rua 9','nº 9',NULL,'Bairro 9','São Paulo','SP',9),(2,'Rua 5','nº 5',NULL,'Bairro 5','Belo Horizonte','MG',5),(3,'Rua 3','nº 3',NULL,'Bairro 3','Natal','RN',3),(4,'Rua 8','nº 8',NULL,'Bairro 8','Rio de Janeiro','RJ',8),(5,'Rua 4','nº 4',NULL,'Bairro 4','Fortaleza','CE',4),(6,'Rua 1','nº 1',NULL,'Bairro 1','Manaus','AM',1),(7,'Rua 7','nº 7',NULL,'Bairro 7','Goiânia','GO',7),(8,'Rua 2','nº 2',NULL,'Bairro 2','Florianópolis','SC',2),(9,'Rua 6','nº 6',NULL,'Bairro 6','Vitória','ES',6);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `idfuncionario` int NOT NULL AUTO_INCREMENT,
  `matricula` int DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `funcao` varchar(50) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `Salario` float DEFAULT NULL,
  `fk_idfuncionario_supervisor` int DEFAULT NULL,
  PRIMARY KEY (`idfuncionario`),
  KEY `fk_funcionario_supervisor` (`fk_idfuncionario_supervisor`),
  CONSTRAINT `fk_funcionario_supervisor` FOREIGN KEY (`fk_idfuncionario_supervisor`) REFERENCES `funcionario` (`idfuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,1,'Alana','Assistente Administrativo','11 98888-7777',NULL,NULL),(2,2,'Elton','Auxiliar Contabil','11 3333-4444',NULL,NULL),(3,3,'Rubens','Gerente Administrativo','11 3333-7777',6000,NULL),(5,5,'Marcela','Diretor TI','11 7777-9999',12000,NULL);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_before_insert_funcionario` BEFORE INSERT ON `funcionario` FOR EACH ROW begin
 
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo) 
    values
    (null, 'BI', null, NEW.Funcao, null, NEW.telefone);
 
 end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_after_insert_funcionario` AFTER INSERT ON `funcionario` FOR EACH ROW begin
 
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo) 
    values
    (new.matricula, 'AI', null, NEW.Funcao, null, NEW.telefone);
 
 end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_before_update_funcionario` BEFORE UPDATE ON `funcionario` FOR EACH ROW begin
 
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo) 
    values
    (null, 'BU', old.funcao, new.funcao, old.telefone, new.telefone);
 
 end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_after_update_funcionario` AFTER UPDATE ON `funcionario` FOR EACH ROW begin
 
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo, salario_antigo, salario_novo) 
    values
    (old.matricula, 'AU', old.funcao, new.funcao, old.telefone, new.telefone, old.salario, new.salario);
 
 end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_before_delete_funcionario` BEFORE DELETE ON `funcionario` FOR EACH ROW begin
 
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo) 
    values
    (null, 'BD', old.funcao, null, old.telefone, null);
 
 end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_after_delete_funcionario` AFTER DELETE ON `funcionario` FOR EACH ROW begin
 
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo) 
    values
    (old.matricula, 'AD', old.funcao, null, old.telefone, null);
 
 end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `funcionario_log`
--

DROP TABLE IF EXISTS `funcionario_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario_log` (
  `idfuncionario_log` int NOT NULL AUTO_INCREMENT,
  `fk_idfuncionario` int DEFAULT NULL,
  `matricula` int DEFAULT NULL,
  `data_log` datetime DEFAULT CURRENT_TIMESTAMP,
  `tipo_log` char(2) NOT NULL,
  `funcao_antiga` varchar(50) DEFAULT NULL,
  `funcao_nova` varchar(50) DEFAULT NULL,
  `telefone_antigo` varchar(20) DEFAULT NULL,
  `telefone_novo` varchar(20) DEFAULT NULL,
  `salario_antigo` float DEFAULT NULL,
  `salario_novo` float DEFAULT NULL,
  PRIMARY KEY (`idfuncionario_log`),
  KEY `fk_funcionario_funcionario_log` (`fk_idfuncionario`),
  CONSTRAINT `fk_funcionario_funcionario_log` FOREIGN KEY (`fk_idfuncionario`) REFERENCES `funcionario` (`idfuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario_log`
--

LOCK TABLES `funcionario_log` WRITE;
/*!40000 ALTER TABLE `funcionario_log` DISABLE KEYS */;
INSERT INTO `funcionario_log` VALUES (1,NULL,NULL,'2025-11-28 16:22:00','BI',NULL,'Assistente Administrativo',NULL,'11 3333-4444',NULL,NULL),(2,NULL,NULL,'2025-11-28 16:22:00','AI',NULL,'Assistente Administrativo',NULL,'11 3333-4444',NULL,NULL),(3,NULL,NULL,'2025-11-28 16:22:54','BI',NULL,'Gerente de Atendimento',NULL,'11 4444-4444',NULL,NULL),(4,NULL,NULL,'2025-11-28 16:22:54','AI',NULL,'Gerente de Atendimento',NULL,'11 4444-4444',NULL,NULL),(5,NULL,NULL,'2025-11-28 16:24:15','BI',NULL,'Técnico de Informática',NULL,'11 3333-3333',NULL,NULL),(6,NULL,NULL,'2025-11-28 16:24:15','AI',NULL,'Técnico de Informática',NULL,'11 3333-3333',NULL,NULL),(7,NULL,NULL,'2025-11-28 16:32:11','BI',NULL,'Auxiliar Contabil',NULL,'11 3333-4444',NULL,NULL),(8,NULL,NULL,'2025-11-28 16:32:11','AI',NULL,'Auxiliar Contabil',NULL,'11 3333-4444',NULL,NULL),(9,NULL,NULL,'2025-11-28 16:34:08','BI',NULL,'Assistente Administrativo',NULL,'11 98888-7777',NULL,NULL),(10,NULL,1,'2025-11-28 16:34:08','AI',NULL,'Assistente Administrativo',NULL,'11 98888-7777',NULL,NULL),(11,NULL,NULL,'2025-11-28 16:34:08','BI',NULL,'Auxiliar Contabil',NULL,'11 3333-4444',NULL,NULL),(12,NULL,2,'2025-11-28 16:34:08','AI',NULL,'Auxiliar Contabil',NULL,'11 3333-4444',NULL,NULL),(13,NULL,NULL,'2025-11-28 16:34:12','BI',NULL,'Assistente Administrativo',NULL,'11 3333-4444',NULL,NULL),(14,NULL,3,'2025-11-28 16:34:12','AI',NULL,'Assistente Administrativo',NULL,'11 3333-4444',NULL,NULL),(15,NULL,NULL,'2025-11-28 16:34:12','BI',NULL,'Gerente de Atendimento',NULL,'11 4444-4444',NULL,NULL),(16,NULL,4,'2025-11-28 16:34:12','AI',NULL,'Gerente de Atendimento',NULL,'11 4444-4444',NULL,NULL),(17,NULL,NULL,'2025-11-28 16:34:12','BI',NULL,'Técnico de Informática',NULL,'11 3333-3333',NULL,NULL),(18,NULL,5,'2025-11-28 16:34:12','AI',NULL,'Técnico de Informática',NULL,'11 3333-3333',NULL,NULL),(19,NULL,NULL,'2025-12-02 13:56:00','BD','Gerente de Atendimento',NULL,'11 4444-4444',NULL,NULL,NULL),(20,NULL,4,'2025-12-02 13:56:00','AD','Gerente de Atendimento',NULL,'11 4444-4444',NULL,NULL,NULL),(21,NULL,NULL,'2025-12-02 14:22:07','BU','Técnico de Informática','Gerente de TI','11 3333-3333','11 7777-1111',NULL,NULL),(22,NULL,NULL,'2025-12-02 14:22:41','BU','Gerente de TI','Diretor de TI','11 7777-1111','11 7777-9999',NULL,NULL),(23,NULL,NULL,'2025-12-02 14:39:42','BU','Diretor de TI','Diretor TI','11 7777-9999','11 7777-9999',NULL,NULL),(24,NULL,5,'2025-12-02 14:39:42','AU','Diretor de TI','Diretor TI','11 7777-9999','11 7777-9999',NULL,NULL),(25,NULL,NULL,'2025-12-02 14:40:33','BU','Diretor TI','Diretor TI','11 7777-9999','11 7777-9999',NULL,NULL),(26,NULL,5,'2025-12-02 14:40:33','AU','Diretor TI','Diretor TI','11 7777-9999','11 7777-9999',NULL,7000),(27,NULL,NULL,'2025-12-02 14:41:36','BU','Diretor TI','Diretor TI','11 7777-9999','11 7777-9999',NULL,NULL),(28,NULL,5,'2025-12-02 14:41:36','AU','Diretor TI','Diretor TI','11 7777-9999','11 7777-9999',7000,12000),(29,NULL,NULL,'2025-12-02 14:41:38','BU','Assistente Administrativo','Gerente Administrativo','11 3333-4444','11 3333-7777',NULL,NULL),(30,NULL,3,'2025-12-02 14:41:38','AU','Assistente Administrativo','Gerente Administrativo','11 3333-4444','11 3333-7777',NULL,6000);
/*!40000 ALTER TABLE `funcionario_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gasto`
--

DROP TABLE IF EXISTS `gasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gasto` (
  `idgasto` int NOT NULL AUTO_INCREMENT,
  `ano` int NOT NULL,
  `tipo` enum('previsto','realizado') NOT NULL,
  `jan` float(10,2) DEFAULT NULL,
  `fev` float(10,2) DEFAULT NULL,
  `mar` float(10,2) DEFAULT NULL,
  `abr` float(10,2) DEFAULT NULL,
  `mai` float(10,2) DEFAULT NULL,
  `jun` float(10,2) DEFAULT NULL,
  `jul` float(10,2) DEFAULT NULL,
  `ago` float(10,2) DEFAULT NULL,
  `set` float(10,2) DEFAULT NULL,
  `out` float(10,2) DEFAULT NULL,
  `nov` float(10,2) DEFAULT NULL,
  `dez` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`idgasto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gasto`
--

LOCK TABLES `gasto` WRITE;
/*!40000 ALTER TABLE `gasto` DISABLE KEYS */;
/*!40000 ALTER TABLE `gasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `idlog` int NOT NULL AUTO_INCREMENT,
  `log` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idlog`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'0 *** 1 - 1 - 2 - 2019-01-07 12:00:00 - 1500 - 0 - 12 - s'),(2,'0 *** 2 - 2 - 3 - 2019-01-12 17:30:00 - 1300 - 0 - 12 - s'),(3,'0 *** 3 - 3 - 1 - 2019-01-09 09:45:00 - 900 - 0 - 10 - s'),(4,'0 *** 4 - 4 - 4 - 2019-02-01 13:20:00 - 2000 - 0 - 10 - s');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `idprofessor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idprofessor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Laura','laura@teste.com.br'),(2,'Miguel','miguel@teste.com.br'),(3,'Sofia','sofia@teste.com.br'),(4,'Patrícia','patricia@teste.com.br'),(5,'Arthur','arthur@teste.com.br'),(6,'Breno','breno@teste.com.br'),(7,'Raquel','raquel@teste.com.br'),(8,'Hugo','hugo@teste.com.br'),(9,'Alex','alex@teste.com.br');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projeto` (
  `idcodigo` int NOT NULL AUTO_INCREMENT,
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`idcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto_funcionario`
--

DROP TABLE IF EXISTS `projeto_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projeto_funcionario` (
  `fk_idcodigo` int NOT NULL,
  `fk_idmatricula` int NOT NULL,
  `horas_estimadas` int NOT NULL,
  `horas_realizadas` int DEFAULT NULL,
  PRIMARY KEY (`fk_idcodigo`,`fk_idmatricula`),
  KEY `projeto_funcionario_ibfk_2` (`fk_idmatricula`),
  CONSTRAINT `projeto_funcionario_ibfk_1` FOREIGN KEY (`fk_idcodigo`) REFERENCES `projeto` (`idcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto_funcionario`
--

LOCK TABLES `projeto_funcionario` WRITE;
/*!40000 ALTER TABLE `projeto_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `projeto_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t1`
--

DROP TABLE IF EXISTS `t1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msg` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t1`
--

LOCK TABLES `t1` WRITE;
/*!40000 ALTER TABLE `t1` DISABLE KEYS */;
INSERT INTO `t1` VALUES (5,'a'),(15,'b'),(25,'c'),(40,'d'),(55,'e');
/*!40000 ALTER TABLE `t1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t2`
--

DROP TABLE IF EXISTS `t2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msg` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t2`
--

LOCK TABLES `t2` WRITE;
/*!40000 ALTER TABLE `t2` DISABLE KEYS */;
INSERT INTO `t2` VALUES (10,'a'),(25,'b'),(40,'c'),(55,'d'),(65,'e'),(85,'f'),(105,'g'),(115,'h');
/*!40000 ALTER TABLE `t2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `idtelefone` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) NOT NULL,
  `fk_idaluno` int NOT NULL,
  `tipo` enum('res','com','cel') NOT NULL,
  PRIMARY KEY (`idtelefone`),
  KEY `fk_aluno_telefone` (`fk_idaluno`),
  CONSTRAINT `fk_aluno_telefone` FOREIGN KEY (`fk_idaluno`) REFERENCES `aluno` (`idaluno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,'11 92222-2222',1,'cel'),(2,'11 3333-2222',1,'com'),(3,'31 5555-2222',5,'res'),(4,'21 4444-1111',8,'res'),(5,'21 91111-2222',1,'cel'),(6,'62 98888-7777',3,'cel'),(7,'62 4444-4444',3,'com'),(8,'62 6666-9999',3,'res'),(9,'27 95555-0000',6,'cel');
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_rel_aluno_curso_contrato`
--

DROP TABLE IF EXISTS `vw_rel_aluno_curso_contrato`;
/*!50001 DROP VIEW IF EXISTS `vw_rel_aluno_curso_contrato`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_rel_aluno_curso_contrato` AS SELECT 
 1 AS `idaluno`,
 1 AS `nome`,
 1 AS `idcurso`,
 1 AS `descricao`,
 1 AS `idcontrato`,
 1 AS `valor_total_curso`,
 1 AS `data_inscricao_curso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_rel_cursos_deisciplina_professores`
--

DROP TABLE IF EXISTS `vw_rel_cursos_deisciplina_professores`;
/*!50001 DROP VIEW IF EXISTS `vw_rel_cursos_deisciplina_professores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_rel_cursos_deisciplina_professores` AS SELECT 
 1 AS `idcurso`,
 1 AS `curso`,
 1 AS `iddisciplina`,
 1 AS `disciplina`,
 1 AS `carga_horaria`,
 1 AS `idprofessor`,
 1 AS `nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_rel_aluno_curso_contrato`
--

/*!50001 DROP VIEW IF EXISTS `vw_rel_aluno_curso_contrato`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rel_aluno_curso_contrato` AS select `a`.`idaluno` AS `idaluno`,`a`.`nome` AS `nome`,`c`.`idcurso` AS `idcurso`,`c`.`descricao` AS `descricao`,`co`.`idcontrato` AS `idcontrato`,`co`.`valor_total_curso` AS `valor_total_curso`,`ac`.`data_inscricao_curso` AS `data_inscricao_curso` from (((`aluno` `a` left join `aluno_curso` `ac` on((`a`.`idaluno` = `ac`.`fk_idaluno`))) left join `curso` `c` on((`c`.`idcurso` = `ac`.`fk_idcurso`))) left join `contrato` `co` on((`co`.`fk_idaluno` = `ac`.`fk_idaluno`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_rel_cursos_deisciplina_professores`
--

/*!50001 DROP VIEW IF EXISTS `vw_rel_cursos_deisciplina_professores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_rel_cursos_deisciplina_professores` AS select `c`.`idcurso` AS `idcurso`,`c`.`descricao` AS `curso`,`d`.`iddisciplina` AS `iddisciplina`,`d`.`descricao` AS `disciplina`,`d`.`carga_horaria` AS `carga_horaria`,`p`.`idprofessor` AS `idprofessor`,`p`.`nome` AS `nome` from ((`curso` `c` left join `disciplina` `d` on((`c`.`idcurso` = `d`.`fk_idcurso`))) left join `professor` `p` on((`d`.`fk_idprofessor` = `p`.`idprofessor`))) */;
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

-- Dump completed on 2025-12-05 16:48:30
