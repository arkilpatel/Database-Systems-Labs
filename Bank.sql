-- MySQL dump 10.13  Distrib 5.6.27, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dbsta
-- ------------------------------------------------------
-- Server version	5.6.27-0ubuntu0.14.04.1

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
-- Table structure for table `ACCOUNT`
--
USE BANK;
DROP TABLE IF EXISTS `ACCOUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCOUNT` (
  `ACC_NO` varchar(20) NOT NULL DEFAULT '',
  `BALANCE` decimal(10,0) DEFAULT NULL,
  `BR_NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`ACC_NO`),
  KEY `BR_NAME` (`BR_NAME`),
  CONSTRAINT `ACCOUNT_ibfk_1` FOREIGN KEY (`BR_NAME`) REFERENCES `BRANCH` (`BRN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCOUNT`
--

LOCK TABLES `ACCOUNT` WRITE;
/*!40000 ALTER TABLE `ACCOUNT` DISABLE KEYS */;
INSERT INTO `ACCOUNT` VALUES ('20012023094',4000,'zone1'),('20012023095',4000,'zone1'),('20012023096',5000,'zone1'),('20012023097',10000,'zone2'),('20012023098',10000,'zone4'),('20012023046',6000,'zone6'),('20012033046',6000,'zone3'),('20112033046',7000,'zone9'),('20112023046',8000,'zone8'),('20012023047',9000,'zone7');
/*!40000 ALTER TABLE `ACCOUNT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSETS`
--

DROP TABLE IF EXISTS `ASSETS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSETS` (
  `BR_NAME` varchar(10) NOT NULL DEFAULT '',
  `FACILITIES` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`BR_NAME`,`FACILITIES`),
  CONSTRAINT `ASSETS_ibfk_1` FOREIGN KEY (`BR_NAME`) REFERENCES `BRANCH` (`BRN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSETS`
--

LOCK TABLES `ASSETS` WRITE;
/*!40000 ALTER TABLE `ASSETS` DISABLE KEYS */;
INSERT INTO `ASSETS` VALUES ('headoffice','fixeddeposit'),('headoffice','locker'),('headoffice','mobilebanking'),('headoffice','netbanking'),('zone1','fixeddeposit'),('zone1','mobilebanking'),('zone1','netbanking'),('zone2','fixeddeposit'),('zone2','netbanking'),('zone3','fixeddeposit'),('zone3','locker'),('zone3','netbanking'),('zone4','netbanking'),('zone5','locker'),('zone6','fixeddeposit'),('zone6','locker'),('zone7','locker'),('zone7','mobilebanking'),('zone8','locker'),('zone8','mobilebanking'),('zone9','locker');
/*!40000 ALTER TABLE `ASSETS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BORROWER`
--

DROP TABLE IF EXISTS `BORROWER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BORROWER` (
  `CUST_ID` char(5) NOT NULL,
  `LOAN_NO` varchar(30) NOT NULL,
  KEY `LOAN_NO` (`LOAN_NO`),
  KEY `CUST_ID` (`CUST_ID`),
  CONSTRAINT `BORROWER_ibfk_1` FOREIGN KEY (`LOAN_NO`) REFERENCES `LOAN` (`LN_NO`),
  CONSTRAINT `BORROWER_ibfk_2` FOREIGN KEY (`CUST_ID`) REFERENCES `CUSTOMER` (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BORROWER`
--

LOCK TABLES `BORROWER` WRITE;
/*!40000 ALTER TABLE `BORROWER` DISABLE KEYS */;
INSERT INTO `BORROWER` VALUES ('c1','car1'),('c2','car2'),('c2','hou1'),('c3','hou2'),('c4','hou2'),('c5','hou3'),('c5','hou4'),('c6','hou5'),('c1','hou5'),('c7','hou6'),('c8','hou6'),('c8','car4'),('c1','per2'),('c5','per3');
/*!40000 ALTER TABLE `BORROWER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BRANCH`
--

DROP TABLE IF EXISTS `BRANCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BRANCH` (
  `BRN_NAME` varchar(10) NOT NULL,
  `CITY` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BRN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BRANCH`
--

LOCK TABLES `BRANCH` WRITE;
/*!40000 ALTER TABLE `BRANCH` DISABLE KEYS */;
INSERT INTO `BRANCH` VALUES ('headoffice','Hyderabad'),('zone1','Vijayawada'),('zone2','Guntur'),('zone3','Eluru'),('zone4','Kakinada'),('zone5','Vizag'),('zone6','Vijayanagaram'),('zone7','Srikakulam'),('zone8','Tirupathi'),('zone9','Chittor');
/*!40000 ALTER TABLE `BRANCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `C_ID` char(5) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `STREET` varchar(25) DEFAULT NULL,
  `CITY` varchar(30) DEFAULT NULL,
  `GENDER` enum('f','F','m','M') DEFAULT NULL,
  UNIQUE KEY `C_ID` (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES ('c1','haritha','nalanda','machlipatnam','f'),('c2','himani','nalanda','machlipatnam','f'),('c3','shankar','kadamba','eluru','m'),('c4','saritha','kadamba','eluru','f'),('c5','sachitra','saraswathi','nandigama','f'),('c6','yogitha','kaveri','hyderabad','f'),('c7','radhika','kaveri','hyderabad','f'),('c8','ramu','azad','Vijayawada','m');
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPOSITOR`
--

DROP TABLE IF EXISTS `DEPOSITOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPOSITOR` (
  `CUST_ID` char(5) NOT NULL,
  `AC_NO` varchar(20) DEFAULT NULL,
  `ACCESS_DT` date DEFAULT NULL,
  KEY `CUST_ID` (`CUST_ID`),
  CONSTRAINT `DEPOSITOR_ibfk_1` FOREIGN KEY (`CUST_ID`) REFERENCES `CUSTOMER` (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPOSITOR`
--

LOCK TABLES `DEPOSITOR` WRITE;
/*!40000 ALTER TABLE `DEPOSITOR` DISABLE KEYS */;
INSERT INTO `DEPOSITOR` VALUES ('c1','20012023094','2012-05-30'),('c1','20012023094','2012-05-30'),('c1','20012023094','2012-05-30'),('c1','20012023094','2012-05-30'),('c2','20012023095','2012-05-29'),('c2','20012023095','2012-05-29'),('c2','20012023095','2012-05-29'),('c3','20012023096','2012-05-12'),('c3','20012023096','2012-05-12'),('c3','20012023096','2012-05-12'),('c4','20012023046','2012-03-12'),('c4','20012023046','2012-03-12'),('c5','20012033046','2012-01-01'),('c6','20112033046','2012-01-01');
/*!40000 ALTER TABLE `DEPOSITOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOAN`
--

DROP TABLE IF EXISTS `LOAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOAN` (
  `LN_NO` char(10) NOT NULL,
  `AMOUNT` decimal(10,0) DEFAULT NULL,
  `BR_NAME` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`LN_NO`),
  KEY `BR_NAME` (`BR_NAME`),
  CONSTRAINT `LOAN_ibfk_1` FOREIGN KEY (`BR_NAME`) REFERENCES `BRANCH` (`BRN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOAN`
--

LOCK TABLES `LOAN` WRITE;
/*!40000 ALTER TABLE `LOAN` DISABLE KEYS */;
INSERT INTO `LOAN` VALUES ('car1',500000,'zone6'),('car2',500000,'zone7'),('car3',500000,'zone6'),('car4',500000,'zone8'),('hou1',2000000,'zone1'),('hou2',4000000,'zone1'),('hou3',8000000,'zone5'),('hou4',8000000,'zone6'),('hou5',500000,'zone2'),('hou6',500000,'zone8'),('per1',6000000,'zone3'),('per2',6000000,'zone4'),('per3',6000000,'zone5'),('per4',500000,'zone2');
/*!40000 ALTER TABLE `LOAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENT`
--

DROP TABLE IF EXISTS `PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAYMENT` (
  `P_NO` varchar(10) NOT NULL DEFAULT '',
  `L_NO` varchar(20) NOT NULL DEFAULT '',
  `DATE` date DEFAULT NULL,
  `AMOUNT` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`L_NO`,`P_NO`),
  CONSTRAINT `PAYMENT_ibfk_1` FOREIGN KEY (`L_NO`) REFERENCES `LOAN` (`LN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENT`
--

LOCK TABLES `PAYMENT` WRITE;
/*!40000 ALTER TABLE `PAYMENT` DISABLE KEYS */;
INSERT INTO `PAYMENT` VALUES ('p1','car1','2011-01-09',1038714),('p2','car1','2000-01-09',1038714),('p3','car1','2011-01-01',3000),('p1','car2','2012-10-25',1038714),('p1','hou1','2011-10-08',5000),('p2','hou1','2011-10-09',5000),('p1','hou2','2011-10-11',5000),('p1','per1','2011-03-11',5000),('p2','per1','2012-03-11',5000),('p1','per2','2012-04-11',8000);
/*!40000 ALTER TABLE `PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-09 11:39:16


