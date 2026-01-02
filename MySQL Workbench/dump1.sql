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

-- Dump completed on 2025-12-05 16:30:36
