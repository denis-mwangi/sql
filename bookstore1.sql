/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.1-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	11.8.1-MariaDB-2
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postalCode` int(20) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `addressStatus`
--

DROP TABLE IF EXISTS `addressStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `addressStatus` (
  `statusId` int(11) NOT NULL AUTO_INCREMENT,
  `statusDescription` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressStatus`
--

LOCK TABLES `addressStatus` WRITE;
/*!40000 ALTER TABLE `addressStatus` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addressStatus` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) DEFAULT NULL,
  `secondName` varchar(100) DEFAULT NULL,
  `bio` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `languageId` int(11) DEFAULT NULL,
  `ISBN_number` int(13) DEFAULT NULL,
  `bookTitle` varchar(100) DEFAULT NULL,
  `publisherId` int(11) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `languageId` (`languageId`),
  KEY `publisherId` (`publisherId`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`languageId`) REFERENCES `bookLanguage` (`languageId`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisherId`) REFERENCES `publisher` (`publisherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `bookAuthor`
--

DROP TABLE IF EXISTS `bookAuthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookAuthor` (
  `bookAuthorId` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookAuthorId`),
  KEY `bookId` (`bookId`),
  KEY `authorId` (`authorId`),
  CONSTRAINT `bookAuthor_ibfk_1` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`),
  CONSTRAINT `bookAuthor_ibfk_2` FOREIGN KEY (`authorId`) REFERENCES `authors` (`authorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookAuthor`
--

LOCK TABLES `bookAuthor` WRITE;
/*!40000 ALTER TABLE `bookAuthor` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `bookAuthor` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `bookLanguage`
--

DROP TABLE IF EXISTS `bookLanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookLanguage` (
  `languageId` int(11) NOT NULL AUTO_INCREMENT,
  `langaugeName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`languageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookLanguage`
--

LOCK TABLES `bookLanguage` WRITE;
/*!40000 ALTER TABLE `bookLanguage` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `bookLanguage` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(30) DEFAULT NULL,
  `continent` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `custOrder`
--

DROP TABLE IF EXISTS `custOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custOrder` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` datetime DEFAULT NULL,
  `customerId` int(20) DEFAULT NULL,
  `totalAmount` int(10) DEFAULT NULL,
  `methodId` int(20) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `customerId` (`customerId`),
  KEY `methodId` (`methodId`),
  CONSTRAINT `custOrder_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `custOrder_ibfk_2` FOREIGN KEY (`methodId`) REFERENCES `shippingMethod` (`methodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custOrder`
--

LOCK TABLES `custOrder` WRITE;
/*!40000 ALTER TABLE `custOrder` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `custOrder` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `contact` int(20) DEFAULT NULL,
  `customerName` varchar(30) DEFAULT NULL,
  `phoneNumber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `customerId` int(11) DEFAULT NULL,
  `addressId` int(11) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  KEY `customerId` (`customerId`),
  KEY `addressId` (`addressId`),
  KEY `statusId` (`statusId`),
  CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `customer_address_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressId`),
  CONSTRAINT `customer_address_ibfk_3` FOREIGN KEY (`statusId`) REFERENCES `addressStatus` (`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `orderHistory`
--

DROP TABLE IF EXISTS `orderHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderHistory` (
  `historyId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `orderStatusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`historyId`),
  KEY `orderId` (`orderId`),
  KEY `orderStatusId` (`orderStatusId`),
  CONSTRAINT `orderHistory_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `custOrder` (`orderId`),
  CONSTRAINT `orderHistory_ibfk_2` FOREIGN KEY (`orderStatusId`) REFERENCES `orderStatus` (`orderStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderHistory`
--

LOCK TABLES `orderHistory` WRITE;
/*!40000 ALTER TABLE `orderHistory` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `orderHistory` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `orderLine`
--

DROP TABLE IF EXISTS `orderLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderLine` (
  `orderLineId` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) DEFAULT NULL,
  `quantity` int(20) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  PRIMARY KEY (`orderLineId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `orderLine_ibfk_1` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderLine`
--

LOCK TABLES `orderLine` WRITE;
/*!40000 ALTER TABLE `orderLine` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `orderLine` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `orderStatus`
--

DROP TABLE IF EXISTS `orderStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderStatus` (
  `orderStatusId` int(11) NOT NULL AUTO_INCREMENT,
  `orderDescription` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`orderStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderStatus`
--

LOCK TABLES `orderStatus` WRITE;
/*!40000 ALTER TABLE `orderStatus` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `orderStatus` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisherId` int(11) NOT NULL AUTO_INCREMENT,
  `contact` varchar(20) DEFAULT NULL,
  `publishersName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`publisherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `shippingMethod`
--

DROP TABLE IF EXISTS `shippingMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippingMethod` (
  `methodId` int(11) NOT NULL AUTO_INCREMENT,
  `methodName` varchar(30) DEFAULT NULL,
  `methodCost` int(20) DEFAULT NULL,
  PRIMARY KEY (`methodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippingMethod`
--

LOCK TABLES `shippingMethod` WRITE;
/*!40000 ALTER TABLE `shippingMethod` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shippingMethod` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-04-13  2:20:26
