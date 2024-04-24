-- MariaDB dump 10.19  Distrib 10.5.23-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: sima_db
-- ------------------------------------------------------
-- Server version	10.5.23-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add Token',8,'add_tokenproxy'),(30,'Can change Token',8,'change_tokenproxy'),(31,'Can delete Token',8,'delete_tokenproxy'),(32,'Can view Token',8,'view_tokenproxy'),(33,'Can add review',9,'add_review'),(34,'Can change review',9,'change_review'),(35,'Can delete review',9,'delete_review'),(36,'Can view review',9,'view_review'),(37,'Can add publisher',10,'add_publisher'),(38,'Can change publisher',10,'change_publisher'),(39,'Can delete publisher',10,'delete_publisher'),(40,'Can view publisher',10,'view_publisher'),(41,'Can add author',11,'add_author'),(42,'Can change author',11,'change_author'),(43,'Can delete author',11,'delete_author'),(44,'Can view author',11,'view_author'),(45,'Can add book',12,'add_book'),(46,'Can change book',12,'change_book'),(47,'Can delete book',12,'delete_book'),(48,'Can view book',12,'view_book'),(49,'Can add user sima',13,'add_usersima'),(50,'Can change user sima',13,'change_usersima'),(51,'Can delete user sima',13,'delete_usersima'),(52,'Can view user sima',13,'view_usersima'),(53,'Can add daftar kunjungan',14,'add_daftarkunjungan'),(54,'Can change daftar kunjungan',14,'change_daftarkunjungan'),(55,'Can delete daftar kunjungan',14,'delete_daftarkunjungan'),(56,'Can view daftar kunjungan',14,'view_daftarkunjungan'),(57,'Can add daftar pinjam',15,'add_daftarpinjam'),(58,'Can change daftar pinjam',15,'change_daftarpinjam'),(59,'Can delete daftar pinjam',15,'delete_daftarpinjam'),(60,'Can view daftar pinjam',15,'view_daftarpinjam');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$jlTMD19arRfG5Ympu1JglA$g6Y+IW3M3ekUfOp9yteV08E9B2p5UDstWtvMeOJ11Go=','2024-04-24 08:35:13.792788',1,'khalifardy','','','',1,1,'2024-04-23 10:49:39.469855'),(2,'pbkdf2_sha256$720000$g6ggaXjHrRPhutMhOkqbqH$iJHuScUFEo4Gqm7LCzDbODCCFR623C9cBIEzkTuZFpE=',NULL,0,'khalifardy22','','','',0,1,'2024-04-24 02:44:46.334034'),(4,'pbkdf2_sha256$720000$V9aNlW1P6kxBPGOaOCFKMP$HdmB/gABU5BOsSjIONY6GlMBVf/zcIVLaYqjksLIkQM=',NULL,0,'kardina.ferlinda','','','',0,1,'2024-04-24 03:02:48.507381'),(5,'pbkdf2_sha256$720000$tpiMU18XwVvNpajqYiHQad$UWoNVpV5eCKZIeUT9dCW50J0sc/Lenk7mfVnSyQeBrY=',NULL,0,'ttnvxx','','','',0,1,'2024-04-24 03:04:55.994509'),(6,'pbkdf2_sha256$720000$R38821fTTpS3eDyRuTsFd3$Zo7LPUhD5rMY43GdcTYntQNHV1H7ZN/baF0iNLYvIN8=',NULL,0,'indriana.noviyanti','','','',0,1,'2024-04-24 03:06:33.489309'),(7,'pbkdf2_sha256$720000$M8wwssN093MpIEoEpBuzb3$TkIlvRm6BNquZi29kfJ+rJql1vZYGTC1LleaDl+0hjg=',NULL,0,'kevin.luzan','','','',0,1,'2024-04-24 23:38:26.784095'),(8,'pbkdf2_sha256$720000$2Q9MICyOF3GhNRc8uMQCGt$ro4PBafHZX2oWXw3VN1mZKB5AQDNniSDEWLl1+MsUT4=',NULL,0,'rendika.tahir','','','',0,1,'2024-04-24 23:42:30.550119');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auths_usersima`
--

DROP TABLE IF EXISTS `auths_usersima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auths_usersima` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `no_anggota` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `alamat` longtext NOT NULL,
  `mobile_phone` varchar(100) NOT NULL,
  `jenis_kelamin` smallint(5) unsigned NOT NULL CHECK (`jenis_kelamin` >= 0),
  `pekerjaan` smallint(5) unsigned NOT NULL CHECK (`pekerjaan` >= 0),
  `pendidikan` bigint(20) unsigned NOT NULL CHECK (`pendidikan` >= 0),
  `tipe` bigint(20) unsigned NOT NULL CHECK (`tipe` >= 0),
  `user_id` int(11) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nip` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `auths_usersima_user_id_109c1a6a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auths_usersima`
--

