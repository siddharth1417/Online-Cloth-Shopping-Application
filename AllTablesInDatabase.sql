-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: online_shopping
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addressId` int NOT NULL AUTO_INCREMENT,
  `line1` varchar(500) DEFAULT NULL,
  `line2` varchar(500) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `state` varchar(90) DEFAULT NULL,
  `pin` int DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  UNIQUE KEY `address_id_UNIQUE` (`addressId`),
  KEY `user_id_idx` (`userId`),
  CONSTRAINT `user_id` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'house no - 123','downtown hill, near dominos','Bhopal','MP',123456,'India',13),(2,'house no - 123','downtown hill, near KFC','Pune','Maharashtra',654321,'India',10),(3,'house no - 666','Raisen road, BHEL','Bhopal','MP',778899,'India',10);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartId` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `isPurchased` tinyint DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`cartId`),
  UNIQUE KEY `cart_id_UNIQUE` (`cartId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  CONSTRAINT `userid4` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=tis620;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,5,1,9),(3,7,1,10);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitem` (
  `cartItemId` int NOT NULL AUTO_INCREMENT,
  `productPrice` double DEFAULT NULL,
  `productQuantity` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `cartId` int DEFAULT NULL,
  PRIMARY KEY (`cartItemId`),
  UNIQUE KEY `cartItemId_UNIQUE` (`cartItemId`),
  KEY `productId3_idx` (`productId`),
  KEY `cartId2_idx` (`cartId`),
  CONSTRAINT `cartId2` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`),
  CONSTRAINT `productId3` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
INSERT INTO `cartitem` VALUES (1,400,2,2,1),(2,500,3,1,1),(3,400,5,2,1),(4,900,3,4,3),(5,500,4,1,3),(6,400,2,2,3),(7,1000,1,3,3),(8,900,5,4,3);
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(250) DEFAULT NULL,
  `subcategoryName` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'men','t-shirt'),(2,'men','formal'),(3,'women','t-shirt'),(4,'women','formal'),(5,'kid','dress');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedbackId` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(1000) DEFAULT NULL,
  `commentDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`feedbackId`),
  UNIQUE KEY `feedback_id_UNIQUE` (`feedbackId`),
  KEY `user_id_idx` (`userId`),
  KEY `productid2_idx` (`productId`),
  CONSTRAINT `productid2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  CONSTRAINT `userID3` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Nice Shirt. This is best site I have ever come across.','2022-01-29 19:55:00',4,11,1),(2,'Best product','2022-01-29 19:56:53',5,10,4),(3,'Love the site','2022-01-29 19:58:16',3,12,4),(4,'I wonder who made this wonderful site','2022-01-29 19:59:56',5,12,4),(5,'Not Bad Product','2022-01-29 20:04:02',2,11,3),(6,'You should go on Shark Tank India','2022-01-29 20:04:02',5,13,2),(7,'Cheers','2022-01-29 20:04:02',3,13,3),(8,'Pune','2022-03-09 07:47:34',5,10,2),(9,'Average Product','2022-03-09 07:51:33',3,11,3),(10,'Nice Shirt','2022-03-09 08:53:51',4,11,2),(11,'Awesome','2022-03-10 14:12:22',4,12,3),(12,'How are you doing?','2022-03-10 14:32:08',2,10,3),(13,'Hey Brother','2022-03-10 14:33:51',4,13,2),(14,'Average','2022-03-10 14:42:28',0,10,1),(15,'Enough','2022-03-10 14:42:49',3,10,3),(16,'Need to improve','2022-03-10 14:43:52',1,11,4),(17,'Comment Comment','2022-03-10 16:25:48',4,10,1),(18,'Nice Product Good Work','2022-03-10 16:29:20',4,12,1),(19,'Best product in market','2022-03-27 08:53:02',4,10,2),(52,'Nice Product I have ever seen','2022-03-27 09:52:03',0,10,1),(53,'Good work','2022-03-27 09:52:29',5,10,1),(54,'Keep it up','2022-03-27 09:52:42',5,10,1),(55,'For Testing','2022-04-04 05:21:12',4,11,2),(56,'For Testing','2022-04-04 05:38:41',4,11,2);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` mediumblob,
  `authentication_id` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `authentication` mediumblob,
  `refresh_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
INSERT INTO `oauth_access_token` VALUES ('b38586338075ede4afb4bcd24e28663e',_binary '¨\Ì\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken≤û6$˙\Œ\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6ÖZ\‹\Á\–\0\0xpsr\0java.util.DatehjÅKYt\0\0xpw\0\0y\œXxsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ﬂGcù\–…∑\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\·\ncT\‘^\0L\0valueq\0~\0xpt\0$aed27416-e23f-42bc-b352-ea4a86817342sq\0~\0	w\0\0Ä\'ÅVxsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet\ÿl\◊Zï\›*\0\0xr\0java.util.HashSet∫DÖïñ∏∑4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writext\0bearert\0$69feaf59-fc87-481e-a16d-53f699c971ce','541fafc0ddd1c515a1c6307bfc951e27','amit@gmail.com','Mobile',_binary '¨\Ì\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2AuthenticationΩ@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\00\0L\0rolet\0Ljava/lang/String;xpt\0userxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qiΩ\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0Mobilesr\0%java.util.Collections$UnmodifiableMapÒ•®˛tıB\0L\0mq\0~\0xpsr\0java.util.HashMap\⁄¡\√`\—\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0Mobilet\0usernamet\0amit@gmail.comt\0scopet\0\nread writexsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xq\0~\0	sr\0java.util.LinkedHashSet\ÿl\◊Zï\›*\0\0xr\0java.util.HashSet∫DÖïñ∏∑4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\0\'w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0USERxsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0\'w\0\0\0?@\0\0\0\0\0t\0resource-server-rest-apixsq\0~\0\'w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\00\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\05sr\0java.util.LinkedHashMap4¿N\\l¿˚\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!q\0~\0\"q\0~\0#x\0psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\00\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiesq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xpsq\0~\0$sr\0java.util.TreeSet›òPìï\Ìá[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\00\0\0xpw\0\0\0q\0~\0xpt\0amit@gmail.com','22e04cb489ea52da1465dd3157df0ad4'),('53e0aa2924b1947afc943c3cd5b13a00',_binary '¨\Ì\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken≤û6$˙\Œ\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6ÖZ\‹\Á\–\0\0xpsr\0java.util.DatehjÅKYt\0\0xpw\0\0ıeNÑxsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ﬂGcù\–…∑\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\·\ncT\‘^\0L\0valueq\0~\0xpt\0$404208de-b07c-40a8-a40c-67ee6963dff2sq\0~\0	w\0\0ˇ\rz2xsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet\ÿl\◊Zï\›*\0\0xr\0java.util.HashSet∫DÖïñ∏∑4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writext\0bearert\0$c413d540-18c2-45ea-8ab0-01bd85c96214','77b4ac6ef4eb880c439224d8b4577fb3','han@gmail.com','Mobile',_binary '¨\Ì\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2AuthenticationΩ@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\00\0L\0rolet\0Ljava/lang/String;xpt\0userxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qiΩ\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0Mobilesr\0%java.util.Collections$UnmodifiableMapÒ•®˛tıB\0L\0mq\0~\0xpsr\0java.util.HashMap\⁄¡\√`\—\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0Mobilet\0usernamet\0\rhan@gmail.comt\0scopet\0\nread writexsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xq\0~\0	sr\0java.util.LinkedHashSet\ÿl\◊Zï\›*\0\0xr\0java.util.HashSet∫DÖïñ∏∑4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\0\'w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0USERxsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0\'w\0\0\0?@\0\0\0\0\0t\0resource-server-rest-apixsq\0~\0\'w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\00\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\05sr\0java.util.LinkedHashMap4¿N\\l¿˚\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!q\0~\0\"q\0~\0#x\0psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\00\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiesq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xpsq\0~\0$sr\0java.util.TreeSet›òPìï\Ìá[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\00\0\0xpw\0\0\0q\0~\0xpt\0\rhan@gmail.com','c619795034256e56dc2b8cf367f198d3'),('02519514caf8b7db85bcb5eddedd6ed0',_binary '¨\Ì\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken≤û6$˙\Œ\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6ÖZ\‹\Á\–\0\0xpsr\0java.util.DatehjÅKYt\0\0xpw\0\0~…Ø≈≤xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ﬂGcù\–…∑\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\·\ncT\‘^\0L\0valueq\0~\0xpt\0$c380bcc7-f665-4567-a5d5-d911dc8587dasq\0~\0	w\0\0_1∞xsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet\ÿl\◊Zï\›*\0\0xr\0java.util.HashSet∫DÖïñ∏∑4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writext\0bearert\0$125c982e-1ad8-4708-b72e-61f771cb00c8','93b908ccccb3012b4e2bad34260c6413','adi@gmail.com','Mobile',_binary '¨\Ì\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2AuthenticationΩ@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\00\0L\0rolet\0Ljava/lang/String;xpt\0userxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qiΩ\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0Mobilesr\0%java.util.Collections$UnmodifiableMapÒ•®˛tıB\0L\0mq\0~\0xpsr\0java.util.HashMap\⁄¡\√`\—\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0Mobilet\0usernamet\0\radi@gmail.comt\0scopet\0\nread writexsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xq\0~\0	sr\0java.util.LinkedHashSet\ÿl\◊Zï\›*\0\0xr\0java.util.HashSet∫DÖïñ∏∑4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\0\'w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0USERxsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0\'w\0\0\0?@\0\0\0\0\0t\0resource-server-rest-apixsq\0~\0\'w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\00\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\05sr\0java.util.LinkedHashMap4¿N\\l¿˚\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!q\0~\0\"q\0~\0#x\0psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\00\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiesq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xpsq\0~\0$sr\0java.util.TreeSet›òPìï\Ìá[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\00\0\0xpw\0\0\0q\0~\0xpt\0\radi@gmail.com','af87385a8fd0953c1276ce9ec0f824e0');
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_approvals`
--

DROP TABLE IF EXISTS `oauth_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_approvals` (
  `userId` varchar(255) DEFAULT NULL,
  `clientId` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModifiedAt` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_approvals`
--

LOCK TABLES `oauth_approvals` WRITE;
/*!40000 ALTER TABLE `oauth_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(255) NOT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `access_token_validity` int DEFAULT NULL,
  `refresh_token_validity` int DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` VALUES ('Mobile','resource-server-rest-api','$2a$04$v8DNBoc36pw4c7b7Xyq/aeSpGneF9WciZUI9FibVz0neksUcPBXVS','read,write','password,authorization_code,refresh_token,implicit',NULL,'USER',86400,2592000,NULL,NULL);
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_token`
--

DROP TABLE IF EXISTS `oauth_client_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(255) DEFAULT NULL,
  `token` mediumblob,
  `authentication_id` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_token`
--

LOCK TABLES `oauth_client_token` WRITE;
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_code`
--

DROP TABLE IF EXISTS `oauth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_code` (
  `code` varchar(255) DEFAULT NULL,
  `authentication` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_code`
--

LOCK TABLES `oauth_code` WRITE;
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` mediumblob,
  `authentication` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
INSERT INTO `oauth_refresh_token` VALUES ('af87385a8fd0953c1276ce9ec0f824e0',_binary '¨\Ì\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ﬂGcù\–…∑\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\·\ncT\‘^\0L\0valuet\0Ljava/lang/String;xpt\0$c380bcc7-f665-4567-a5d5-d911dc8587dasr\0java.util.DatehjÅKYt\0\0xpw\0\0_1∞x',_binary '¨\Ì\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2AuthenticationΩ@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\00\0L\0rolet\0Ljava/lang/String;xpt\0userxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qiΩ\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0Mobilesr\0%java.util.Collections$UnmodifiableMapÒ•®˛tıB\0L\0mq\0~\0xpsr\0java.util.HashMap\⁄¡\√`\—\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0Mobilet\0usernamet\0\radi@gmail.comt\0scopet\0\nread writexsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xq\0~\0	sr\0java.util.LinkedHashSet\ÿl\◊Zï\›*\0\0xr\0java.util.HashSet∫DÖïñ∏∑4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\0\'w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0USERxsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0\'w\0\0\0?@\0\0\0\0\0t\0resource-server-rest-apixsq\0~\0\'w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\00\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\05sr\0java.util.LinkedHashMap4¿N\\l¿˚\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!q\0~\0\"q\0~\0#x\0psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\00\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiesq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xpsq\0~\0$sr\0java.util.TreeSet›òPìï\Ìá[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\00\0\0xpw\0\0\0q\0~\0xpt\0\radi@gmail.com'),('22e04cb489ea52da1465dd3157df0ad4',_binary '¨\Ì\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ﬂGcù\–…∑\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\·\ncT\‘^\0L\0valuet\0Ljava/lang/String;xpt\0$aed27416-e23f-42bc-b352-ea4a86817342sr\0java.util.DatehjÅKYt\0\0xpw\0\0Ä\'ÅVx',_binary '¨\Ì\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2AuthenticationΩ@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\00\0L\0rolet\0Ljava/lang/String;xpt\0userxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qiΩ\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0Mobilesr\0%java.util.Collections$UnmodifiableMapÒ•®˛tıB\0L\0mq\0~\0xpsr\0java.util.HashMap\⁄¡\√`\—\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0Mobilet\0usernamet\0amit@gmail.comt\0scopet\0\nread writexsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xq\0~\0	sr\0java.util.LinkedHashSet\ÿl\◊Zï\›*\0\0xr\0java.util.HashSet∫DÖïñ∏∑4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\0\'w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0USERxsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0\'w\0\0\0?@\0\0\0\0\0t\0resource-server-rest-apixsq\0~\0\'w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\00\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\05sr\0java.util.LinkedHashMap4¿N\\l¿˚\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!q\0~\0\"q\0~\0#x\0psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\00\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiesq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xpsq\0~\0$sr\0java.util.TreeSet›òPìï\Ìá[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\00\0\0xpw\0\0\0q\0~\0xpt\0amit@gmail.com'),('c619795034256e56dc2b8cf367f198d3',_binary '¨\Ì\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ﬂGcù\–…∑\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\·\ncT\‘^\0L\0valuet\0Ljava/lang/String;xpt\0$404208de-b07c-40a8-a40c-67ee6963dff2sr\0java.util.DatehjÅKYt\0\0xpw\0\0ˇ\rz2x',_binary '¨\Ì\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2AuthenticationΩ@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\00\0L\0rolet\0Ljava/lang/String;xpt\0userxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qiΩ\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0Mobilesr\0%java.util.Collections$UnmodifiableMapÒ•®˛tıB\0L\0mq\0~\0xpsr\0java.util.HashMap\⁄¡\√`\—\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0Mobilet\0usernamet\0\rhan@gmail.comt\0scopet\0\nread writexsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xq\0~\0	sr\0java.util.LinkedHashSet\ÿl\◊Zï\›*\0\0xr\0java.util.HashSet∫DÖïñ∏∑4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\0\'w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0USERxsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0\'w\0\0\0?@\0\0\0\0\0t\0resource-server-rest-apixsq\0~\0\'w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\00\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\05sr\0java.util.LinkedHashMap4¿N\\l¿˚\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!q\0~\0\"q\0~\0#x\0psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\00\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiesq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xpsq\0~\0$sr\0java.util.TreeSet›òPìï\Ìá[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\00\0\0xpw\0\0\0q\0~\0xpt\0\rhan@gmail.com');
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `orderNumber` int DEFAULT NULL,
  `orderStatus` varchar(250) DEFAULT NULL,
  `orderDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `numberOfOrderedProduct` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `order_id_UNIQUE` (`orderId`),
  UNIQUE KEY `orderNumber_UNIQUE` (`orderNumber`),
  KEY `user_id_idx` (`userId`),
  CONSTRAINT `userID2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,101,'Cancelled','2022-01-26 12:14:29',1998.00,2,13),(2,102,'Cancelled','2022-01-26 12:18:26',4995.00,5,10),(3,103,'Ordered','2022-01-27 12:21:53',1598.00,2,13),(4,104,'Cancelled','2022-02-04 18:17:11',998.00,2,12),(5,105,'Ordered','2022-01-27 18:08:35',1497.00,3,11),(6,106,'Cancelled','2022-01-28 19:06:53',599.00,1,11),(7,107,'Cancelled','2022-01-29 10:24:39',1198.00,2,10),(8,108,'Cancelled','2022-02-04 18:16:27',999.00,1,12),(9,109,'Ordered','2022-02-04 18:28:19',1998.00,2,12);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `orderItemId` int NOT NULL AUTO_INCREMENT,
  `productPrice` double DEFAULT NULL,
  `productQuantity` int DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  UNIQUE KEY `orderItemId_UNIQUE` (`orderItemId`),
  KEY `productId2_idx` (`productId`),
  KEY `orderId_idx` (`orderId`),
  CONSTRAINT `orderId3` FOREIGN KEY (`orderId`) REFERENCES `orderdetails` (`orderId`),
  CONSTRAINT `productId4` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,999,2,2,3),(2,999,3,2,4),(3,599,1,3,1),(4,999,2,1,3),(5,999,1,3,3),(6,499,2,4,2),(7,499,3,5,2),(8,599,1,6,1),(9,599,2,7,1),(10,999,1,8,4),(11,999,2,9,4);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentId` int NOT NULL AUTO_INCREMENT,
  `totalAmount` double DEFAULT NULL,
  `paymentMode` varchar(500) DEFAULT NULL,
  `paymentDate` timestamp NULL DEFAULT NULL,
  `paymentStatus` varchar(250) DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`paymentId`),
  UNIQUE KEY `payment_id_UNIQUE` (`paymentId`),
  UNIQUE KEY `orderId_UNIQUE` (`orderId`),
  KEY `orderID1_idx` (`orderId`),
  KEY `uderId2_idx` (`userId`),
  CONSTRAINT `orderID1` FOREIGN KEY (`orderId`) REFERENCES `orderdetails` (`orderId`),
  CONSTRAINT `uderId2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(500) DEFAULT NULL,
  `productDescription` varchar(1000) DEFAULT NULL,
  `productPrice` double DEFAULT NULL,
  `totalSoldQuantity` int DEFAULT NULL,
  `productAddedDate` timestamp NULL DEFAULT NULL,
  `smallQuantity` int DEFAULT NULL,
  `mediumQuantity` int DEFAULT NULL,
  `largeQuantity` int DEFAULT NULL,
  `extraLargeQuantity` int DEFAULT NULL,
  `size` varchar(500) DEFAULT NULL,
  `imageUrl` varchar(500) DEFAULT NULL,
  `productDetails` varchar(2000) DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`productId`),
  UNIQUE KEY `product_id_UNIQUE` (`productId`),
  KEY `categoryId12345_idx` (`categoryId`),
  CONSTRAINT `categoryId12345` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Red T-Shirt','men,man,mard',599,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://m.media-amazon.com/images/I/61lTDRuWEuL._AC_UL480_FMwebp_QL65_.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',1),(2,'Blue T-Shirt','men,man,mard',499,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://m.media-amazon.com/images/I/613BlDwF+yL._AC_UL480_FMwebp_QL65_.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',1),(3,'Men\'s formal','women,woman,aaurat ',999,50,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://m.media-amazon.com/images/I/81+evO8AxiL._AC_UL480_FMwebp_QL65_.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',2),(4,'Womens\'s Blazer','women,woman,aaurat ',999,60,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://m.media-amazon.com/images/I/81Jjkrm-vYL._AC_UL480_FMwebp_QL65_.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',4),(5,'Kid\'s Shirts','kid,baccha',599,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://m.media-amazon.com/images/I/71xBbDHAdNL._AC_UL480_FMwebp_QL65_.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',5),(6,'Shirt','men,man,mard',499,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://api.powerlook.in/pub/media/catalog/product//cache/a355f488ce208bb58a90660f35cdc6e0/d/p/dp_712.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',1),(7,'Shirt','men,man,mard',399,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://api.powerlook.in/pub/media/catalog/product//cache/a355f488ce208bb58a90660f35cdc6e0/d/p/dp_931.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',1),(8,'Shirt','men,man,mard',499,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://api.powerlook.in/pub/media/catalog/product//cache/a355f488ce208bb58a90660f35cdc6e0/d/p/dp_566_1_1.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',1),(9,'T-Shirt','kid,baccha',599,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://m.media-amazon.com/images/I/61sFLnpPerL._AC_UL320_.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',5),(10,'T-Shirt','kid,baccha',499,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://m.media-amazon.com/images/I/A1gBcfp+vGS._AC_UL480_FMwebp_QL65_.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',5),(11,'T-Shirt','kid,baccha',499,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://m.media-amazon.com/images/I/61jXRjkD+ZL._AC_UL480_FMwebp_QL65_.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',5),(12,'T-Shirt','women,woman,aaurat ',599,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://m.media-amazon.com/images/I/71OBf8tSLAL._AC_UL480_FMwebp_QL65_.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',3),(13,'T-Shirt','women,woman,aaurat ',799,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://m.media-amazon.com/images/I/31NS3rA0nMS._AC_UL480_FMwebp_QL65_.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',3),(14,'T-Shirt','women,woman,aaurat ',800,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://m.media-amazon.com/images/I/51N3d0HeAEL._AC_UL480_FMwebp_QL65_.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',3),(15,'T-Shirt','kid,baccha',500,20,'2021-09-01 03:31:15',20,20,20,20,'s|m|l|ex','https://m.media-amazon.com/images/I/51PxG9tAFLL._AC_UL480_FMwebp_QL65_.jpg','Care Instructions: Hand Wash Only |Fit Type: Regular Fit |Made from 100 % Super Fine cotton |Perfect fit |Long lasting colors. Actual colour may slighlty vary due to computer color limitations',5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userproductmeta`
--

DROP TABLE IF EXISTS `userproductmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userproductmeta` (
  `productMetaId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `productPrice` double DEFAULT NULL,
  `productQuantity` int DEFAULT NULL,
  PRIMARY KEY (`productMetaId`),
  UNIQUE KEY `productMetaId_UNIQUE` (`productMetaId`),
  KEY `user2_idx` (`userId`),
  KEY `product2_idx` (`productId`),
  CONSTRAINT `product2` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  CONSTRAINT `user2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userproductmeta`
--

LOCK TABLES `userproductmeta` WRITE;
/*!40000 ALTER TABLE `userproductmeta` DISABLE KEYS */;
INSERT INTO `userproductmeta` VALUES (1,9,1,500,3),(2,9,2,400,4),(3,10,2,400,2),(4,10,3,1000,2),(5,10,4,900,4);
/*!40000 ALTER TABLE `userproductmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(500) DEFAULT NULL,
  `userMobileNumber` bigint DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `userEmail` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `registeredAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastLogin` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isEmailVerified` tinyint DEFAULT '0',
  `role` varchar(250) DEFAULT NULL,
  `enabled` tinyint DEFAULT '1',
  `accountNonExpired` tinyint DEFAULT '1',
  `credentialsNonExpired` tinyint DEFAULT '1',
  `accountNonLocked` tinyint DEFAULT '1',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `user_id_UNIQUE` (`userId`),
  UNIQUE KEY `user_email_UNIQUE` (`userEmail`),
  UNIQUE KEY `user_mobile_number_UNIQUE` (`userMobileNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'hanumant',NULL,NULL,'han@gmail.com','$2a$08$O.ABYwLM4gnidoUiXvFir.Kx7IGx0Y1le8yfFu3qW2j0reRg8cdpy','2022-01-20 08:35:28','2022-01-20 08:35:28',0,'user',1,1,1,1),(11,'aman',NULL,NULL,'aman@gmail.com','$2a$08$AHrGOdRKdOQ4ad/udBIvR.R9M7Ys0/5gVshASOR.rfMZfBJLc7NuS','2022-02-03 18:07:43','2022-02-03 18:07:43',0,'user',1,1,1,1),(12,'amit',NULL,NULL,'amit@gmail.com','$2a$08$X8Khx8hcDONPCbqtcs/FN.6NRrCAknM8vJZ22kBtgIEp.SLk0EdC2','2022-02-04 11:11:30','2022-02-04 11:11:30',0,'user',1,1,1,1),(13,'adi',NULL,NULL,'adi@gmail.com','$2a$08$elubWrGoPoU5sMVItU3XfuvXYRVvZzIrP2JsQltq3ZqJW..ovMzHm','2022-02-04 11:40:10','2022-02-04 11:40:10',0,'user',1,1,1,1),(14,'Rahul',1234567890,'Male','rah@gmail.com','$2a$08$h8.UWq/H7EbSyVJOm/QAK.zZoi1yElTVzDrBkovZpkO/BHW2iMYM2','2022-03-09 16:55:28','2022-03-09 16:55:28',0,'user',1,1,1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-06 20:53:51
