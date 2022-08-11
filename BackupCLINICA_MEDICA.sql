CREATE DATABASE  IF NOT EXISTS `clinica_medica` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `clinica_medica`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: clinica_medica
-- ------------------------------------------------------
-- Server version	5.1.34-community

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
-- Table structure for table `plano_saude`
--

DROP TABLE IF EXISTS `plano_saude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plano_saude` (
  `Cod_Plano` int(4) NOT NULL AUTO_INCREMENT,
  `Nome_Plano` varchar(300) NOT NULL,
  PRIMARY KEY (`Cod_Plano`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano_saude`
--

LOCK TABLES `plano_saude` WRITE;
/*!40000 ALTER TABLE `plano_saude` DISABLE KEYS */;
INSERT INTO `plano_saude` VALUES (1,'UNIMED'),(2,'AMIL'),(3,'GEAP'),(4,'ALIANCA'),(5,'PARTICULAR'),(6,'BRADESCO'),(7,'GOLDEN CROSS');
/*!40000 ALTER TABLE `plano_saude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico` (
  `CRM` int(4) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(300) NOT NULL,
  `Cod_Especialidade` int(4) NOT NULL,
  `Endereco` varchar(300) DEFAULT NULL,
  `Telefone` decimal(10,0) NOT NULL,
  PRIMARY KEY (`CRM`),
  KEY `Cod_Especialidade` (`Cod_Especialidade`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`Cod_Especialidade`) REFERENCES `especialidade` (`Cod_Especialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'João Paulo',3,'',33227695),(2,'Miriam Ribeiro',7,'',33214559),(3,'Andre Nascimento',8,'',33450897),(4,'Abelardo Assis',6,'',33227695),(5,'Melissa Bastos',1,'',33254089),(6,'Teobaldo Freitas',2,'Rua Armindo Dias, n 74',32610511),(7,'Antonio João',4,'',33091695),(8,'Acacia Santana',5,'',32113365),(9,'Dilma Rabelo',9,'',32345681),(10,'Drauzio Varella',11,'',33212344);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `Cod_Paciente` int(4) NOT NULL AUTO_INCREMENT,
  `Nome_Paciente` varchar(50) NOT NULL,
  `Endereco` varchar(300) NOT NULL,
  `Telefone` decimal(10,0) NOT NULL,
  `Cod_Plano` int(4) NOT NULL,
  PRIMARY KEY (`Cod_Paciente`),
  KEY `Cod_Plano` (`Cod_Plano`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`Cod_Plano`) REFERENCES `plano_saude` (`Cod_Plano`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (2,'Ana Maria','Rua das Ostras, s/n',33446688,1),(3,'Raul Seixas','Rua Maluco Beleza, n 11',33676608,7),(4,'Bob Marley','Rua da Noia, n 10',33876688,4),(5,'Dave Grohl','Travessa B, s/n',33446688,2),(6,'Eddie Vedder','Rua A, n 1000',28766808,3),(7,'Aguns Young','Travessa Wass, n 121',34127690,3),(8,'Alanis Morissette','Rua Andreaza, n 1010',28762354,1),(9,'Romer Simpson','Rua da Ladeira, n 1',3866800,6);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exames`
--

DROP TABLE IF EXISTS `exames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exames` (
  `Cod_Exame` int(4) NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(50) NOT NULL,
  `Descricao` varchar(500) NOT NULL,
  PRIMARY KEY (`Cod_Exame`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exames`
--

LOCK TABLES `exames` WRITE;
/*!40000 ALTER TABLE `exames` DISABLE KEYS */;
INSERT INTO `exames` VALUES (1,'Imagem','Ultrasonografia'),(2,'Radiologia','Raio X'),(3,'Video','Endoscopia'),(4,'Clinico','Sangue'),(5,'Clinico','Anti-Alergico'),(6,'Clinico','Urina');
/*!40000 ALTER TABLE `exames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `Cod_Consulta` int(4) NOT NULL AUTO_INCREMENT,
  `Cod_Paciente` int(4) NOT NULL,
  `CRM` int(4) NOT NULL,
  `Data` date NOT NULL,
  `Horario` decimal(4,0) NOT NULL,
  `Prescricao` varchar(500) DEFAULT NULL,
  `Cod_Exame` int(4) DEFAULT NULL,
  PRIMARY KEY (`Cod_Consulta`),
  KEY `Cod_Paciente` (`Cod_Paciente`),
  KEY `Cod_Exame` (`Cod_Exame`),
  KEY `CRM` (`CRM`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`Cod_Paciente`) REFERENCES `paciente` (`Cod_Paciente`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`Cod_Exame`) REFERENCES `exames` (`Cod_Exame`),
  CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`CRM`) REFERENCES `medico` (`CRM`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,2,4,'2012-12-10',800,'',NULL),(39,3,4,'2012-04-01',830,'',NULL),(40,6,1,'2012-11-10',800,'',NULL),(41,7,10,'2012-01-10',1400,'',NULL),(42,8,3,'2012-02-11',845,'',NULL),(43,5,5,'2012-09-22',1045,'',3),(44,4,2,'2012-09-22',1500,'',5),(45,2,4,'2012-03-10',1100,'',1),(46,3,1,'2012-09-12',930,'',2);
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidade` (
  `Cod_Especialidade` int(4) NOT NULL AUTO_INCREMENT,
  `Nome_Especialidade` varchar(300) NOT NULL,
  PRIMARY KEY (`Cod_Especialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (1,'Angiologia'),(2,'Cardiologia'),(3,'Dermatologia'),(4,'Gastrologia'),(5,'Alergia e Imunologia'),(6,'Cirurgia Geral'),(7,'Otorrinolaringologia'),(8,'Pedriatria'),(9,'Oncologia'),(10,'Ortopedia'),(11,'Urologia'),(12,'Fonoaudiologia'),(13,'Nutricao'),(14,'Ortopedia'),(15,'Oftalmologia');
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-09 21:04:25
