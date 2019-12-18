-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: mkafe
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `detil_jual`
--

DROP TABLE IF EXISTS `detil_jual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detil_jual` (
  `no_pesan` varchar(15) DEFAULT NULL,
  `id_menu` char(4) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` varchar(3) DEFAULT NULL,
  `comment` text,
  `diskon` int(3) DEFAULT NULL,
  `ppn` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detil_jual`
--

LOCK TABLES `detil_jual` WRITE;
/*!40000 ALTER TABLE `detil_jual` DISABLE KEYS */;
INSERT INTO `detil_jual` VALUES ('TR0714082608','3',3000,'1','-',0,10),('TR0715004327','3',3000,'1','-',0,10),('TR0715004327','2',7000,'1','-',0,10),('TR0715052852','3',3300,'1','-',0,10),('TR0717101714','3',3300,'1','pahit dan panas',0,10);
/*!40000 ALTER TABLE `detil_jual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jual`
--

DROP TABLE IF EXISTS `jual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jual` (
  `id_jual` int(11) NOT NULL AUTO_INCREMENT,
  `no_pesan` varchar(15) DEFAULT NULL,
  `tgl_jual` date DEFAULT NULL,
  `id_member` char(4) DEFAULT NULL,
  `id_kasir` char(4) DEFAULT NULL,
  `total_byr` int(11) DEFAULT NULL,
  `bayar` int(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `nama_cust` varchar(50) DEFAULT NULL,
  `kontak` varchar(50) DEFAULT NULL,
  `status_byr` varchar(6) DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id_jual`),
  UNIQUE KEY `no_pesan` (`no_pesan`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jual`
--

LOCK TABLES `jual` WRITE;
/*!40000 ALTER TABLE `jual` DISABLE KEYS */;
INSERT INTO `jual` VALUES (8,'TR0714082608',NULL,'1',NULL,3000,NULL,NULL,'member','0890890890890','pesan','belum'),(9,'TR0715004327','2019-07-15','no','1',10000,10000,0,'uji','','bayar','simpan'),(10,'TR0715052852',NULL,'no',NULL,3300,NULL,NULL,'uji2','','pesan','belum'),(11,'TR0717101714',NULL,'no',NULL,3300,NULL,NULL,'uji','','pesan','belum');
/*!40000 ALTER TABLE `jual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kasir`
--

DROP TABLE IF EXISTS `kasir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kasir` (
  `id_kasir` int(11) NOT NULL AUTO_INCREMENT,
  `nm_kasir` varchar(50) DEFAULT NULL,
  `alamat` text,
  `tgl_lhr` date DEFAULT NULL,
  `kota_lhr` varchar(40) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_kasir`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kasir`
--

LOCK TABLES `kasir` WRITE;
/*!40000 ALTER TABLE `kasir` DISABLE KEYS */;
INSERT INTO `kasir` VALUES (1,'kasir','kasir','2019-07-05','semarang','89123456789','kasir@kasir','kasir','kasir'),(2,'kasir2','Semarang','2000-11-11','Semarang','089000888999','kasir@2','kasir2','kasir2');
/*!40000 ALTER TABLE `kasir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `user_login` varchar(20) DEFAULT NULL,
  `pass_login` varchar(100) DEFAULT NULL,
  `login_as` varchar(20) DEFAULT NULL,
  UNIQUE KEY `UX_login_user_login` (`user_login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('admin','*4ACFE3202A5FF5CF467898FC58AAB1D615029441','admin'),('kasir','*6E02B27D5638DD2E97ABAA5B61A4FE6D03D8DF45','kasir'),('member','*F76A0292E763BD108EA5492E25EC051F7E23E6E9','member'),('kasir2','*65A4FA02F4A4B15A53012F7CAF3E0CF0F566B3C8','kasir'),('member2','*2FAF8D7F69BBF9784796EA6D378EF19AD0D73231','member');
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
  `nm_member` varchar(50) DEFAULT NULL,
  `alamat` text,
  `no_telp` char(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_member`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'member','member','0890890890890','member@member','member','member'),(2,'member2','member2','090','member@7','member2','member2');
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
  `harga` int(11) DEFAULT NULL,
  `deskripsi` text,
  `diskon` int(3) DEFAULT NULL,
  `ppn` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Teh','minuman','esteh.jpg',3000,'Dapat disajikan dingin atau hangat',0,10),(2,'mie rebus','makanan','mierebus.jpg',7000,'Terdapat varian rasa',0,10),(3,'kopi','minuman','kopi.jpg',3000,'Dapat disajikan dingin atau panas',0,10),(4,'Roti Bakar','makanan','rotibakar.jpg',5000,'Varian rasa',0,10),(21,'Wifi','layanan','wifi.jpg',2000,'Layanan wifi',0,10);
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

-- Dump completed on 2019-07-17 11:12:41
