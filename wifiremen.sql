-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: localhost    Database: wifiremen
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Current Database: `wifiremen`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `wifiremen` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wifiremen`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add beacon帧',7,'add_beacon'),(20,'Can change beacon帧',7,'change_beacon'),(21,'Can delete beacon帧',7,'delete_beacon'),(22,'Can add 确认码',8,'add_confirmstring'),(23,'Can change 确认码',8,'change_confirmstring'),(24,'Can delete 确认码',8,'delete_confirmstring'),(25,'Can add deauth帧',9,'add_deauth'),(26,'Can change deauth帧',9,'change_deauth'),(27,'Can delete deauth帧',9,'delete_deauth'),(28,'Can add 设备',10,'add_device'),(29,'Can change 设备',10,'change_device'),(30,'Can delete 设备',10,'delete_device'),(31,'Can add 热点',11,'add_point'),(32,'Can change 热点',11,'change_point'),(33,'Can delete 热点',11,'delete_point'),(34,'Can add 用户',12,'add_user'),(35,'Can change 用户',12,'change_user'),(36,'Can delete 用户',12,'delete_user'),(37,'Can add 记录',13,'add_log'),(38,'Can change 记录',13,'change_log'),(39,'Can delete 记录',13,'delete_log');
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
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$36000$palg0e0M5uTo$SgDVtgFqHKxfP3tLvOJaRm7fAO6Sh/Z17Jf08OioGAg=','2019-04-27 11:13:36.814304',1,'admin','','','248807472@qq.com',1,1,'2019-04-26 14:52:35.054962');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (5,'2019-04-26 14:52:56.789234','3','admin',3,'',12,2),(6,'2019-04-26 14:55:13.128740','4','admin',3,'',12,2),(7,'2019-04-26 15:00:10.242529','5','admin',3,'',12,2),(8,'2019-04-26 15:06:29.291186','6','admin',3,'',12,2),(9,'2019-04-26 15:08:20.497997','7','admin',3,'',12,2),(10,'2019-04-26 15:10:01.271181','8','admin',3,'',12,2),(11,'2019-04-26 15:12:53.580689','9','admin',3,'',12,2),(12,'2019-04-26 15:15:25.511182','10','admin',3,'',12,2),(13,'2019-04-26 19:17:46.414987','1','ASUS',2,'[{\"changed\": {\"fields\": [\"point\"]}}]',10,2),(14,'2019-04-26 19:19:31.043056','3','CMCC-WEB2',1,'[{\"added\": {}}]',11,2),(15,'2019-04-26 19:20:07.148486','4','77',1,'[{\"added\": {}}]',11,2),(16,'2019-04-26 19:57:20.518966','1','WiFiremen已经启动!',1,'[{\"added\": {}}]',13,2),(17,'2019-04-26 19:57:23.663802','1','WiFiremen已经启动!',2,'[]',13,2),(18,'2019-04-26 19:57:34.637444','2','WiFiremen已经关闭!',1,'[{\"added\": {}}]',13,2),(19,'2019-04-26 19:57:44.663892','3','WiFiremen已经启动!',1,'[{\"added\": {}}]',13,2),(20,'2019-04-26 19:59:00.544836','4','[警惕]丧失与绑定热点的连接!请检查当前网络!',1,'[{\"added\": {}}]',13,2),(21,'2019-04-26 19:59:22.205918','5','[危险]周围环境疑似出现Beacon洪水!',1,'[{\"added\": {}}]',13,2),(22,'2019-04-26 19:59:39.602978','6','[危险]周围环境疑似出现Deauth攻击!',1,'[{\"added\": {}}]',13,2),(23,'2019-04-26 19:59:55.740819','7','[危险]周围环境疑似出现钓鱼热点!',1,'[{\"added\": {}}]',13,2),(24,'2019-04-26 20:00:24.762944','8','[危险]周围环境疑似出现钓鱼热点!',1,'[{\"added\": {}}]',13,2),(25,'2019-04-26 20:00:34.983271','9','WiFiremen已经关闭!',1,'[{\"added\": {}}]',13,2),(26,'2019-04-26 20:15:05.854096','1','ASUS',2,'[{\"changed\": {\"fields\": [\"point\"]}}]',10,2),(27,'2019-04-26 20:15:09.454034','2','SAMSUNG',2,'[{\"changed\": {\"fields\": [\"point\"]}}]',10,2),(28,'2019-04-26 20:15:29.491016','4','77',2,'[{\"changed\": {\"fields\": [\"quality\"]}}]',11,2),(29,'2019-04-26 22:06:49.192806','11','admin',3,'',12,2),(30,'2019-04-26 22:14:10.393530','12','test',3,'',12,2),(31,'2019-04-26 22:39:59.673078','13','wt',3,'',12,2),(32,'2019-04-27 09:54:38.582012','14','admin',3,'',12,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'main','beacon'),(8,'main','confirmstring'),(9,'main','deauth'),(10,'main','device'),(13,'main','log'),(11,'main','point'),(12,'main','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-26 04:24:40.387687'),(2,'auth','0001_initial','2019-04-26 04:24:48.504997'),(3,'admin','0001_initial','2019-04-26 04:24:50.307148'),(4,'admin','0002_logentry_remove_auto_add','2019-04-26 04:24:50.369632'),(5,'contenttypes','0002_remove_content_type_name','2019-04-26 04:24:51.446218'),(6,'auth','0002_alter_permission_name_max_length','2019-04-26 04:24:52.117291'),(7,'auth','0003_alter_user_email_max_length','2019-04-26 04:24:52.856858'),(8,'auth','0004_alter_user_username_opts','2019-04-26 04:24:52.903717'),(9,'auth','0005_alter_user_last_login_null','2019-04-26 04:24:53.509707'),(10,'auth','0006_require_contenttypes_0002','2019-04-26 04:24:53.556654'),(11,'auth','0007_alter_validators_add_error_messages','2019-04-26 04:24:53.619109'),(12,'auth','0008_alter_user_username_max_length','2019-04-26 04:24:54.548459'),(13,'main','0001_initial','2019-04-26 04:25:01.894072'),(14,'sessions','0001_initial','2019-04-26 04:25:02.406826'),(15,'main','0002_auto_20190426_1236','2019-04-26 04:36:12.915959'),(16,'main','0003_log','2019-04-26 13:15:56.085893');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a4d4zpuro2homhwxvd55uuhrwk34nqty','MGY4ZmJkZTI2Y2Q4MDQ5MzdiOThkYmE0MDc4MjI3MWUwOTI5ZGNhNTp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxNSwidXNlcl9uYW1lIjoid2FuZ3RhbyJ9','2019-06-05 09:24:51.047155');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_beacon`
--

