CREATE DATABASE  IF NOT EXISTS `marketingmanagement` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `marketingmanagement`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: marketingmanagement
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `Address_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Vaillage` varchar(45) DEFAULT NULL,
  `Upazilla` varchar(45) DEFAULT NULL,
  `District` varchar(45) DEFAULT NULL,
  `Post_Code` varchar(45) DEFAULT NULL,
  `Emp_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Address_Id`),
  KEY `addEmp_idx` (`Emp_Id`),
  CONSTRAINT `addEmp` FOREIGN KEY (`Emp_Id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Bagura','Bagura Sadar','Rajshahi','90092',1),(2,'Durgapur','Kandirpar','Comilla','90015',2),(3,'Mirpur','Mirpur','Jessor','80015',3);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `A_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Emp_Id` int(11) DEFAULT NULL,
  `Emp_Name` varchar(45) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Present` int(11) DEFAULT NULL,
  `Absent` int(11) DEFAULT NULL,
  `Late` int(11) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`A_Id`),
  KEY `Attend_emp_idx` (`Emp_Id`),
  CONSTRAINT `Attend_emp` FOREIGN KEY (`Emp_Id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (29,1,'Rabiul','2016-10-24 00:00:00',1,0,0,'Present'),(30,2,'Din islam','2016-10-24 00:00:00',1,0,0,'Present'),(31,3,'Farid Ahmed','2016-10-24 00:00:00',1,0,0,'Present'),(32,4,'Irin Akter','2016-10-24 00:00:00',1,0,0,'Present'),(33,5,'Maruf Billah','2016-10-24 00:00:00',1,0,0,'Present'),(34,6,'Hafiz','2016-10-24 00:00:00',1,0,0,'Present'),(35,7,'Hanif','2016-10-24 00:00:00',1,0,0,'Present');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_ manager`
--

DROP TABLE IF EXISTS `b_ manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_ manager` (
  `BM_Id` int(11) NOT NULL AUTO_INCREMENT,
  `BM_Name` varchar(45) DEFAULT NULL,
  `Emp_Id` int(11) DEFAULT NULL,
  `Loc_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`BM_Id`),
  KEY `EmpBm_idx` (`Emp_Id`),
  KEY `LocBm_idx` (`Loc_Id`),
  CONSTRAINT `EmpBm` FOREIGN KEY (`Emp_Id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `LocBm` FOREIGN KEY (`Loc_Id`) REFERENCES `location` (`Loc_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_ manager`
--

LOCK TABLES `b_ manager` WRITE;
/*!40000 ALTER TABLE `b_ manager` DISABLE KEYS */;
INSERT INTO `b_ manager` VALUES (1,'Irin Akter',4,4);
/*!40000 ALTER TABLE `b_ manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `Cat_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cat_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Cat_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (30,'Electronics'),(31,'Food'),(33,'Soft Drinks');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctrl_access`
--

DROP TABLE IF EXISTS `ctrl_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctrl_access` (
  `Ctl_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Emp_Id` int(11) DEFAULT NULL,
  `Emp_Name` varchar(45) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `User_Role` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Ctl_Id`),
  KEY `ctrlEmp_idx` (`Emp_Id`),
  KEY `ctrlUser_idx` (`User_Id`),
  CONSTRAINT `ctrlEmp` FOREIGN KEY (`Emp_Id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ctrlUser` FOREIGN KEY (`User_Id`) REFERENCES `login` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctrl_access`
--

LOCK TABLES `ctrl_access` WRITE;
/*!40000 ALTER TABLE `ctrl_access` DISABLE KEYS */;
INSERT INTO `ctrl_access` VALUES (1,4,'Irin',1,'bm','active'),(2,6,'Hafiz',2,'dataentry','active'),(3,5,'Maruf Billah',3,'user','active'),(4,7,'Hanif',4,'user','active');
/*!40000 ALTER TABLE `ctrl_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Cust_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cust_Name` varchar(45) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `Shop_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Cust_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (50,'Tanvir Ahmed','Mirpur','Needs Everydays'),(51,'Anisur Ahmed','Dhanmondi','Laz shop'),(52,'Shipti Akter','Kalabagan','All Store Shop'),(53,'Kawser Ahmed','Kakrail','Liza Shop'),(54,'Razu Ahmed','Mohammadpur','Care\'s Shop');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(45) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `depMan_idx` (`manager_id`),
  KEY `depLoc_idx` (`location_id`),
  CONSTRAINT `depLoc` FOREIGN KEY (`location_id`) REFERENCES `location` (`Loc_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `depMan` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`M_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Marketing',1,1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `D_Id` int(11) NOT NULL AUTO_INCREMENT,
  `D_Name` varchar(45) DEFAULT NULL,
  `Emp_Id` int(11) DEFAULT NULL,
  `Supp_Id` int(11) DEFAULT NULL,
  `Loc_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`D_Id`),
  KEY `drvEmp_idx` (`Emp_Id`),
  KEY `drvLoc_idx` (`Loc_Id`),
  KEY `drvSupp_idx` (`Supp_Id`),
  CONSTRAINT `drvEmp` FOREIGN KEY (`Emp_Id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `drvLoc` FOREIGN KEY (`Loc_Id`) REFERENCES `location` (`Loc_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `drvSupp` FOREIGN KEY (`Supp_Id`) REFERENCES `supplier` (`Supp_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Emp_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Emp_Name` varchar(45) DEFAULT NULL,
  `Eamil` varchar(45) DEFAULT NULL,
  `Mobile` varchar(45) DEFAULT NULL,
  `Desgination` varchar(45) DEFAULT NULL,
  `Hire_Date` date DEFAULT NULL,
  `Job_Id` int(11) DEFAULT NULL,
  `Salary` double DEFAULT NULL,
  `Commission_Pct` double DEFAULT NULL,
  `Manager_Id` int(11) DEFAULT NULL,
  `Department_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Emp_Id`),
  UNIQUE KEY `Eamil_UNIQUE` (`Eamil`),
  KEY `empJob_idx` (`Job_Id`),
  KEY `empMan_idx` (`Manager_Id`),
  KEY `empDep_idx` (`Department_Id`),
  CONSTRAINT `empDep` FOREIGN KEY (`Department_Id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `empJob` FOREIGN KEY (`Job_Id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `empMan` FOREIGN KEY (`Manager_Id`) REFERENCES `manager` (`M_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Rabiul','rabu@gmail.com','01724486878','Manager','2014-02-01',NULL,NULL,NULL,NULL,NULL),(2,'Din islam','din@gmail.com','01724587541','Driver','2015-01-01',NULL,NULL,NULL,NULL,NULL),(3,'Farid Ahmed','w3farid@gmail.com','01724486878','Supervisor','2014-09-01',NULL,NULL,NULL,NULL,NULL),(4,'Irin Akter','irin@gmail.com','01013125413','BM','2016-09-14',NULL,NULL,NULL,NULL,NULL),(5,'Maruf Billah','maru3@gmail.com','01013125413','SR','2016-09-08',NULL,NULL,NULL,NULL,NULL),(6,'Hafiz','hafiz@gmail.com','017244868578','Data Entry','2015-02-01',NULL,NULL,NULL,NULL,NULL),(7,'Hanif','hanif@gmail.com','0124578956','SR','2015-02-04',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobhistory`
--

DROP TABLE IF EXISTS `jobhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobhistory` (
  `emp_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `jobhJob_idx` (`job_id`),
  KEY `jobDep_idx` (`department_id`),
  CONSTRAINT `jobDep` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobhEmp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobhJob` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobhistory`
--

LOCK TABLES `jobhistory` WRITE;
/*!40000 ALTER TABLE `jobhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_title` varchar(45) DEFAULT NULL,
  `min_salary` double DEFAULT NULL,
  `max_salary` double DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Manager',25000,50000);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `Loc_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Loc_Name` varchar(45) DEFAULT NULL,
  `Emp_Id` int(11) DEFAULT NULL,
  `regions_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Loc_Id`),
  KEY `locEmp_idx` (`Emp_Id`),
  KEY `locRegion_idx` (`regions_id`),
  CONSTRAINT `locEmp` FOREIGN KEY (`Emp_Id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `locRegion` FOREIGN KEY (`regions_id`) REFERENCES `regions` (`regions_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Mirpur',1,2),(2,'Dhanmondi',2,2),(3,'Mohammadpur',1,2),(4,'Kalabagan',3,2);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `Emp_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`User_Id`),
  KEY `LogEmp_idx` (`Emp_Id`),
  CONSTRAINT `LogEmp` FOREIGN KEY (`Emp_Id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'bm','bm',4),(2,'dataentry','dataentry',6),(3,'u1','u1',5),(4,'u2','u2',7);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `M_Id` int(11) NOT NULL AUTO_INCREMENT,
  `M_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`M_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'MD.Din Isalm'),(2,'MD.Farid'),(3,'MD.Robiul Islam'),(4,'MD.Jashim Uddin');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prices` (
  `Prices_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_Name` varchar(45) DEFAULT NULL,
  `Pur_Price` double DEFAULT NULL,
  `Sales_Price` double DEFAULT NULL,
  `Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Prices_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,'NCAFE',450,480,1),(2,'NIDO',500,600,2),(3,'Cerelac',600,700,3),(4,'BFCP',300,400,4),(5,'Kitkat',400,450,5),(6,'Horlicks',210,250,6),(7,'DCM',320,380,7),(8,'printer',450,480,8),(9,'Monitor',680,740,9),(10,'aram',1200,1400,10),(11,'tcpa',250,300,11),(12,'Sprite',30,80,12),(13,'Coca',20,100,13),(14,'Mrnda',40,120,14),(15,'Clemon',50,150,15);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `Pro_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_Name` varchar(45) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pro_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'NCAFE',18),(2,'NIDO',15),(3,'Cerelac',10),(4,'BFCP',10),(5,'Kitkat',20),(6,'Horlicks',50),(7,'DCM',20),(8,'printer',25),(9,'Monitor',20),(10,'aram',20),(11,'tcpa',50),(12,'Sprite',100),(13,'Coca',100),(14,'Mrnda',100),(15,'Clemon',50);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `Pur_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_Id` int(11) NOT NULL,
  `Pur_Name` varchar(45) NOT NULL,
  `SerialNo` varchar(45) NOT NULL,
  `Purchases_Date` date NOT NULL,
  `Price` double NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Total_Price` double NOT NULL,
  PRIMARY KEY (`Pur_Id`),
  UNIQUE KEY `SerialNo_UNIQUE` (`SerialNo`),
  KEY `Pro_ID_Emp_idx` (`Pro_Id`),
  CONSTRAINT `Pro_EM_Id_FK` FOREIGN KEY (`Pro_Id`) REFERENCES `product` (`Pro_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (11,1,'A','54','2016-09-03',6,8,36),(12,2,'B','45','2016-09-03',4,564,2256),(13,1,'A','33433545','2016-09-04',324,3,972),(14,3,'C','02145','2016-05-09',150,10,1500);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `marketingmanagement`.`purchases_BEFORE_INSERT` BEFORE INSERT ON `purchases` FOR EACH ROW
BEGIN
update product set stock=stock+new.Quantity where Pro_Id=new.Pro_Id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `marketingmanagement`.`purchases_AFTER_UPDATE` AFTER UPDATE ON `purchases` FOR EACH ROW
BEGIN
	update product set stock=stock+new.Quantity where Pro_Id=new.Pro_Id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `regions_id` int(11) NOT NULL AUTO_INCREMENT,
  `regions_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`regions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (2,'Bandar');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ROLE_ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `CODE` varchar(60) NOT NULL,
  `LABEL` varchar(100) NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  KEY `FK_USROLE` (`USER_ID`),
  CONSTRAINT `FK_USROLE` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `Salary_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Emp_Id` int(11) DEFAULT NULL,
  `Emp_Name` varchar(45) DEFAULT NULL,
  `Basic_Salary` double DEFAULT NULL,
  `Target` double DEFAULT NULL,
  `TaDa` double DEFAULT NULL,
  `Sr_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Salary_Id`),
  KEY `Emp_Salary_idx` (`Emp_Id`),
  KEY `Sr_Id_Salary_idx` (`Sr_Id`),
  CONSTRAINT `Emp_Salary` FOREIGN KEY (`Emp_Id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Sr_Id_Salary` FOREIGN KEY (`Sr_Id`) REFERENCES `sr` (`Sr_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `Sales_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_Id` int(11) DEFAULT NULL,
  `Pro_Name` varchar(45) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `Sell_Date` date DEFAULT NULL,
  `Emp_Id` int(11) DEFAULT NULL,
  `MemoNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sales_Id`),
  KEY `Pro_FK_Pro_Id_idx` (`Pro_Id`),
  KEY `Emp_id_SR_idx` (`Emp_Id`),
  CONSTRAINT `Emp_id_SR` FOREIGN KEY (`Emp_Id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Pro_FK_Pro_Id` FOREIGN KEY (`Pro_Id`) REFERENCES `product` (`Pro_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,'demo',0,0,0,'2016-09-04',1,1),(2,2,'NIDO',600,5,3000,'2016-09-04',5,2),(3,1,'NCAFE',480,8,3840,'2016-09-04',5,3),(4,2,'NIDO',600,4,2400,'2016-09-04',5,3),(5,3,'CERELAC',700,5,3500,'2016-09-04',5,3),(6,4,'BFCP',400,7,2800,'2016-09-04',5,3),(7,5,'KITKAT',450,6,2700,'2016-09-04',5,3),(8,1,'NCAFE',480,45,21600,'2016-09-05',5,4),(9,2,'NIDO',600,3,1800,'2016-09-05',5,4),(10,1,'NCAFE',480,5,2400,'2016-09-05',5,5),(11,2,'NIDO',600,6,3600,'2016-09-05',5,5),(12,3,'CERELAC',700,34,23800,'2016-09-05',5,5),(13,1,'NCAFE',480,6,2880,'2016-09-05',5,6),(14,2,'NIDO',600,8,4800,'2016-09-05',5,6),(15,1,'NCAFE',480,NULL,2880,'2016-09-05',5,7),(16,2,'NIDO',600,NULL,4800,'2016-09-05',5,7),(17,1,'NCAFE',480,6,2880,'2016-09-05',5,8),(18,8,'PRINTER',480,5,2400,'2016-09-05',5,8),(19,1,'NCAFE',480,NULL,2880,'2016-09-05',5,9),(20,8,'PRINTER',480,5,2400,'2016-09-05',5,9),(21,2,'NIDO',600,4,2400,'2016-09-05',5,10),(22,1,'NCAFE',480,2,960,'2016-10-18',5,11),(23,2,'NIDO',600,2,1200,'2016-10-18',5,11),(24,10,'ARAM',1400,3,4200,'2016-10-18',5,11),(25,14,'MRNDA',120,3,360,'2016-10-18',5,11),(26,9,'MONITOR',740,3,2220,'2016-10-18',5,11),(27,11,'TCPA',300,1,300,'2016-10-18',5,11),(28,12,'SPRITE',80,2,160,'2016-10-18',5,11),(29,4,'BFCP',400,4,1600,'2016-10-18',5,11),(30,5,'KITKAT',450,4,1800,'2016-10-18',5,11),(31,7,'DCM',380,4,1520,'2016-10-18',5,11),(32,8,'PRINTER',480,1,480,'2016-10-18',5,11),(33,15,'CLEMON',150,3,450,'2016-10-18',5,11),(34,13,'COCA',100,1,100,'2016-10-18',5,11),(35,3,'CERELAC',700,2,1400,'2016-10-18',5,11),(36,6,'HORLICKS',250,12,3000,'2016-10-18',5,11),(37,1,'NCAFE',480,2,960,'2016-10-18',5,12),(38,2,'NIDO',600,2,1200,'2016-10-18',5,12),(39,10,'ARAM',1400,3,4200,'2016-10-18',5,12),(40,14,'MRNDA',120,3,360,'2016-10-18',5,12),(41,9,'MONITOR',740,3,2220,'2016-10-18',5,12),(42,11,'TCPA',300,1,300,'2016-10-18',5,12),(43,12,'SPRITE',80,2,160,'2016-10-18',5,12),(44,4,'BFCP',400,4,1600,'2016-10-18',5,12),(45,5,'KITKAT',450,4,1800,'2016-10-18',5,12),(46,7,'DCM',380,4,1520,'2016-10-18',5,12),(47,8,'PRINTER',480,1,480,'2016-10-18',5,12),(48,15,'CLEMON',150,3,450,'2016-10-18',5,12),(49,13,'COCA',100,1,100,'2016-10-18',5,12),(50,3,'CERELAC',700,2,1400,'2016-10-18',5,12),(51,6,'HORLICKS',250,12,3000,'2016-10-18',5,12);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sr`
--

DROP TABLE IF EXISTS `sr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sr` (
  `Sr_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sr_Name` varchar(45) DEFAULT NULL,
  `Loc_Id` int(11) DEFAULT NULL,
  `Emp_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sr_Id`),
  KEY `srLoc_idx` (`Loc_Id`),
  KEY `srEmp_idx` (`Emp_Id`),
  CONSTRAINT `srEmp` FOREIGN KEY (`Emp_Id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `srLoc` FOREIGN KEY (`Loc_Id`) REFERENCES `location` (`Loc_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sr`
--

LOCK TABLES `sr` WRITE;
/*!40000 ALTER TABLE `sr` DISABLE KEYS */;
INSERT INTO `sr` VALUES (1,'Farid',2,1),(2,'Irin',1,2),(3,'Dinislam',3,3),(4,'Robiul',2,4);
/*!40000 ALTER TABLE `sr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppervisor`
--

DROP TABLE IF EXISTS `suppervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppervisor` (
  `Sup_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sup_Name` varchar(45) DEFAULT NULL,
  `Emp_Id` int(11) DEFAULT NULL,
  `M_Id` int(11) DEFAULT NULL,
  `Loc_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sup_Id`),
  KEY `supEmp_idx` (`Emp_Id`),
  KEY `supMan_idx` (`M_Id`),
  KEY `supLoc_idx` (`Loc_Id`),
  CONSTRAINT `supEmp` FOREIGN KEY (`Emp_Id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supLoc` FOREIGN KEY (`Loc_Id`) REFERENCES `location` (`Loc_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supMan` FOREIGN KEY (`M_Id`) REFERENCES `manager` (`M_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppervisor`
--

LOCK TABLES `suppervisor` WRITE;
/*!40000 ALTER TABLE `suppervisor` DISABLE KEYS */;
INSERT INTO `suppervisor` VALUES (10,'Hafiz Uddin',1,1,1),(11,'Ashraful Islam',2,3,3),(12,'Karim Ahmed',1,2,4),(13,'Kawser Ahmed',3,3,2);
/*!40000 ALTER TABLE `suppervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `Supp_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Supp_Name` varchar(45) DEFAULT NULL,
  `Emp_Id` int(11) DEFAULT NULL,
  `Sup_Id` int(11) DEFAULT NULL,
  `Loc_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Supp_Id`),
  KEY `suppEmp_idx` (`Emp_Id`),
  KEY `suppSup_idx` (`Sup_Id`),
  KEY `suppLoc_idx` (`Loc_Id`),
  CONSTRAINT `suppEmp` FOREIGN KEY (`Emp_Id`) REFERENCES `employee` (`Emp_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppLoc` FOREIGN KEY (`Loc_Id`) REFERENCES `location` (`Loc_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppSup` FOREIGN KEY (`Sup_Id`) REFERENCES `suppervisor` (`Sup_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (100,'Maruf Ahmed',1,10,2),(101,'Razu Ahmed',2,11,1),(102,'Irin Akhter',3,12,4),(103,'Nazim Uddin',2,13,2),(104,'Jashim Uddin',3,11,3),(105,'Rony Ahmed',1,12,2);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_ID` int(10) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(50) NOT NULL,
  `PWD` varchar(100) NOT NULL,
  `ENABLED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'marketingmanagement'
--

--
-- Dumping routines for database 'marketingmanagement'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-24  6:46:50
