-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mxonline
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can view group',2,'view_group'),(8,'Can view permission',1,'view_permission'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add session',4,'add_session'),(14,'Can change session',4,'change_session'),(15,'Can delete session',4,'delete_session'),(16,'Can view session',4,'view_session'),(17,'Can add 用户信息',5,'add_userprofile'),(18,'Can change 用户信息',5,'change_userprofile'),(19,'Can delete 用户信息',5,'delete_userprofile'),(20,'Can add 轮播图',6,'add_banner'),(21,'Can change 轮播图',6,'change_banner'),(22,'Can delete 轮播图',6,'delete_banner'),(23,'Can add 邮箱验证码',7,'add_emailverifyrecord'),(24,'Can change 邮箱验证码',7,'change_emailverifyrecord'),(25,'Can delete 邮箱验证码',7,'delete_emailverifyrecord'),(26,'Can view 轮播图',6,'view_banner'),(27,'Can view 邮箱验证码',7,'view_emailverifyrecord'),(28,'Can view 用户信息',5,'view_userprofile'),(29,'Can add 课程',8,'add_course'),(30,'Can change 课程',8,'change_course'),(31,'Can delete 课程',8,'delete_course'),(32,'Can add 课程资源',9,'add_courseresource'),(33,'Can change 课程资源',9,'change_courseresource'),(34,'Can delete 课程资源',9,'delete_courseresource'),(35,'Can add 章节',10,'add_lesson'),(36,'Can change 章节',10,'change_lesson'),(37,'Can delete 章节',10,'delete_lesson'),(38,'Can add 视频',11,'add_video'),(39,'Can change 视频',11,'change_video'),(40,'Can delete 视频',11,'delete_video'),(41,'Can add 轮播课程',8,'add_bannercourse'),(42,'Can change 轮播课程',8,'change_bannercourse'),(43,'Can delete 轮播课程',8,'delete_bannercourse'),(44,'Can view 轮播课程',12,'view_bannercourse'),(45,'Can view 课程',8,'view_course'),(46,'Can view 课程资源',9,'view_courseresource'),(47,'Can view 章节',10,'view_lesson'),(48,'Can view 视频',11,'view_video'),(49,'Can add 城市',13,'add_citydict'),(50,'Can change 城市',13,'change_citydict'),(51,'Can delete 城市',13,'delete_citydict'),(52,'Can add 课程机构',14,'add_courseorg'),(53,'Can change 课程机构',14,'change_courseorg'),(54,'Can delete 课程机构',14,'delete_courseorg'),(55,'Can add 教师',15,'add_teacher'),(56,'Can change 教师',15,'change_teacher'),(57,'Can delete 教师',15,'delete_teacher'),(58,'Can view 城市',13,'view_citydict'),(59,'Can view 课程机构',14,'view_courseorg'),(60,'Can view 教师',15,'view_teacher'),(61,'Can add 课程评论',16,'add_coursecomments'),(62,'Can change 课程评论',16,'change_coursecomments'),(63,'Can delete 课程评论',16,'delete_coursecomments'),(64,'Can add 用户咨询',17,'add_userask'),(65,'Can change 用户咨询',17,'change_userask'),(66,'Can delete 用户咨询',17,'delete_userask'),(67,'Can add 用户课程',18,'add_usercourse'),(68,'Can change 用户课程',18,'change_usercourse'),(69,'Can delete 用户课程',18,'delete_usercourse'),(70,'Can add 用户收藏',19,'add_userfavorite'),(71,'Can change 用户收藏',19,'change_userfavorite'),(72,'Can delete 用户收藏',19,'delete_userfavorite'),(73,'Can add 用户消息',20,'add_usermessage'),(74,'Can change 用户消息',20,'change_usermessage'),(75,'Can delete 用户消息',20,'delete_usermessage'),(76,'Can view 课程评论',16,'view_coursecomments'),(77,'Can view 用户咨询',17,'view_userask'),(78,'Can view 用户课程',18,'view_usercourse'),(79,'Can view 用户收藏',19,'view_userfavorite'),(80,'Can view 用户消息',20,'view_usermessage'),(81,'Can add Bookmark',21,'add_bookmark'),(82,'Can change Bookmark',21,'change_bookmark'),(83,'Can delete Bookmark',21,'delete_bookmark'),(84,'Can add User Setting',22,'add_usersettings'),(85,'Can change User Setting',22,'change_usersettings'),(86,'Can delete User Setting',22,'delete_usersettings'),(87,'Can add User Widget',23,'add_userwidget'),(88,'Can change User Widget',23,'change_userwidget'),(89,'Can delete User Widget',23,'delete_userwidget'),(90,'Can add log entry',24,'add_log'),(91,'Can change log entry',24,'change_log'),(92,'Can delete log entry',24,'delete_log'),(93,'Can view Bookmark',21,'view_bookmark'),(94,'Can view log entry',24,'view_log'),(95,'Can view User Setting',22,'view_usersettings'),(96,'Can view User Widget',23,'view_userwidget'),(97,'Can add captcha store',25,'add_captchastore'),(98,'Can change captcha store',25,'change_captchastore'),(99,'Can delete captcha store',25,'delete_captchastore'),(100,'Can view captcha store',25,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (61,'FGYF','fgyf','9793592e821915e33dd5b8a2acc648989bb75602','2017-11-23 18:15:44.282999');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `youneed_know` varchar(300) NOT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'Python入门','Python入门Python入门Python入门','Python入门Python入门Python入门Python入门Python入门Python入门Python入门Python入门Python入门Python入门Python入门Python入门',1,'cj',100,1,0,'courses/2017/11/u37268388383824523919fm27gp0.jpg',35,'后端开发','python','人生苦短我用python','好好学习天天向上','2017-11-24 20:32:00.000000',1,1),(2,'Python进阶','Python进阶Python进阶Python进阶','Python进阶Python进阶Python进阶Python进阶Python进阶Python进阶Python进阶Python进阶Python进阶Python进阶',1,'zj',120,0,0,'courses/2017/11/timg.jpg',10,'后端进阶开发','python','课程较为简单','认真学习','2017-11-24 20:35:00.000000',2,2),(3,'python算法入门','python算法入门python算法入门python算法入门','python算法入门python算法入门python算法入门python算法入门python算法入门python算法入门python算法入门python算法入门python算法入门python算法入门',1,'gj',200,0,0,'courses/2017/11/timg11.jpg',1,'python算法','python','算法','算法才是程序的灵魂','2017-11-24 20:37:00.000000',3,3),(4,'MySQL入门','MySQL入门MySQL入门MySQL入门','MySQL入门MySQL入门MySQL入门MySQL入门MySQL入门MySQL入门MySQL入门MySQL入门MySQL入门MySQL入门MySQL入门MySQL入门',0,'cj',110,1,1,'courses/2017/11/4385c71fe474fc29a8b09ddaec67eb32.jpg',8,'数据库开发','MySQL','常用数据库','数据数据','2017-11-24 20:40:00.000000',1,1),(5,'MySQL基础','MySQL基础MySQL基础MySQL基础','MySQL基础MySQL基础MySQL基础MySQL基础MySQL基础MySQL基础MySQL基础MySQL基础MySQL基础MySQL基础',0,'zj',150,1,0,'courses/2017/11/u37627668762524073929fm27gp0.jpg',4,'MySQL','MySQL','mysql很有趣','好好学','2017-11-24 20:41:00.000000',2,2),(6,'MySQL进阶','MySQL进阶MySQL进阶MySQL进阶','MySQL进阶MySQL进阶MySQL进阶MySQL进阶MySQL进阶MySQL进阶MySQL进阶MySQL进阶MySQL进阶MySQL进阶',0,'gj',600,2,0,'courses/2017/11/u8731987123578000798fm27gp0.jpg',22,'MySQL','MySQL','mysql工程师','mysql很有用','2017-11-24 20:42:00.000000',3,3),(7,'Django初体验','Django初体验Django初体验Django初体验','Django初体验Django初体验Django初体验Django初体验Django初体验Django初体验Django初体验Django初体验Django初体验Django初体验',0,'cj',110,32,1,'courses/2017/11/5705d21e0001e4f106000338-240-135.jpg',35,'Django开发','Django','django初级体验','django是目前最流行的web开发框架之一','2017-11-26 13:28:00.000000',4,1),(8,'Python开发环境搭建','Python开发环境搭建Python开发环境搭建Python开发环境搭建','<p><img src=\"/media/courses/ueditor/1161f313e06d9cbc17ecd2ee10ab40de_20171202123147_692.png\" title=\"\" alt=\"1161f313e06d9cbc17ecd2ee10ab40de.png\"/>\r\n &nbsp; &nbsp; Python开发环境搭建Python开发环境搭建Python开发环境搭建Python开发环境搭建Python开发环境搭建Python开发环境搭建Python开发环境搭建Python开发环境搭建Python开发环境搭建Python开发环境搭建</p>',0,'cj',35,64,0,'courses/2017/12/92247dbfe814e71be2b6f68cebc042dc.jpg',47,'pycharm','pycharm','python IDE pycharm','工欲善其事必先利其器','2017-11-27 21:11:00.000000',3,3);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (1,'前端html源码','course/resource/2017/11/前端html源码-最新.zip','2017-11-26 21:46:00.000000',7);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'第一章 前情提要',20,'2017-11-26 13:22:00.000000',4),(2,'第二章 如何正确使用join语句',30,'2017-11-26 13:25:00.000000',4),(3,'第一章 课程介绍及开发环境搭建',10,'2017-11-26 13:30:00.000000',7),(4,'第二章 创建工程及应用',26,'2017-11-26 13:32:00.000000',7),(5,'第一章 pycharm',0,'2017-11-27 21:13:00.000000',8),(6,'第二章 MySQL和Navicat安装和使用',0,'2017-11-27 21:14:00.000000',8),(7,'第三章python安装',5,'2017-11-27 21:15:00.000000',8),(8,'第四章 虚拟环境',0,'2017-11-27 21:15:00.000000',8);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'1.1 SQL发展历程',2,'https://www.imooc.com/video/7762','2017-11-26 13:23:00.000000',1),(2,'1.2 SQL语句分类',5,'https://www.imooc.com/video/7763','2017-11-26 13:24:00.000000',1),(3,'2.1 join语句——内连接',4,'https://www.imooc.com/video/7764','2017-11-26 13:26:00.000000',2),(4,'2.2 join从句——左外连接',5,'https://www.imooc.com/video/7765','2017-11-26 13:26:00.000000',2),(5,'1.1 django初体验课程介绍',4,'https://www.imooc.com/video/8909','2017-11-26 13:31:00.000000',3),(6,'1.2 django环境搭建',10,'https://www.imooc.com/video/8914','2017-11-26 13:31:00.000000',3),(7,'2.1 django之创建工程及应用一',15,'https://www.imooc.com/video/8910','2017-11-26 13:33:00.000000',4),(8,'2.2 django之创建工程及应用二',0,'https://www.imooc.com/video/8911','2017-11-26 13:33:00.000000',4),(9,'1.1 pycharm的安装和简单使用',4,'http://mxonline.oss-cn-beijing.aliyuncs.com/2-1%20pycharm%E7%9A%84%E5%AE%89%E8%A3%85%E5%92%8C%E7%AE%80%E5%8D%95%E4%BD%BF%E7%94%A8.mp4?Expires=1511955169&OSSAccessKeyId=TMP.AQHQV7S8Vr2cKcnH-AFSXloj15xhHdIV0BZBGFNpYbkwnFRoxciXzMeJR5IlMC4CFQCQP-VPmzjdcVDOziHVtmVaOdBxtwIVAI2u8KsE6rX1_oAop2_Rs8ok0WwF&Signature=c4%2BaBMiG72fcGQcdzcivHKCKO7Y%3D','2017-11-27 21:16:00.000000',5),(10,'2.1 mysql和navicat订单安装和使用',0,'http://mxonline.oss-cn-beijing.aliyuncs.com/2-2%20mysql%E5%92%8Cnavicat%E7%9A%84%E5%AE%89%E8%A3%85%E5%92%8C%E4%BD%BF%E7%94%A8.mp4?Expires=1511955209&OSSAccessKeyId=TMP.AQHQV7S8Vr2cKcnH-AFSXloj15xhHdIV0BZBGFNpYbkwnFRoxciXzMeJR5IlMC4CFQCQP-VPmzjdcVDOziHVtmVaOdBxtwIVAI2u8KsE6rX1_oAop2_Rs8ok0WwF&Signature=3c47XPQJRahO%2B3V2u9U06tXVpTQ%3D','2017-11-27 21:18:00.000000',6),(11,'3.1 windows和linux下安装python2和python3',0,'http://mxonline.oss-cn-beijing.aliyuncs.com/2-3%20windows%E5%92%8Clinux%E4%B8%8B%E5%AE%89%E8%A3%85python2%E5%92%8Cpython3.mp4?Expires=1511955228&OSSAccessKeyId=TMP.AQHQV7S8Vr2cKcnH-AFSXloj15xhHdIV0BZBGFNpYbkwnFRoxciXzMeJR5IlMC4CFQCQP-VPmzjdcVDOziHVtmVaOdBxtwIVAI2u8KsE6rX1_oAop2_Rs8ok0WwF&Signature=azIsKBPSWfv0iGRQbXaMuFV%2Bb1c%3D','2017-11-27 21:19:00.000000',7),(12,'4.1 虚拟环境的安装和配置',0,'http://mxonline.oss-cn-beijing.aliyuncs.com/2-4%20%E8%99%9A%E6%8B%9F%E7%8E%AF%E5%A2%83%E7%9A%84%E5%AE%89%E8%A3%85%E5%92%8C%E9%85%8D%E7%BD%AE.mp4?Expires=1511955249&OSSAccessKeyId=TMP.AQHQV7S8Vr2cKcnH-AFSXloj15xhHdIV0BZBGFNpYbkwnFRoxciXzMeJR5IlMC4CFQCQP-VPmzjdcVDOziHVtmVaOdBxtwIVAI2u8KsE6rX1_oAop2_Rs8ok0WwF&Signature=upGKmR%2FSa4q6r95nkVie5mdBUwA%3D','2017-11-27 21:20:00.000000',8);
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'auth','group'),(1,'auth','permission'),(25,'captcha','captchastore'),(3,'contenttypes','contenttype'),(12,'courses','bannercourse'),(8,'courses','course'),(9,'courses','courseresource'),(10,'courses','lesson'),(11,'courses','video'),(16,'operation','coursecomments'),(17,'operation','userask'),(18,'operation','usercourse'),(19,'operation','userfavorite'),(20,'operation','usermessage'),(13,'organization','citydict'),(14,'organization','courseorg'),(15,'organization','teacher'),(4,'sessions','session'),(6,'users','banner'),(7,'users','emailverifyrecord'),(5,'users','userprofile'),(21,'xadmin','bookmark'),(24,'xadmin','log'),(22,'xadmin','usersettings'),(23,'xadmin','userwidget');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-11-19 21:20:52.429802'),(2,'contenttypes','0002_remove_content_type_name','2017-11-19 21:20:52.534808'),(3,'auth','0001_initial','2017-11-19 21:20:52.938831'),(4,'auth','0002_alter_permission_name_max_length','2017-11-19 21:20:53.013836'),(5,'auth','0003_alter_user_email_max_length','2017-11-19 21:20:53.022836'),(6,'auth','0004_alter_user_username_opts','2017-11-19 21:20:53.030836'),(7,'auth','0005_alter_user_last_login_null','2017-11-19 21:20:53.038837'),(8,'auth','0006_require_contenttypes_0002','2017-11-19 21:20:53.041837'),(9,'auth','0007_alter_validators_add_error_messages','2017-11-19 21:20:53.048838'),(10,'auth','0008_alter_user_username_max_length','2017-11-19 21:20:53.057838'),(11,'organization','0001_initial','2017-11-19 21:20:53.296852'),(12,'courses','0001_initial','2017-11-19 21:20:53.890886'),(13,'users','0001_initial','2017-11-19 21:20:54.507921'),(14,'operation','0001_initial','2017-11-19 21:20:54.682931'),(15,'operation','0002_auto_20171119_2117','2017-11-19 21:20:55.488977'),(16,'sessions','0001_initial','2017-11-19 21:20:55.546980'),(17,'xadmin','0001_initial','2017-11-19 21:20:55.945003'),(18,'xadmin','0002_log','2017-11-19 21:20:56.130014'),(19,'xadmin','0003_auto_20160715_0100','2017-11-19 21:20:56.217019'),(20,'captcha','0001_initial','2017-11-20 22:39:40.476590'),(21,'courses','0002_auto_20171127_2151','2017-11-27 21:51:23.208819');
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
INSERT INTO `django_session` VALUES ('bhpz23jcuz4y52vz4702k0ft42zqpmvy','MDI4ZDRhOWJjZDE3Yjg5ZTBkZWM0ZTc4YTNiY2ViNTE3N2EyOTkxZjp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YzcwYTk4MDlkODExMzg3M2RhYjgyNTVmZmFmYmQ5MDMyZTM0YTUxIn0=','2017-12-07 18:11:44.656085'),('iq1xzxaztjrs4at1uycoca61nobosi1w','MmJiMDlkNjIwMWIxOTljNjA3Y2E5ZDBlYWY0MDJiOGFhNjNmN2QyZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhMTM0NDZiZWY1YjZjZjNiMTFmMGYzYjY0YjdjMTkyNDgyODE1YzEiLCJuYXZfbWVudSI6Ilt7XCJ0aXRsZVwiOiBcIlx1NjczYVx1Njc4NFx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NTdjZVx1NWUwMlwiLCBcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL2NpdHlkaWN0L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxMH0sIHtcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU2NzNhXHU2Nzg0XCIsIFwidXJsXCI6IFwiL3hhZG1pbi9vcmdhbml6YXRpb24vY291cnNlb3JnL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxMX0sIHtcInRpdGxlXCI6IFwiXHU2NTU5XHU1ZTA4XCIsIFwidXJsXCI6IFwiL3hhZG1pbi9vcmdhbml6YXRpb24vdGVhY2hlci9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTJ9XSwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL29yZ2FuaXphdGlvbi9jaXR5ZGljdC9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU0ZmUxXHU2MDZmXCIsIFwidXJsXCI6IFwiL3hhZG1pbi91c2Vycy91c2VycHJvZmlsZS9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1OTBhZVx1N2JiMVx1OWE4Y1x1OGJjMVx1NzgwMVwiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvZW1haWx2ZXJpZnlyZWNvcmQvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDR9LCB7XCJ0aXRsZVwiOiBcIlx1OGY2ZVx1NjRhZFx1NTZmZVwiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvYmFubmVyL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA1fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3VzZXJzL3VzZXJwcm9maWxlL1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTY0Y2RcdTRmNWNcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTU0YThcdThiZTJcIiwgXCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VyYXNrL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxM30sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU4YmZlXHU3YTBiXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb24vdXNlcmNvdXJzZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTR9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NmQ4OFx1NjA2ZlwiLCBcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL3VzZXJtZXNzYWdlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNX0sIHtcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU4YmM0XHU4YmJhXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb24vY291cnNlY29tbWVudHMvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE2fSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTY1MzZcdTg1Y2ZcIiwgXCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VyZmF2b3JpdGUvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE3fV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb24vdXNlcmFzay9cIn0sIHtcInRpdGxlXCI6IFwiXHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU2NWU1XHU1ZmQ3XCIsIFwidXJsXCI6IFwiL3hhZG1pbi94YWRtaW4vbG9nL1wiLCBcImljb25cIjogXCJmYSBmYS1jb2dcIiwgXCJvcmRlclwiOiAxOX1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1jb2dcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1N2VjNFwiLCBcInVybFwiOiBcIi94YWRtaW4vYXV0aC9ncm91cC9cIiwgXCJpY29uXCI6IFwiZmEgZmEtZ3JvdXBcIiwgXCJvcmRlclwiOiAxfSwge1widGl0bGVcIjogXCJcdTY3NDNcdTk2NTBcIiwgXCJ1cmxcIjogXCIveGFkbWluL2F1dGgvcGVybWlzc2lvbi9cIiwgXCJpY29uXCI6IFwiZmEgZmEtbG9ja1wiLCBcIm9yZGVyXCI6IDN9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtZ3JvdXBcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL2F1dGgvZ3JvdXAvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlwiLCBcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9jb3Vyc2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDZ9LCB7XCJ0aXRsZVwiOiBcIlx1N2FlMFx1ODI4MlwiLCBcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9sZXNzb24vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDd9LCB7XCJ0aXRsZVwiOiBcIlx1ODljNlx1OTg5MVwiLCBcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy92aWRlby9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogOH0sIHtcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU4ZDQ0XHU2ZTkwXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9jb3Vyc2VzL2NvdXJzZXJlc291cmNlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA5fV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9jb3Vyc2VzL2NvdXJzZS9cIn1dIiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImNvdXJzZSJdLCIiXX0=','2017-12-16 12:32:25.327034');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecomments`
--

DROP TABLE IF EXISTS `operation_coursecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecomments`
--

LOCK TABLES `operation_coursecomments` WRITE;
/*!40000 ALTER TABLE `operation_coursecomments` DISABLE KEYS */;
INSERT INTO `operation_coursecomments` VALUES (1,'肥的','2017-11-26 22:51:06.999912',7,1),(2,'可以评论','2017-11-26 22:52:28.164555',7,1),(3,'python开发环境搭建','2017-11-27 22:16:02.654438',8,1);
/*!40000 ALTER TABLE `operation_coursecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
INSERT INTO `operation_userask` VALUES (1,'dd','13548569612','dd','2017-11-24 19:43:49.097737'),(2,'hj','13752684524','1212','2017-11-24 19:44:12.623083');
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (1,'2017-11-26 21:50:20.444341',7,1),(2,'2017-11-26 21:56:50.173633',6,1),(3,'2017-11-27 21:21:41.759926',8,1),(4,'2017-11-27 22:01:07.227223',1,1),(5,'2017-11-27 22:19:09.740139',4,1),(6,'2017-11-30 18:19:41.215976',5,1);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (27,3,2,'2017-11-29 21:41:01.190612',1),(31,7,1,'2017-11-29 22:43:24.166698',1),(33,2,2,'2017-11-29 22:48:51.157401',1),(34,4,2,'2017-11-29 22:49:00.632943',1),(36,4,1,'2017-11-29 22:49:11.056539',1),(38,1,3,'2017-11-29 22:49:22.569198',1),(39,2,3,'2017-11-29 22:49:28.095514',1);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
INSERT INTO `operation_usermessage` VALUES (1,2,'欢迎注册慕课学院',0,'2017-11-21 20:26:41.593083'),(2,3,'欢迎注册慕课学院',0,'2017-11-21 20:27:56.599374'),(3,4,'欢迎注册慕课学院',0,'2017-11-21 20:40:33.914689'),(4,5,'欢迎注册慕课学院',0,'2017-11-21 20:41:39.500441'),(5,6,'欢迎注册慕课学院',0,'2017-11-21 20:51:46.935184'),(6,7,'欢迎注册慕课学院',0,'2017-11-21 20:59:08.994468'),(7,8,'欢迎注册慕课学院',0,'2017-11-21 21:10:57.798010'),(8,9,'欢迎注册慕课学院',0,'2017-11-22 19:07:41.217196'),(9,10,'欢迎注册慕课学院',0,'2017-11-22 19:09:23.632054'),(10,11,'欢迎注册慕课学院',0,'2017-11-22 21:31:54.685146'),(11,1,'欢迎注册慕课学院',1,'2017-11-29 23:22:00.000000');
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'北京市','首都','2017-11-23 18:47:00.000000'),(2,'南京市','六朝古都','2017-11-23 18:47:00.000000'),(3,'上海市','繁华都市','2017-11-23 18:51:00.000000'),(4,'天津市','狗不理包子','2017-11-23 18:51:00.000000'),(5,'广州市','闽南话','2017-11-23 18:53:00.000000');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `tag` varchar(10) NOT NULL,
  `category` varchar(20) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `students` int(11) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'北京大学','北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学北京大学','全国知名','gx',43,0,'org/2017/11/bjdx.jpg','北京',0,0,'2017-11-23 18:44:00.000000',1),(2,'清华大学','清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学清华大学','全国知名','gx',15,1,'org/2017/11/qhdx-logo.png','北京市',0,0,'2017-11-23 18:48:00.000000',1),(3,'南京大学','南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学南京大学','全国知名','gx',8,1,'org/2017/11/njdx.jpg','南京市',0,0,'2017-11-23 18:48:00.000000',2),(4,'慕课网1','慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1慕课网1','良心企业','pxjg',2,1,'org/2017/11/imooc.png','上海',0,0,'2017-11-23 18:49:00.000000',3),(5,'慕课网2','慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2慕课网2','认证机构','pxjg',1,0,'org/2017/11/imooc_Gn1sRjp_AWPRGCn.png','天津市',0,0,'2017-11-23 18:51:00.000000',4),(6,'慕课网3','慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3慕课网3','知名企业','pxjg',0,0,'org/2017/11/imooc_klgAUn5.png','广州市',0,0,'2017-11-23 18:52:00.000000',5),(7,'慕课网4','慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4慕课网4','认证机构','pxjg',0,0,'org/2017/11/imooc_OO2ykYP.png','广州市',0,0,'2017-11-23 18:53:00.000000',5),(8,'慕课网5','慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5慕课网5','知名企业','gr',0,0,'org/2017/11/imooc_qEaMov1.png','江宁区',0,0,'2017-11-23 18:53:00.000000',2),(9,'慕课网6','慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6慕课网6','全国知名','gr',0,0,'org/2017/11/imooc_V0TJOyb.png','栖霞区',0,0,'2017-11-23 18:54:00.000000',2),(10,'慕课网7','慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7慕课网7','良心企业','gr',0,0,'org/2017/11/imooc_Y2Tonsq.png','建邺区',0,0,'2017-11-23 18:55:00.000000',2);
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (1,'xue01',10,'北京大学','工程师','严谨负责',13,4,36,'teacher/2017/11/af7add35a825f97d9828edb3b63d9cb8.png','2017-11-23 18:56:00.000000',1),(2,'xue02',5,'清华大学','教授','风趣幽默',3,2,26,'teacher/2017/11/475d19c64f975713aafd30c6522bb86d.png','2017-11-23 18:58:00.000000',2),(3,'xue03',6,'南京大学','老师','科学严谨',2,1,28,'teacher/2017/11/20c57daa15f3e7a92cb914ab5edaf179.jpg','2017-11-23 18:59:00.000000',3);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
INSERT INTO `users_banner` VALUES (1,'001','banner/2017/11/5a163a75000171b909360316.jpg','http://coding.imooc.com/class/162.html',100,'2017-11-30 19:53:00.000000'),(2,'002','banner/2017/11/5a1e815e0001075809360316.jpg','http://coding.imooc.com/class/163.html',100,'2017-11-30 19:55:00.000000'),(3,'003','banner/2017/11/5a1e875f00012e1309360316.jpg','http://coding.imooc.com/class/150.html',100,'2017-11-30 19:55:00.000000'),(4,'004','banner/2017/11/5a162fa20001e83c09360316.jpg','http://coding.imooc.com/class/96.html',100,'2017-11-30 19:57:00.000000'),(5,'005','banner/2017/11/5a0cfba00001b7f709360316.jpg','http://coding.imooc.com/class/157.html',100,'2017-11-30 19:57:00.000000'),(6,'006','banner/2017/11/5a1e88dd0001505309360316.jpg','http://coding.imooc.com/class/107.html',100,'2017-11-30 19:58:00.000000');
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (11,'WyOjX1uESzOPl6As','xuegj1010@163.com','register','2017-11-22 21:31:54.698147'),(12,'cF34UjKcveDRhqq9','xuegj1010@163.com','forgetpwd','2017-11-22 21:34:34.234272'),(13,'SB3kbC72ebrrcjR5','xuegj1010@163.com','forgetpwd','2017-11-22 21:59:48.003854'),(14,'or9W0VFGPFxbL7Wb','xuegj1010@163.com','forgetpwd','2017-11-22 22:10:07.941313'),(15,'4I0u8vEI66mdH5uu','xuegj1010@163.com','forgetpwd','2017-11-22 22:15:08.380497'),(16,'J5InmuWAjXSdSb4F','xuegj1010@163.com','forgetpwd','2017-11-22 22:59:22.233289'),(17,'DjU9dyfdGb1skU8g','xuegj1010@163.com','forgetpwd','2017-11-22 23:01:44.496426'),(18,'f1AktW81NTdZDvs8','xuegj1010@163.com','forgetpwd','2017-11-22 23:10:30.952537'),(19,'pNH9G5LXXbi3ghMv','xuegj1010@163.com','forgetpwd','2017-11-22 23:16:08.501844'),(20,'5dDxlf9fn7gryHK1','xuegj1010@163.com','forgetpwd','2017-11-23 18:11:00.981587'),(21,'jUwS','xuegj1010@sina.com','update_email','2017-11-29 20:20:43.428052'),(22,'Skos','869624090@qq.com','update_email','2017-11-29 20:31:43.901829'),(23,'e77e','869624090@qq.com','update_email','2017-11-29 20:32:34.430719'),(24,'DzjU','xuegj@163.coom','update_email','2017-11-29 20:33:28.709824'),(25,'eJw4','xuegj@163.com','update_email','2017-11-29 20:33:37.221310'),(26,'3quC','xuegj1010@sina.com','update_email','2017-11-29 20:34:23.394951');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
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
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$36000$4xGcVFGnCCLy$XiC6BOW2tIiRlOhlqVNHzSITvBAxBk4NZP4ALauj42Y=','2017-12-01 19:10:51.216566',1,'xue','','','xuegj1010@sina.com',1,1,'2017-11-19 21:32:00.000000','xueguojun','2017-11-01','male','太','13770961707','image/2017/11/0991da2379ab9218400x400_big_jsvTO55.jpg'),(11,'pbkdf2_sha256$36000$Ej5m4QD4t8z6$TeLgMW031GA2cmZNDstRVtcO/PQ79x7nib8ZxOZ2xzg=','2017-11-23 18:41:40.875823',0,'xuegj1010@163.com','','','xuegj1010@163.com',0,1,'2017-11-22 21:31:54.634143','',NULL,'female','',NULL,'image/default.png');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2017-11-23 18:47:16.584025','127.0.0.1','1','北京市','create','已添加',13,1),(2,'2017-11-23 18:47:30.241806','127.0.0.1','2','南京市','create','已添加',13,1),(3,'2017-11-23 18:47:58.028395','127.0.0.1','1','北京大学','create','已添加',14,1),(4,'2017-11-23 18:48:48.325272','127.0.0.1','2','清华大学','create','已添加',14,1),(5,'2017-11-23 18:49:33.635864','127.0.0.1','3','南京大学','create','已添加',14,1),(6,'2017-11-23 18:51:22.093067','127.0.0.1','3','上海市','create','已添加',13,1),(7,'2017-11-23 18:51:25.955288','127.0.0.1','4','慕课网1','create','已添加',14,1),(8,'2017-11-23 18:52:15.637130','127.0.0.1','4','天津市','create','已添加',13,1),(9,'2017-11-23 18:52:28.360857','127.0.0.1','5','慕课网2','create','已添加',14,1),(10,'2017-11-23 18:53:24.290056','127.0.0.1','5','广州市','create','已添加',13,1),(11,'2017-11-23 18:53:27.168221','127.0.0.1','6','慕课网3','create','已添加',14,1),(12,'2017-11-23 18:53:57.886978','127.0.0.1','7','慕课网4','create','已添加',14,1),(13,'2017-11-23 18:54:45.067677','127.0.0.1','8','慕课网5','create','已添加',14,1),(14,'2017-11-23 18:55:15.997446','127.0.0.1','9','慕课网6','create','已添加',14,1),(15,'2017-11-23 18:56:10.230548','127.0.0.1','10','慕课网7','create','已添加',14,1),(16,'2017-11-23 18:58:30.232555','127.0.0.1','1','xue01','create','已添加',15,1),(17,'2017-11-23 18:59:14.558091','127.0.0.1','2','xue02','create','已添加',15,1),(18,'2017-11-23 19:00:19.536807','127.0.0.1','3','xue03','create','已添加',15,1),(19,'2017-11-23 19:00:46.282337','127.0.0.1','1','xue01','change','修改 work_company 和 image',15,1),(20,'2017-11-23 19:37:56.599904','127.0.0.1','1','北京大学','change','修改 image',14,1),(21,'2017-11-23 19:38:26.593619','127.0.0.1','2','清华大学','change','修改 image',14,1),(22,'2017-11-23 19:38:36.295174','127.0.0.1','3','南京大学','change','修改 image',14,1),(23,'2017-11-23 19:38:45.954727','127.0.0.1','4','慕课网1','change','修改 image',14,1),(24,'2017-11-23 19:38:55.126251','127.0.0.1','5','慕课网2','change','修改 image',14,1),(25,'2017-11-23 19:39:05.006816','127.0.0.1','5','慕课网2','change','修改 image',14,1),(26,'2017-11-23 19:39:16.735487','127.0.0.1','6','慕课网3','change','修改 image',14,1),(27,'2017-11-23 19:39:28.111138','127.0.0.1','7','慕课网4','change','修改 image',14,1),(28,'2017-11-23 19:39:36.683628','127.0.0.1','8','慕课网5','change','修改 image',14,1),(29,'2017-11-23 19:39:48.624311','127.0.0.1','9','慕课网6','change','修改 image',14,1),(30,'2017-11-23 19:40:01.372040','127.0.0.1','10','慕课网7','change','修改 image',14,1),(31,'2017-11-23 20:39:28.490068','127.0.0.1','5','慕课网2','change','修改 image',14,1),(32,'2017-11-24 20:35:43.158851','127.0.0.1','1','Python入门','create','已添加',8,1),(33,'2017-11-24 20:37:05.796578','127.0.0.1','2','Python进阶','create','已添加',8,1),(34,'2017-11-24 20:38:28.920332','127.0.0.1','3','python算法入门','create','已添加',8,1),(35,'2017-11-24 20:41:25.410427','127.0.0.1','4','MySQL入门','create','已添加',8,1),(36,'2017-11-24 20:42:35.840455','127.0.0.1','5','MySQL基础','create','已添加',8,1),(37,'2017-11-24 20:43:41.770226','127.0.0.1','6','MySQL进阶','create','已添加',8,1),(38,'2017-11-25 12:00:05.429305','127.0.0.1','3','xue03','change','修改 image',15,1),(39,'2017-11-25 12:00:27.724581','127.0.0.1','2','xue02','change','修改 image',15,1),(40,'2017-11-25 12:00:34.477967','127.0.0.1','1','xue01','change','修改 image',15,1),(41,'2017-11-25 12:03:19.754420','127.0.0.1','4','MySQL入门','change','修改 image',8,1),(42,'2017-11-25 23:09:55.920070','127.0.0.1','1','xue','change','修改 last_login，nick_name，gender，address 和 image',5,1),(43,'2017-11-26 13:23:21.619711','127.0.0.1','1','第一章 前情提要','create','已添加',10,1),(44,'2017-11-26 13:23:26.576994','127.0.0.1','1','第一章 前情提要','change','没有数据变化',10,1),(45,'2017-11-26 13:24:18.310954','127.0.0.1','1','1.1 SQL发展历程','create','已添加',11,1),(46,'2017-11-26 13:25:01.100401','127.0.0.1','2','1.2 SQL语句分类','create','已添加',11,1),(47,'2017-11-26 13:25:08.375817','127.0.0.1','1','第一章 前情提要','change','没有数据变化',10,1),(48,'2017-11-26 13:25:52.922365','127.0.0.1','2','第二章','create','已添加',10,1),(49,'2017-11-26 13:26:10.457368','127.0.0.1','2','第二章 如何正确使用join语句','change','修改 name',10,1),(50,'2017-11-26 13:26:56.860022','127.0.0.1','3','2.1 join语句——内连接','create','已添加',11,1),(51,'2017-11-26 13:27:38.222388','127.0.0.1','4','2.2 join从句——左外连接','create','已添加',11,1),(52,'2017-11-26 13:30:28.463125','127.0.0.1','7','Django初体验','create','已添加',8,1),(53,'2017-11-26 13:31:10.903552','127.0.0.1','3','第一章 课程介绍及开发环境搭建','create','已添加',10,1),(54,'2017-11-26 13:31:49.854780','127.0.0.1','5','1.1 django初体验课程介绍','create','已添加',11,1),(55,'2017-11-26 13:32:16.655313','127.0.0.1','6','1.2 django环境搭建','create','已添加',11,1),(56,'2017-11-26 13:33:13.128543','127.0.0.1','4','第二章 创建工程及应用','create','已添加',10,1),(57,'2017-11-26 13:33:52.448792','127.0.0.1','7','2.1 django之创建工程及应用一','create','已添加',11,1),(58,'2017-11-26 13:34:21.704466','127.0.0.1','8','2.2 django之创建工程及应用二','create','已添加',11,1),(59,'2017-11-26 21:46:55.475618','127.0.0.1','1','CourseResource object','create','已添加',9,1),(60,'2017-11-27 21:13:26.712611','127.0.0.1','8','Python开发环境搭建','create','已添加',8,1),(61,'2017-11-27 21:14:25.532975','127.0.0.1','5','第一章 pycharm','create','已添加',10,1),(62,'2017-11-27 21:15:13.867740','127.0.0.1','6','第二章 MySQL和Navicat安装和使用','create','已添加',10,1),(63,'2017-11-27 21:15:42.452375','127.0.0.1','7','第三章python安装','create','已添加',10,1),(64,'2017-11-27 21:15:55.797138','127.0.0.1','8','第四章 虚拟环境','create','已添加',10,1),(65,'2017-11-27 21:16:38.812598','127.0.0.1','9','pycharm的安装和简单使用','create','已添加',11,1),(66,'2017-11-27 21:18:42.290661','127.0.0.1','10','2.1 mysql和navicat订单安装和使用','create','已添加',11,1),(67,'2017-11-27 21:19:19.769804','127.0.0.1','9','1.1 pycharm的安装和简单使用','change','修改 name',11,1),(68,'2017-11-27 21:20:37.914274','127.0.0.1','11','3.1 windows和linux下安装python2和python3','create','已添加',11,1),(69,'2017-11-27 21:21:27.958136','127.0.0.1','12','4.1 虚拟环境的安装和配置','create','已添加',11,1),(70,'2017-11-27 21:52:27.367489','127.0.0.1','9','1.1 pycharm的安装和简单使用','change','修改 url',11,1),(71,'2017-11-27 21:52:56.207138','127.0.0.1','10','2.1 mysql和navicat订单安装和使用','change','修改 url',11,1),(72,'2017-11-27 21:53:19.756485','127.0.0.1','11','3.1 windows和linux下安装python2和python3','change','修改 url',11,1),(73,'2017-11-27 21:53:45.275945','127.0.0.1','12','4.1 虚拟环境的安装和配置','change','修改 url',11,1),(74,'2017-11-28 20:56:52.734763','127.0.0.1','1','xue','change','修改 last_login，birthday，mobile 和 image',5,1),(75,'2017-11-29 18:33:20.872559','127.0.0.1','9','1.1 pycharm的安装和简单使用','change','修改 url',11,1),(76,'2017-11-29 18:33:40.312671','127.0.0.1','10','2.1 mysql和navicat订单安装和使用','change','修改 url',11,1),(77,'2017-11-29 18:34:04.541057','127.0.0.1','11','3.1 windows和linux下安装python2和python3','change','修改 url',11,1),(78,'2017-11-29 18:34:19.672922','127.0.0.1','12','4.1 虚拟环境的安装和配置','change','修改 url',11,1),(79,'2017-11-29 23:22:35.722200','127.0.0.1','11','UserMessage object','create','已添加',20,1),(80,'2017-11-30 19:55:12.256773','127.0.0.1','1','Banner object','create','已添加',6,1),(81,'2017-11-30 19:55:42.165484','127.0.0.1','2','Banner object','create','已添加',6,1),(82,'2017-11-30 19:56:24.686916','127.0.0.1','3','Banner object','create','已添加',6,1),(83,'2017-11-30 19:57:21.037139','127.0.0.1','3','Banner object','change','修改 image',6,1),(84,'2017-11-30 19:57:49.499767','127.0.0.1','4','Banner object','create','已添加',6,1),(85,'2017-11-30 19:58:35.157378','127.0.0.1','5','Banner object','create','已添加',6,1),(86,'2017-11-30 19:58:52.441367','127.0.0.1','5','Banner object','change','修改 image',6,1),(87,'2017-11-30 19:59:37.818962','127.0.0.1','6','Banner object','create','已添加',6,1),(88,'2017-12-02 12:32:25.134023','127.0.0.1','8','Python开发环境搭建','change','修改 detail 和 image',8,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-02 13:04:25