DROP TABLE IF EXISTS `main_beacon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_beacon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `point_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_beacon_point_id_80e41ecd_fk_main_point_id` (`point_id`),
  CONSTRAINT `main_beacon_point_id_80e41ecd_fk_main_point_id` FOREIGN KEY (`point_id`) REFERENCES `main_point` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_beacon`
--

LOCK TABLES `main_beacon` WRITE;
/*!40000 ALTER TABLE `main_beacon` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_beacon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_confirmstring`
--

DROP TABLE IF EXISTS `main_confirmstring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_confirmstring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(256) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `main_confirmstring_user_id_05063437_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_confirmstring`
--

LOCK TABLES `main_confirmstring` WRITE;
/*!40000 ALTER TABLE `main_confirmstring` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_confirmstring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_deauth`
--

DROP TABLE IF EXISTS `main_deauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_deauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `point_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_deauth_point_id_6629f82b_fk_main_point_id` (`point_id`),
  CONSTRAINT `main_deauth_point_id_6629f82b_fk_main_point_id` FOREIGN KEY (`point_id`) REFERENCES `main_point` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_deauth`
--

LOCK TABLES `main_deauth` WRITE;
/*!40000 ALTER TABLE `main_deauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_deauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_device`
--

DROP TABLE IF EXISTS `main_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `mac` varchar(128) NOT NULL,
  `point_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_device_point_id_ec64865a_fk_main_point_id` (`point_id`),
  CONSTRAINT `main_device_point_id_ec64865a_fk_main_point_id` FOREIGN KEY (`point_id`) REFERENCES `main_point` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_device`
--

LOCK TABLES `main_device` WRITE;
/*!40000 ALTER TABLE `main_device` DISABLE KEYS */;
INSERT INTO `main_device` VALUES (1,'ASUS','F8:32:06:A3:12:2F',4),(2,'SAMSUNG','C3:31:DA:A7:91:3F',4),(3,'UNKNOWN','07:EC:7D:9A:21:F2',4);
/*!40000 ALTER TABLE `main_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_log`
--

DROP TABLE IF EXISTS `main_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(256) NOT NULL,
  `level` int(11) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `point_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_log_point_id_0bcb590f_fk_main_point_id` (`point_id`),
  CONSTRAINT `main_log_point_id_0bcb590f_fk_main_point_id` FOREIGN KEY (`point_id`) REFERENCES `main_point` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_log`
--

LOCK TABLES `main_log` WRITE;
/*!40000 ALTER TABLE `main_log` DISABLE KEYS */;
INSERT INTO `main_log` VALUES (1,'WiFiremen已经启动!',0,'2019-03-01 23:03:20.485000',4),(2,'WiFiremen已经关闭!',0,'2019-03-02 12:16:34.533000',4),(3,'WiFiremen已经启动!',0,'2019-03-17 14:57:44.662000',4),(4,'[警惕]丧失与绑定热点的连接!请检查当前网络!',1,'2019-03-25 04:59:00.541000',4),(5,'[危险]周围环境疑似出现Beacon洪水!',2,'2019-04-14 20:59:22.203000',4),(6,'[危险]周围环境疑似出现Deauth攻击!',2,'2019-04-14 21:02:39.601000',4),(7,'[危险]周围环境疑似出现钓鱼热点!',2,'2019-04-14 21:05:55.739000',4),(8,'[危险]周围环境疑似出现钓鱼热点!',2,'2019-04-17 18:00:24.761000',4),(9,'WiFiremen已经关闭!',0,'2019-04-26 20:17:34.981000',4),(10,'[危险]网络中出现可疑设备！',2,'2019-04-18 20:17:07.348000',4),(11,'WiFiremen已经启动!',0,'2019-05-21 09:57:42.995000',4);
/*!40000 ALTER TABLE `main_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_point`
--

DROP TABLE IF EXISTS `main_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssid` varchar(128) NOT NULL,
  `mac` varchar(128) NOT NULL,
  `quality` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_point`
--

LOCK TABLES `main_point` WRITE;
/*!40000 ALTER TABLE `main_point` DISABLE KEYS */;
INSERT INTO `main_point` VALUES (1,'HUNAU','00:01:6C:06:A6:29',85),(2,'HUNAU-Auto','EA:03:06:23:5E:3F',87),(3,'CMCC-WEB2','61:E7:63:12:34:EF',98),(4,'77','DC:EF:CA:F5:36:AF',100),(5,'304-2','7D:F3:B3:31:9C:03',42),(7,'ec-13306','E7:C1:BA:32:7A:73',41),(8,'HUNAU-KY','EC:DA:32:3C:B7:3A',76);
/*!40000 ALTER TABLE `main_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_user`
--

DROP TABLE IF EXISTS `main_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(254) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `has_confirmed` tinyint(1) NOT NULL,
  `point_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `point_id` (`point_id`),
  CONSTRAINT `main_user_point_id_b3eebe3c_fk_main_point_id` FOREIGN KEY (`point_id`) REFERENCES `main_point` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_user`
--

LOCK TABLES `main_user` WRITE;
/*!40000 ALTER TABLE `main_user` DISABLE KEYS */;
INSERT INTO `main_user` VALUES (15,'wangtao','268fc139700a0a99255cd3e3eb3af2098a5d826a4bb051a253839699860a6e7b','248807472@qq.com','2019-04-27 09:55:16.261935',1,4);
/*!40000 ALTER TABLE `main_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-13 12:49:13