LOCK TABLES `auths_usersima` WRITE;
/*!40000 ALTER TABLE `auths_usersima` DISABLE KEYS */;
INSERT INTO `auths_usersima` VALUES (1,'376415246956','khalifardy','miqdarsah','khalifardy.miqdarsah','perumnas 1 bekasi','081310266283',1,2,6,1,2,'1991-11-26','123456'),(2,'881311555436','kardina','ferlinda','kardinaf@student.telkomuniversity.ac.id','belitong','0823245',2,3,6,2,4,'2000-11-26','123457'),(3,'374203004711','Tegar','Fadillah Z','ttnvxx@student.telkomuniversity.ac.id','Riau','08352352523',1,3,6,3,5,'2000-11-23','123458'),(4,'995874140996','Indriana ','Noviyanti','indriana@student.telkomuniversity.ac.id','Semarang','08352352521',2,3,6,2,6,'1995-11-23','123459'),(5,'891506017112','kevin','luzan de fretes','kevinluzan@student.telkomuniversity.ac.id','Jakarta','123-456-7890',1,3,6,2,7,'2000-06-27','1623456782'),(6,'213389573374','rendika','tahir ahmad','rerendikatahirahmad@student.telkomuniversity.ac.id','Jakarta','123-456-7890',1,3,6,2,8,'2000-06-20','1623456784');
/*!40000 ALTER TABLE `auths_usersima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(13,'auths','usersima'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(11,'main_page','author'),(12,'main_page','book'),(10,'main_page','publisher'),(9,'main_page','review'),(6,'sessions','session'),(14,'transaksi','daftarkunjungan'),(15,'transaksi','daftarpinjam');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-23 04:25:26.569783'),(2,'auth','0001_initial','2024-04-23 04:25:27.313206'),(3,'admin','0001_initial','2024-04-23 04:25:27.522256'),(4,'admin','0002_logentry_remove_auto_add','2024-04-23 04:25:27.549182'),(5,'admin','0003_logentry_add_action_flag_choices','2024-04-23 04:25:27.569531'),(6,'contenttypes','0002_remove_content_type_name','2024-04-23 04:25:27.658426'),(7,'auth','0002_alter_permission_name_max_length','2024-04-23 04:25:27.682807'),(8,'auth','0003_alter_user_email_max_length','2024-04-23 04:25:27.714929'),(9,'auth','0004_alter_user_username_opts','2024-04-23 04:25:27.736979'),(10,'auth','0005_alter_user_last_login_null','2024-04-23 04:25:27.826482'),(11,'auth','0006_require_contenttypes_0002','2024-04-23 04:25:27.830663'),(12,'auth','0007_alter_validators_add_error_messages','2024-04-23 04:25:27.852689'),(13,'auth','0008_alter_user_username_max_length','2024-04-23 04:25:27.890445'),(14,'auth','0009_alter_user_last_name_max_length','2024-04-23 04:25:27.916854'),(15,'auth','0010_alter_group_name_max_length','2024-04-23 04:25:27.946455'),(16,'auth','0011_update_proxy_permissions','2024-04-23 04:25:27.970514'),(17,'auth','0012_alter_user_first_name_max_length','2024-04-23 04:25:27.997340'),(18,'authtoken','0001_initial','2024-04-23 04:25:28.121975'),(19,'authtoken','0002_auto_20160226_1747','2024-04-23 04:25:28.179615'),(20,'authtoken','0003_tokenproxy','2024-04-23 04:25:28.185635'),(21,'authtoken','0004_alter_tokenproxy_options','2024-04-23 04:25:28.196721'),(22,'sessions','0001_initial','2024-04-23 04:25:28.244585'),(23,'main_page','0001_initial','2024-04-23 08:12:04.368200'),(24,'main_page','0002_alter_book_publisher','2024-04-23 08:44:49.300818'),(25,'auths','0001_initial','2024-04-23 08:45:18.605640'),(26,'transaksi','0001_initial','2024-04-23 09:03:24.707443'),(27,'auths','0002_usersima_tanggal_lahir','2024-04-23 12:10:18.242199'),(28,'main_page','0003_book_premium','2024-04-23 12:32:22.522080'),(29,'auths','0003_usersima_nip','2024-04-23 12:35:03.662699');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bpvs7a2cynmrff8qoyejcpx4tcad190g','.eJxVjMsOwiAQRf-FtSFMeXRw6d5vIAyDUjWQlHZl_HfbpAvdnnPufYsQ16WEtec5TCzOAsTpl1FMz1x3wY9Y702mVpd5Irkn8rBdXhvn1-Vo_w5K7GVb2wTG80gECpEdkwXwjAqdS4gDpAGJRpdvVnkTtduQMoYjWG2U1lp8vsWHNnw:1rzDjd:hFQnHZ-lAy9lrQxcJ8SqVP0EZNJPME2V1zQIhjX67H0','2024-05-07 10:50:49.752044'),('dhfjxjmrvfpu8mm8l0awozl2cfil7e26','.eJxVjMsOwiAQRf-FtSFMeXRw6d5vIAyDUjWQlHZl_HfbpAvdnnPufYsQ16WEtec5TCzOAsTpl1FMz1x3wY9Y702mVpd5Irkn8rBdXhvn1-Vo_w5K7GVb2wTG80gECpEdkwXwjAqdS4gDpAGJRpdvVnkTtduQMoYjWG2U1lp8vsWHNnw:1rzY5x:isGcs7ttMT9mdAQFQfk8qamyZaOq1cjlmkLm1-eiQvA','2024-05-08 08:35:13.800025');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_page_author`
--

DROP TABLE IF EXISTS `main_page_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_page_author` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_page_author`
--

LOCK TABLES `main_page_author` WRITE;
/*!40000 ALTER TABLE `main_page_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_page_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_page_book`
--

DROP TABLE IF EXISTS `main_page_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_page_book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `category` smallint(5) unsigned NOT NULL CHECK (`category` >= 0),
  `sub_category` smallint(5) unsigned NOT NULL CHECK (`sub_category` >= 0),
  `url_buku` varchar(200) NOT NULL,
  `url_image` varchar(200) NOT NULL,
  `stok` int(11) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `publisher_id` bigint(20) DEFAULT NULL,
  `premium` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_page_book_author_id_3b559e3e_fk_main_page_author_id` (`author_id`),
  KEY `main_page_book_publisher_id_d588c666_fk_main_page_publisher_id` (`publisher_id`),
  CONSTRAINT `main_page_book_author_id_3b559e3e_fk_main_page_author_id` FOREIGN KEY (`author_id`) REFERENCES `main_page_author` (`id`),
  CONSTRAINT `main_page_book_publisher_id_d588c666_fk_main_page_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `main_page_publisher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_page_book`
--

LOCK TABLES `main_page_book` WRITE;
/*!40000 ALTER TABLE `main_page_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_page_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_page_publisher`
--

DROP TABLE IF EXISTS `main_page_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_page_publisher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `website` varchar(200) NOT NULL,
  `contact` varchar(254) NOT NULL,
  `phone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_page_publisher`
--

LOCK TABLES `main_page_publisher` WRITE;
/*!40000 ALTER TABLE `main_page_publisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_page_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_page_review`
--

DROP TABLE IF EXISTS `main_page_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_page_review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review` longtext NOT NULL,
  `rating` int(11) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_page_review_book_id_82d97213_fk_main_page_book_id` (`book_id`),
  CONSTRAINT `main_page_review_book_id_82d97213_fk_main_page_book_id` FOREIGN KEY (`book_id`) REFERENCES `main_page_book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_page_review`
--

LOCK TABLES `main_page_review` WRITE;
/*!40000 ALTER TABLE `main_page_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_page_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi_daftarkunjungan`
--

DROP TABLE IF EXISTS `transaksi_daftarkunjungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi_daftarkunjungan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `masuk` datetime(6) NOT NULL,
  `keluar` datetime(6) NOT NULL,
  `anggota_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transaksi_daftarkunj_anggota_id_c1f9a426_fk_auths_use` (`anggota_id`),
  CONSTRAINT `transaksi_daftarkunj_anggota_id_c1f9a426_fk_auths_use` FOREIGN KEY (`anggota_id`) REFERENCES `auths_usersima` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi_daftarkunjungan`
--

LOCK TABLES `transaksi_daftarkunjungan` WRITE;
/*!40000 ALTER TABLE `transaksi_daftarkunjungan` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi_daftarkunjungan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi_daftarpinjam`
--

DROP TABLE IF EXISTS `transaksi_daftarpinjam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi_daftarpinjam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `tgl_pinjam` datetime(6) NOT NULL,
  `tgl_kembali` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `keterangan` longtext DEFAULT NULL,
  `anggota_id` bigint(20) NOT NULL,
  `buku_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transaksi_daftarpinjam_anggota_id_f993235c_fk_auths_usersima_id` (`anggota_id`),
  KEY `transaksi_daftarpinjam_buku_id_9eb60dce_fk_main_page_book_id` (`buku_id`),
  CONSTRAINT `transaksi_daftarpinjam_anggota_id_f993235c_fk_auths_usersima_id` FOREIGN KEY (`anggota_id`) REFERENCES `auths_usersima` (`id`),
  CONSTRAINT `transaksi_daftarpinjam_buku_id_9eb60dce_fk_main_page_book_id` FOREIGN KEY (`buku_id`) REFERENCES `main_page_book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi_daftarpinjam`
--

LOCK TABLES `transaksi_daftarpinjam` WRITE;
/*!40000 ALTER TABLE `transaksi_daftarpinjam` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi_daftarpinjam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sima_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-25  6:45:34
