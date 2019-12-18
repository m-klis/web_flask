-- MySQL dump 10.17  Distrib 10.3.16-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mkafe
-- ------------------------------------------------------
-- Server version	10.3.16-MariaDB

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
-- Table structure for table `detil_jual`
--

DROP TABLE IF EXISTS `detil_jual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detil_jual` (
  `id_jual` int(6) NOT NULL,
  `id_menu` int(4) NOT NULL,
  `harga` int(7) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `comment` text NOT NULL,
  `diskon` int(3) NOT NULL,
  `ppn` int(3) NOT NULL,
  KEY `id_jual` (`id_jual`),
  KEY `id_menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detil_jual`
--

LOCK TABLES `detil_jual` WRITE;
/*!40000 ALTER TABLE `detil_jual` DISABLE KEYS */;
INSERT INTO `detil_jual` VALUES (1,52,11000,1,'-',0,10),(1,53,13200,1,'-',0,10),(2,52,11000,1,'-',0,10),(2,53,13200,1,'-',0,10),(3,52,11000,1,'-',0,10),(3,53,13200,1,'-',0,10),(4,68,26400,1,'-',0,10);
/*!40000 ALTER TABLE `detil_jual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jual`
--

DROP TABLE IF EXISTS `jual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jual` (
  `id_jual` int(6) NOT NULL AUTO_INCREMENT,
  `no_pesan` varchar(15) NOT NULL,
  `tgl_jual` date DEFAULT NULL,
  `id_member` int(4) DEFAULT NULL,
  `id_kasir` int(4) DEFAULT NULL,
  `total_byr` int(7) DEFAULT NULL,
  `bayar` int(7) DEFAULT NULL,
  `kembali` int(7) DEFAULT NULL,
  `nama_cust` varchar(50) DEFAULT NULL,
  `kontak` varchar(50) DEFAULT NULL,
  `status_byr` varchar(7) DEFAULT NULL,
  `status` varchar(7) DEFAULT NULL,
  `tgl_trx` date DEFAULT NULL,
  `no_meja` varchar(3) NOT NULL,
  PRIMARY KEY (`id_jual`),
  KEY `id_member` (`id_member`),
  KEY `id_kasir` (`id_kasir`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jual`
--

LOCK TABLES `jual` WRITE;
/*!40000 ALTER TABLE `jual` DISABLE KEYS */;
INSERT INTO `jual` VALUES (1,'TR190829115836','2019-08-29',0,1,24200,24200,0,'uji','-','bayar','selesai','2019-08-29','20'),(3,'TR190829120043',NULL,0,NULL,24200,NULL,NULL,'input kasir','-','pesan','belum','2019-08-29','90'),(4,'TR190829190440',NULL,0,NULL,26400,NULL,NULL,'uji coba','-','pesan','belum','2019-08-29','88');
/*!40000 ALTER TABLE `jual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kasir`
--

DROP TABLE IF EXISTS `kasir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kasir` (
  `id_kasir` int(4) NOT NULL AUTO_INCREMENT,
  `nm_kasir` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tgl_lhr` date NOT NULL,
  `kota_lhr` varchar(40) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id_kasir`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kasir`
--

LOCK TABLES `kasir` WRITE;
/*!40000 ALTER TABLE `kasir` DISABLE KEYS */;
INSERT INTO `kasir` VALUES (1,'kasir','semarang','1997-08-06','Semarang','089089089089','kasir@kasir','kasir','kasir');
/*!40000 ALTER TABLE `kasir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `login_as` varchar(20) NOT NULL,
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('admin','*4ACFE3202A5FF5CF467898FC58AAB1D615029441','admin'),('kasir','*6E02B27D5638DD2E97ABAA5B61A4FE6D03D8DF45','kasir'),('member','*F76A0292E763BD108EA5492E25EC051F7E23E6E9','member');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id_member` int(4) NOT NULL AUTO_INCREMENT,
  `nm_member` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` char(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id_member`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'member','semarang','089089000999','member@member','member','member');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id_menu` int(4) NOT NULL AUTO_INCREMENT,
  `nm_menu` varchar(50) DEFAULT NULL,
  `kategori` varchar(25) DEFAULT NULL,
  `ft_menu` varchar(50) DEFAULT NULL,
  `harga` int(6) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `diskon` int(3) DEFAULT NULL,
  `ppn` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (30,'Gyu Don','Rice is Lyfe','Gyu_Don.jpg',35000,'Gyu Don',0,10),(31,'Darkside Burger','No Rice No Cry','Darkside_Burger.png',32000,'Cheese/Salted Egg/Blackpepper',0,10),(34,'Banana Fritter','Diet What Diet ?','Banana_Fritter.jpg',19000,'Chocolate/Peanut/Cheese',0,10),(35,'Crispy Chicken Skin','Diet What Diet ?','Crispy_Chicken_Skin.jpg',18000,'Crispy Chicken Skin',0,10),(36,'Potato Ball','Diet What Diet ?','Potato_Ball.jpg',19000,'Potato Ball',0,10),(37,'French Fries','Diet What Diet ?','French_Fries.jpg',19000,'French Fries',0,10),(38,'Mayo Cassava','Diet What Diet ?','mayo_casava.jpg',19000,'Mayo Cassava',0,10),(39,'French Egg Toast','Diet What Diet ?','French_Egg_Toast.jpg',21000,'French Egg Toast',0,10),(40,'Naugat Bread','Diet What Diet ?','nugget_bread.jpg',22000,'Naugat Bread',0,10),(41,'Banana Hotdog','Diet What Diet ?','banana_hotdog.jpg',21000,'Banana Hotdog',0,10),(42,'Bratwurst Hotdog','Diet What Diet ?','Bratwurst_Hotdog.jpg',24000,'Bratwurst Hotdog',0,10),(43,'Chicken Bites','Diet What Diet ?','Chicken_Bites.jpg',23000,'Salt Pepper / BBQ',0,10),(44,'Chocolate','Non Caffeine and else','Chocolate.jpg',28000,'Chocolate',0,10),(45,'Matcha','Non Caffeine and else','Matcha.jpg',28000,'Matcha',0,10),(46,'Matcha Chocolate','Non Caffeine and else','Matcha_Chocolate.jpg',28000,'Matcha Chocolate',0,10),(47,'Salted Caramel','Non Caffeine and else','Salted_Caramel.jpg',26000,'Salted Caramel',0,10),(48,'Purplish Latte','Non Caffeine and else','Purplish_Latte.jpg',26000,'Purplish Latte',0,10),(49,'Black Latte','Non Caffeine and else','Black_Latte.jpg',28000,'Black Latte',0,10),(50,'Black Forest','Non Caffeine and else','Black_Forest.jpg',28000,'Black Forest',0,10),(51,'Blood Velvet','Non Caffeine and else','Blood_Velvet.jpg',26000,'Blood Velvet',0,10),(52,'Mineral Water','Any \"tea\" ng','Mineral_Water.jpg',10000,'Mineral Water',0,10),(53,'Tea','Any \"tea\" ng','tea.jpg',12000,'Tea',0,10),(54,'Lychee Tea','Any \"tea\" ng','Lychee_Tea.jpg',18000,'Lychee Tea',0,10),(55,'Peach Tea','Any \"tea\" ng','Peach_Tea.jpg',16000,'Peach Tea',0,10),(56,'Mango Tea','Any \"tea\" ng','mango_tea.jpg',16000,'Mango Tea',0,10),(57,'Peppermint Tea','Any \"tea\" ng','Peppermint_Tea.jpg',16000,'Peppermint Tea',0,10),(58,'Thai Tea','Any \"tea\" ng','Thai_Tea.jpg',21000,'Thai Tea',0,10),(59,'Green Tea Jasmine Tea','Any \"tea\" ng','jasmine_tea.jpg',18000,'Green Tea Jasmine Tea',0,10),(60,'Blacktea Decaf','Any \"tea\" ng','Blacktea_Decaf.jpg',18000,'Blacktea Decaf',0,10),(61,'Chamomile Tea','Any \"tea\" ng','Chamomile_Tea.jpg',18000,'Chamomile Tea',0,10),(62,'Espresso','Sleep is for The Weak','Espresso.jpg',17000,'Espresso',0,10),(63,'Kopi Susu Anugerah','Sleep is for The Weak','Kopi_Susu_Anugerah.jpg',20000,'Kopi Susu Anugerah',0,10),(64,'Kopi Susu Marie','Sleep is for The Weak','Kopi_Susu_Marie.jpg',24000,'Kopi Susu Marie',0,10),(65,'Kopi Susu Rum','Sleep is for The Weak','Kopi_Susu_Rum.jpg',24000,'Kopi Susu Rum',0,10),(66,'Latte','Sleep is for The Weak','Latte.jpg',27000,'Original/Hazelnut/Kalua/Caramel/Greyscale',0,10),(67,'Cappucinno','Sleep is for The Weak','Capucinno.jpg',27000,'Cappucinno',0,10),(68,'Picollo','Sleep is for The Weak','Picollo.png',24000,'Picollo',0,10),(69,'Afogatto','Sleep is for The Weak','Afogatto.jpg',24000,'Afogatto',0,10),(70,'Kalua Java Chip','Non Caffeine and else','Kalua_Java_Chip.jpg',29000,'Kalua Java Chip',0,10),(71,'Caramel Sweet Cookies','Non Caffeine and else','Caramel_Sweet_Cookies.jpg',29000,'Caramel Sweet Cookies',0,10),(72,'Mango Slush','Non Caffeine and else','Mango_Slush.jpg',27000,'Mango Slush',0,10),(73,'Banana Monkey','Non Caffeine and else','Banana_Monkey.jpg',27000,'Banana Monkey',0,10),(74,'Banana Coffee (Surprise !!)','Non Caffeine and else','Banana_Coffee_Surprise_.jpg',30000,'Banana Coffee (Surprise !!)',0,10),(75,'Lavender Bliss','Non Caffeine and else','Lavender_Bliss.jpg',27000,'Lavender Bliss',0,10),(76,'Green Pappermint','Non Caffeine and else','Green_Pappermint.jpg',27000,'Green Pappermint',0,10),(77,'Blue Agave','Non Caffeine and else','Blue_Agave.jpg',27000,'Blue Agave',0,10),(78,'Melonized','Non Caffeine and else','Melonized.jpg',27000,'Melonized',0,10),(79,'Fruitini','Non Caffeine and else','Fruitini.jpg',26000,'Fruitini',0,10),(80,'Beer Coffe Ori','Non Caffeine and else','Beer_Coffe_Ori.jpg',26000,'Beer Coffe Ori',0,10),(81,'Beer Coffee Signature','Non Caffeine and else','Beer_Coffee_Signature.jpg',25000,'Beer Coffee Signature',0,10),(82,'Signature Chicken','Non Caffeine and else','Signature_Chicken.jpg',30000,'Signature Chicken',0,10),(83,'Thai Basil Chicken Rice','Rice is Lyfe','Thai_Basil_Chicken_Rice.jpg',30000,'Thai Basil Chicken Rice',0,10),(84,'Patty Hamburg Mushroom Butter Rice','Rice is Lyfe','Patty_Hamburg_Mushroom_Butter_Rice.png',30000,'Patty Hamburg Mushroom Butter Rice',0,10),(85,'Chicken Bowl','Rice is Lyfe','Chicken_Bowl.jpg',28000,'Salted Egg/Cheese/Black Pepper',0,10),(86,'Crazy Rice','Rice is Lyfe','Crazy_Rice.jpg',25000,'Crazy Rice',0,10),(87,'Chicken Prek','Rice is Lyfe','Chiken_Prek.jpg',25000,'Chicken Prek',0,10),(88,'Athaya Fried Chicken','Rice is Lyfe','Athaya_Fried_Chicken.jpg',25000,'Athaya Fried Chicken',0,10),(89,'Spicy Crispy Chicken Noodle','No Rice No Cry','Spicy_Crispy_Chicken_Noodle.jpg',28000,'Spicy Crispy Chicken Noodle',0,10),(90,'Penne Aglio Olio','No Rice No Cry','Penne_Aglio_Olio.jpg',28000,'Penne Aglio Olio',0,10),(91,'Malaya Fried Noodle','No Rice No Cry','Malaya_Fried_Noodle.jpg',25000,'Malaya Fried Noodle',0,10);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-30 16:53:01
