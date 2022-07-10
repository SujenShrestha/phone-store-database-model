-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mobilestore
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `Customer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Phone_number` varchar(10) NOT NULL,
  `Age` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  UNIQUE KEY `Phone_number` (`Phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Samir','Kansakar','9800000000',20,'Putalisadak'),(2,'Ajay','Chhetri','9811111111',25,'New Baneshwor'),(3,'Sunny','Jha','9822222222',33,'Gwarko'),(4,'Jenish','Tandukar','9833333333',47,'Putalisadak'),(5,'Sampanna','Basnet','9844444444',36,'New Plaza');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobileproductdetails`
--

DROP TABLE IF EXISTS `mobileproductdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobileproductdetails` (
  `Wholesaler` int(11) NOT NULL,
  `Product` int(11) NOT NULL,
  KEY `Wholesaler` (`Wholesaler`),
  KEY `Product` (`Product`),
  CONSTRAINT `mobileproductdetails_ibfk_1` FOREIGN KEY (`Wholesaler`) REFERENCES `wholesalers` (`Wholesaler_ID`),
  CONSTRAINT `mobileproductdetails_ibfk_2` FOREIGN KEY (`Product`) REFERENCES `mobileproducts` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobileproductdetails`
--

LOCK TABLES `mobileproductdetails` WRITE;
/*!40000 ALTER TABLE `mobileproductdetails` DISABLE KEYS */;
INSERT INTO `mobileproductdetails` VALUES (1,2),(2,3),(3,4),(4,1),(5,5);
/*!40000 ALTER TABLE `mobileproductdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobileproducts`
--

DROP TABLE IF EXISTS `mobileproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobileproducts` (
  `Product_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Product_name` varchar(255) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobileproducts`
--

LOCK TABLES `mobileproducts` WRITE;
/*!40000 ALTER TABLE `mobileproducts` DISABLE KEYS */;
INSERT INTO `mobileproducts` VALUES (1,'Samsung',80000.00),(2,'Apple',120000.00),(3,'Xiaomi',40000.00),(4,'Sony',100000.00),(5,'Oppo',60000.00);
/*!40000 ALTER TABLE `mobileproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer` int(11) NOT NULL,
  `Product` int(11) NOT NULL,
  `Order_date` date NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`Order_ID`),
  KEY `Customer` (`Customer`),
  KEY `Product` (`Product`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer`) REFERENCES `customers` (`Customer_ID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Product`) REFERENCES `mobileproducts` (`Product_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,1,'2021-02-20',4),(2,1,3,'2021-02-27',10),(3,5,2,'2021-03-15',5),(4,3,5,'2021-03-30',6),(5,4,4,'2021-04-20',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wholesalers`
--

DROP TABLE IF EXISTS `wholesalers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wholesalers` (
  `Wholesaler_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Wholesaler_name` varchar(255) NOT NULL,
  `Wholesaler_product` varchar(255) DEFAULT NULL,
  `Wholesale_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Wholesaler_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wholesalers`
--

LOCK TABLES `wholesalers` WRITE;
/*!40000 ALTER TABLE `wholesalers` DISABLE KEYS */;
INSERT INTO `wholesalers` VALUES (1,'Shiva Electronic Suppliers','Apple',5600000.00),(2,'Shankhar Mobile Suppliers','Xiaomi',1800000.00),(3,'Bhairab Gadget Suppliers','Sony',4700000.00),(4,'Mahakal IT Suppliers','Samsung',3600000.00),(5,'Rudra Phone Suppliers','Oppo',2800000.00);
/*!40000 ALTER TABLE `wholesalers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-27 19:07:59
