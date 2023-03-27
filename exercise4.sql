-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: exercise4
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Appointement`
--

DROP TABLE IF EXISTS `Appointement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Appointement` (
  `idAppointement` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Time` varchar(45) NOT NULL,
  `Patient_idPatient` int(11) NOT NULL,
  `Doctor_IdDoctor` int(11) NOT NULL,
  PRIMARY KEY (`idAppointement`),
  UNIQUE KEY `idAppointement_UNIQUE` (`idAppointement`),
  KEY `fk_Appointement_Patient1_idx` (`Patient_idPatient`),
  KEY `fk_Appointement_Doctor1_idx` (`Doctor_IdDoctor`),
  CONSTRAINT `fk_Appointement_Doctor1` FOREIGN KEY (`Doctor_IdDoctor`) REFERENCES `Doctor` (`IdDoctor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointement_Patient1` FOREIGN KEY (`Patient_idPatient`) REFERENCES `Patient` (`idPatient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointement`
--

LOCK TABLES `Appointement` WRITE;
/*!40000 ALTER TABLE `Appointement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Appointement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bill` (
  `idBill` int(11) NOT NULL AUTO_INCREMENT,
  `Total` int(10) unsigned NOT NULL,
  `Patient_idPatient` int(11) NOT NULL,
  PRIMARY KEY (`idBill`,`Patient_idPatient`),
  UNIQUE KEY `idBill_UNIQUE` (`idBill`),
  KEY `fk_Bill_Patient1_idx` (`Patient_idPatient`),
  CONSTRAINT `fk_Bill_Patient1` FOREIGN KEY (`Patient_idPatient`) REFERENCES `Patient` (`idPatient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill`
--

LOCK TABLES `Bill` WRITE;
/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `IdDoctor` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Phone_number` varchar(45) DEFAULT NULL,
  `Salary` float unsigned DEFAULT NULL,
  `Specialist_idSpecialist` int(11) NOT NULL,
  `Specialist_idSpecialist1` int(11) NOT NULL,
  PRIMARY KEY (`IdDoctor`,`Specialist_idSpecialist`),
  UNIQUE KEY `IdDoctor_UNIQUE` (`IdDoctor`),
  KEY `fk_Doctor_Specialist1_idx` (`Specialist_idSpecialist1`),
  CONSTRAINT `fk_Doctor_Medical1` FOREIGN KEY (`IdDoctor`) REFERENCES `Medical` (`idMedical`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_Specialist1` FOREIGN KEY (`Specialist_idSpecialist1`) REFERENCES `Specialist` (`idSpecialist`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medical`
--

DROP TABLE IF EXISTS `Medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medical` (
  `idMedical` int(11) NOT NULL AUTO_INCREMENT,
  `Overtime_rate` float unsigned DEFAULT NULL,
  PRIMARY KEY (`idMedical`),
  UNIQUE KEY `idMedical_UNIQUE` (`idMedical`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medical`
--

LOCK TABLES `Medical` WRITE;
/*!40000 ALTER TABLE `Medical` DISABLE KEYS */;
/*!40000 ALTER TABLE `Medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `idPatient` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Phone_number` varchar(45) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  PRIMARY KEY (`idPatient`),
  UNIQUE KEY `idPatient_UNIQUE` (`idPatient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `idPayment` int(11) NOT NULL AUTO_INCREMENT,
  `Details` varchar(45) DEFAULT NULL,
  `Method` enum('Cash','Credit','Debit','Payconiq') NOT NULL,
  PRIMARY KEY (`idPayment`),
  UNIQUE KEY `idPayment_UNIQUE` (`idPayment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment_has_Bill`
--

DROP TABLE IF EXISTS `Payment_has_Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment_has_Bill` (
  `Payment_idPayment` int(11) NOT NULL,
  `Bill_idBill` int(11) NOT NULL,
  PRIMARY KEY (`Payment_idPayment`,`Bill_idBill`),
  KEY `fk_Payment_has_Bill_Bill1_idx` (`Bill_idBill`),
  KEY `fk_Payment_has_Bill_Payment_idx` (`Payment_idPayment`),
  CONSTRAINT `fk_Payment_has_Bill_Bill1` FOREIGN KEY (`Bill_idBill`) REFERENCES `Bill` (`idBill`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_has_Bill_Payment` FOREIGN KEY (`Payment_idPayment`) REFERENCES `Payment` (`idPayment`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment_has_Bill`
--

LOCK TABLES `Payment_has_Bill` WRITE;
/*!40000 ALTER TABLE `Payment_has_Bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payment_has_Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specialist`
--

DROP TABLE IF EXISTS `Specialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Specialist` (
  `idSpecialist` int(11) NOT NULL AUTO_INCREMENT,
  `Field_area` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSpecialist`),
  UNIQUE KEY `idSpecialist_UNIQUE` (`idSpecialist`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specialist`
--

LOCK TABLES `Specialist` WRITE;
/*!40000 ALTER TABLE `Specialist` DISABLE KEYS */;
/*!40000 ALTER TABLE `Specialist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-27 21:50:01
