-- MySQL dump 10.13  Distrib 5.1.66, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: moodle
-- ------------------------------------------------------
-- Server version	5.1.66-0ubuntu0.10.04.3

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) NOT NULL DEFAULT '',
  `resubmit` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '100000',
  `timedue` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_submissions`
--

DROP TABLE IF EXISTS `assignment_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_submissions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `numfiles` bigint(10) unsigned NOT NULL DEFAULT '0',
  `data1` text,
  `data2` text,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` text NOT NULL,
  `format` smallint(4) unsigned NOT NULL DEFAULT '0',
  `teacher` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemarked` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assisubm_use_ix` (`userid`),
  KEY `assisubm_mai_ix` (`mailed`),
  KEY `assisubm_tim_ix` (`timemarked`),
  KEY `assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_submissions`
--

LOCK TABLES `assignment_submissions` WRITE;
/*!40000 ALTER TABLE `assignment_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_controllers`
--

DROP TABLE IF EXISTS `backup_controllers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_controllers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT 'backup',
  `type` varchar(10) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `format` varchar(20) NOT NULL DEFAULT '',
  `interactive` smallint(4) unsigned NOT NULL,
  `purpose` smallint(4) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `status` smallint(4) unsigned NOT NULL,
  `execution` smallint(4) unsigned NOT NULL,
  `executiontime` bigint(10) unsigned NOT NULL,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `controller` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backcont_bac_uix` (`backupid`),
  KEY `backcont_typite_ix` (`type`,`itemid`),
  KEY `backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store the backup_controllers as they are used';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_controllers`
--

LOCK TABLES `backup_controllers` WRITE;
/*!40000 ALTER TABLE `backup_controllers` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_controllers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_courses`
--

DROP TABLE IF EXISTS `backup_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_courses` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `laststatus` varchar(1) NOT NULL DEFAULT '0',
  `nextstarttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store every course backup status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_courses`
--

LOCK TABLES `backup_courses` WRITE;
/*!40000 ALTER TABLE `backup_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_files`
--

DROP TABLE IF EXISTS `backup_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_files` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backup_code` bigint(10) unsigned NOT NULL DEFAULT '0',
  `file_type` varchar(10) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `old_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `new_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `backfile_bacfilpat_uix` (`backup_code`,`file_type`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store and recode ids to user and course files';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_files`
--

LOCK TABLES `backup_files` WRITE;
/*!40000 ALTER TABLE `backup_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_files_template`
--

DROP TABLE IF EXISTS `backup_files_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_files_template` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `info` mediumtext,
  PRIMARY KEY (`id`),
  KEY `backfiletemp_bacconcomfilit_ix` (`backupid`,`contextid`,`component`,`filearea`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store files along the backup process. Note this table isn';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_files_template`
--

LOCK TABLES `backup_files_template` WRITE;
/*!40000 ALTER TABLE `backup_files_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_files_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_ids`
--

DROP TABLE IF EXISTS `backup_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_ids` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backup_code` bigint(12) unsigned NOT NULL DEFAULT '0',
  `table_name` varchar(30) NOT NULL DEFAULT '',
  `old_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `new_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `info` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backids_bactabold_uix` (`backup_code`,`table_name`,`old_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store and convert ids in backup/restore';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_ids`
--

LOCK TABLES `backup_ids` WRITE;
/*!40000 ALTER TABLE `backup_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_ids_template`
--

DROP TABLE IF EXISTS `backup_ids_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_ids_template` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `itemname` varchar(160) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `newitemid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `parentitemid` bigint(10) unsigned DEFAULT NULL,
  `info` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backidstemp_baciteite_uix` (`backupid`,`itemname`,`itemid`),
  KEY `backidstemp_bacitepar_ix` (`backupid`,`itemname`,`parentitemid`),
  KEY `backidstemp_bacitenew_ix` (`backupid`,`itemname`,`newitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all sort of ids along the backup process. Note this';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_ids_template`
--

LOCK TABLES `backup_ids_template` WRITE;
/*!40000 ALTER TABLE `backup_ids_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_ids_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_log`
--

DROP TABLE IF EXISTS `backup_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `info` varchar(255) NOT NULL DEFAULT '',
  `backuptype` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `backlog_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store every course backup log info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_log`
--

LOCK TABLES `backup_log` WRITE;
/*!40000 ALTER TABLE `backup_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_logs`
--

DROP TABLE IF EXISTS `backup_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_logs` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `loglevel` smallint(4) unsigned NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backlogs_bacid_uix` (`backupid`,`id`),
  KEY `backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all the logs from backup and restore operations (by';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_logs`
--

LOCK TABLES `backup_logs` WRITE;
/*!40000 ALTER TABLE `backup_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `version` bigint(10) unsigned NOT NULL DEFAULT '0',
  `cron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastcron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bloc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='contains all installed blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES (1,'activity_modules',2007101509,0,0,1),(2,'admin_bookmarks',2007101509,0,0,1),(3,'blog_menu',2009071700,0,0,0),(4,'blog_recent',2009070900,0,0,1),(5,'blog_tags',2007101509,0,0,1),(6,'calendar_month',2007101509,0,0,1),(7,'calendar_upcoming',2007101509,0,0,1),(8,'comments',2009072000,0,0,1),(9,'community',2010042701,0,0,1),(10,'completionstatus',2009072800,0,0,1),(11,'course_list',2007101509,0,0,1),(12,'course_overview',2010021100,0,0,1),(13,'course_summary',2007101509,0,0,1),(14,'feedback',2010050200,0,0,0),(15,'glossary_random',2007101509,0,0,1),(16,'html',2010071900,0,0,1),(17,'login',2007101509,0,0,1),(18,'mentees',2007101509,0,0,1),(19,'messages',2007101509,0,0,1),(20,'mnet_hosts',2007101509,0,0,1),(21,'myprofile',2009123100,0,0,1),(22,'navigation',2010091400,0,0,1),(23,'news_items',2007101509,0,0,1),(24,'online_users',2007101510,0,0,1),(25,'participants',2007101509,0,0,1),(26,'private_files',2010030100,0,0,1),(27,'quiz_results',2007101509,0,0,1),(28,'recent_activity',2007101509,0,0,1),(29,'rss_client',2009072901,300,1360797423,1),(30,'search',2010111100,1,0,0),(31,'search_forums',2007101509,0,0,1),(32,'section_links',2007101511,0,0,1),(33,'selfcompletion',2009072800,0,0,1),(34,'settings',2010091400,0,0,1),(35,'site_main_menu',2007101509,0,0,1),(36,'social_activities',2007101509,0,0,1),(37,'tag_flickr',2007101509,0,0,1),(38,'tag_youtube',2007101509,0,0,1),(39,'tags',2010090502,0,0,1);
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_community`
--

DROP TABLE IF EXISTS `block_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_community` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `coursename` varchar(255) NOT NULL DEFAULT '',
  `coursedescription` longtext,
  `courseurl` varchar(255) NOT NULL DEFAULT '',
  `imageurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Community block';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_community`
--

LOCK TABLES `block_community` WRITE;
/*!40000 ALTER TABLE `block_community` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_instance_old`
--

DROP TABLE IF EXISTS `block_instance_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_instance_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `oldid` bigint(10) unsigned NOT NULL,
  `blockid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pagetype` varchar(20) NOT NULL DEFAULT '',
  `position` varchar(10) NOT NULL DEFAULT '',
  `weight` smallint(3) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `configdata` text,
  PRIMARY KEY (`id`),
  KEY `blocinstold_pag_ix` (`pageid`),
  KEY `blocinstold_pag2_ix` (`pagetype`),
  KEY `blocinstold_blo_ix` (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of 1.9 block instances - to be deleted';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_instance_old`
--

LOCK TABLES `block_instance_old` WRITE;
/*!40000 ALTER TABLE `block_instance_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_instance_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_instances`
--

DROP TABLE IF EXISTS `block_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) unsigned NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) DEFAULT NULL,
  `defaultregion` varchar(16) NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` text,
  PRIMARY KEY (`id`),
  KEY `blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='This table stores block instances. The type of block this is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_instances`
--

LOCK TABLES `block_instances` WRITE;
/*!40000 ALTER TABLE `block_instances` DISABLE KEYS */;
INSERT INTO `block_instances` VALUES (1,'site_main_menu',2,0,'site-index',NULL,'side-pre',0,''),(2,'course_summary',2,0,'site-index',NULL,'side-post',0,''),(3,'calendar_month',2,0,'site-index',NULL,'side-post',1,''),(4,'navigation',1,1,'*',NULL,'side-pre',0,''),(5,'settings',1,1,'*',NULL,'side-pre',1,''),(6,'admin_bookmarks',1,0,'admin-*',NULL,'side-pre',0,''),(7,'private_files',1,0,'my-index','2','side-post',0,''),(8,'online_users',1,0,'my-index','2','side-post',1,''),(9,'course_overview',1,0,'my-index','2','content',0,''),(10,'search_forums',14,0,'course-view-*',NULL,'side-post',0,''),(11,'news_items',14,0,'course-view-*',NULL,'side-post',1,''),(12,'calendar_upcoming',14,0,'course-view-*',NULL,'side-post',2,''),(13,'recent_activity',14,0,'course-view-*',NULL,'side-post',3,''),(14,'search_forums',27,0,'course-view-*',NULL,'side-post',0,''),(15,'news_items',27,0,'course-view-*',NULL,'side-post',1,''),(16,'calendar_upcoming',27,0,'course-view-*',NULL,'side-post',2,''),(17,'recent_activity',27,0,'course-view-*',NULL,'side-post',3,''),(18,'search_forums',32,0,'course-view-*',NULL,'side-post',0,''),(19,'news_items',32,0,'course-view-*',NULL,'side-post',1,''),(20,'calendar_upcoming',32,0,'course-view-*',NULL,'side-post',2,''),(21,'recent_activity',32,0,'course-view-*',NULL,'side-post',3,''),(22,'search_forums',37,0,'course-view-*',NULL,'side-post',0,''),(23,'news_items',37,0,'course-view-*',NULL,'side-post',1,''),(24,'calendar_upcoming',37,0,'course-view-*',NULL,'side-post',2,''),(25,'recent_activity',37,0,'course-view-*',NULL,'side-post',3,''),(26,'search_forums',44,0,'course-view-*',NULL,'side-post',0,''),(27,'news_items',44,0,'course-view-*',NULL,'side-post',1,''),(28,'calendar_upcoming',44,0,'course-view-*',NULL,'side-post',2,''),(29,'recent_activity',44,0,'course-view-*',NULL,'side-post',3,'');
/*!40000 ALTER TABLE `block_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_pinned_old`
--

DROP TABLE IF EXISTS `block_pinned_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_pinned_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pagetype` varchar(20) NOT NULL DEFAULT '',
  `position` varchar(10) NOT NULL DEFAULT '',
  `weight` smallint(3) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `configdata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blocpinnold_pag_ix` (`pagetype`),
  KEY `blocpinnold_blo_ix` (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of 1.9 pinned blocks - to be deleted';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_pinned_old`
--

LOCK TABLES `block_pinned_old` WRITE;
/*!40000 ALTER TABLE `block_pinned_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_pinned_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_positions`
--

DROP TABLE IF EXISTS `block_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_positions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) unsigned NOT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `pagetype` varchar(64) NOT NULL DEFAULT '',
  `subpage` varchar(16) NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `blocposi_blo_ix` (`blockinstanceid`),
  KEY `blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the position of a sticky block_instance on a another ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_positions`
--

LOCK TABLES `block_positions` WRITE;
/*!40000 ALTER TABLE `block_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_rss_client`
--

DROP TABLE IF EXISTS `block_rss_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_rss_client` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` text NOT NULL,
  `preferredtitle` varchar(64) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `shared` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_rss_client`
--

LOCK TABLES `block_rss_client` WRITE;
/*!40000 ALTER TABLE `block_rss_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_rss_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_search_documents`
--

DROP TABLE IF EXISTS `block_search_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_search_documents` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `docid` varchar(32) NOT NULL DEFAULT '',
  `doctype` varchar(32) NOT NULL DEFAULT 'none',
  `itemtype` varchar(32) NOT NULL DEFAULT 'standard',
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `docdate` bigint(10) unsigned NOT NULL DEFAULT '0',
  `updated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blocseardocu_doc_ix` (`docid`),
  KEY `blocseardocu_doc2_ix` (`doctype`),
  KEY `blocseardocu_ite_ix` (`itemtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table to store search index backups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_search_documents`
--

LOCK TABLES `block_search_documents` WRITE;
/*!40000 ALTER TABLE `block_search_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_search_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_association`
--

DROP TABLE IF EXISTS `blog_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_association` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `blogid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blogasso_con_ix` (`contextid`),
  KEY `blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associations of blog entries with courses and module instanc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_association`
--

LOCK TABLES `blog_association` WRITE;
/*!40000 ALTER TABLE `blog_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_external`
--

DROP TABLE IF EXISTS `blog_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_external` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `url` text NOT NULL,
  `filtertags` varchar(255) DEFAULT NULL,
  `failedlastsync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `timefetched` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='External blog links used for RSS copying of blog entries to ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_external`
--

LOCK TABLES `blog_external` WRITE;
/*!40000 ALTER TABLE `blog_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_filters`
--

DROP TABLE IF EXISTS `cache_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_filters` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `version` bigint(10) unsigned NOT NULL DEFAULT '0',
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `rawtext` text NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_filters`
--

LOCK TABLES `cache_filters` WRITE;
/*!40000 ALTER TABLE `cache_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_flags`
--

DROP TABLE IF EXISTS `cache_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_flags` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` mediumtext NOT NULL,
  `expiry` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cachflag_fla_ix` (`flagtype`),
  KEY `cachflag_nam_ix` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache of time-sensitive flags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_flags`
--

LOCK TABLES `cache_flags` WRITE;
/*!40000 ALTER TABLE `cache_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_text`
--

DROP TABLE IF EXISTS `cache_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_text` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `formattedtext` longtext NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cachtext_md5_ix` (`md5key`),
  KEY `cachtext_tim_ix` (`timemodified`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='For storing temporary copies of processed texts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_text`
--

LOCK TABLES `cache_text` WRITE;
/*!40000 ALTER TABLE `cache_text` DISABLE KEYS */;
INSERT INTO `cache_text` VALUES (1,'645eef79328213b5c4498e03f1ed3c33','<div class=\"no-overflow\"><div class=\"text_to_html\"><p><strong>Welcome to Faber.edu</strong></p></div></div>',1360798689),(2,'b2e2f5d569e6919b41120300158f0a1b','<div class=\"no-overflow\"><p>This course discusses the best practices of Computer Security and Local Area Networking.</p>\r\n<p>good luck<br /><strong>Measuring And Reviewing The Yen</strong>!</p>\r\n<p> </p>\r\n<p><span style=\"font-size: xx-small;\">designed by JV</span></p></div>',1360798689),(3,'fcae03c1b930ecb21061abf07c256f62','<div class=\"no-overflow\"><p>Home of the <strong>pfSense</strong> project, free Open Source FreeBSD based firewall, router, unified threat management, load balancing, multi WAN, Linux</p></div>',1360798689),(4,'583032e0948ec1edafce67170fee767a','<div class=\"no-overflow\"><p>﻿﻿﻿﻿﻿﻿﻿</p></div>',1360798689),(5,'79bca160374bbe4cdd23adac278544ae','Computer Security- Best Practices',1360798689),(6,'11e6b5958ff74d71a616505c15dd94f3','LAN-104 Firewall',1360798689),(7,'c07db0fdbcdd2d8331c3122f51a4c183','LAN103 Cybersafety',1360798689),(8,'cd71b342bfb282e210ad23ee1183d77a','Orientation to IT Professions',1360798689),(9,'0839166243b04e6ccb7e505552584a4e','ART-101  Digital Photo',1360798689);
/*!40000 ALTER TABLE `cache_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capabilities`
--

DROP TABLE IF EXISTS `capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capabilities` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `captype` varchar(50) NOT NULL DEFAULT '',
  `contextlevel` bigint(10) unsigned NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `capa_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capabilities`
--

LOCK TABLES `capabilities` WRITE;
/*!40000 ALTER TABLE `capabilities` DISABLE KEYS */;
INSERT INTO `capabilities` VALUES (1,'moodle/site:config','write',10,'moodle',62),(2,'moodle/site:readallmessages','read',10,'moodle',8),(3,'moodle/site:sendmessage','write',10,'moodle',16),(4,'moodle/site:approvecourse','write',10,'moodle',4),(5,'moodle/backup:backupcourse','write',50,'moodle',28),(6,'moodle/backup:backupsection','write',50,'moodle',28),(7,'moodle/backup:backupactivity','write',70,'moodle',28),(8,'moodle/backup:backuptargethub','write',50,'moodle',28),(9,'moodle/backup:backuptargetimport','write',50,'moodle',28),(10,'moodle/backup:downloadfile','write',50,'moodle',28),(11,'moodle/backup:configure','write',50,'moodle',28),(12,'moodle/backup:userinfo','read',50,'moodle',8),(13,'moodle/backup:anonymise','read',50,'moodle',8),(14,'moodle/restore:restorecourse','write',50,'moodle',28),(15,'moodle/restore:restoresection','write',50,'moodle',28),(16,'moodle/restore:restoreactivity','write',50,'moodle',28),(17,'moodle/restore:viewautomatedfilearea','write',50,'moodle',28),(18,'moodle/restore:restoretargethub','write',50,'moodle',28),(19,'moodle/restore:restoretargetimport','write',50,'moodle',28),(20,'moodle/restore:uploadfile','write',50,'moodle',28),(21,'moodle/restore:configure','write',50,'moodle',28),(22,'moodle/restore:rolldates','write',50,'moodle',0),(23,'moodle/restore:userinfo','write',50,'moodle',30),(24,'moodle/restore:createuser','write',10,'moodle',24),(25,'moodle/site:manageblocks','write',80,'moodle',20),(26,'moodle/site:accessallgroups','read',50,'moodle',0),(27,'moodle/site:viewfullnames','read',50,'moodle',0),(28,'moodle/site:viewreports','read',50,'moodle',8),(29,'moodle/site:trustcontent','write',50,'moodle',4),(30,'moodle/site:uploadusers','write',10,'moodle',24),(31,'moodle/filter:manage','write',50,'moodle',0),(32,'moodle/user:create','write',10,'moodle',24),(33,'moodle/user:delete','write',10,'moodle',8),(34,'moodle/user:update','write',10,'moodle',24),(35,'moodle/user:viewdetails','read',50,'moodle',0),(36,'moodle/user:viewalldetails','read',30,'moodle',8),(37,'moodle/user:viewhiddendetails','read',50,'moodle',8),(38,'moodle/user:loginas','write',50,'moodle',30),(39,'moodle/user:managesyspages','write',10,'moodle',0),(40,'moodle/user:manageblocks','write',30,'moodle',0),(41,'moodle/user:manageownblocks','write',10,'moodle',0),(42,'moodle/user:manageownfiles','write',10,'moodle',0),(43,'moodle/my:configsyspages','write',10,'moodle',0),(44,'moodle/role:assign','write',50,'moodle',28),(45,'moodle/role:review','read',50,'moodle',8),(46,'moodle/role:override','write',50,'moodle',28),(47,'moodle/role:safeoverride','write',50,'moodle',16),(48,'moodle/role:manage','write',10,'moodle',28),(49,'moodle/role:switchroles','read',50,'moodle',12),(50,'moodle/category:manage','write',40,'moodle',4),(51,'moodle/category:viewhiddencategories','read',40,'moodle',0),(52,'moodle/cohort:manage','write',40,'moodle',0),(53,'moodle/cohort:assign','write',40,'moodle',0),(54,'moodle/cohort:view','read',50,'moodle',0),(55,'moodle/course:create','write',40,'moodle',4),(56,'moodle/course:request','write',10,'moodle',0),(57,'moodle/course:delete','write',50,'moodle',32),(58,'moodle/course:update','write',50,'moodle',4),(59,'moodle/course:view','read',50,'moodle',0),(60,'moodle/course:enrolreview','read',50,'moodle',8),(61,'moodle/course:enrolconfig','write',50,'moodle',8),(62,'moodle/course:bulkmessaging','write',50,'moodle',16),(63,'moodle/course:viewhiddenuserfields','read',50,'moodle',8),(64,'moodle/course:viewhiddencourses','read',50,'moodle',0),(65,'moodle/course:visibility','write',50,'moodle',0),(66,'moodle/course:managefiles','write',50,'moodle',4),(67,'moodle/course:manageactivities','write',50,'moodle',4),(68,'moodle/course:activityvisibility','write',50,'moodle',0),(69,'moodle/course:viewhiddenactivities','write',50,'moodle',0),(70,'moodle/course:viewparticipants','read',50,'moodle',0),(71,'moodle/course:changefullname','write',50,'moodle',4),(72,'moodle/course:changeshortname','write',50,'moodle',4),(73,'moodle/course:changeidnumber','write',50,'moodle',4),(74,'moodle/course:changecategory','write',50,'moodle',4),(75,'moodle/course:changesummary','write',50,'moodle',4),(76,'moodle/site:viewparticipants','read',10,'moodle',0),(77,'moodle/course:viewscales','read',50,'moodle',0),(78,'moodle/course:managescales','write',50,'moodle',0),(79,'moodle/course:managegroups','write',50,'moodle',0),(80,'moodle/course:reset','write',50,'moodle',32),(81,'moodle/blog:view','read',10,'moodle',0),(82,'moodle/blog:search','read',10,'moodle',0),(83,'moodle/blog:viewdrafts','read',10,'moodle',8),(84,'moodle/blog:create','write',10,'moodle',16),(85,'moodle/blog:manageentries','write',10,'moodle',16),(86,'moodle/blog:manageexternal','write',10,'moodle',16),(87,'moodle/blog:associatecourse','write',50,'moodle',0),(88,'moodle/blog:associatemodule','write',70,'moodle',0),(89,'moodle/calendar:manageownentries','write',50,'moodle',16),(90,'moodle/calendar:managegroupentries','write',50,'moodle',16),(91,'moodle/calendar:manageentries','write',50,'moodle',16),(92,'moodle/user:editprofile','write',30,'moodle',24),(93,'moodle/user:editownprofile','write',10,'moodle',16),(94,'moodle/user:changeownpassword','write',10,'moodle',0),(95,'moodle/user:readuserposts','read',30,'moodle',0),(96,'moodle/user:readuserblogs','read',30,'moodle',0),(97,'moodle/user:viewuseractivitiesreport','read',30,'moodle',8),(98,'moodle/user:editmessageprofile','write',30,'moodle',16),(99,'moodle/user:editownmessageprofile','write',10,'moodle',0),(100,'moodle/question:managecategory','write',50,'moodle',20),(101,'moodle/question:add','write',50,'moodle',20),(102,'moodle/question:editmine','write',50,'moodle',20),(103,'moodle/question:editall','write',50,'moodle',20),(104,'moodle/question:viewmine','read',50,'moodle',0),(105,'moodle/question:viewall','read',50,'moodle',0),(106,'moodle/question:usemine','read',50,'moodle',0),(107,'moodle/question:useall','read',50,'moodle',0),(108,'moodle/question:movemine','write',50,'moodle',0),(109,'moodle/question:moveall','write',50,'moodle',0),(110,'moodle/question:config','write',10,'moodle',2),(111,'moodle/question:flag','write',50,'moodle',0),(112,'moodle/site:doclinks','read',10,'moodle',0),(113,'moodle/course:sectionvisibility','write',50,'moodle',0),(114,'moodle/course:useremail','write',50,'moodle',0),(115,'moodle/course:viewhiddensections','write',50,'moodle',0),(116,'moodle/course:setcurrentsection','write',50,'moodle',0),(117,'moodle/site:mnetlogintoremote','read',10,'moodle',0),(118,'moodle/grade:viewall','read',50,'moodle',8),(119,'moodle/grade:view','read',50,'moodle',0),(120,'moodle/grade:viewhidden','read',50,'moodle',8),(121,'moodle/grade:import','write',50,'moodle',12),(122,'moodle/grade:export','read',50,'moodle',8),(123,'moodle/grade:manage','write',50,'moodle',12),(124,'moodle/grade:edit','write',50,'moodle',12),(125,'moodle/grade:manageoutcomes','write',50,'moodle',0),(126,'moodle/grade:manageletters','write',50,'moodle',0),(127,'moodle/grade:hide','write',50,'moodle',0),(128,'moodle/grade:lock','write',50,'moodle',0),(129,'moodle/grade:unlock','write',50,'moodle',0),(130,'moodle/my:manageblocks','write',10,'moodle',0),(131,'moodle/notes:view','read',50,'moodle',0),(132,'moodle/notes:manage','write',50,'moodle',16),(133,'moodle/tag:manage','write',10,'moodle',16),(134,'moodle/tag:create','write',10,'moodle',16),(135,'moodle/tag:edit','write',10,'moodle',16),(136,'moodle/tag:editblocks','write',10,'moodle',0),(137,'moodle/block:view','read',80,'moodle',0),(138,'moodle/block:edit','write',80,'moodle',20),(139,'moodle/portfolio:export','read',10,'moodle',0),(140,'moodle/comment:view','read',50,'moodle',0),(141,'moodle/comment:post','write',50,'moodle',24),(142,'moodle/comment:delete','write',50,'moodle',32),(143,'moodle/webservice:createtoken','write',10,'moodle',62),(144,'moodle/rating:view','read',50,'moodle',0),(145,'moodle/rating:viewany','read',50,'moodle',8),(146,'moodle/rating:viewall','read',50,'moodle',8),(147,'moodle/rating:rate','write',50,'moodle',0),(148,'moodle/course:publish','write',10,'moodle',24),(149,'moodle/course:markcomplete','write',50,'moodle',0),(150,'moodle/community:add','write',10,'moodle',0),(151,'moodle/community:download','write',10,'moodle',0),(152,'mod/assignment:view','read',70,'mod_assignment',0),(153,'mod/assignment:submit','write',70,'mod_assignment',0),(154,'mod/assignment:grade','write',70,'mod_assignment',4),(155,'mod/assignment:exportownsubmission','read',70,'mod_assignment',0),(156,'mod/chat:chat','write',70,'mod_chat',16),(157,'mod/chat:readlog','read',70,'mod_chat',0),(158,'mod/chat:deletelog','write',70,'mod_chat',0),(159,'mod/chat:exportparticipatedsession','read',70,'mod_chat',8),(160,'mod/chat:exportsession','read',70,'mod_chat',8),(161,'mod/choice:choose','write',70,'mod_choice',0),(162,'mod/choice:readresponses','read',70,'mod_choice',0),(163,'mod/choice:deleteresponses','write',70,'mod_choice',0),(164,'mod/choice:downloadresponses','read',70,'mod_choice',0),(165,'mod/data:viewentry','read',70,'mod_data',0),(166,'mod/data:writeentry','write',70,'mod_data',16),(167,'mod/data:comment','write',70,'mod_data',16),(168,'mod/data:rate','write',70,'mod_data',0),(169,'mod/data:viewrating','read',70,'mod_data',0),(170,'mod/data:viewanyrating','read',70,'mod_data',8),(171,'mod/data:viewallratings','read',70,'mod_data',8),(172,'mod/data:approve','write',70,'mod_data',16),(173,'mod/data:manageentries','write',70,'mod_data',16),(174,'mod/data:managecomments','write',70,'mod_data',16),(175,'mod/data:managetemplates','write',70,'mod_data',20),(176,'mod/data:viewalluserpresets','read',70,'mod_data',0),(177,'mod/data:manageuserpresets','write',70,'mod_data',20),(178,'mod/data:exportentry','read',70,'mod_data',8),(179,'mod/data:exportownentry','read',70,'mod_data',0),(180,'mod/data:exportallentries','read',70,'mod_data',8),(181,'mod/feedback:view','read',70,'mod_feedback',0),(182,'mod/feedback:complete','write',70,'mod_feedback',16),(183,'mod/feedback:viewanalysepage','read',70,'mod_feedback',8),(184,'mod/feedback:deletesubmissions','write',70,'mod_feedback',0),(185,'mod/feedback:mapcourse','write',70,'mod_feedback',0),(186,'mod/feedback:edititems','write',70,'mod_feedback',20),(187,'mod/feedback:createprivatetemplate','write',70,'mod_feedback',16),(188,'mod/feedback:createpublictemplate','write',70,'mod_feedback',16),(189,'mod/feedback:deletetemplate','write',70,'mod_feedback',0),(190,'mod/feedback:viewreports','read',70,'mod_feedback',8),(191,'mod/feedback:receivemail','read',70,'mod_feedback',8),(192,'mod/folder:view','read',70,'mod_folder',0),(193,'mod/folder:managefiles','write',70,'mod_folder',16),(194,'mod/forum:viewdiscussion','read',70,'mod_forum',0),(195,'mod/forum:viewhiddentimedposts','read',70,'mod_forum',0),(196,'mod/forum:startdiscussion','write',70,'mod_forum',16),(197,'mod/forum:replypost','write',70,'mod_forum',16),(198,'mod/forum:addnews','write',70,'mod_forum',16),(199,'mod/forum:replynews','write',70,'mod_forum',16),(200,'mod/forum:viewrating','read',70,'mod_forum',0),(201,'mod/forum:viewanyrating','read',70,'mod_forum',8),(202,'mod/forum:viewallratings','read',70,'mod_forum',8),(203,'mod/forum:rate','write',70,'mod_forum',0),(204,'mod/forum:createattachment','write',70,'mod_forum',16),(205,'mod/forum:deleteownpost','read',70,'mod_forum',0),(206,'mod/forum:deleteanypost','read',70,'mod_forum',0),(207,'mod/forum:splitdiscussions','read',70,'mod_forum',0),(208,'mod/forum:movediscussions','read',70,'mod_forum',0),(209,'mod/forum:editanypost','write',70,'mod_forum',16),(210,'mod/forum:viewqandawithoutposting','read',70,'mod_forum',0),(211,'mod/forum:viewsubscribers','read',70,'mod_forum',0),(212,'mod/forum:managesubscriptions','read',70,'mod_forum',16),(213,'mod/forum:initialsubscriptions','read',70,'mod_forum',0),(214,'mod/forum:postwithoutthrottling','write',70,'mod_forum',16),(215,'mod/forum:exportdiscussion','read',70,'mod_forum',8),(216,'mod/forum:exportpost','read',70,'mod_forum',8),(217,'mod/forum:exportownpost','read',70,'mod_forum',8),(218,'mod/glossary:write','write',70,'mod_glossary',16),(219,'mod/glossary:manageentries','write',70,'mod_glossary',16),(220,'mod/glossary:managecategories','write',70,'mod_glossary',16),(221,'mod/glossary:comment','write',70,'mod_glossary',16),(222,'mod/glossary:managecomments','write',70,'mod_glossary',16),(223,'mod/glossary:import','write',70,'mod_glossary',16),(224,'mod/glossary:export','read',70,'mod_glossary',0),(225,'mod/glossary:approve','write',70,'mod_glossary',16),(226,'mod/glossary:rate','write',70,'mod_glossary',0),(227,'mod/glossary:viewrating','read',70,'mod_glossary',0),(228,'mod/glossary:viewanyrating','read',70,'mod_glossary',8),(229,'mod/glossary:viewallratings','read',70,'mod_glossary',8),(230,'mod/glossary:exportentry','read',70,'mod_glossary',8),(231,'mod/glossary:exportownentry','read',70,'mod_glossary',0),(232,'mod/imscp:view','read',70,'mod_imscp',0),(233,'mod/lesson:edit','write',70,'mod_lesson',4),(234,'mod/lesson:manage','write',70,'mod_lesson',0),(235,'mod/page:view','read',70,'mod_page',0),(236,'mod/quiz:view','read',70,'mod_quiz',0),(237,'mod/quiz:attempt','write',70,'mod_quiz',16),(238,'mod/quiz:reviewmyattempts','read',70,'mod_quiz',0),(239,'mod/quiz:manage','write',70,'mod_quiz',16),(240,'mod/quiz:manageoverrides','write',70,'mod_quiz',0),(241,'mod/quiz:preview','write',70,'mod_quiz',0),(242,'mod/quiz:grade','write',70,'mod_quiz',16),(243,'mod/quiz:regrade','write',70,'mod_quiz',16),(244,'mod/quiz:viewreports','read',70,'mod_quiz',8),(245,'mod/quiz:deleteattempts','write',70,'mod_quiz',32),(246,'mod/quiz:ignoretimelimits','read',70,'mod_quiz',0),(247,'mod/quiz:emailconfirmsubmission','read',70,'mod_quiz',0),(248,'mod/quiz:emailnotifysubmission','read',70,'mod_quiz',0),(249,'mod/resource:view','read',70,'mod_resource',0),(250,'mod/scorm:viewreport','read',70,'mod_scorm',0),(251,'mod/scorm:skipview','write',70,'mod_scorm',0),(252,'mod/scorm:savetrack','write',70,'mod_scorm',0),(253,'mod/scorm:viewscores','read',70,'mod_scorm',0),(254,'mod/scorm:deleteresponses','read',70,'mod_scorm',0),(255,'mod/survey:participate','read',70,'mod_survey',0),(256,'mod/survey:readresponses','read',70,'mod_survey',0),(257,'mod/survey:download','read',70,'mod_survey',0),(258,'mod/url:view','read',70,'mod_url',0),(259,'mod/wiki:viewpage','read',70,'mod_wiki',0),(260,'mod/wiki:editpage','write',70,'mod_wiki',16),(261,'mod/wiki:createpage','write',70,'mod_wiki',16),(262,'mod/wiki:viewcomment','read',70,'mod_wiki',0),(263,'mod/wiki:editcomment','write',70,'mod_wiki',16),(264,'mod/wiki:managecomment','write',70,'mod_wiki',0),(265,'mod/wiki:overridelock','write',70,'mod_wiki',0),(266,'mod/wiki:managewiki','write',70,'mod_wiki',0),(267,'mod/workshop:view','read',70,'mod_workshop',0),(268,'mod/workshop:switchphase','write',70,'mod_workshop',0),(269,'mod/workshop:editdimensions','write',70,'mod_workshop',4),(270,'mod/workshop:submit','write',70,'mod_workshop',0),(271,'mod/workshop:peerassess','write',70,'mod_workshop',0),(272,'mod/workshop:manageexamples','write',70,'mod_workshop',0),(273,'mod/workshop:allocate','write',70,'mod_workshop',0),(274,'mod/workshop:publishsubmissions','write',70,'mod_workshop',0),(275,'mod/workshop:viewauthornames','read',70,'mod_workshop',0),(276,'mod/workshop:viewreviewernames','read',70,'mod_workshop',0),(277,'mod/workshop:viewallsubmissions','read',70,'mod_workshop',0),(278,'mod/workshop:viewpublishedsubmissions','read',70,'mod_workshop',0),(279,'mod/workshop:viewallassessments','read',70,'mod_workshop',0),(280,'mod/workshop:overridegrades','write',70,'mod_workshop',0),(281,'enrol/authorize:config','write',50,'enrol_authorize',0),(282,'enrol/authorize:manage','write',50,'enrol_authorize',0),(283,'enrol/authorize:unenrol','write',50,'enrol_authorize',0),(284,'enrol/authorize:unenrolself','write',50,'enrol_authorize',0),(285,'enrol/authorize:managepayments','write',10,'enrol_authorize',8),(286,'enrol/authorize:uploadcsv','write',10,'enrol_authorize',4),(287,'enrol/category:synchronised','write',10,'enrol_category',0),(288,'enrol/cohort:config','write',50,'enrol_cohort',0),(289,'enrol/guest:config','write',50,'enrol_guest',0),(290,'enrol/ldap:manage','write',50,'enrol_ldap',0),(291,'enrol/manual:config','write',50,'enrol_manual',0),(292,'enrol/manual:enrol','write',50,'enrol_manual',0),(293,'enrol/manual:manage','write',50,'enrol_manual',0),(294,'enrol/manual:unenrol','write',50,'enrol_manual',0),(295,'enrol/manual:unenrolself','write',50,'enrol_manual',0),(296,'enrol/meta:config','write',50,'enrol_meta',0),(297,'enrol/meta:selectaslinked','read',50,'enrol_meta',0),(298,'enrol/paypal:config','write',50,'enrol_paypal',0),(299,'enrol/paypal:manage','write',50,'enrol_paypal',0),(300,'enrol/paypal:unenrol','write',50,'enrol_paypal',0),(301,'enrol/paypal:unenrolself','write',50,'enrol_paypal',0),(302,'enrol/self:config','write',50,'enrol_self',0),(303,'enrol/self:manage','write',50,'enrol_self',0),(304,'enrol/self:unenrolself','write',50,'enrol_self',0),(305,'enrol/self:unenrol','write',50,'enrol_self',0),(306,'block/online_users:viewlist','read',80,'block_online_users',0),(307,'block/rss_client:manageownfeeds','write',80,'block_rss_client',0),(308,'block/rss_client:manageanyfeeds','write',80,'block_rss_client',16),(309,'report/courseoverview:view','read',10,'report_courseoverview',8),(310,'report/customlang:view','read',10,'report_customlang',2),(311,'report/customlang:edit','write',10,'report_customlang',6),(312,'report/questioninstances:view','read',10,'report_questioninstances',0),(313,'report/security:view','read',10,'report_security',2),(314,'report/unittest:view','read',10,'report_unittest',32),(315,'coursereport/completion:view','read',50,'coursereport_completion',8),(316,'coursereport/log:view','read',50,'coursereport_log',8),(317,'coursereport/log:viewlive','read',50,'coursereport_log',8),(318,'coursereport/log:viewtoday','read',50,'coursereport_log',8),(319,'coursereport/outline:view','read',50,'coursereport_outline',8),(320,'coursereport/participation:view','read',50,'coursereport_participation',8),(321,'coursereport/progress:view','read',50,'coursereport_progress',8),(322,'coursereport/stats:view','read',50,'coursereport_stats',8),(323,'gradeexport/ods:view','read',50,'gradeexport_ods',8),(324,'gradeexport/ods:publish','read',50,'gradeexport_ods',8),(325,'gradeexport/txt:view','read',50,'gradeexport_txt',8),(326,'gradeexport/txt:publish','read',50,'gradeexport_txt',8),(327,'gradeexport/xls:view','read',50,'gradeexport_xls',8),(328,'gradeexport/xls:publish','read',50,'gradeexport_xls',8),(329,'gradeexport/xml:view','read',50,'gradeexport_xml',8),(330,'gradeexport/xml:publish','read',50,'gradeexport_xml',8),(331,'gradeimport/csv:view','write',50,'gradeimport_csv',0),(332,'gradeimport/xml:view','write',50,'gradeimport_xml',0),(333,'gradeimport/xml:publish','write',50,'gradeimport_xml',0),(334,'gradereport/grader:view','read',50,'gradereport_grader',8),(335,'gradereport/outcomes:view','read',50,'gradereport_outcomes',8),(336,'gradereport/overview:view','read',50,'gradereport_overview',8),(337,'gradereport/user:view','read',50,'gradereport_user',8),(338,'webservice/amf:use','read',50,'webservice_amf',62),(339,'webservice/rest:use','read',50,'webservice_rest',62),(340,'webservice/soap:use','read',50,'webservice_soap',62),(341,'webservice/xmlrpc:use','read',50,'webservice_xmlrpc',62),(342,'repository/alfresco:view','read',70,'repository_alfresco',0),(343,'repository/boxnet:view','read',70,'repository_boxnet',0),(344,'repository/coursefiles:view','read',70,'repository_coursefiles',0),(345,'repository/dropbox:view','read',70,'repository_dropbox',0),(346,'repository/filesystem:view','read',70,'repository_filesystem',0),(347,'repository/flickr:view','read',70,'repository_flickr',0),(348,'repository/flickr_public:view','read',70,'repository_flickr_public',0),(349,'repository/googledocs:view','read',70,'repository_googledocs',0),(350,'repository/local:view','read',70,'repository_local',0),(351,'repository/merlot:view','read',70,'repository_merlot',0),(352,'repository/picasa:view','read',70,'repository_picasa',0),(353,'repository/recent:view','read',70,'repository_recent',0),(354,'repository/s3:view','read',70,'repository_s3',0),(355,'repository/upload:view','read',70,'repository_upload',0),(356,'repository/url:view','read',70,'repository_url',0),(357,'repository/user:view','read',70,'repository_user',0),(358,'repository/webdav:view','read',70,'repository_webdav',0),(359,'repository/wikimedia:view','read',70,'repository_wikimedia',0),(360,'repository/youtube:view','read',70,'repository_youtube',0),(361,'quizreport/statistics:view','read',70,'quiz_statistics',0);
/*!40000 ALTER TABLE `capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_messages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chatmess_use_ix` (`userid`),
  KEY `chatmess_gro_ix` (`groupid`),
  KEY `chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages`
--

LOCK TABLES `chat_messages` WRITE;
/*!40000 ALTER TABLE `chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_messages_current`
--

DROP TABLE IF EXISTS `chat_messages_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_messages_current` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chatmesscurr_use_ix` (`userid`),
  KEY `chatmesscurr_gro_ix` (`groupid`),
  KEY `chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores current session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages_current`
--

LOCK TABLES `chat_messages_current` WRITE;
/*!40000 ALTER TABLE `chat_messages_current` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_messages_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_users`
--

DROP TABLE IF EXISTS `chat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_users` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `firstping` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastping` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `chatuser_use_ix` (`userid`),
  KEY `chatuser_las_ix` (`lastping`),
  KEY `chatuser_gro_ix` (`groupid`),
  KEY `chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_users`
--

LOCK TABLES `chat_users` WRITE;
/*!40000 ALTER TABLE `chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choice`
--

DROP TABLE IF EXISTS `choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choice` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `publish` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `showresults` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice`
--

LOCK TABLES `choice` WRITE;
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choice_answers`
--

DROP TABLE IF EXISTS `choice_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choice_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `optionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `choiansw_use_ix` (`userid`),
  KEY `choiansw_cho_ix` (`choiceid`),
  KEY `choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='choices performed by users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice_answers`
--

LOCK TABLES `choice_answers` WRITE;
/*!40000 ALTER TABLE `choice_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `choice_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choice_options`
--

DROP TABLE IF EXISTS `choice_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choice_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `text` text,
  `maxanswers` bigint(10) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='available options to choice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice_options`
--

LOCK TABLES `choice_options` WRITE;
/*!40000 ALTER TABLE `choice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `choice_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cohort`
--

DROP TABLE IF EXISTS `cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohort` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents one cohort (aka site-wide group).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohort`
--

LOCK TABLES `cohort` WRITE;
/*!40000 ALTER TABLE `cohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cohort_members`
--

DROP TABLE IF EXISTS `cohort_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohort_members` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeadded` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `cohomemb_coh_ix` (`cohortid`),
  KEY `cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a cohort.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohort_members`
--

LOCK TABLES `cohort_members` WRITE;
/*!40000 ALTER TABLE `cohort_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `cohort_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `commentarea` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `format` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle comments module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conf_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (2,'rolesactive','1'),(3,'auth','email'),(4,'auth_pop3mailbox','INBOX'),(5,'enrol_plugins_enabled','manual,guest,self,cohort'),(6,'theme','anomaly'),(7,'filter_multilang_converted','1'),(8,'siteidentifier','VyHkj3YRQEmhfZY6SrvxpKXtCQ8KX2YA127.0.0.1'),(9,'backup_version','2008111700'),(10,'backup_release','2.0 dev'),(11,'mnet_dispatcher_mode','off'),(12,'sessiontimeout','7200'),(13,'stringfilters',''),(14,'filterall','0'),(15,'texteditors','tinymce,textarea'),(16,'mnet_localhost_id','1'),(17,'mnet_all_hosts_id','2'),(18,'siteguest','1'),(19,'siteadmins','2'),(20,'themerev','161'),(21,'licenses','unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),(22,'version','2010112400'),(23,'enablewsdocumentation','0'),(24,'release','2.0 (Build: 20101125)'),(25,'jsrev','160'),(26,'enableoutcomes','0'),(27,'usecomments','1'),(28,'usetags','1'),(29,'enablenotes','1'),(30,'enableportfolios','0'),(31,'enablewebservices','0'),(32,'messaging','1'),(33,'messaginghidereadnotifications','0'),(34,'messagingdeletereadnotificationsdelay','604800'),(35,'enablestats','0'),(36,'enablerssfeeds','0'),(37,'bloglevel','4'),(38,'enablecompletion','0'),(39,'progresstrackedroles','5'),(40,'enableavailability','0'),(41,'enableplagiarism','0'),(42,'notloggedinroleid','6'),(43,'guestroleid','6'),(44,'defaultuserroleid','7'),(45,'nodefaultuserrolelists','0'),(46,'creatornewroleid','3'),(47,'autologinguests','0'),(48,'hiddenuserfields',''),(49,'extrauserselectorfields','email'),(50,'enablecourserequests','0'),(51,'defaultrequestcategory','1'),(52,'courserequestnotify',''),(53,'gradebookroles','5'),(54,'grade_profilereport','user'),(55,'grade_aggregationposition','1'),(56,'grade_includescalesinaggregation','1'),(57,'grade_hiddenasdate','0'),(58,'gradepublishing','0'),(59,'grade_export_displaytype','1'),(60,'grade_export_decimalpoints','2'),(61,'grade_navmethod','0'),(62,'gradeexport',''),(63,'unlimitedgrades','0'),(64,'grade_hideforcedsettings','1'),(65,'grade_aggregation','11'),(66,'grade_aggregation_flag','0'),(67,'grade_aggregations_visible','0,10,11,12,2,4,6,8,13'),(68,'grade_aggregateonlygraded','1'),(69,'grade_aggregateonlygraded_flag','2'),(70,'grade_aggregateoutcomes','0'),(71,'grade_aggregateoutcomes_flag','2'),(72,'grade_aggregatesubcats','0'),(73,'grade_aggregatesubcats_flag','2'),(74,'grade_keephigh','0'),(75,'grade_keephigh_flag','3'),(76,'grade_droplow','0'),(77,'grade_droplow_flag','2'),(78,'grade_displaytype','1'),(79,'grade_decimalpoints','2'),(80,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),(81,'grade_report_studentsperpage','100'),(82,'grade_report_quickgrading','1'),(83,'grade_report_showquickfeedback','0'),(84,'grade_report_fixedstudents','0'),(85,'grade_report_meanselection','1'),(86,'grade_report_enableajax','0'),(87,'grade_report_showcalculations','0'),(88,'grade_report_showeyecons','0'),(89,'grade_report_showaverages','1'),(90,'grade_report_showlocks','0'),(91,'grade_report_showranges','0'),(92,'grade_report_showuserimage','1'),(93,'grade_report_showuseridnumber','0'),(94,'grade_report_showactivityicons','1'),(95,'grade_report_shownumberofgrades','0'),(96,'grade_report_averagesdisplaytype','inherit'),(97,'grade_report_rangesdisplaytype','inherit'),(98,'grade_report_averagesdecimalpoints','inherit'),(99,'grade_report_rangesdecimalpoints','inherit'),(100,'grade_report_overview_showrank','0'),(101,'grade_report_overview_showtotalsifcontainhidden','0'),(102,'grade_report_user_showrank','0'),(103,'grade_report_user_showpercentage','0'),(104,'grade_report_user_showhiddenitems','1'),(105,'grade_report_user_showtotalsifcontainhidden','0'),(106,'timezone','99'),(107,'forcetimezone','99'),(108,'country','0'),(109,'geoipfile','/var/www/moodledata/geoip/GeoLiteCity.dat'),(110,'googlemapkey',''),(111,'allcountrycodes',''),(112,'autolang','1'),(113,'lang','en'),(114,'langmenu','1'),(115,'langlist',''),(116,'langcache','1'),(117,'langstringcache','1'),(118,'locale',''),(119,'latinexcelexport','0'),(120,'assignment_itemstocount','1'),(121,'assignment_showrecentsubmissions','1'),(122,'chat_method','ajax'),(123,'chat_refresh_userlist','10'),(124,'chat_old_ping','35'),(125,'chat_refresh_room','5'),(126,'chat_normal_updatemode','jsupdate'),(127,'chat_serverhost','127.0.0.1'),(128,'chat_serverip','127.0.0.1'),(129,'chat_serverport','9111'),(130,'chat_servermax','100'),(131,'data_enablerssfeeds','0'),(132,'feedback_allowfullanonymous','0'),(133,'forum_displaymode','3'),(134,'forum_replytouser','1'),(135,'forum_shortpost','300'),(136,'forum_longpost','600'),(137,'forum_manydiscussions','100'),(138,'forum_maxattachments','9'),(139,'forum_trackreadposts','1'),(140,'forum_oldpostdays','14'),(141,'forum_usermarksread','0'),(142,'forum_cleanreadtime','2'),(143,'forum_enablerssfeeds','0'),(144,'forum_enabletimedposts','0'),(145,'glossary_entbypage','10'),(146,'glossary_dupentries','0'),(147,'glossary_allowcomments','0'),(148,'glossary_linkbydefault','1'),(149,'glossary_defaultapproval','1'),(150,'glossary_enablerssfeeds','0'),(151,'glossary_linkentries','0'),(152,'glossary_casesensitive','0'),(153,'glossary_fullmatch','0'),(154,'lesson_slideshowwidth','640'),(155,'lesson_slideshowheight','480'),(156,'lesson_slideshowbgcolor','#FFFFFF'),(157,'lesson_mediawidth','640'),(158,'lesson_mediaheight','480'),(159,'lesson_mediaclose','0'),(160,'lesson_maxhighscores','10'),(161,'lesson_maxanswers','4'),(162,'lesson_defaultnextpage','0'),(163,'block_course_list_adminview','all'),(164,'block_course_list_hideallcourseslink','0'),(165,'block_online_users_timetosee','5'),(166,'block_rss_client_num_entries','5'),(167,'block_rss_client_timeout','30'),(168,'block_search_enable_file_indexing','0'),(169,'block_search_filetypes','PDF,TXT,HTML,PPT,XML,DOC,HTM'),(170,'block_search_usemoodleroot','1'),(171,'block_search_limit_index_body','0'),(172,'block_search_pdf_to_text_cmd','lib/xpdf/linux/pdftotext -enc UTF-8 -eol unix -q'),(173,'block_search_word_to_text_cmd','lib/antiword/linux/usr/bin/antiword'),(174,'block_search_word_to_text_env','ANTIWORDHOME=/var/www/moodle/lib/antiword/linux/usr/share/antiword'),(175,'search_in_assignment','1'),(176,'search_in_chat','1'),(177,'search_in_data','1'),(178,'search_in_forum','1'),(179,'search_in_glossary','1'),(180,'search_in_label','1'),(181,'search_in_lesson','1'),(182,'search_in_resource','1'),(183,'search_in_wiki','1'),(184,'block_tags_showcoursetags','0'),(185,'registerauth',''),(186,'guestloginbutton','1'),(187,'alternateloginurl',''),(188,'forgottenpasswordurl',''),(189,'auth_instructions',''),(190,'allowemailaddresses',''),(191,'denyemailaddresses',''),(192,'verifychangedemail','1'),(193,'recaptchapublickey',''),(194,'recaptchaprivatekey',''),(195,'sitedefaultlicense','allrightsreserved'),(196,'cachetext','60'),(197,'filteruploadedfiles','0'),(198,'filtermatchoneperpage','0'),(199,'filtermatchonepertext','0'),(200,'filter_multilang_force_old','0'),(201,'filter_mediaplugin_enable_mp3','1'),(202,'filter_mediaplugin_enable_swf','0'),(203,'filter_mediaplugin_enable_mov','1'),(204,'filter_mediaplugin_enable_wmv','1'),(205,'filter_mediaplugin_enable_mpg','1'),(206,'filter_mediaplugin_enable_avi','1'),(207,'filter_mediaplugin_enable_flv','1'),(208,'filter_mediaplugin_enable_ram','1'),(209,'filter_mediaplugin_enable_rpm','1'),(210,'filter_mediaplugin_enable_rm','1'),(211,'filter_mediaplugin_enable_youtube','1'),(212,'filter_mediaplugin_enable_ogg','1'),(213,'filter_mediaplugin_enable_ogv','1'),(214,'filter_mediaplugin_enable_img','1'),(215,'filter_tex_latexpreamble','\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),(216,'filter_tex_latexbackground','#FFFFFF'),(217,'filter_tex_density','120'),(218,'filter_tex_pathlatex','/usr/bin/latex'),(219,'filter_tex_pathdvips','/usr/bin/dvips'),(220,'filter_tex_pathconvert','/usr/bin/convert'),(221,'filter_tex_convertformat','gif'),(222,'filter_censor_badwords',''),(223,'portfolio_moderate_filesize_threshold','1048576'),(224,'portfolio_high_filesize_threshold','5242880'),(225,'portfolio_moderate_db_threshold','20'),(226,'portfolio_high_db_threshold','50'),(227,'repositorycacheexpire','120'),(228,'repositoryallowexternallinks','1'),(229,'legacyfilesinnewcourses','0'),(230,'allowbeforeblock','0'),(231,'allowedip',''),(232,'blockedip',''),(233,'protectusernames','1'),(234,'forcelogin','0'),(235,'forceloginforprofiles','1'),(236,'opentogoogle','0'),(237,'profileroles','3,4,5'),(238,'maxbytes','0'),(239,'userquota','104857600'),(240,'enablehtmlpurifier','1'),(241,'allowobjectembed','0'),(242,'enabletrusttext','0'),(243,'maxeditingtime','1800'),(244,'fullnamedisplay','language'),(245,'extendedusernamechars','0'),(246,'sitepolicy',''),(247,'sitepolicyguest',''),(248,'keeptagnamecase','1'),(249,'profilesforenrolledusersonly','1'),(250,'cronclionly','0'),(251,'cronremotepassword',''),(252,'passwordpolicy','0'),(253,'minpasswordlength','1'),(254,'minpassworddigits','0'),(255,'minpasswordlower','0'),(256,'minpasswordupper','0'),(257,'minpasswordnonalphanum','0'),(258,'maxconsecutiveidentchars','0'),(259,'groupenrolmentkeypolicy','0'),(260,'disableuserimages','0'),(261,'emailchangeconfirmation','0'),(262,'loginhttps','1'),(263,'cookiesecure','0'),(264,'cookiehttponly','0'),(265,'excludeoldflashclients','10.0.12'),(266,'restrictmodulesfor','none'),(267,'restrictbydefault','0'),(268,'defaultallowedmodules',''),(269,'displayloginfailures',''),(270,'notifyloginfailures',''),(271,'notifyloginthreshold','10'),(272,'runclamonupload','0'),(273,'pathtoclam',''),(274,'quarantinedir',''),(275,'clamfailureonupload','donothing'),(276,'themelist',''),(277,'themedesignermode','0'),(278,'allowuserthemes','0'),(279,'allowcoursethemes','0'),(280,'allowcategorythemes','0'),(281,'allowthemechangeonurl','0'),(282,'allowuserblockhiding','1'),(283,'allowblockstodock','1'),(284,'custommenuitems',''),(285,'calendar_adminseesall','0'),(286,'calendar_site_timeformat','0'),(287,'calendar_startwday','0'),(288,'calendar_weekend','65'),(289,'calendar_lookahead','21'),(290,'calendar_maxevents','10'),(291,'enablecalendarexport','1'),(292,'calendar_exportsalt','3DB4r3D4QLqd9xbb3r11sRdHKKuQSl5dkKiJk5moKiCwbd6nqRFAYGPiyLhE'),(293,'useblogassociations','1'),(294,'useexternalblogs','1'),(295,'externalblogcrontime','86400'),(296,'maxexternalblogsperuser','1'),(297,'blogusecomments','1'),(298,'blogshowcommentscount','1'),(299,'defaulthomepage','0'),(300,'navshowcategories','1'),(301,'navshowallcourses','0'),(302,'navcourselimit','20'),(303,'formatstringstriptags','1'),(304,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]'),(305,'docroot','http://docs.moodle.org'),(306,'doctonewwindow','0'),(307,'coursecontact','3'),(308,'enableajax','1'),(309,'useexternalyui','0'),(310,'yuicomboloading','1'),(311,'cachejs','1'),(312,'enablecourseajax','1'),(313,'frontpage','1,4'),(314,'frontpageloggedin','1,4'),(315,'maxcategorydepth','0'),(316,'commentsperpage','15'),(317,'coursesperpage','20'),(318,'defaultfrontpageroleid','0'),(319,'gdversion','2'),(320,'pathtodu','/usr/bin/du'),(321,'aspellpath','/usr/bin/aspell'),(322,'smtphosts','127.0.0.1'),(323,'smtpuser',''),(324,'smtppass',''),(325,'smtpmaxbulk','1'),(326,'noreplyaddress','noreply@example.com'),(327,'digestmailtime','17'),(328,'sitemailcharset','0'),(329,'allowusermailcharset','0'),(330,'mailnewline','LF'),(331,'supportname','Admin User'),(332,'supportemail',''),(333,'supportpage',''),(334,'jabberhost',''),(335,'jabberserver',''),(336,'jabberusername',''),(337,'jabberpassword',''),(338,'jabberport','5222'),(339,'dbsessions','1'),(340,'sessioncookie',''),(341,'sessioncookiepath','/'),(342,'sessioncookiedomain',''),(343,'statsfirstrun','none'),(344,'statsmaxruntime','0'),(345,'statsruntimedays','31'),(346,'statsruntimestarthour','0'),(347,'statsruntimestartminute','0'),(348,'statsuserthreshold','0'),(349,'framename','_top'),(350,'slasharguments','1'),(351,'getremoteaddrconf','0'),(352,'proxyhost',''),(353,'proxyport','0'),(354,'proxytype','HTTP'),(355,'proxyuser',''),(356,'proxypassword',''),(357,'proxybypass','localhost, 127.0.0.1'),(358,'maintenance_enabled','0'),(359,'maintenance_message',''),(360,'deleteunconfirmed','168'),(361,'deleteincompleteusers','0'),(362,'logguests','1'),(363,'loglifetime','0'),(364,'disablegradehistory','0'),(365,'gradehistorylifetime','0'),(366,'extramemorylimit','512M'),(367,'curlcache','120'),(368,'enableglobalsearch','0'),(369,'enablesafebrowserintegration','0'),(370,'enablegroupmembersonly','0'),(371,'debug','0'),(372,'debugdisplay','1'),(373,'xmlstrictheaders','0'),(374,'debugsmtp','0'),(375,'perfdebug','7'),(376,'debugstringids','0'),(377,'debugvalidators','0'),(378,'debugpageinfo','0'),(379,'assignment_maxbytes','1048576'),(380,'forum_maxbytes','512000'),(381,'digestmailtimelast','1360797423'),(382,'forum_lastreadclean','1360797423'),(383,'scorm_updatetimelast','1360797423'),(384,'fileslastcleanup','1360797424');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_log`
--

DROP TABLE IF EXISTS `config_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` text,
  `oldvalue` text,
  PRIMARY KEY (`id`),
  KEY `conflog_tim_ix` (`timemodified`),
  KEY `conflog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=718 DEFAULT CHARSET=utf8 COMMENT='Changes done in server configuration through admin UI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_log`
--

LOCK TABLES `config_log` WRITE;
/*!40000 ALTER TABLE `config_log` DISABLE KEYS */;
INSERT INTO `config_log` VALUES (1,0,1292778856,NULL,'enablewsdocumentation','0',NULL),(2,2,1292778870,NULL,'enableoutcomes','0',NULL),(3,2,1292778870,NULL,'usecomments','1',NULL),(4,2,1292778870,NULL,'usetags','1',NULL),(5,2,1292778870,NULL,'enablenotes','1',NULL),(6,2,1292778870,NULL,'enableportfolios','0',NULL),(7,2,1292778870,NULL,'enablewebservices','0',NULL),(8,2,1292778870,NULL,'messaging','1',NULL),(9,2,1292778870,NULL,'messaginghidereadnotifications','0',NULL),(10,2,1292778870,NULL,'messagingdeletereadnotificationsdelay','604800',NULL),(11,2,1292778870,NULL,'enablestats','0',NULL),(12,2,1292778870,NULL,'enablerssfeeds','0',NULL),(13,2,1292778870,NULL,'bloglevel','4',NULL),(14,2,1292778870,NULL,'enablecompletion','0',NULL),(15,2,1292778870,NULL,'progresstrackedroles','5',NULL),(16,2,1292778870,NULL,'enableavailability','0',NULL),(17,2,1292778870,NULL,'enableplagiarism','0',NULL),(18,2,1292778870,NULL,'notloggedinroleid','6',NULL),(19,2,1292778870,NULL,'guestroleid','6',NULL),(20,2,1292778870,NULL,'defaultuserroleid','7',NULL),(21,2,1292778870,NULL,'nodefaultuserrolelists','0',NULL),(22,2,1292778870,NULL,'creatornewroleid','3',NULL),(23,2,1292778870,NULL,'autologinguests','0',NULL),(24,2,1292778870,NULL,'hiddenuserfields','',NULL),(25,2,1292778870,NULL,'extrauserselectorfields','email',NULL),(26,2,1292778870,'moodlecourse','format','weeks',NULL),(27,2,1292778870,'moodlecourse','numsections','10',NULL),(28,2,1292778870,'moodlecourse','hiddensections','0',NULL),(29,2,1292778870,'moodlecourse','newsitems','5',NULL),(30,2,1292778870,'moodlecourse','showgrades','1',NULL),(31,2,1292778870,'moodlecourse','showreports','0',NULL),(32,2,1292778870,'moodlecourse','maxbytes','8388608',NULL),(33,2,1292778870,'moodlecourse','groupmode','0',NULL),(34,2,1292778870,'moodlecourse','groupmodeforce','0',NULL),(35,2,1292778870,'moodlecourse','visible','1',NULL),(36,2,1292778870,'moodlecourse','lang','',NULL),(37,2,1292778870,'moodlecourse','enablecompletion','0',NULL),(38,2,1292778870,'moodlecourse','completionstartonenrol','0',NULL),(39,2,1292778870,NULL,'enablecourserequests','0',NULL),(40,2,1292778870,NULL,'defaultrequestcategory','1',NULL),(41,2,1292778870,NULL,'courserequestnotify','',NULL),(42,2,1292778870,'backup','backup_general_users','1',NULL),(43,2,1292778870,'backup','backup_general_users_locked','0',NULL),(44,2,1292778870,'backup','backup_general_anonymize','0',NULL),(45,2,1292778870,'backup','backup_general_anonymize_locked','0',NULL),(46,2,1292778870,'backup','backup_general_role_assignments','1',NULL),(47,2,1292778870,'backup','backup_general_role_assignments_locked','0',NULL),(48,2,1292778870,'backup','backup_general_user_files','1',NULL),(49,2,1292778870,'backup','backup_general_user_files_locked','0',NULL),(50,2,1292778870,'backup','backup_general_activities','1',NULL),(51,2,1292778870,'backup','backup_general_activities_locked','0',NULL),(52,2,1292778870,'backup','backup_general_blocks','1',NULL),(53,2,1292778870,'backup','backup_general_blocks_locked','0',NULL),(54,2,1292778870,'backup','backup_general_filters','1',NULL),(55,2,1292778870,'backup','backup_general_filters_locked','0',NULL),(56,2,1292778870,'backup','backup_general_comments','1',NULL),(57,2,1292778870,'backup','backup_general_comments_locked','0',NULL),(58,2,1292778870,'backup','backup_general_userscompletion','1',NULL),(59,2,1292778870,'backup','backup_general_userscompletion_locked','0',NULL),(60,2,1292778870,'backup','backup_general_logs','0',NULL),(61,2,1292778870,'backup','backup_general_logs_locked','0',NULL),(62,2,1292778870,'backup','backup_general_histories','0',NULL),(63,2,1292778870,'backup','backup_general_histories_locked','0',NULL),(64,2,1292778870,'backup','backup_auto_active','0',NULL),(65,2,1292778870,'backup','backup_auto_weekdays','0000000',NULL),(66,2,1292778870,'backup','backup_auto_hour','0',NULL),(67,2,1292778870,'backup','backup_auto_minute','0',NULL),(68,2,1292778870,'backup','backup_auto_storage','0',NULL),(69,2,1292778870,'backup','backup_auto_destination','',NULL),(70,2,1292778870,'backup','backup_auto_keep','1',NULL),(71,2,1292778870,'backup','backup_auto_users','1',NULL),(72,2,1292778870,'backup','backup_auto_role_assignments','1',NULL),(73,2,1292778870,'backup','backup_auto_user_files','1',NULL),(74,2,1292778870,'backup','backup_auto_activities','1',NULL),(75,2,1292778870,'backup','backup_auto_blocks','1',NULL),(76,2,1292778870,'backup','backup_auto_filters','1',NULL),(77,2,1292778870,'backup','backup_auto_comments','1',NULL),(78,2,1292778870,'backup','backup_auto_userscompletion','1',NULL),(79,2,1292778870,'backup','backup_auto_logs','0',NULL),(80,2,1292778870,'backup','backup_auto_histories','0',NULL),(81,2,1292778870,NULL,'gradebookroles','5',NULL),(82,2,1292778870,NULL,'grade_profilereport','user',NULL),(83,2,1292778870,NULL,'grade_aggregationposition','1',NULL),(84,2,1292778870,NULL,'grade_includescalesinaggregation','1',NULL),(85,2,1292778870,NULL,'grade_hiddenasdate','0',NULL),(86,2,1292778870,NULL,'gradepublishing','0',NULL),(87,2,1292778870,NULL,'grade_export_displaytype','1',NULL),(88,2,1292778870,NULL,'grade_export_decimalpoints','2',NULL),(89,2,1292778870,NULL,'grade_navmethod','0',NULL),(90,2,1292778870,NULL,'gradeexport','',NULL),(91,2,1292778870,NULL,'unlimitedgrades','0',NULL),(92,2,1292778870,NULL,'grade_hideforcedsettings','1',NULL),(93,2,1292778870,NULL,'grade_aggregation','11',NULL),(94,2,1292778870,NULL,'grade_aggregation_flag','0',NULL),(95,2,1292778870,NULL,'grade_aggregations_visible','0,10,11,12,2,4,6,8,13',NULL),(96,2,1292778870,NULL,'grade_aggregateonlygraded','1',NULL),(97,2,1292778870,NULL,'grade_aggregateonlygraded_flag','2',NULL),(98,2,1292778870,NULL,'grade_aggregateoutcomes','0',NULL),(99,2,1292778870,NULL,'grade_aggregateoutcomes_flag','2',NULL),(100,2,1292778870,NULL,'grade_aggregatesubcats','0',NULL),(101,2,1292778870,NULL,'grade_aggregatesubcats_flag','2',NULL),(102,2,1292778870,NULL,'grade_keephigh','0',NULL),(103,2,1292778870,NULL,'grade_keephigh_flag','3',NULL),(104,2,1292778870,NULL,'grade_droplow','0',NULL),(105,2,1292778870,NULL,'grade_droplow_flag','2',NULL),(106,2,1292778870,NULL,'grade_displaytype','1',NULL),(107,2,1292778870,NULL,'grade_decimalpoints','2',NULL),(108,2,1292778870,NULL,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime',NULL),(109,2,1292778870,NULL,'grade_report_studentsperpage','100',NULL),(110,2,1292778870,NULL,'grade_report_quickgrading','1',NULL),(111,2,1292778870,NULL,'grade_report_showquickfeedback','0',NULL),(112,2,1292778870,NULL,'grade_report_fixedstudents','0',NULL),(113,2,1292778870,NULL,'grade_report_meanselection','1',NULL),(114,2,1292778870,NULL,'grade_report_enableajax','0',NULL),(115,2,1292778870,NULL,'grade_report_showcalculations','0',NULL),(116,2,1292778870,NULL,'grade_report_showeyecons','0',NULL),(117,2,1292778870,NULL,'grade_report_showaverages','1',NULL),(118,2,1292778870,NULL,'grade_report_showlocks','0',NULL),(119,2,1292778870,NULL,'grade_report_showranges','0',NULL),(120,2,1292778870,NULL,'grade_report_showuserimage','1',NULL),(121,2,1292778870,NULL,'grade_report_showuseridnumber','0',NULL),(122,2,1292778870,NULL,'grade_report_showactivityicons','1',NULL),(123,2,1292778870,NULL,'grade_report_shownumberofgrades','0',NULL),(124,2,1292778870,NULL,'grade_report_averagesdisplaytype','inherit',NULL),(125,2,1292778870,NULL,'grade_report_rangesdisplaytype','inherit',NULL),(126,2,1292778870,NULL,'grade_report_averagesdecimalpoints','inherit',NULL),(127,2,1292778870,NULL,'grade_report_rangesdecimalpoints','inherit',NULL),(128,2,1292778870,NULL,'grade_report_overview_showrank','0',NULL),(129,2,1292778870,NULL,'grade_report_overview_showtotalsifcontainhidden','0',NULL),(130,2,1292778870,NULL,'grade_report_user_showrank','0',NULL),(131,2,1292778870,NULL,'grade_report_user_showpercentage','0',NULL),(132,2,1292778870,NULL,'grade_report_user_showhiddenitems','1',NULL),(133,2,1292778870,NULL,'grade_report_user_showtotalsifcontainhidden','0',NULL),(134,2,1292778870,NULL,'timezone','99',NULL),(135,2,1292778870,NULL,'forcetimezone','99',NULL),(136,2,1292778870,NULL,'country','0',NULL),(137,2,1292778870,NULL,'geoipfile','/var/www/moodledata/geoip/GeoLiteCity.dat',NULL),(138,2,1292778870,NULL,'googlemapkey','',NULL),(139,2,1292778870,NULL,'allcountrycodes','',NULL),(140,2,1292778870,NULL,'autolang','1',NULL),(141,2,1292778870,NULL,'lang','en',NULL),(142,2,1292778870,NULL,'langmenu','1',NULL),(143,2,1292778870,NULL,'langlist','',NULL),(144,2,1292778870,NULL,'langcache','1',NULL),(145,2,1292778870,NULL,'langstringcache','1',NULL),(146,2,1292778870,NULL,'locale','',NULL),(147,2,1292778870,NULL,'latinexcelexport','0',NULL),(148,2,1292778870,NULL,'assignment_itemstocount','1',NULL),(149,2,1292778870,NULL,'assignment_showrecentsubmissions','1',NULL),(150,2,1292778870,NULL,'chat_method','ajax',NULL),(151,2,1292778870,NULL,'chat_refresh_userlist','10',NULL),(152,2,1292778870,NULL,'chat_old_ping','35',NULL),(153,2,1292778870,NULL,'chat_refresh_room','5',NULL),(154,2,1292778870,NULL,'chat_normal_updatemode','jsupdate',NULL),(155,2,1292778870,NULL,'chat_serverhost','127.0.0.1',NULL),(156,2,1292778870,NULL,'chat_serverip','127.0.0.1',NULL),(157,2,1292778870,NULL,'chat_serverport','9111',NULL),(158,2,1292778870,NULL,'chat_servermax','100',NULL),(159,2,1292778870,NULL,'data_enablerssfeeds','0',NULL),(160,2,1292778870,NULL,'feedback_allowfullanonymous','0',NULL),(161,2,1292778870,'folder','requiremodintro','1',NULL),(162,2,1292778870,NULL,'forum_displaymode','3',NULL),(163,2,1292778870,NULL,'forum_replytouser','1',NULL),(164,2,1292778870,NULL,'forum_shortpost','300',NULL),(165,2,1292778870,NULL,'forum_longpost','600',NULL),(166,2,1292778870,NULL,'forum_manydiscussions','100',NULL),(167,2,1292778870,NULL,'forum_maxattachments','9',NULL),(168,2,1292778870,NULL,'forum_trackreadposts','1',NULL),(169,2,1292778870,NULL,'forum_oldpostdays','14',NULL),(170,2,1292778870,NULL,'forum_usermarksread','0',NULL),(171,2,1292778870,NULL,'forum_cleanreadtime','2',NULL),(172,2,1292778870,NULL,'forum_enablerssfeeds','0',NULL),(173,2,1292778870,NULL,'forum_enabletimedposts','0',NULL),(174,2,1292778870,NULL,'glossary_entbypage','10',NULL),(175,2,1292778870,NULL,'glossary_dupentries','0',NULL),(176,2,1292778870,NULL,'glossary_allowcomments','0',NULL),(177,2,1292778870,NULL,'glossary_linkbydefault','1',NULL),(178,2,1292778870,NULL,'glossary_defaultapproval','1',NULL),(179,2,1292778870,NULL,'glossary_enablerssfeeds','0',NULL),(180,2,1292778870,NULL,'glossary_linkentries','0',NULL),(181,2,1292778870,NULL,'glossary_casesensitive','0',NULL),(182,2,1292778870,NULL,'glossary_fullmatch','0',NULL),(183,2,1292778870,'imscp','requiremodintro','1',NULL),(184,2,1292778870,'imscp','keepold','1',NULL),(185,2,1292778870,'imscp','keepold_adv','0',NULL),(186,2,1292778870,NULL,'lesson_slideshowwidth','640',NULL),(187,2,1292778870,NULL,'lesson_slideshowheight','480',NULL),(188,2,1292778870,NULL,'lesson_slideshowbgcolor','#FFFFFF',NULL),(189,2,1292778870,NULL,'lesson_mediawidth','640',NULL),(190,2,1292778870,NULL,'lesson_mediaheight','480',NULL),(191,2,1292778870,NULL,'lesson_mediaclose','0',NULL),(192,2,1292778870,NULL,'lesson_maxhighscores','10',NULL),(193,2,1292778870,NULL,'lesson_maxanswers','4',NULL),(194,2,1292778870,NULL,'lesson_defaultnextpage','0',NULL),(195,2,1292778870,'page','requiremodintro','1',NULL),(196,2,1292778870,'page','displayoptions','5',NULL),(197,2,1292778870,'page','printheading','1',NULL),(198,2,1292778870,'page','printheading_adv','0',NULL),(199,2,1292778870,'page','printintro','0',NULL),(200,2,1292778870,'page','printintro_adv','0',NULL),(201,2,1292778870,'page','display','5',NULL),(202,2,1292778870,'page','display_adv','1',NULL),(203,2,1292778870,'page','popupwidth','620',NULL),(204,2,1292778870,'page','popupwidth_adv','1',NULL),(205,2,1292778870,'page','popupheight','450',NULL),(206,2,1292778870,'page','popupheight_adv','1',NULL),(207,2,1292778870,'quiz','timelimit','0',NULL),(208,2,1292778870,'quiz','timelimit_adv','0',NULL),(209,2,1292778870,'quiz','attempts','0',NULL),(210,2,1292778870,'quiz','attempts_adv','0',NULL),(211,2,1292778870,'quiz','grademethod','1',NULL),(212,2,1292778870,'quiz','grademethod_adv','0',NULL),(213,2,1292778870,'quiz','maximumgrade','10',NULL),(214,2,1292778870,'quiz','shufflequestions','0',NULL),(215,2,1292778870,'quiz','shufflequestions_adv','0',NULL),(216,2,1292778870,'quiz','questionsperpage','1',NULL),(217,2,1292778870,'quiz','questionsperpage_adv','0',NULL),(218,2,1292778870,'quiz','shuffleanswers','1',NULL),(219,2,1292778870,'quiz','shuffleanswers_adv','0',NULL),(220,2,1292778870,'quiz','optionflags','1',NULL),(221,2,1292778870,'quiz','optionflags_adv','0',NULL),(222,2,1292778870,'quiz','penaltyscheme','1',NULL),(223,2,1292778870,'quiz','penaltyscheme_adv','1',NULL),(224,2,1292778870,'quiz','attemptonlast','0',NULL),(225,2,1292778870,'quiz','attemptonlast_adv','1',NULL),(226,2,1292778870,'quiz','review','1073741823',NULL),(227,2,1292778870,'quiz','review_adv','0',NULL),(228,2,1292778870,'quiz','showuserpicture','0',NULL),(229,2,1292778870,'quiz','showuserpicture_adv','0',NULL),(230,2,1292778870,'quiz','decimalpoints','2',NULL),(231,2,1292778870,'quiz','decimalpoints_adv','0',NULL),(232,2,1292778870,'quiz','questiondecimalpoints','-1',NULL),(233,2,1292778870,'quiz','questiondecimalpoints_adv','0',NULL),(234,2,1292778870,'quiz','showblocks','0',NULL),(235,2,1292778870,'quiz','showblocks_adv','1',NULL),(236,2,1292778870,'quiz','password','',NULL),(237,2,1292778870,'quiz','password_adv','0',NULL),(238,2,1292778870,'quiz','subnet','',NULL),(239,2,1292778870,'quiz','subnet_adv','0',NULL),(240,2,1292778870,'quiz','delay1','0',NULL),(241,2,1292778870,'quiz','delay1_adv','0',NULL),(242,2,1292778871,'quiz','delay2','0',NULL),(243,2,1292778871,'quiz','delay2_adv','0',NULL),(244,2,1292778871,'quiz','popup','0',NULL),(245,2,1292778871,'quiz','popup_adv','1',NULL),(246,2,1292778871,'resource','framesize','130',NULL),(247,2,1292778871,'resource','requiremodintro','1',NULL),(248,2,1292778871,'resource','displayoptions','0,1,4,5,6',NULL),(249,2,1292778871,'resource','printheading','0',NULL),(250,2,1292778871,'resource','printheading_adv','0',NULL),(251,2,1292778871,'resource','printintro','1',NULL),(252,2,1292778871,'resource','printintro_adv','0',NULL),(253,2,1292778871,'resource','display','0',NULL),(254,2,1292778871,'resource','display_adv','0',NULL),(255,2,1292778871,'resource','popupwidth','620',NULL),(256,2,1292778871,'resource','popupwidth_adv','1',NULL),(257,2,1292778871,'resource','popupheight','450',NULL),(258,2,1292778871,'resource','popupheight_adv','1',NULL),(259,2,1292778871,'resource','filterfiles','0',NULL),(260,2,1292778871,'resource','filterfiles_adv','1',NULL),(261,2,1292778871,'scorm','grademethod','1',NULL),(262,2,1292778871,'scorm','maxgrade','100',NULL),(263,2,1292778871,'scorm','maxattempts','0',NULL),(264,2,1292778871,'scorm','displayattemptstatus','0',NULL),(265,2,1292778871,'scorm','displaycoursestructure','0',NULL),(266,2,1292778871,'scorm','forcecompleted','0',NULL),(267,2,1292778871,'scorm','forcenewattempt','0',NULL),(268,2,1292778871,'scorm','lastattemptlock','0',NULL),(269,2,1292778871,'scorm','whatgrade','0',NULL),(270,2,1292778871,'scorm','framewidth','100',NULL),(271,2,1292778871,'scorm','frameheight','500',NULL),(272,2,1292778871,'scorm','popup','0',NULL),(273,2,1292778871,'scorm','resizable','0',NULL),(274,2,1292778871,'scorm','scrollbars','0',NULL),(275,2,1292778871,'scorm','directories','0',NULL),(276,2,1292778871,'scorm','location','0',NULL),(277,2,1292778871,'scorm','menubar','0',NULL),(278,2,1292778871,'scorm','toolbar','0',NULL),(279,2,1292778871,'scorm','status','0',NULL),(280,2,1292778871,'scorm','skipview','0',NULL),(281,2,1292778871,'scorm','hidebrowse','0',NULL),(282,2,1292778871,'scorm','hidetoc','0',NULL),(283,2,1292778871,'scorm','hidenav','0',NULL),(284,2,1292778871,'scorm','auto','0',NULL),(285,2,1292778871,'scorm','updatefreq','0',NULL),(286,2,1292778871,'scorm','updatetime','2',NULL),(287,2,1292778871,'scorm','allowtypeexternal','0',NULL),(288,2,1292778871,'scorm','allowtypelocalsync','0',NULL),(289,2,1292778871,'scorm','allowtypeimsrepository','0',NULL),(290,2,1292778871,'scorm','allowapidebug','0',NULL),(291,2,1292778871,'scorm','apidebugmask','.*',NULL),(292,2,1292778871,'url','framesize','130',NULL),(293,2,1292778871,'url','requiremodintro','1',NULL),(294,2,1292778871,'url','secretphrase','',NULL),(295,2,1292778871,'url','rolesinparams','0',NULL),(296,2,1292778871,'url','displayoptions','0,1,5,6',NULL),(297,2,1292778871,'url','printheading','0',NULL),(298,2,1292778871,'url','printheading_adv','0',NULL),(299,2,1292778871,'url','printintro','1',NULL),(300,2,1292778871,'url','printintro_adv','0',NULL),(301,2,1292778871,'url','display','0',NULL),(302,2,1292778871,'url','display_adv','0',NULL),(303,2,1292778871,'url','popupwidth','620',NULL),(304,2,1292778871,'url','popupwidth_adv','1',NULL),(305,2,1292778871,'url','popupheight','450',NULL),(306,2,1292778871,'url','popupheight_adv','1',NULL),(307,2,1292778871,'workshop','grade','80',NULL),(308,2,1292778871,'workshop','gradinggrade','20',NULL),(309,2,1292778871,'workshop','gradedecimals','0',NULL),(310,2,1292778871,'workshop','strategy','accumulative',NULL),(311,2,1292778871,'workshop','examplesmode','0',NULL),(312,2,1292778871,'workshopallocation_random','numofreviews','5',NULL),(313,2,1292778871,'workshopform_numerrors','grade0','No',NULL),(314,2,1292778871,'workshopform_numerrors','grade1','Yes',NULL),(315,2,1292778871,'workshopeval_best','comparison','5',NULL),(316,2,1292778871,NULL,'block_course_list_adminview','all',NULL),(317,2,1292778871,NULL,'block_course_list_hideallcourseslink','0',NULL),(318,2,1292778871,NULL,'block_online_users_timetosee','5',NULL),(319,2,1292778871,NULL,'block_rss_client_num_entries','5',NULL),(320,2,1292778871,NULL,'block_rss_client_timeout','30',NULL),(321,2,1292778871,NULL,'block_search_enable_file_indexing','0',NULL),(322,2,1292778871,NULL,'block_search_filetypes','PDF,TXT,HTML,PPT,XML,DOC,HTM',NULL),(323,2,1292778871,NULL,'block_search_usemoodleroot','1',NULL),(324,2,1292778871,NULL,'block_search_limit_index_body','0',NULL),(325,2,1292778871,NULL,'block_search_pdf_to_text_cmd','lib/xpdf/linux/pdftotext -enc UTF-8 -eol unix -q',NULL),(326,2,1292778871,NULL,'block_search_word_to_text_cmd','lib/antiword/linux/usr/bin/antiword',NULL),(327,2,1292778871,NULL,'block_search_word_to_text_env','ANTIWORDHOME=/var/www/moodle/lib/antiword/linux/usr/share/antiword',NULL),(328,2,1292778871,NULL,'search_in_assignment','1',NULL),(329,2,1292778871,NULL,'search_in_chat','1',NULL),(330,2,1292778871,NULL,'search_in_data','1',NULL),(331,2,1292778871,NULL,'search_in_forum','1',NULL),(332,2,1292778871,NULL,'search_in_glossary','1',NULL),(333,2,1292778871,NULL,'search_in_label','1',NULL),(334,2,1292778871,NULL,'search_in_lesson','1',NULL),(335,2,1292778871,NULL,'search_in_resource','1',NULL),(336,2,1292778871,NULL,'search_in_wiki','1',NULL),(337,2,1292778871,'blocks/section_links','numsections1','22',NULL),(338,2,1292778871,'blocks/section_links','incby1','2',NULL),(339,2,1292778871,'blocks/section_links','numsections2','40',NULL),(340,2,1292778871,'blocks/section_links','incby2','5',NULL),(341,2,1292778871,NULL,'block_tags_showcoursetags','0',NULL),(342,2,1292778871,NULL,'registerauth','',NULL),(343,2,1292778871,NULL,'guestloginbutton','1',NULL),(344,2,1292778871,NULL,'alternateloginurl','',NULL),(345,2,1292778871,NULL,'forgottenpasswordurl','',NULL),(346,2,1292778871,NULL,'auth_instructions','',NULL),(347,2,1292778871,NULL,'allowemailaddresses','',NULL),(348,2,1292778871,NULL,'denyemailaddresses','',NULL),(349,2,1292778871,NULL,'verifychangedemail','1',NULL),(350,2,1292778871,NULL,'recaptchapublickey','',NULL),(351,2,1292778871,NULL,'recaptchaprivatekey','',NULL),(352,2,1292778871,'enrol_cohort','roleid','5',NULL),(353,2,1292778871,'enrol_database','dbtype','',NULL),(354,2,1292778871,'enrol_database','dbhost','localhost',NULL),(355,2,1292778871,'enrol_database','dbuser','',NULL),(356,2,1292778871,'enrol_database','dbpass','',NULL),(357,2,1292778871,'enrol_database','dbname','',NULL),(358,2,1292778871,'enrol_database','dbencoding','utf-8',NULL),(359,2,1292778871,'enrol_database','dbsetupsql','',NULL),(360,2,1292778871,'enrol_database','dbsybasequoting','0',NULL),(361,2,1292778871,'enrol_database','debugdb','0',NULL),(362,2,1292778871,'enrol_database','localcoursefield','idnumber',NULL),(363,2,1292778871,'enrol_database','localuserfield','idnumber',NULL),(364,2,1292778871,'enrol_database','localrolefield','shortname',NULL),(365,2,1292778871,'enrol_database','remoteenroltable','',NULL),(366,2,1292778871,'enrol_database','remotecoursefield','',NULL),(367,2,1292778871,'enrol_database','remoteuserfield','',NULL),(368,2,1292778871,'enrol_database','remoterolefield','',NULL),(369,2,1292778871,'enrol_database','defaultrole','5',NULL),(370,2,1292778871,'enrol_database','ignorehiddencourses','0',NULL),(371,2,1292778871,'enrol_database','unenrolaction','0',NULL),(372,2,1292778871,'enrol_database','newcoursetable','',NULL),(373,2,1292778871,'enrol_database','newcoursefullname','fullname',NULL),(374,2,1292778871,'enrol_database','newcourseshortname','shortname',NULL),(375,2,1292778871,'enrol_database','newcourseidnumber','idnumber',NULL),(376,2,1292778871,'enrol_database','newcoursecategory','',NULL),(377,2,1292778871,'enrol_database','defaultcategory','1',NULL),(378,2,1292778871,'enrol_database','templatecourse','',NULL),(379,2,1292778871,'enrol_flatfile','location','',NULL),(380,2,1292778871,'enrol_flatfile','mailstudents','0',NULL),(381,2,1292778871,'enrol_flatfile','mailteachers','0',NULL),(382,2,1292778871,'enrol_flatfile','mailadmins','0',NULL),(383,2,1292778871,'enrol_flatfile','map_1','manager',NULL),(384,2,1292778871,'enrol_flatfile','map_2','coursecreator',NULL),(385,2,1292778871,'enrol_flatfile','map_3','editingteacher',NULL),(386,2,1292778871,'enrol_flatfile','map_4','teacher',NULL),(387,2,1292778871,'enrol_flatfile','map_5','student',NULL),(388,2,1292778871,'enrol_flatfile','map_6','guest',NULL),(389,2,1292778871,'enrol_flatfile','map_7','user',NULL),(390,2,1292778871,'enrol_flatfile','map_8','frontpage',NULL),(391,2,1292778871,'enrol_guest','requirepassword','0',NULL),(392,2,1292778871,'enrol_guest','usepasswordpolicy','0',NULL),(393,2,1292778871,'enrol_guest','showhint','0',NULL),(394,2,1292778871,'enrol_guest','defaultenrol','1',NULL),(395,2,1292778871,'enrol_guest','status','1',NULL),(396,2,1292778871,'enrol_guest','status_adv','0',NULL),(397,2,1292778871,'enrol_imsenterprise','imsfilelocation','',NULL),(398,2,1292778871,'enrol_imsenterprise','logtolocation','',NULL),(399,2,1292778871,'enrol_imsenterprise','mailadmins','0',NULL),(400,2,1292778871,'enrol_imsenterprise','createnewusers','0',NULL),(401,2,1292778871,'enrol_imsenterprise','imsdeleteusers','0',NULL),(402,2,1292778871,'enrol_imsenterprise','fixcaseusernames','0',NULL),(403,2,1292778871,'enrol_imsenterprise','fixcasepersonalnames','0',NULL),(404,2,1292778871,'enrol_imsenterprise','imssourcedidfallback','0',NULL),(405,2,1292778871,'enrol_imsenterprise','imsrolemap01','5',NULL),(406,2,1292778871,'enrol_imsenterprise','imsrolemap02','3',NULL),(407,2,1292778871,'enrol_imsenterprise','imsrolemap03','3',NULL),(408,2,1292778871,'enrol_imsenterprise','imsrolemap04','5',NULL),(409,2,1292778871,'enrol_imsenterprise','imsrolemap05','0',NULL),(410,2,1292778871,'enrol_imsenterprise','imsrolemap06','4',NULL),(411,2,1292778871,'enrol_imsenterprise','imsrolemap07','0',NULL),(412,2,1292778871,'enrol_imsenterprise','imsrolemap08','4',NULL),(413,2,1292778871,'enrol_imsenterprise','truncatecoursecodes','0',NULL),(414,2,1292778871,'enrol_imsenterprise','createnewcourses','0',NULL),(415,2,1292778871,'enrol_imsenterprise','createnewcategories','0',NULL),(416,2,1292778871,'enrol_imsenterprise','imsunenrol','0',NULL),(417,2,1292778871,'enrol_imsenterprise','imsrestricttarget','',NULL),(418,2,1292778871,'enrol_imsenterprise','imscapitafix','0',NULL),(419,2,1292778871,'enrol_ldap','host_url','',NULL),(420,2,1292778871,'enrol_ldap','ldap_version','3',NULL),(421,2,1292778871,'enrol_ldap','ldapencoding','utf-8',NULL),(422,2,1292778871,'enrol_ldap','bind_dn','',NULL),(423,2,1292778871,'enrol_ldap','bind_pw','',NULL),(424,2,1292778871,'enrol_ldap','course_search_sub','0',NULL),(425,2,1292778871,'enrol_ldap','memberattribute_isdn','0',NULL),(426,2,1292778871,'enrol_ldap','user_contexts','',NULL),(427,2,1292778871,'enrol_ldap','user_search_sub','0',NULL),(428,2,1292778871,'enrol_ldap','user_type','default',NULL),(429,2,1292778871,'enrol_ldap','opt_deref','0',NULL),(430,2,1292778871,'enrol_ldap','idnumber_attribute','',NULL),(431,2,1292778871,'enrol_ldap','objectclass','',NULL),(432,2,1292778871,'enrol_ldap','course_idnumber','',NULL),(433,2,1292778871,'enrol_ldap','course_shortname','',NULL),(434,2,1292778871,'enrol_ldap','course_fullname','',NULL),(435,2,1292778871,'enrol_ldap','course_summary','',NULL),(436,2,1292778871,'enrol_ldap','ignorehiddencourses','0',NULL),(437,2,1292778871,'enrol_ldap','unenrolaction','0',NULL),(438,2,1292778871,'enrol_ldap','autocreate','0',NULL),(439,2,1292778871,'enrol_ldap','category','1',NULL),(440,2,1292778871,'enrol_ldap','template','',NULL),(441,2,1292778871,'enrol_ldap','nested_groups','0',NULL),(442,2,1292778871,'enrol_ldap','group_memberofattribute','',NULL),(443,2,1292778871,'enrol_manual','defaultenrol','1',NULL),(444,2,1292778871,'enrol_manual','status','0',NULL),(445,2,1292778871,'enrol_manual','enrolperiod','0',NULL),(446,2,1292778871,'enrol_manual','roleid','5',NULL),(447,2,1292778871,'enrol_meta','nosyncroleids','',NULL),(448,2,1292778871,'enrol_mnet','roleid','5',NULL),(449,2,1292778871,'enrol_mnet','roleid_adv','1',NULL),(450,2,1292778871,'enrol_paypal','paypalbusiness','',NULL),(451,2,1292778871,'enrol_paypal','mailstudents','0',NULL),(452,2,1292778871,'enrol_paypal','mailteachers','0',NULL),(453,2,1292778871,'enrol_paypal','mailadmins','0',NULL),(454,2,1292778871,'enrol_paypal','status','1',NULL),(455,2,1292778871,'enrol_paypal','cost','0',NULL),(456,2,1292778871,'enrol_paypal','currency','USD',NULL),(457,2,1292778871,'enrol_paypal','roleid','5',NULL),(458,2,1292778871,'enrol_paypal','enrolperiod','0',NULL),(459,2,1292778871,'enrol_self','requirepassword','0',NULL),(460,2,1292778871,'enrol_self','usepasswordpolicy','0',NULL),(461,2,1292778871,'enrol_self','showhint','0',NULL),(462,2,1292778871,'enrol_self','defaultenrol','1',NULL),(463,2,1292778871,'enrol_self','status','1',NULL),(464,2,1292778871,'enrol_self','groupkey','0',NULL),(465,2,1292778871,'enrol_self','roleid','5',NULL),(466,2,1292778871,'enrol_self','enrolperiod','0',NULL),(467,2,1292778871,'enrol_self','longtimenosee','0',NULL),(468,2,1292778871,'enrol_self','maxenrolled','0',NULL),(469,2,1292778871,'enrol_self','sendcoursewelcomemessage','1',NULL),(470,2,1292778871,'editor_tinymce','spellengine','GoogleSpell',NULL),(471,2,1292778871,NULL,'sitedefaultlicense','allrightsreserved',NULL),(472,2,1292778871,NULL,'cachetext','60',NULL),(473,2,1292778871,NULL,'filteruploadedfiles','0',NULL),(474,2,1292778871,NULL,'filtermatchoneperpage','0',NULL),(475,2,1292778871,NULL,'filtermatchonepertext','0',NULL),(476,2,1292778871,'filter_urltolink','formats','0',NULL),(477,2,1292778871,'filter_emoticon','formats','1,4,0',NULL),(478,2,1292778871,NULL,'filter_multilang_force_old','0',NULL),(479,2,1292778871,NULL,'filter_mediaplugin_enable_mp3','1',NULL),(480,2,1292778871,NULL,'filter_mediaplugin_enable_swf','0',NULL),(481,2,1292778871,NULL,'filter_mediaplugin_enable_mov','1',NULL),(482,2,1292778871,NULL,'filter_mediaplugin_enable_wmv','1',NULL),(483,2,1292778871,NULL,'filter_mediaplugin_enable_mpg','1',NULL),(484,2,1292778871,NULL,'filter_mediaplugin_enable_avi','1',NULL),(485,2,1292778871,NULL,'filter_mediaplugin_enable_flv','1',NULL),(486,2,1292778871,NULL,'filter_mediaplugin_enable_ram','1',NULL),(487,2,1292778871,NULL,'filter_mediaplugin_enable_rpm','1',NULL),(488,2,1292778871,NULL,'filter_mediaplugin_enable_rm','1',NULL),(489,2,1292778871,NULL,'filter_mediaplugin_enable_youtube','1',NULL),(490,2,1292778871,NULL,'filter_mediaplugin_enable_ogg','1',NULL),(491,2,1292778871,NULL,'filter_mediaplugin_enable_ogv','1',NULL),(492,2,1292778871,NULL,'filter_mediaplugin_enable_img','1',NULL),(493,2,1292778871,NULL,'filter_tex_latexpreamble','\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n',NULL),(494,2,1292778871,NULL,'filter_tex_latexbackground','#FFFFFF',NULL),(495,2,1292778871,NULL,'filter_tex_density','120',NULL),(496,2,1292778871,NULL,'filter_tex_pathlatex','/usr/bin/latex',NULL),(497,2,1292778871,NULL,'filter_tex_pathdvips','/usr/bin/dvips',NULL),(498,2,1292778871,NULL,'filter_tex_pathconvert','/usr/bin/convert',NULL),(499,2,1292778871,NULL,'filter_tex_convertformat','gif',NULL),(500,2,1292778871,NULL,'filter_censor_badwords','',NULL),(501,2,1292778871,NULL,'portfolio_moderate_filesize_threshold','1048576',NULL),(502,2,1292778871,NULL,'portfolio_high_filesize_threshold','5242880',NULL),(503,2,1292778871,NULL,'portfolio_moderate_db_threshold','20',NULL),(504,2,1292778871,NULL,'portfolio_high_db_threshold','50',NULL),(505,2,1292778871,NULL,'repositorycacheexpire','120',NULL),(506,2,1292778871,NULL,'repositoryallowexternallinks','1',NULL),(507,2,1292778871,NULL,'legacyfilesinnewcourses','0',NULL),(508,2,1292778871,NULL,'allowbeforeblock','0',NULL),(509,2,1292778871,NULL,'allowedip','',NULL),(510,2,1292778871,NULL,'blockedip','',NULL),(511,2,1292778871,NULL,'protectusernames','1',NULL),(512,2,1292778871,NULL,'forcelogin','0',NULL),(513,2,1292778871,NULL,'forceloginforprofiles','1',NULL),(514,2,1292778871,NULL,'opentogoogle','0',NULL),(515,2,1292778871,NULL,'profileroles','5,4,3',NULL),(516,2,1292778871,NULL,'maxbytes','0',NULL),(517,2,1292778871,NULL,'userquota','104857600',NULL),(518,2,1292778871,NULL,'enablehtmlpurifier','1',NULL),(519,2,1292778871,NULL,'allowobjectembed','0',NULL),(520,2,1292778871,NULL,'enabletrusttext','0',NULL),(521,2,1292778871,NULL,'maxeditingtime','1800',NULL),(522,2,1292778871,NULL,'fullnamedisplay','language',NULL),(523,2,1292778871,NULL,'extendedusernamechars','0',NULL),(524,2,1292778871,NULL,'sitepolicy','',NULL),(525,2,1292778871,NULL,'sitepolicyguest','',NULL),(526,2,1292778871,NULL,'keeptagnamecase','1',NULL),(527,2,1292778871,NULL,'profilesforenrolledusersonly','1',NULL),(528,2,1292778871,NULL,'cronclionly','0',NULL),(529,2,1292778871,NULL,'cronremotepassword','',NULL),(530,2,1292778871,NULL,'passwordpolicy','1',NULL),(531,2,1292778871,NULL,'minpasswordlength','8',NULL),(532,2,1292778871,NULL,'minpassworddigits','1',NULL),(533,2,1292778871,NULL,'minpasswordlower','1',NULL),(534,2,1292778871,NULL,'minpasswordupper','1',NULL),(535,2,1292778871,NULL,'minpasswordnonalphanum','1',NULL),(536,2,1292778871,NULL,'maxconsecutiveidentchars','0',NULL),(537,2,1292778871,NULL,'groupenrolmentkeypolicy','1',NULL),(538,2,1292778871,NULL,'disableuserimages','0',NULL),(539,2,1292778871,NULL,'emailchangeconfirmation','1',NULL),(540,2,1292778871,NULL,'loginhttps','0',NULL),(541,2,1292778871,NULL,'cookiesecure','0',NULL),(542,2,1292778871,NULL,'cookiehttponly','0',NULL),(543,2,1292778871,NULL,'excludeoldflashclients','10.0.12',NULL),(544,2,1292778871,NULL,'restrictmodulesfor','none',NULL),(545,2,1292778871,NULL,'restrictbydefault','0',NULL),(546,2,1292778871,NULL,'defaultallowedmodules','',NULL),(547,2,1292778871,NULL,'displayloginfailures','',NULL),(548,2,1292778871,NULL,'notifyloginfailures','',NULL),(549,2,1292778871,NULL,'notifyloginthreshold','10',NULL),(550,2,1292778871,NULL,'runclamonupload','0',NULL),(551,2,1292778871,NULL,'pathtoclam','',NULL),(552,2,1292778871,NULL,'quarantinedir','',NULL),(553,2,1292778871,NULL,'clamfailureonupload','donothing',NULL),(554,2,1292778871,NULL,'themelist','',NULL),(555,2,1292778871,NULL,'themedesignermode','0',NULL),(556,2,1292778871,NULL,'allowuserthemes','0',NULL),(557,2,1292778871,NULL,'allowcoursethemes','0',NULL),(558,2,1292778871,NULL,'allowcategorythemes','0',NULL),(559,2,1292778871,NULL,'allowthemechangeonurl','0',NULL),(560,2,1292778871,NULL,'allowuserblockhiding','1',NULL),(561,2,1292778871,NULL,'allowblockstodock','1',NULL),(562,2,1292778871,NULL,'custommenuitems','',NULL),(563,2,1292778871,'theme_arialist','logo','',NULL),(564,2,1292778871,'theme_arialist','tagline','',NULL),(565,2,1292778871,'theme_arialist','linkcolor','#f25f0f',NULL),(566,2,1292778871,'theme_arialist','regionwidth','250',NULL),(567,2,1292778871,'theme_arialist','customcss','',NULL),(568,2,1292778871,'theme_brick','logo','',NULL),(569,2,1292778871,'theme_brick','linkcolor','#06365b',NULL),(570,2,1292778871,'theme_brick','linkhover','#5487ad',NULL),(571,2,1292778871,'theme_brick','maincolor','#8e2800',NULL),(572,2,1292778871,'theme_brick','maincolorlink','#fff0a5',NULL),(573,2,1292778871,'theme_brick','headingcolor','#5c3500',NULL),(574,2,1292778871,'theme_formal_white','backgroundcolor','#F7F6F1',NULL),(575,2,1292778871,'theme_formal_white','logo','',NULL),(576,2,1292778871,'theme_formal_white','regionwidth','200',NULL),(577,2,1292778871,'theme_formal_white','alwayslangmenu','0',NULL),(578,2,1292778871,'theme_formal_white','footnote','',NULL),(579,2,1292778871,'theme_formal_white','customcss','',NULL),(580,2,1292778871,'theme_fusion','linkcolor','#2d83d5',NULL),(581,2,1292778871,'theme_fusion','tagline','',NULL),(582,2,1292778871,'theme_fusion','footertext','',NULL),(583,2,1292778871,'theme_fusion','customcss','',NULL),(584,2,1292778871,'theme_magazine','background','',NULL),(585,2,1292778871,'theme_magazine','logo','',NULL),(586,2,1292778871,'theme_magazine','linkcolor','#32529a',NULL),(587,2,1292778871,'theme_magazine','linkhover','#4e2300',NULL),(588,2,1292778871,'theme_magazine','maincolor','#002f2f',NULL),(589,2,1292778871,'theme_magazine','maincoloraccent','#092323',NULL),(590,2,1292778871,'theme_magazine','headingcolor','#4e0000',NULL),(591,2,1292778871,'theme_magazine','blockcolor','#002f2f',NULL),(592,2,1292778871,'theme_magazine','forumback','#e6e2af',NULL),(593,2,1292778871,'theme_nonzero','regionprewidth','200',NULL),(594,2,1292778871,'theme_nonzero','regionpostwidth','200',NULL),(595,2,1292778871,'theme_nonzero','customcss','',NULL),(596,2,1292778871,'theme_overlay','linkcolor','#428ab5',NULL),(597,2,1292778871,'theme_overlay','headercolor','#2a4c7b',NULL),(598,2,1292778871,'theme_overlay','footertext','',NULL),(599,2,1292778871,'theme_overlay','customcss','',NULL),(600,2,1292778871,'theme_sky_high','logo','',NULL),(601,2,1292778871,'theme_sky_high','regionwidth','240',NULL),(602,2,1292778871,'theme_sky_high','footnote','',NULL),(603,2,1292778871,'theme_sky_high','customcss','',NULL),(604,2,1292778871,'theme_splash','logo','',NULL),(605,2,1292778871,'theme_splash','tagline','Virtual learning center',NULL),(606,2,1292778871,'theme_splash','hide_tagline','0',NULL),(607,2,1292778871,'theme_splash','footnote','',NULL),(608,2,1292778871,'theme_splash','customcss','',NULL),(609,2,1292778871,NULL,'calendar_adminseesall','0',NULL),(610,2,1292778871,NULL,'calendar_site_timeformat','0',NULL),(611,2,1292778871,NULL,'calendar_startwday','0',NULL),(612,2,1292778871,NULL,'calendar_weekend','65',NULL),(613,2,1292778871,NULL,'calendar_lookahead','21',NULL),(614,2,1292778871,NULL,'calendar_maxevents','10',NULL),(615,2,1292778871,NULL,'enablecalendarexport','1',NULL),(616,2,1292778871,NULL,'calendar_exportsalt','z8roH4QBoNuFwmKqgZZ5xHoRP1NxUYaqKbipcxO1bU8wIuI9501NuoyJCxzX',NULL),(617,2,1292778871,NULL,'useblogassociations','1',NULL),(618,2,1292778871,NULL,'useexternalblogs','1',NULL),(619,2,1292778871,NULL,'externalblogcrontime','86400',NULL),(620,2,1292778871,NULL,'maxexternalblogsperuser','1',NULL),(621,2,1292778871,NULL,'blogusecomments','1',NULL),(622,2,1292778871,NULL,'blogshowcommentscount','1',NULL),(623,2,1292778871,NULL,'defaulthomepage','0',NULL),(624,2,1292778871,NULL,'navshowcategories','1',NULL),(625,2,1292778871,NULL,'navshowallcourses','0',NULL),(626,2,1292778871,NULL,'navcourselimit','20',NULL),(627,2,1292778871,NULL,'formatstringstriptags','1',NULL),(628,2,1292778871,NULL,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]',NULL),(629,2,1292778871,NULL,'docroot','http://docs.moodle.org',NULL),(630,2,1292778871,NULL,'doctonewwindow','0',NULL),(631,2,1292778871,NULL,'coursecontact','3',NULL),(632,2,1292778871,NULL,'enableajax','1',NULL),(633,2,1292778871,NULL,'useexternalyui','0',NULL),(634,2,1292778871,NULL,'yuicomboloading','1',NULL),(635,2,1292778871,NULL,'cachejs','1',NULL),(636,2,1292778871,NULL,'enablecourseajax','1',NULL),(637,2,1292778871,NULL,'frontpage','1',NULL),(638,2,1292778871,NULL,'frontpageloggedin','1',NULL),(639,2,1292778871,NULL,'maxcategorydepth','0',NULL),(640,2,1292778871,NULL,'commentsperpage','15',NULL),(641,2,1292778871,NULL,'coursesperpage','20',NULL),(642,2,1292778871,NULL,'defaultfrontpageroleid','0',NULL),(643,2,1292778871,NULL,'gdversion','2',NULL),(644,2,1292778871,NULL,'pathtodu','',NULL),(645,2,1292778871,NULL,'aspellpath','',NULL),(646,2,1292778871,NULL,'smtphosts','',NULL),(647,2,1292778871,NULL,'smtpuser','',NULL),(648,2,1292778871,NULL,'smtppass','',NULL),(649,2,1292778871,NULL,'smtpmaxbulk','1',NULL),(650,2,1292778871,NULL,'noreplyaddress','noreply@127.0.0.1',NULL),(651,2,1292778871,NULL,'digestmailtime','17',NULL),(652,2,1292778871,NULL,'sitemailcharset','0',NULL),(653,2,1292778871,NULL,'allowusermailcharset','0',NULL),(654,2,1292778871,NULL,'mailnewline','LF',NULL),(655,2,1292778871,NULL,'supportname','Admin User',NULL),(656,2,1292778871,NULL,'supportemail','',NULL),(657,2,1292778871,NULL,'supportpage','',NULL),(658,2,1292778871,NULL,'jabberhost','',NULL),(659,2,1292778871,NULL,'jabberserver','',NULL),(660,2,1292778871,NULL,'jabberusername','',NULL),(661,2,1292778871,NULL,'jabberpassword','',NULL),(662,2,1292778871,NULL,'jabberport','5222',NULL),(663,2,1292778871,NULL,'dbsessions','1',NULL),(664,2,1292778871,NULL,'sessioncookie','',NULL),(665,2,1292778871,NULL,'sessioncookiepath','/',NULL),(666,2,1292778871,NULL,'sessioncookiedomain','',NULL),(667,2,1292778871,NULL,'statsfirstrun','none',NULL),(668,2,1292778871,NULL,'statsmaxruntime','0',NULL),(669,2,1292778871,NULL,'statsruntimedays','31',NULL),(670,2,1292778871,NULL,'statsruntimestarthour','0',NULL),(671,2,1292778871,NULL,'statsruntimestartminute','0',NULL),(672,2,1292778871,NULL,'statsuserthreshold','0',NULL),(673,2,1292778871,NULL,'framename','_top',NULL),(674,2,1292778871,NULL,'slasharguments','1',NULL),(675,2,1292778871,NULL,'getremoteaddrconf','0',NULL),(676,2,1292778871,NULL,'proxyhost','',NULL),(677,2,1292778871,NULL,'proxyport','0',NULL),(678,2,1292778871,NULL,'proxytype','HTTP',NULL),(679,2,1292778871,NULL,'proxyuser','',NULL),(680,2,1292778871,NULL,'proxypassword','',NULL),(681,2,1292778871,NULL,'proxybypass','localhost, 127.0.0.1',NULL),(682,2,1292778871,NULL,'maintenance_enabled','0',NULL),(683,2,1292778871,NULL,'maintenance_message','',NULL),(684,2,1292778871,NULL,'deleteunconfirmed','168',NULL),(685,2,1292778871,NULL,'deleteincompleteusers','0',NULL),(686,2,1292778871,NULL,'logguests','1',NULL),(687,2,1292778871,NULL,'loglifetime','0',NULL),(688,2,1292778871,NULL,'disablegradehistory','0',NULL),(689,2,1292778871,NULL,'gradehistorylifetime','0',NULL),(690,2,1292778871,NULL,'extramemorylimit','512M',NULL),(691,2,1292778871,NULL,'curlcache','120',NULL),(692,2,1292778871,NULL,'enableglobalsearch','0',NULL),(693,2,1292778871,NULL,'enablesafebrowserintegration','0',NULL),(694,2,1292778871,NULL,'enablegroupmembersonly','0',NULL),(695,2,1292778871,NULL,'debug','0',NULL),(696,2,1292778871,NULL,'debugdisplay','1',NULL),(697,2,1292778871,NULL,'xmlstrictheaders','0',NULL),(698,2,1292778871,NULL,'debugsmtp','0',NULL),(699,2,1292778871,NULL,'perfdebug','7',NULL),(700,2,1292778871,NULL,'debugstringids','0',NULL),(701,2,1292778871,NULL,'debugvalidators','0',NULL),(702,2,1292778871,NULL,'debugpageinfo','0',NULL),(703,2,1292778871,NULL,'assignment_maxbytes','1048576',NULL),(704,2,1292778871,NULL,'forum_maxbytes','512000',NULL),(705,2,1292778871,'workshop','maxbytes','0',NULL),(706,2,1292778872,NULL,'calendar_exportsalt','3DB4r3D4QLqd9xbb3r11sRdHKKuQSl5dkKiJk5moKiCwbd6nqRFAYGPiyLhE','z8roH4QBoNuFwmKqgZZ5xHoRP1NxUYaqKbipcxO1bU8wIuI9501NuoyJCxzX'),(707,2,1354824201,NULL,'frontpage','1,4','1'),(708,2,1354824201,NULL,'frontpageloggedin','1,4','1'),(709,2,1354827960,NULL,'profileroles','3,4,5','5,4,3'),(710,2,1354827960,NULL,'passwordpolicy','0','1'),(711,2,1354827960,NULL,'minpasswordlength','1','8'),(712,2,1354827960,NULL,'minpassworddigits','0','1'),(713,2,1354827960,NULL,'minpasswordlower','0','1'),(714,2,1354827960,NULL,'minpasswordupper','0','1'),(715,2,1354827960,NULL,'minpasswordnonalphanum','0','1'),(716,2,1354827960,NULL,'groupenrolmentkeypolicy','0','1'),(717,2,1354827960,NULL,'emailchangeconfirmation','0','1');
/*!40000 ALTER TABLE `config_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_plugins`
--

DROP TABLE IF EXISTS `config_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_plugins` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_plugins`
--

LOCK TABLES `config_plugins` WRITE;
/*!40000 ALTER TABLE `config_plugins` DISABLE KEYS */;
INSERT INTO `config_plugins` VALUES (9,'auth_cas','version','2010072600'),(11,'auth_db','version','2009112400'),(13,'auth_fc','version','2009112400'),(15,'auth_imap','version','2009112400'),(17,'auth_ldap','version','2010072600'),(19,'auth_mnet','version','2010071300'),(21,'auth_nntp','version','2009112400'),(23,'auth_pam','version','2009112400'),(25,'auth_pop3','version','2009112400'),(27,'auth_radius','version','2009112400'),(29,'auth_shibboleth','version','2009112400'),(31,'enrol_authorize','version','2010081203'),(32,'enrol_category','version','2010061500'),(34,'enrol_cohort','version','2010073100'),(35,'enrol_database','version','2010073100'),(37,'enrol_flatfile','version','2010091400'),(38,'enrol_guest','version','2010081800'),(39,'enrol_imsenterprise','version','2010071200'),(40,'enrol_ldap','version','2010071100'),(42,'enrol_manual','version','2010071200'),(44,'enrol_meta','version','2010073100'),(46,'enrol_mnet','version','2010071701'),(47,'enrol_paypal','version','2010073100'),(48,'enrol_self','version','2010090501'),(50,'message_email','version','2010090501'),(52,'message_jabber','version','2010090501'),(54,'message_popup','version','2010090501'),(58,'filter_emoticon','version','2010102300'),(59,'filter_mediaplugin','version','2010070900'),(61,'filter_tex','version','2010073000'),(63,'filter_urltolink','version','2010100500'),(64,'editor_textarea','version','2010090501'),(65,'editor_tinymce','version','2010093000'),(66,'report_courseoverview','version','2010090501'),(67,'report_customlang','version','2010111500'),(68,'report_questioninstances','version','2010090501'),(69,'report_security','version','2010090501'),(70,'report_unittest','version','2010090501'),(71,'report_unsuproles','version','2010071800'),(72,'coursereport_completion','version','2010090501'),(73,'coursereport_log','version','2010090501'),(74,'coursereport_outline','version','2010090501'),(75,'coursereport_participation','version','2010090501'),(76,'coursereport_progress','version','2010090501'),(77,'coursereport_stats','version','2010090501'),(78,'gradeexport_ods','version','2010090501'),(79,'gradeexport_txt','version','2010090501'),(80,'gradeexport_xls','version','2010090501'),(81,'gradeexport_xml','version','2010090501'),(82,'gradeimport_csv','version','2010090501'),(83,'gradeimport_xml','version','2010090501'),(84,'gradereport_grader','version','2010090501'),(85,'gradereport_outcomes','version','2010090501'),(86,'gradereport_overview','version','2010090501'),(87,'gradereport_user','version','2010090501'),(88,'mnetservice_enrol','version','2010071700'),(89,'webservice_amf','version','2009101900'),(90,'webservice_rest','version','2009100800'),(91,'webservice_soap','version','2009101900'),(92,'webservice_xmlrpc','version','2009101900'),(93,'repository_alfresco','version','2010050700'),(94,'repository_boxnet','version','2009080105'),(95,'repository_coursefiles','version','2010083100'),(96,'repository_dropbox','version','2010051400'),(97,'repository_filesystem','version','2009080102'),(98,'repository_flickr','version','2009080102'),(99,'repository_flickr_public','version','2009080102'),(100,'repository_googledocs','version','2009080102'),(101,'repository_local','version','2009080102'),(103,'local','enablecourseinstances','0'),(104,'local','enableuserinstances','0'),(105,'repository_merlot','version','2009111301'),(106,'repository_picasa','version','2009080102'),(107,'repository_recent','version','2010042202'),(109,'recent','enablecourseinstances','0'),(110,'recent','enableuserinstances','0'),(111,'repository_s3','version','2009080102'),(112,'repository_upload','version','2009080102'),(114,'upload','enablecourseinstances','0'),(115,'upload','enableuserinstances','0'),(116,'repository_url','version','2009080102'),(117,'repository_user','version','2010052700'),(119,'user','enablecourseinstances','0'),(120,'user','enableuserinstances','0'),(121,'repository_webdav','version','2009080102'),(122,'repository_wikimedia','version','2009080102'),(123,'repository_youtube','version','2009080102'),(124,'portfolio_boxnet','version','2010090501'),(125,'portfolio_download','version','2010090501'),(126,'portfolio_flickr','version','2010090501'),(127,'portfolio_googledocs','version','2010090501'),(128,'portfolio_mahara','version','2010090501'),(129,'portfolio_picasa','version','2010090501'),(130,'qtype_calculated','version','2010090501'),(131,'qtype_essay','version','2010090501'),(132,'qtype_match','version','2010090501'),(133,'qtype_multianswer','version','2010090501'),(134,'qtype_multichoice','version','2010090501'),(135,'qtype_numerical','version','2010090501'),(136,'qtype_randomsamatch','version','2010090501'),(137,'qtype_shortanswer','version','2010090501'),(138,'qtype_truefalse','version','2010090501'),(139,'assignment_online','version','2010090501'),(140,'quiz_overview','version','2009091400'),(141,'quiz_statistics','version','2008112100'),(143,'workshopform_accumulative','version','2010091700'),(145,'workshopform_comments','version','2010091700'),(147,'workshopform_numerrors','version','2010091700'),(149,'workshopform_rubric','version','2010091700'),(151,'workshopeval_best','version','2010090501'),(152,'moodlecourse','format','weeks'),(153,'moodlecourse','numsections','10'),(154,'moodlecourse','hiddensections','0'),(155,'moodlecourse','newsitems','5'),(156,'moodlecourse','showgrades','1'),(157,'moodlecourse','showreports','0'),(158,'moodlecourse','maxbytes','8388608'),(159,'moodlecourse','groupmode','0'),(160,'moodlecourse','groupmodeforce','0'),(161,'moodlecourse','visible','1'),(162,'moodlecourse','lang',''),(163,'moodlecourse','enablecompletion','0'),(164,'moodlecourse','completionstartonenrol','0'),(165,'backup','backup_general_users','1'),(166,'backup','backup_general_users_locked','0'),(167,'backup','backup_general_anonymize','0'),(168,'backup','backup_general_anonymize_locked','0'),(169,'backup','backup_general_role_assignments','1'),(170,'backup','backup_general_role_assignments_locked','0'),(171,'backup','backup_general_user_files','1'),(172,'backup','backup_general_user_files_locked','0'),(173,'backup','backup_general_activities','1'),(174,'backup','backup_general_activities_locked','0'),(175,'backup','backup_general_blocks','1'),(176,'backup','backup_general_blocks_locked','0'),(177,'backup','backup_general_filters','1'),(178,'backup','backup_general_filters_locked','0'),(179,'backup','backup_general_comments','1'),(180,'backup','backup_general_comments_locked','0'),(181,'backup','backup_general_userscompletion','1'),(182,'backup','backup_general_userscompletion_locked','0'),(183,'backup','backup_general_logs','0'),(184,'backup','backup_general_logs_locked','0'),(185,'backup','backup_general_histories','0'),(186,'backup','backup_general_histories_locked','0'),(187,'backup','backup_auto_active','0'),(188,'backup','backup_auto_weekdays','0000000'),(189,'backup','backup_auto_hour','0'),(190,'backup','backup_auto_minute','0'),(191,'backup','backup_auto_storage','0'),(192,'backup','backup_auto_destination',''),(193,'backup','backup_auto_keep','1'),(194,'backup','backup_auto_users','1'),(195,'backup','backup_auto_role_assignments','1'),(196,'backup','backup_auto_user_files','1'),(197,'backup','backup_auto_activities','1'),(198,'backup','backup_auto_blocks','1'),(199,'backup','backup_auto_filters','1'),(200,'backup','backup_auto_comments','1'),(201,'backup','backup_auto_userscompletion','1'),(202,'backup','backup_auto_logs','0'),(203,'backup','backup_auto_histories','0'),(204,'folder','requiremodintro','1'),(205,'imscp','requiremodintro','1'),(206,'imscp','keepold','1'),(207,'imscp','keepold_adv','0'),(208,'page','requiremodintro','1'),(209,'page','displayoptions','5'),(210,'page','printheading','1'),(211,'page','printheading_adv','0'),(212,'page','printintro','0'),(213,'page','printintro_adv','0'),(214,'page','display','5'),(215,'page','display_adv','1'),(216,'page','popupwidth','620'),(217,'page','popupwidth_adv','1'),(218,'page','popupheight','450'),(219,'page','popupheight_adv','1'),(220,'quiz','timelimit','0'),(221,'quiz','timelimit_adv','0'),(222,'quiz','attempts','0'),(223,'quiz','attempts_adv','0'),(224,'quiz','grademethod','1'),(225,'quiz','grademethod_adv','0'),(226,'quiz','maximumgrade','10'),(227,'quiz','shufflequestions','0'),(228,'quiz','shufflequestions_adv','0'),(229,'quiz','questionsperpage','1'),(230,'quiz','questionsperpage_adv','0'),(231,'quiz','shuffleanswers','1'),(232,'quiz','shuffleanswers_adv','0'),(233,'quiz','optionflags','1'),(234,'quiz','optionflags_adv','0'),(235,'quiz','penaltyscheme','1'),(236,'quiz','penaltyscheme_adv','1'),(237,'quiz','attemptonlast','0'),(238,'quiz','attemptonlast_adv','1'),(239,'quiz','review','1073741823'),(240,'quiz','review_adv','0'),(241,'quiz','showuserpicture','0'),(242,'quiz','showuserpicture_adv','0'),(243,'quiz','decimalpoints','2'),(244,'quiz','decimalpoints_adv','0'),(245,'quiz','questiondecimalpoints','-1'),(246,'quiz','questiondecimalpoints_adv','0'),(247,'quiz','showblocks','0'),(248,'quiz','showblocks_adv','1'),(249,'quiz','password',''),(250,'quiz','password_adv','0'),(251,'quiz','subnet',''),(252,'quiz','subnet_adv','0'),(253,'quiz','delay1','0'),(254,'quiz','delay1_adv','0'),(255,'quiz','delay2','0'),(256,'quiz','delay2_adv','0'),(257,'quiz','popup','0'),(258,'quiz','popup_adv','1'),(259,'resource','framesize','130'),(260,'resource','requiremodintro','1'),(261,'resource','displayoptions','0,1,4,5,6'),(262,'resource','printheading','0'),(263,'resource','printheading_adv','0'),(264,'resource','printintro','1'),(265,'resource','printintro_adv','0'),(266,'resource','display','0'),(267,'resource','display_adv','0'),(268,'resource','popupwidth','620'),(269,'resource','popupwidth_adv','1'),(270,'resource','popupheight','450'),(271,'resource','popupheight_adv','1'),(272,'resource','filterfiles','0'),(273,'resource','filterfiles_adv','1'),(274,'scorm','grademethod','1'),(275,'scorm','maxgrade','100'),(276,'scorm','maxattempts','0'),(277,'scorm','displayattemptstatus','0'),(278,'scorm','displaycoursestructure','0'),(279,'scorm','forcecompleted','0'),(280,'scorm','forcenewattempt','0'),(281,'scorm','lastattemptlock','0'),(282,'scorm','whatgrade','0'),(283,'scorm','framewidth','100'),(284,'scorm','frameheight','500'),(285,'scorm','popup','0'),(286,'scorm','resizable','0'),(287,'scorm','scrollbars','0'),(288,'scorm','directories','0'),(289,'scorm','location','0'),(290,'scorm','menubar','0'),(291,'scorm','toolbar','0'),(292,'scorm','status','0'),(293,'scorm','skipview','0'),(294,'scorm','hidebrowse','0'),(295,'scorm','hidetoc','0'),(296,'scorm','hidenav','0'),(297,'scorm','auto','0'),(298,'scorm','updatefreq','0'),(299,'scorm','updatetime','2'),(300,'scorm','allowtypeexternal','0'),(301,'scorm','allowtypelocalsync','0'),(302,'scorm','allowtypeimsrepository','0'),(303,'scorm','allowapidebug','0'),(304,'scorm','apidebugmask','.*'),(305,'url','framesize','130'),(306,'url','requiremodintro','1'),(307,'url','secretphrase',''),(308,'url','rolesinparams','0'),(309,'url','displayoptions','0,1,5,6'),(310,'url','printheading','0'),(311,'url','printheading_adv','0'),(312,'url','printintro','1'),(313,'url','printintro_adv','0'),(314,'url','display','0'),(315,'url','display_adv','0'),(316,'url','popupwidth','620'),(317,'url','popupwidth_adv','1'),(318,'url','popupheight','450'),(319,'url','popupheight_adv','1'),(320,'workshop','grade','80'),(321,'workshop','gradinggrade','20'),(322,'workshop','gradedecimals','0'),(323,'workshop','strategy','accumulative'),(324,'workshop','examplesmode','0'),(325,'workshopallocation_random','numofreviews','5'),(326,'workshopform_numerrors','grade0','No'),(327,'workshopform_numerrors','grade1','Yes'),(328,'workshopeval_best','comparison','5'),(329,'blocks/section_links','numsections1','22'),(330,'blocks/section_links','incby1','2'),(331,'blocks/section_links','numsections2','40'),(332,'blocks/section_links','incby2','5'),(333,'enrol_cohort','roleid','5'),(334,'enrol_database','dbtype',''),(335,'enrol_database','dbhost','localhost'),(336,'enrol_database','dbuser',''),(337,'enrol_database','dbpass',''),(338,'enrol_database','dbname',''),(339,'enrol_database','dbencoding','utf-8'),(340,'enrol_database','dbsetupsql',''),(341,'enrol_database','dbsybasequoting','0'),(342,'enrol_database','debugdb','0'),(343,'enrol_database','localcoursefield','idnumber'),(344,'enrol_database','localuserfield','idnumber'),(345,'enrol_database','localrolefield','shortname'),(346,'enrol_database','remoteenroltable',''),(347,'enrol_database','remotecoursefield',''),(348,'enrol_database','remoteuserfield',''),(349,'enrol_database','remoterolefield',''),(350,'enrol_database','defaultrole','5'),(351,'enrol_database','ignorehiddencourses','0'),(352,'enrol_database','unenrolaction','0'),(353,'enrol_database','newcoursetable',''),(354,'enrol_database','newcoursefullname','fullname'),(355,'enrol_database','newcourseshortname','shortname'),(356,'enrol_database','newcourseidnumber','idnumber'),(357,'enrol_database','newcoursecategory',''),(358,'enrol_database','defaultcategory','1'),(359,'enrol_database','templatecourse',''),(360,'enrol_flatfile','location',''),(361,'enrol_flatfile','mailstudents','0'),(362,'enrol_flatfile','mailteachers','0'),(363,'enrol_flatfile','mailadmins','0'),(364,'enrol_flatfile','map_1','manager'),(365,'enrol_flatfile','map_2','coursecreator'),(366,'enrol_flatfile','map_3','editingteacher'),(367,'enrol_flatfile','map_4','teacher'),(368,'enrol_flatfile','map_5','student'),(369,'enrol_flatfile','map_6','guest'),(370,'enrol_flatfile','map_7','user'),(371,'enrol_flatfile','map_8','frontpage'),(372,'enrol_guest','requirepassword','0'),(373,'enrol_guest','usepasswordpolicy','0'),(374,'enrol_guest','showhint','0'),(375,'enrol_guest','defaultenrol','1'),(376,'enrol_guest','status','1'),(377,'enrol_guest','status_adv','0'),(378,'enrol_imsenterprise','imsfilelocation',''),(379,'enrol_imsenterprise','logtolocation',''),(380,'enrol_imsenterprise','mailadmins','0'),(381,'enrol_imsenterprise','createnewusers','0'),(382,'enrol_imsenterprise','imsdeleteusers','0'),(383,'enrol_imsenterprise','fixcaseusernames','0'),(384,'enrol_imsenterprise','fixcasepersonalnames','0'),(385,'enrol_imsenterprise','imssourcedidfallback','0'),(386,'enrol_imsenterprise','imsrolemap01','5'),(387,'enrol_imsenterprise','imsrolemap02','3'),(388,'enrol_imsenterprise','imsrolemap03','3'),(389,'enrol_imsenterprise','imsrolemap04','5'),(390,'enrol_imsenterprise','imsrolemap05','0'),(391,'enrol_imsenterprise','imsrolemap06','4'),(392,'enrol_imsenterprise','imsrolemap07','0'),(393,'enrol_imsenterprise','imsrolemap08','4'),(394,'enrol_imsenterprise','truncatecoursecodes','0'),(395,'enrol_imsenterprise','createnewcourses','0'),(396,'enrol_imsenterprise','createnewcategories','0'),(397,'enrol_imsenterprise','imsunenrol','0'),(398,'enrol_imsenterprise','imsrestricttarget',''),(399,'enrol_imsenterprise','imscapitafix','0'),(400,'enrol_ldap','host_url',''),(401,'enrol_ldap','ldap_version','3'),(402,'enrol_ldap','ldapencoding','utf-8'),(403,'enrol_ldap','bind_dn',''),(404,'enrol_ldap','bind_pw',''),(405,'enrol_ldap','course_search_sub','0'),(406,'enrol_ldap','memberattribute_isdn','0'),(407,'enrol_ldap','user_contexts',''),(408,'enrol_ldap','user_search_sub','0'),(409,'enrol_ldap','user_type','default'),(410,'enrol_ldap','opt_deref','0'),(411,'enrol_ldap','idnumber_attribute',''),(412,'enrol_ldap','objectclass',''),(413,'enrol_ldap','course_idnumber',''),(414,'enrol_ldap','course_shortname',''),(415,'enrol_ldap','course_fullname',''),(416,'enrol_ldap','course_summary',''),(417,'enrol_ldap','ignorehiddencourses','0'),(418,'enrol_ldap','unenrolaction','0'),(419,'enrol_ldap','autocreate','0'),(420,'enrol_ldap','category','1'),(421,'enrol_ldap','template',''),(422,'enrol_ldap','nested_groups','0'),(423,'enrol_ldap','group_memberofattribute',''),(424,'enrol_manual','defaultenrol','1'),(425,'enrol_manual','status','0'),(426,'enrol_manual','enrolperiod','0'),(427,'enrol_manual','roleid','5'),(428,'enrol_meta','nosyncroleids',''),(429,'enrol_mnet','roleid','5'),(430,'enrol_mnet','roleid_adv','1'),(431,'enrol_paypal','paypalbusiness',''),(432,'enrol_paypal','mailstudents','0'),(433,'enrol_paypal','mailteachers','0'),(434,'enrol_paypal','mailadmins','0'),(435,'enrol_paypal','status','1'),(436,'enrol_paypal','cost','0'),(437,'enrol_paypal','currency','USD'),(438,'enrol_paypal','roleid','5'),(439,'enrol_paypal','enrolperiod','0'),(440,'enrol_self','requirepassword','0'),(441,'enrol_self','usepasswordpolicy','0'),(442,'enrol_self','showhint','0'),(443,'enrol_self','defaultenrol','1'),(444,'enrol_self','status','1'),(445,'enrol_self','groupkey','0'),(446,'enrol_self','roleid','5'),(447,'enrol_self','enrolperiod','0'),(448,'enrol_self','longtimenosee','0'),(449,'enrol_self','maxenrolled','0'),(450,'enrol_self','sendcoursewelcomemessage','1'),(451,'editor_tinymce','spellengine','GoogleSpell'),(452,'filter_urltolink','formats','0'),(453,'filter_emoticon','formats','1,4,0'),(454,'theme_arialist','logo',''),(455,'theme_arialist','tagline',''),(456,'theme_arialist','linkcolor','#f25f0f'),(457,'theme_arialist','regionwidth','250'),(458,'theme_arialist','customcss',''),(459,'theme_brick','logo',''),(460,'theme_brick','linkcolor','#06365b'),(461,'theme_brick','linkhover','#5487ad'),(462,'theme_brick','maincolor','#8e2800'),(463,'theme_brick','maincolorlink','#fff0a5'),(464,'theme_brick','headingcolor','#5c3500'),(465,'theme_formal_white','backgroundcolor','#F7F6F1'),(466,'theme_formal_white','logo',''),(467,'theme_formal_white','regionwidth','200'),(468,'theme_formal_white','alwayslangmenu','0'),(469,'theme_formal_white','footnote',''),(470,'theme_formal_white','customcss',''),(471,'theme_fusion','linkcolor','#2d83d5'),(472,'theme_fusion','tagline',''),(473,'theme_fusion','footertext',''),(474,'theme_fusion','customcss',''),(475,'theme_magazine','background',''),(476,'theme_magazine','logo',''),(477,'theme_magazine','linkcolor','#32529a'),(478,'theme_magazine','linkhover','#4e2300'),(479,'theme_magazine','maincolor','#002f2f'),(480,'theme_magazine','maincoloraccent','#092323'),(481,'theme_magazine','headingcolor','#4e0000'),(482,'theme_magazine','blockcolor','#002f2f'),(483,'theme_magazine','forumback','#e6e2af'),(484,'theme_nonzero','regionprewidth','200'),(485,'theme_nonzero','regionpostwidth','200'),(486,'theme_nonzero','customcss',''),(487,'theme_overlay','linkcolor','#428ab5'),(488,'theme_overlay','headercolor','#2a4c7b'),(489,'theme_overlay','footertext',''),(490,'theme_overlay','customcss',''),(491,'theme_sky_high','logo',''),(492,'theme_sky_high','regionwidth','240'),(493,'theme_sky_high','footnote',''),(494,'theme_sky_high','customcss',''),(495,'theme_splash','logo',''),(496,'theme_splash','tagline','Virtual learning center'),(497,'theme_splash','hide_tagline','0'),(498,'theme_splash','footnote',''),(499,'theme_splash','customcss',''),(500,'workshop','maxbytes','0'),(501,'enrol_self','lastcron','1360797424'),(502,'enrol_cohort','lastcron','1360797424'),(503,'registration','crontime','1360797424');
/*!40000 ALTER TABLE `config_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `context`
--

DROP TABLE IF EXISTS `context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `context` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instanceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `cont_ins_ix` (`instanceid`),
  KEY `cont_pat_ix` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='one of these must be set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `context`
--

LOCK TABLES `context` WRITE;
/*!40000 ALTER TABLE `context` DISABLE KEYS */;
INSERT INTO `context` VALUES (1,10,0,'/1',1),(2,50,1,'/1/2',2),(3,40,1,'/1/3',2),(4,80,1,'/1/2/4',3),(5,80,2,'/1/2/5',3),(6,80,3,'/1/2/6',3),(7,80,4,'/1/7',2),(8,80,5,'/1/8',2),(9,80,6,'/1/9',2),(10,80,7,'/1/10',2),(11,80,8,'/1/11',2),(12,80,9,'/1/12',2),(13,30,2,'/1/13',2),(14,50,2,'/1/26/14',3),(15,80,10,'/1/26/14/15',4),(16,80,11,'/1/26/14/16',4),(17,80,12,'/1/26/14/17',4),(18,80,13,'/1/26/14/18',4),(19,30,3,'/1/19',2),(20,30,4,'/1/20',2),(21,30,5,'/1/21',2),(22,30,6,'/1/22',2),(23,30,7,'/1/23',2),(24,30,8,'/1/24',2),(25,30,9,'/1/25',2),(26,40,2,'/1/26',2),(27,50,3,'/1/26/27',3),(28,80,14,'/1/26/27/28',4),(29,80,15,'/1/26/27/29',4),(30,80,16,'/1/26/27/30',4),(31,80,17,'/1/26/27/31',4),(32,50,4,'/1/3/32',3),(33,80,18,'/1/3/32/33',4),(34,80,19,'/1/3/32/34',4),(35,80,20,'/1/3/32/35',4),(36,80,21,'/1/3/32/36',4),(37,50,5,'/1/26/37',3),(38,80,22,'/1/26/37/38',4),(39,80,23,'/1/26/37/39',4),(40,80,24,'/1/26/37/40',4),(41,80,25,'/1/26/37/41',4),(42,70,1,'/1/26/37/42',4),(43,70,2,'/1/26/27/43',4),(44,50,6,'/1/26/44',3),(45,80,26,'/1/26/44/45',4),(46,80,27,'/1/26/44/46',4),(47,80,28,'/1/26/44/47',4),(48,80,29,'/1/26/44/48',4),(49,70,3,'/1/26/44/49',4),(50,70,4,'/1/26/44/50',4),(51,70,5,'/1/26/44/51',4),(52,70,6,'/1/26/44/52',4),(53,70,7,'/1/26/44/53',4),(54,70,8,'/1/26/44/54',4),(55,70,9,'/1/26/44/55',4);
/*!40000 ALTER TABLE `context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `context_temp`
--

DROP TABLE IF EXISTS `context_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `context_temp` (
  `id` bigint(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `depth` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by build_context_path() in upgrade and cron to keep con';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `context_temp`
--

LOCK TABLES `context_temp` WRITE;
/*!40000 ALTER TABLE `context_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `context_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` text,
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `format` varchar(10) NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `modinfo` longtext,
  `newsitems` mediumint(5) unsigned NOT NULL DEFAULT '1',
  `startdate` bigint(10) unsigned NOT NULL DEFAULT '0',
  `numsections` mediumint(5) unsigned NOT NULL DEFAULT '1',
  `marker` bigint(10) unsigned NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `showreports` smallint(4) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hiddensections` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `groupmode` smallint(4) unsigned NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) unsigned NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `requested` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `restrictmodules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completionstartonenrol` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cour_cat_ix` (`category`),
  KEY `cour_idn_ix` (`idnumber`),
  KEY `cour_sho_ix` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Central course table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,0,1,'Faber.edu','moo','','<p><strong>Welcome to Faber.edu</strong></p>',0,'site',1,'a:0:{}',3,0,1,0,0,0,0,1,1,0,0,0,0,'','',0,1354824201,0,0,0,0,0),(2,2,10004,'Orientation to IT Professions','LAN101','101-350','<p>﻿﻿﻿﻿﻿﻿﻿</p>',1,'weeks',1,'a:0:{}',5,1354838400,10,0,8388608,0,0,1,1,0,0,0,0,'','',1354827403,1354827403,0,0,0,0,0),(3,2,10003,'LAN103 Cybersafety','LAN103','','',1,'weeks',1,'a:1:{i:2;O:8:\"stdClass\":13:{s:2:\"id\";s:1:\"2\";s:2:\"cm\";s:1:\"2\";s:3:\"mod\";s:5:\"forum\";s:7:\"section\";s:1:\"0\";s:8:\"idnumber\";N;s:7:\"visible\";s:1:\"1\";s:9:\"groupmode\";s:1:\"0\";s:10:\"groupingid\";s:1:\"0\";s:16:\"groupmembersonly\";s:1:\"0\";s:6:\"indent\";s:1:\"0\";s:10:\"completion\";s:1:\"0\";s:5:\"extra\";s:0:\"\";s:4:\"name\";s:10:\"News forum\";}}',5,1354838400,10,0,8388608,0,0,1,1,0,0,0,0,'','',1354830312,1354830312,0,0,0,0,0),(4,1,20001,'ART-101  Digital Photo','ART101','','',1,'weeks',1,'a:0:{}',5,1354838400,10,0,8388608,0,0,1,1,0,0,0,0,'','',1354830647,1354830647,0,0,0,0,0),(5,2,10002,'LAN-104 Firewall','LAN104','','<p>Home of the <strong>pfSense</strong> project, free Open Source FreeBSD based firewall, router, unified threat management, load balancing, multi WAN, Linux</p>',1,'weeks',1,'a:1:{i:1;O:8:\"stdClass\":13:{s:2:\"id\";s:1:\"1\";s:2:\"cm\";s:1:\"1\";s:3:\"mod\";s:5:\"forum\";s:7:\"section\";s:1:\"0\";s:8:\"idnumber\";N;s:7:\"visible\";s:1:\"1\";s:9:\"groupmode\";s:1:\"0\";s:10:\"groupingid\";s:1:\"0\";s:16:\"groupmembersonly\";s:1:\"0\";s:6:\"indent\";s:1:\"0\";s:10:\"completion\";s:1:\"0\";s:5:\"extra\";s:0:\"\";s:4:\"name\";s:10:\"News forum\";}}',5,1358726400,8,0,8388608,0,0,1,1,0,0,0,0,'','',1354834133,1355265596,0,0,0,0,0),(6,2,10001,'Computer Security- Best Practices','Best Practices','254-350','<p>This course discusses the best practices of Computer Security and Local Area Networking.</p>\r\n<p>good luck<br /><strong>Measuring And Reviewing The Yen</strong>!</p>\r\n<p> </p>\r\n<p><span style=\"font-size: xx-small;\">designed by JV</span></p>',1,'weeks',1,'a:7:{i:3;O:8:\"stdClass\":13:{s:2:\"id\";s:1:\"3\";s:2:\"cm\";s:1:\"3\";s:3:\"mod\";s:5:\"forum\";s:7:\"section\";s:1:\"0\";s:8:\"idnumber\";N;s:7:\"visible\";s:1:\"1\";s:9:\"groupmode\";s:1:\"0\";s:10:\"groupingid\";s:1:\"0\";s:16:\"groupmembersonly\";s:1:\"0\";s:6:\"indent\";s:1:\"0\";s:10:\"completion\";s:1:\"0\";s:5:\"extra\";s:0:\"\";s:4:\"name\";s:10:\"News forum\";}i:4;O:8:\"stdClass\":14:{s:2:\"id\";s:1:\"1\";s:2:\"cm\";s:1:\"4\";s:3:\"mod\";s:8:\"resource\";s:7:\"section\";s:1:\"1\";s:8:\"idnumber\";s:0:\"\";s:7:\"visible\";s:1:\"1\";s:9:\"groupmode\";s:1:\"0\";s:10:\"groupingid\";s:1:\"0\";s:16:\"groupmembersonly\";s:1:\"0\";s:6:\"indent\";s:1:\"0\";s:10:\"completion\";s:1:\"0\";s:5:\"extra\";s:0:\"\";s:4:\"icon\";s:7:\"f/image\";s:4:\"name\";s:14:\"Week 1 Content\";}i:5;O:8:\"stdClass\":14:{s:2:\"id\";s:1:\"2\";s:2:\"cm\";s:1:\"5\";s:3:\"mod\";s:8:\"resource\";s:7:\"section\";s:1:\"2\";s:8:\"idnumber\";s:0:\"\";s:7:\"visible\";s:1:\"1\";s:9:\"groupmode\";s:1:\"0\";s:10:\"groupingid\";s:1:\"0\";s:16:\"groupmembersonly\";s:1:\"0\";s:6:\"indent\";s:1:\"0\";s:10:\"completion\";s:1:\"0\";s:5:\"extra\";s:0:\"\";s:4:\"icon\";s:7:\"f/image\";s:4:\"name\";s:14:\"Week 2 Content\";}i:6;O:8:\"stdClass\":14:{s:2:\"id\";s:1:\"3\";s:2:\"cm\";s:1:\"6\";s:3:\"mod\";s:8:\"resource\";s:7:\"section\";s:1:\"3\";s:8:\"idnumber\";s:0:\"\";s:7:\"visible\";s:1:\"1\";s:9:\"groupmode\";s:1:\"0\";s:10:\"groupingid\";s:1:\"0\";s:16:\"groupmembersonly\";s:1:\"0\";s:6:\"indent\";s:1:\"0\";s:10:\"completion\";s:1:\"0\";s:5:\"extra\";s:0:\"\";s:4:\"icon\";s:7:\"f/image\";s:4:\"name\";s:14:\"Week 3 Content\";}i:7;O:8:\"stdClass\":14:{s:2:\"id\";s:1:\"4\";s:2:\"cm\";s:1:\"7\";s:3:\"mod\";s:8:\"resource\";s:7:\"section\";s:1:\"4\";s:8:\"idnumber\";s:0:\"\";s:7:\"visible\";s:1:\"1\";s:9:\"groupmode\";s:1:\"0\";s:10:\"groupingid\";s:1:\"0\";s:16:\"groupmembersonly\";s:1:\"0\";s:6:\"indent\";s:1:\"0\";s:10:\"completion\";s:1:\"0\";s:5:\"extra\";s:0:\"\";s:4:\"icon\";s:7:\"f/image\";s:4:\"name\";s:14:\"Week 4 Content\";}i:8;O:8:\"stdClass\":14:{s:2:\"id\";s:1:\"5\";s:2:\"cm\";s:1:\"8\";s:3:\"mod\";s:8:\"resource\";s:7:\"section\";s:1:\"5\";s:8:\"idnumber\";s:0:\"\";s:7:\"visible\";s:1:\"1\";s:9:\"groupmode\";s:1:\"0\";s:10:\"groupingid\";s:1:\"0\";s:16:\"groupmembersonly\";s:1:\"0\";s:6:\"indent\";s:1:\"0\";s:10:\"completion\";s:1:\"0\";s:5:\"extra\";s:0:\"\";s:4:\"icon\";s:7:\"f/image\";s:4:\"name\";s:14:\"Week 5 Content\";}i:9;O:8:\"stdClass\":14:{s:2:\"id\";s:1:\"6\";s:2:\"cm\";s:1:\"9\";s:3:\"mod\";s:8:\"resource\";s:7:\"section\";s:1:\"6\";s:8:\"idnumber\";s:0:\"\";s:7:\"visible\";s:1:\"1\";s:9:\"groupmode\";s:1:\"0\";s:10:\"groupingid\";s:1:\"0\";s:16:\"groupmembersonly\";s:1:\"0\";s:6:\"indent\";s:1:\"0\";s:10:\"completion\";s:1:\"0\";s:5:\"extra\";s:0:\"\";s:4:\"icon\";s:7:\"f/image\";s:4:\"name\";s:14:\"Week 6 Content\";}}',5,1355875200,6,0,8388608,0,0,1,1,0,0,0,0,'','',1355850941,1355853569,0,0,0,0,0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_allowed_modules`
--

DROP TABLE IF EXISTS `course_allowed_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_allowed_modules` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `module` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `courallomodu_cou_ix` (`course`),
  KEY `courallomodu_mod_ix` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='allowed modules foreach course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_allowed_modules`
--

LOCK TABLES `course_allowed_modules` WRITE;
/*!40000 ALTER TABLE `course_allowed_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_allowed_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_categories`
--

DROP TABLE IF EXISTS `course_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `coursecount` bigint(10) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `depth` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Course categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_categories`
--

LOCK TABLES `course_categories` WRITE;
/*!40000 ALTER TABLE `course_categories` DISABLE KEYS */;
INSERT INTO `course_categories` VALUES (1,'Art','',0,0,20000,1,1,1,1292778855,1,'/1',NULL),(2,'Internet and Computer Use','',1,0,10000,4,1,1,0,1,'/2',NULL);
/*!40000 ALTER TABLE `course_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_completion_aggr_methd`
--

DROP TABLE IF EXISTS `course_completion_aggr_methd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_completion_aggr_methd` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `criteriatype` bigint(20) unsigned DEFAULT NULL,
  `method` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courcompaggrmeth_cou_ix` (`course`),
  KEY `courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion aggregation methods for criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_completion_aggr_methd`
--

LOCK TABLES `course_completion_aggr_methd` WRITE;
/*!40000 ALTER TABLE `course_completion_aggr_methd` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_completion_aggr_methd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_completion_crit_compl`
--

DROP TABLE IF EXISTS `course_completion_crit_compl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_completion_crit_compl` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) unsigned DEFAULT NULL,
  `deleted` tinyint(1) unsigned DEFAULT NULL,
  `timecompleted` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courcompcritcomp_use_ix` (`userid`),
  KEY `courcompcritcomp_cou_ix` (`course`),
  KEY `courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion user records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_completion_crit_compl`
--

LOCK TABLES `course_completion_crit_compl` WRITE;
/*!40000 ALTER TABLE `course_completion_crit_compl` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_completion_crit_compl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_completion_criteria`
--

DROP TABLE IF EXISTS `course_completion_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_completion_criteria` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `criteriatype` bigint(20) unsigned NOT NULL DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `moduleinstance` bigint(10) unsigned DEFAULT NULL,
  `courseinstance` bigint(10) unsigned DEFAULT NULL,
  `enrolperiod` bigint(10) unsigned DEFAULT NULL,
  `timeend` bigint(10) unsigned DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_completion_criteria`
--

LOCK TABLES `course_completion_criteria` WRITE;
/*!40000 ALTER TABLE `course_completion_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_completion_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_completion_notify`
--

DROP TABLE IF EXISTS `course_completion_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_completion_notify` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `role` bigint(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `timesent` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `courcompnoti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion notification emails';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_completion_notify`
--

LOCK TABLES `course_completion_notify` WRITE;
/*!40000 ALTER TABLE `course_completion_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_completion_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_completions`
--

DROP TABLE IF EXISTS `course_completions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_completions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned DEFAULT NULL,
  `timenotified` bigint(10) unsigned DEFAULT NULL,
  `timeenrolled` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timestarted` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) unsigned DEFAULT NULL,
  `reaggregate` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `courcomp_use_ix` (`userid`),
  KEY `courcomp_cou_ix` (`course`),
  KEY `courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_completions`
--

LOCK TABLES `course_completions` WRITE;
/*!40000 ALTER TABLE `course_completions` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_completions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_display`
--

DROP TABLE IF EXISTS `course_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_display` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `courdisp_couuse_ix` (`course`,`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Stores info about how to display the course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_display`
--

LOCK TABLES `course_display` WRITE;
/*!40000 ALTER TABLE `course_display` DISABLE KEYS */;
INSERT INTO `course_display` VALUES (1,5,2,1),(2,3,2,0),(3,6,2,0);
/*!40000 ALTER TABLE `course_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modules`
--

DROP TABLE IF EXISTS `course_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modules` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `module` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instance` bigint(10) unsigned NOT NULL DEFAULT '0',
  `section` bigint(10) unsigned NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `added` bigint(10) unsigned NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) unsigned NOT NULL DEFAULT '0',
  `completion` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) unsigned DEFAULT NULL,
  `completionview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) unsigned NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) unsigned NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `courmodu_vis_ix` (`visible`),
  KEY `courmodu_cou_ix` (`course`),
  KEY `courmodu_mod_ix` (`module`),
  KEY `courmodu_ins_ix` (`instance`),
  KEY `courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modules`
--

LOCK TABLES `course_modules` WRITE;
/*!40000 ALTER TABLE `course_modules` DISABLE KEYS */;
INSERT INTO `course_modules` VALUES (1,5,7,1,6,NULL,1355265463,0,0,1,1,0,0,0,0,NULL,0,0,0,0,0),(2,3,7,2,4,NULL,1355850645,0,0,1,1,0,0,0,0,NULL,0,0,0,0,0),(3,6,7,3,27,NULL,1355851001,0,0,1,1,0,0,0,0,NULL,0,0,0,0,0),(4,6,14,1,28,'',1355851823,0,0,1,1,0,0,0,0,NULL,0,0,0,0,0),(5,6,14,2,29,'',1355852168,0,0,1,1,0,0,0,0,NULL,0,0,0,0,0),(6,6,14,3,30,'',1355852364,0,0,1,1,0,0,0,0,NULL,0,0,0,0,0),(7,6,14,4,31,'',1355852536,0,0,1,1,0,0,0,0,NULL,0,0,0,0,0),(8,6,14,5,32,'',1355852760,0,0,1,1,0,0,0,0,NULL,0,0,0,0,0),(9,6,14,6,33,'',1355853037,0,0,1,1,0,0,0,0,NULL,0,0,0,0,0);
/*!40000 ALTER TABLE `course_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modules_availability`
--

DROP TABLE IF EXISTS `course_modules_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modules_availability` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) unsigned NOT NULL,
  `sourcecmid` bigint(10) unsigned DEFAULT NULL,
  `requiredcompletion` tinyint(1) unsigned DEFAULT NULL,
  `gradeitemid` bigint(10) unsigned DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courmoduavai_cou_ix` (`coursemoduleid`),
  KEY `courmoduavai_sou_ix` (`sourcecmid`),
  KEY `courmoduavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table stores conditions that affect whether a module/activit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modules_availability`
--

LOCK TABLES `course_modules_availability` WRITE;
/*!40000 ALTER TABLE `course_modules_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_modules_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modules_completion`
--

DROP TABLE IF EXISTS `course_modules_completion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modules_completion` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `completionstate` tinyint(1) unsigned NOT NULL,
  `viewed` tinyint(1) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courmoducomp_cou_ix` (`coursemoduleid`),
  KEY `courmoducomp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the completion state (completed or not completed, etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modules_completion`
--

LOCK TABLES `course_modules_completion` WRITE;
/*!40000 ALTER TABLE `course_modules_completion` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_modules_completion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_published`
--

DROP TABLE IF EXISTS `course_published`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_published` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) DEFAULT NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `timepublished` bigint(10) unsigned NOT NULL,
  `enrollable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned DEFAULT '0',
  `timechecked` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about how and when an local courses were publish';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_published`
--

LOCK TABLES `course_published` WRITE;
/*!40000 ALTER TABLE `course_published` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_published` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_request`
--

DROP TABLE IF EXISTS `course_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_request` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `summary` text NOT NULL,
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  `requester` bigint(10) unsigned NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_request`
--

LOCK TABLES `course_request` WRITE;
/*!40000 ALTER TABLE `course_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_sections`
--

DROP TABLE IF EXISTS `course_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_sections` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `section` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `summary` text,
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sequence` text,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `coursect_cousec_ix` (`course`,`section`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_sections`
--

LOCK TABLES `course_sections` WRITE;
/*!40000 ALTER TABLE `course_sections` DISABLE KEYS */;
INSERT INTO `course_sections` VALUES (1,1,1,NULL,'',1,'',1),(2,1,0,NULL,'',1,'',1),(3,2,0,NULL,NULL,1,NULL,1),(4,3,0,NULL,NULL,1,'2',1),(5,4,0,NULL,NULL,1,NULL,1),(6,5,0,NULL,NULL,1,'1',1),(7,5,1,NULL,'',1,NULL,1),(8,5,2,NULL,'',1,NULL,1),(9,5,3,NULL,'',1,NULL,1),(10,5,4,NULL,'',1,NULL,1),(11,5,5,NULL,'',1,NULL,1),(12,5,6,NULL,'',1,NULL,1),(13,5,7,NULL,'',1,NULL,1),(14,5,8,NULL,'',1,NULL,1),(15,5,9,NULL,'',1,NULL,1),(16,5,10,NULL,'',1,NULL,1),(17,3,1,NULL,'',1,NULL,1),(18,3,2,NULL,'',1,NULL,1),(19,3,3,NULL,'',1,NULL,1),(20,3,4,NULL,'',1,NULL,1),(21,3,5,NULL,'',1,NULL,1),(22,3,6,NULL,'',1,NULL,1),(23,3,7,NULL,'',1,NULL,1),(24,3,8,NULL,'',1,NULL,1),(25,3,9,NULL,'',1,NULL,1),(26,3,10,NULL,'',1,NULL,1),(27,6,0,NULL,NULL,1,'3',1),(28,6,1,NULL,'',1,'4',1),(29,6,2,NULL,'',1,'5',1),(30,6,3,NULL,'',1,'6',1),(31,6,4,NULL,'',1,'7',1),(32,6,5,NULL,'',1,'8',1),(33,6,6,NULL,'',1,'9',1);
/*!40000 ALTER TABLE `course_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `comments` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) unsigned NOT NULL DEFAULT '0',
  `requiredentries` int(8) unsigned NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) unsigned NOT NULL DEFAULT '0',
  `maxentries` int(8) unsigned NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `singletemplate` text,
  `listtemplate` text,
  `listtemplateheader` text,
  `listtemplatefooter` text,
  `addtemplate` text,
  `rsstemplate` text,
  `rsstitletemplate` text,
  `csstemplate` text,
  `jstemplate` text,
  `asearchtemplate` text,
  `approval` smallint(4) unsigned NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) unsigned NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) unsigned NOT NULL DEFAULT '0',
  `editany` smallint(4) unsigned NOT NULL DEFAULT '0',
  `notification` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all database activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_content`
--

DROP TABLE IF EXISTS `data_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_content` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `recordid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext,
  PRIMARY KEY (`id`),
  KEY `datacont_rec_ix` (`recordid`),
  KEY `datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_content`
--

LOCK TABLES `data_content` WRITE;
/*!40000 ALTER TABLE `data_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_fields`
--

DROP TABLE IF EXISTS `data_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_fields` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `param1` text,
  `param2` text,
  `param3` text,
  `param4` text,
  `param5` text,
  `param6` text,
  `param7` text,
  `param8` text,
  `param9` text,
  `param10` text,
  PRIMARY KEY (`id`),
  KEY `datafiel_typdat_ix` (`type`,`dataid`),
  KEY `datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every field available';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_fields`
--

LOCK TABLES `data_fields` WRITE;
/*!40000 ALTER TABLE `data_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_records`
--

DROP TABLE IF EXISTS `data_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_records` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `dataid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `approved` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every record introduced';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_records`
--

LOCK TABLES `data_records` WRITE;
/*!40000 ALTER TABLE `data_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrol`
--

DROP TABLE IF EXISTS `enrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrol` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) NOT NULL DEFAULT '',
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `enrolperiod` bigint(10) unsigned DEFAULT '0',
  `enrolstartdate` bigint(10) unsigned DEFAULT '0',
  `enrolenddate` bigint(10) unsigned DEFAULT '0',
  `expirynotify` tinyint(1) unsigned DEFAULT '0',
  `expirythreshold` bigint(10) unsigned DEFAULT '0',
  `notifyall` tinyint(1) unsigned DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `roleid` bigint(10) unsigned DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) DEFAULT NULL,
  `customchar2` varchar(255) DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext,
  `customtext2` longtext,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enro_enr_ix` (`enrol`),
  KEY `enro_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Instances of enrolment plugins used in courses, fields marke';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrol`
--

LOCK TABLES `enrol` WRITE;
/*!40000 ALTER TABLE `enrol` DISABLE KEYS */;
INSERT INTO `enrol` VALUES (1,'manual',0,2,0,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1354827403,1354827403),(2,'guest',1,2,1,NULL,0,0,0,0,0,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1354827403,1354827403),(3,'self',1,2,2,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,1354827403,1354827403),(4,'manual',0,3,0,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1354830312,1354830312),(5,'guest',1,3,1,NULL,0,0,0,0,0,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1354830312,1354830312),(6,'self',1,3,2,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,1354830312,1354830312),(7,'manual',0,4,0,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1354830647,1354830647),(8,'guest',1,4,1,NULL,0,0,0,0,0,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1354830647,1354830647),(9,'self',1,4,2,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,1354830647,1354830647),(10,'manual',0,5,0,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1354834133,1354834133),(11,'guest',1,5,1,NULL,0,0,0,0,0,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1354834133,1355265596),(12,'self',1,5,2,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,1354834133,1354834133),(13,'manual',0,6,0,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1355850941,1355850941),(14,'guest',0,6,1,NULL,0,0,0,0,0,0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1355850941,1355853569),(15,'self',1,6,2,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,1355850941,1355850941);
/*!40000 ALTER TABLE `enrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrol_authorize`
--

DROP TABLE IF EXISTS `enrol_authorize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrol_authorize` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `paymentmethod` varchar(6) NOT NULL DEFAULT 'cc',
  `refundinfo` smallint(4) unsigned NOT NULL DEFAULT '0',
  `ccname` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instanceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `transid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `settletime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `amount` varchar(10) NOT NULL DEFAULT '',
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  PRIMARY KEY (`id`),
  KEY `enroauth_cou_ix` (`courseid`),
  KEY `enroauth_use_ix` (`userid`),
  KEY `enroauth_sta_ix` (`status`),
  KEY `enroauth_tra_ix` (`transid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about authorize.net transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrol_authorize`
--

LOCK TABLES `enrol_authorize` WRITE;
/*!40000 ALTER TABLE `enrol_authorize` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrol_authorize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrol_authorize_refunds`
--

DROP TABLE IF EXISTS `enrol_authorize_refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrol_authorize_refunds` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `amount` varchar(10) NOT NULL DEFAULT '',
  `transid` bigint(20) unsigned DEFAULT '0',
  `settletime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enroauthrefu_tra_ix` (`transid`),
  KEY `enroauthrefu_ord_ix` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Authorize.net refunds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrol_authorize_refunds`
--

LOCK TABLES `enrol_authorize_refunds` WRITE;
/*!40000 ALTER TABLE `enrol_authorize_refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrol_authorize_refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrol_flatfile`
--

DROP TABLE IF EXISTS `enrol_flatfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrol_flatfile` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(30) NOT NULL DEFAULT '',
  `roleid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enroflat_cou_ix` (`courseid`),
  KEY `enroflat_use_ix` (`userid`),
  KEY `enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='enrol_flatfile table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrol_flatfile`
--

LOCK TABLES `enrol_flatfile` WRITE;
/*!40000 ALTER TABLE `enrol_flatfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrol_flatfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrol_paypal`
--

DROP TABLE IF EXISTS `enrol_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrol_paypal` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `business` varchar(255) NOT NULL DEFAULT '',
  `receiver_email` varchar(255) NOT NULL DEFAULT '',
  `receiver_id` varchar(255) NOT NULL DEFAULT '',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instanceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `tax` varchar(255) NOT NULL DEFAULT '',
  `option_name1` varchar(255) NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) NOT NULL DEFAULT '',
  `option_name2` varchar(255) NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `pending_reason` varchar(255) NOT NULL DEFAULT '',
  `reason_code` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) NOT NULL DEFAULT '',
  `payment_type` varchar(30) NOT NULL DEFAULT '',
  `timeupdated` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrol_paypal`
--

LOCK TABLES `enrol_paypal` WRITE;
/*!40000 ALTER TABLE `enrol_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrol_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `format` smallint(4) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `repeatid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modulename` varchar(20) NOT NULL DEFAULT '',
  `instance` bigint(10) unsigned NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeduration` bigint(10) unsigned NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(36) NOT NULL DEFAULT '',
  `sequence` bigint(10) unsigned NOT NULL DEFAULT '1',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `even_cou_ix` (`courseid`),
  KEY `even_use_ix` (`userid`),
  KEY `even_tim_ix` (`timestart`),
  KEY `even_tim2_ix` (`timeduration`),
  KEY `even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_handlers`
--

DROP TABLE IF EXISTS `events_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_handlers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) NOT NULL DEFAULT '',
  `component` varchar(166) NOT NULL DEFAULT '',
  `handlerfile` varchar(255) NOT NULL DEFAULT '',
  `handlerfunction` mediumtext,
  `schedule` varchar(255) DEFAULT NULL,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `internal` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='This table is for storing which components requests what typ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_handlers`
--

LOCK TABLES `events_handlers` WRITE;
/*!40000 ALTER TABLE `events_handlers` DISABLE KEYS */;
INSERT INTO `events_handlers` VALUES (1,'portfolio_send','moodle','/lib/portfolio.php','s:22:\"portfolio_handle_event\";','cron',0,0),(2,'user_logout','mod_chat','/mod/chat/lib.php','s:16:\"chat_user_logout\";','instant',0,1),(3,'user_enrolled','mod_forum','/mod/forum/lib.php','s:19:\"forum_user_enrolled\";','instant',0,1),(4,'user_unenrolled','mod_forum','/mod/forum/lib.php','s:21:\"forum_user_unenrolled\";','instant',0,1),(5,'role_assigned','enrol_category','/enrol/category/locallib.php','a:2:{i:0;s:22:\"enrol_category_handler\";i:1;s:13:\"role_assigned\";}','instant',0,1),(6,'role_unassigned','enrol_category','/enrol/category/locallib.php','a:2:{i:0;s:22:\"enrol_category_handler\";i:1;s:15:\"role_unassigned\";}','instant',0,1),(7,'cohort_member_added','enrol_cohort','/enrol/cohort/locallib.php','a:2:{i:0;s:20:\"enrol_cohort_handler\";i:1;s:12:\"member_added\";}','instant',0,1),(8,'cohort_member_removed','enrol_cohort','/enrol/cohort/locallib.php','a:2:{i:0;s:20:\"enrol_cohort_handler\";i:1;s:14:\"member_removed\";}','instant',0,1),(9,'cohort_deleted','enrol_cohort','/enrol/cohort/locallib.php','a:2:{i:0;s:20:\"enrol_cohort_handler\";i:1;s:7:\"deleted\";}','instant',0,1),(10,'role_assigned','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:13:\"role_assigned\";}','instant',0,1),(11,'role_unassigned','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:15:\"role_unassigned\";}','instant',0,1),(12,'user_enrolled','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:13:\"user_enrolled\";}','instant',0,1),(13,'user_unenrolled','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:15:\"user_unenrolled\";}','instant',0,1),(14,'course_deleted','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:14:\"course_deleted\";}','instant',0,1),(15,'user_deleted','portfolio_googledocs','/portfolio/googledocs/lib.php','s:33:\"portfolio_googledocs_user_deleted\";','cron',0,0),(16,'user_deleted','portfolio_picasa','/portfolio/picasa/lib.php','s:29:\"portfolio_picasa_user_deleted\";','cron',0,0);
/*!40000 ALTER TABLE `events_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_queue`
--

DROP TABLE IF EXISTS `events_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_queue` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventdata` longtext NOT NULL,
  `stackdump` mediumtext,
  `userid` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing queued events. It stores only one ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_queue`
--

LOCK TABLES `events_queue` WRITE;
/*!40000 ALTER TABLE `events_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_queue_handlers`
--

DROP TABLE IF EXISTS `events_queue_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_queue_handlers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) unsigned NOT NULL,
  `handlerid` bigint(10) unsigned NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` mediumtext,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evenqueuhand_que_ix` (`queuedeventid`),
  KEY `evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is the list of queued handlers for processing. The even';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_queue_handlers`
--

LOCK TABLES `events_queue_handlers` WRITE;
/*!40000 ALTER TABLE `events_queue_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_queue_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_functions`
--

DROP TABLE IF EXISTS `external_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_functions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `classname` varchar(100) NOT NULL DEFAULT '',
  `methodname` varchar(100) NOT NULL DEFAULT '',
  `classpath` varchar(255) DEFAULT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `capabilities` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extefunc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='list of all external functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_functions`
--

LOCK TABLES `external_functions` WRITE;
/*!40000 ALTER TABLE `external_functions` DISABLE KEYS */;
INSERT INTO `external_functions` VALUES (1,'moodle_group_create_groups','moodle_group_external','create_groups','group/externallib.php','moodle','moodle/course:managegroups'),(2,'moodle_group_get_groups','moodle_group_external','get_groups','group/externallib.php','moodle','moodle/course:managegroups'),(3,'moodle_group_get_course_groups','moodle_group_external','get_course_groups','group/externallib.php','moodle','moodle/course:managegroups'),(4,'moodle_group_delete_groups','moodle_group_external','delete_groups','group/externallib.php','moodle','moodle/course:managegroups'),(5,'moodle_group_get_groupmembers','moodle_group_external','get_groupmembers','group/externallib.php','moodle','moodle/course:managegroups'),(6,'moodle_group_add_groupmembers','moodle_group_external','add_groupmembers','group/externallib.php','moodle','moodle/course:managegroups'),(7,'moodle_group_delete_groupmembers','moodle_group_external','delete_groupmembers','group/externallib.php','moodle','moodle/course:managegroups'),(8,'moodle_file_get_files','moodle_file_external','get_files','files/externallib.php','moodle',''),(9,'moodle_file_upload','moodle_file_external','upload','files/externallib.php','moodle',''),(10,'moodle_user_create_users','moodle_user_external','create_users','user/externallib.php','moodle','moodle/user:create'),(11,'moodle_user_get_users_by_id','moodle_user_external','get_users_by_id','user/externallib.php','moodle','moodle/user:viewdetails'),(12,'moodle_user_delete_users','moodle_user_external','delete_users','user/externallib.php','moodle','moodle/user:delete'),(13,'moodle_user_update_users','moodle_user_external','update_users','user/externallib.php','moodle','moodle/user:update'),(14,'moodle_enrol_get_enrolled_users','moodle_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),(15,'moodle_role_assign','moodle_enrol_external','role_assign','enrol/externallib.php','moodle','moodle/role:assign'),(16,'moodle_role_unassign','moodle_enrol_external','role_unassign','enrol/externallib.php','moodle','moodle/role:assign'),(17,'moodle_course_get_courses','moodle_course_external','get_courses','course/externallib.php','moodle','moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),(18,'moodle_course_create_courses','moodle_course_external','create_courses','course/externallib.php','moodle','moodle/course:create,moodle/course:visibility');
/*!40000 ALTER TABLE `external_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_services`
--

DROP TABLE IF EXISTS `external_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_services` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL,
  `requiredcapability` varchar(150) DEFAULT NULL,
  `restrictedusers` tinyint(1) unsigned NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exteserv_nam_uix` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='built in and custom external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_services`
--

LOCK TABLES `external_services` WRITE;
/*!40000 ALTER TABLE `external_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_services_functions`
--

DROP TABLE IF EXISTS `external_services_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_services_functions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) unsigned NOT NULL,
  `functionname` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lists functions available in each service group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_services_functions`
--

LOCK TABLES `external_services_functions` WRITE;
/*!40000 ALTER TABLE `external_services_functions` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_services_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_services_users`
--

DROP TABLE IF EXISTS `external_services_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_services_users` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exteservuser_ext_ix` (`externalserviceid`),
  KEY `exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users allowed to use services with restricted users flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_services_users`
--

LOCK TABLES `external_services_users` WRITE;
/*!40000 ALTER TABLE `external_services_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_services_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_tokens`
--

DROP TABLE IF EXISTS `external_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_tokens` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL DEFAULT '',
  `tokentype` smallint(4) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `externalserviceid` bigint(10) unsigned NOT NULL,
  `sid` varchar(128) DEFAULT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `creatorid` bigint(20) unsigned NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `lastaccess` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extetoke_use_ix` (`userid`),
  KEY `extetoke_ext_ix` (`externalserviceid`),
  KEY `extetoke_con_ix` (`contextid`),
  KEY `extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Security tokens for accessing of external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_tokens`
--

LOCK TABLES `external_tokens` WRITE;
/*!40000 ALTER TABLE `external_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) NOT NULL DEFAULT '',
  `page_after_submit` text NOT NULL,
  `page_after_submitformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all feedbacks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_completed`
--

DROP TABLE IF EXISTS `feedback_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_completed` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `random_response` bigint(10) unsigned NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `feedcomp_use_ix` (`userid`),
  KEY `feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_completed`
--

LOCK TABLES `feedback_completed` WRITE;
/*!40000 ALTER TABLE `feedback_completed` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_completedtmp`
--

DROP TABLE IF EXISTS `feedback_completedtmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_completedtmp` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `guestid` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `random_response` bigint(10) unsigned NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `feedcomp_use2_ix` (`userid`),
  KEY `feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_completedtmp`
--

LOCK TABLES `feedback_completedtmp` WRITE;
/*!40000 ALTER TABLE `feedback_completedtmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback_completedtmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_item`
--

DROP TABLE IF EXISTS `feedback_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_item` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `template` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` text NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `position` smallint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dependitem` bigint(10) unsigned NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `feeditem_fee_ix` (`feedback`),
  KEY `feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_item`
--

LOCK TABLES `feedback_item` WRITE;
/*!40000 ALTER TABLE `feedback_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_sitecourse_map`
--

DROP TABLE IF EXISTS `feedback_sitecourse_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_sitecourse_map` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `feedsitemap_cou_ix` (`courseid`),
  KEY `feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback sitecourse map';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_sitecourse_map`
--

LOCK TABLES `feedback_sitecourse_map` WRITE;
/*!40000 ALTER TABLE `feedback_sitecourse_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback_sitecourse_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_template`
--

DROP TABLE IF EXISTS `feedback_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_template` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='templates of feedbackstructures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_template`
--

LOCK TABLES `feedback_template` WRITE;
/*!40000 ALTER TABLE `feedback_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_tracking`
--

DROP TABLE IF EXISTS `feedback_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_tracking` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `feedtrac_use_ix` (`userid`),
  KEY `feedtrac_fee_ix` (`feedback`),
  KEY `feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback trackingdata';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_tracking`
--

LOCK TABLES `feedback_tracking` WRITE;
/*!40000 ALTER TABLE `feedback_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_value`
--

DROP TABLE IF EXISTS `feedback_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_value` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `item` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feedvalu_cou_ix` (`course_id`),
  KEY `feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completeds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_value`
--

LOCK TABLES `feedback_value` WRITE;
/*!40000 ALTER TABLE `feedback_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_valuetmp`
--

DROP TABLE IF EXISTS `feedback_valuetmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_valuetmp` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `item` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feedvalu_cou2_ix` (`course_id`),
  KEY `feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completedstmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_valuetmp`
--

LOCK TABLES `feedback_valuetmp` WRITE;
/*!40000 ALTER TABLE `feedback_valuetmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback_valuetmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned DEFAULT NULL,
  `filesize` bigint(10) unsigned NOT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `source` text,
  `author` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_pat_uix` (`pathnamehash`),
  KEY `file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `file_con_ix` (`contenthash`),
  KEY `file_con2_ix` (`contextid`),
  KEY `file_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='description of files, content is stored in sha1 file pool';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (4,'da39a3ee5e6b4b0d3255bfef95601890afd80709','c314d3659b425d8dd33a2527cb89b0821d8638fc',50,'mod_resource','content',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1355851814,1355851814,0),(10,'1340461f45c402fae9ed300965805b23e4f5f0f6','e418804e16decdd9351e3b361aef83eb62fdfbad',50,'mod_resource','content',0,'/','mouse lock.jpg',2,36639,'image/jpeg',0,NULL,'Admin User','allrightsreserved',1355852033,1355852038,1),(13,'659609f314f551b8cdac64073e957c85ee41a49e','86bac0b00438d30e436e8ca5c35cdb0ef25aeab5',51,'mod_resource','content',0,'/','secure keyboard.jpg',2,60785,'image/jpeg',0,NULL,'Admin User','allrightsreserved',1355852162,1355852162,1),(14,'da39a3ee5e6b4b0d3255bfef95601890afd80709','3aafec321377141faa54359e44e1d4474783d3d6',51,'mod_resource','content',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1355852162,1355852162,0),(18,'da39a3ee5e6b4b0d3255bfef95601890afd80709','6e080a62c0e81abe62fcf65e808221972b722136',52,'mod_resource','content',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1355852360,1355852360,0),(21,'77ad94ab445af852827c4991d6bd0cff10907242','ec7e826f4b5c39ee4b1975a951fd0e4650b1ecd4',53,'mod_resource','content',0,'/','Hard Drive Search.jpg',2,48814,'image/jpeg',0,NULL,'Admin User','allrightsreserved',1355852532,1355852532,1),(22,'da39a3ee5e6b4b0d3255bfef95601890afd80709','40304404bccb66ef419d301f1a9839dadc597718',53,'mod_resource','content',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1355852532,1355852532,0),(25,'d6edecd0eeed6ec487c9c57799ebadbe0f2fbdd3','ae5955a66b5a5e8420052c00313622d16808c165',54,'mod_resource','content',0,'/','Computer Failure.jpg',2,56623,'image/jpeg',0,NULL,'Admin User','allrightsreserved',1355852756,1355852756,1),(26,'da39a3ee5e6b4b0d3255bfef95601890afd80709','9b2e461164f8f704226b8cbd09c144bfc04efe36',54,'mod_resource','content',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1355852756,1355852756,0),(29,'26fecb71ba83c1471ae599ea4ea742640d108103','be162a0a0b72e6f4ad1101773ff88d1677b0389d',55,'mod_resource','content',0,'/','System_Failure.jpg',2,300176,'image/jpeg',0,NULL,'Admin User','allrightsreserved',1355853034,1355853034,1),(30,'da39a3ee5e6b4b0d3255bfef95601890afd80709','254f6dbade8c5b65e3b6fbcd14fa7e0b3122932b',55,'mod_resource','content',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1355853034,1355853034,0),(34,'f4cca77a3ace45923f1c725dd66e963b3f969d1e','16dc9619c32be8c02ab44e2841e33c7a592a537c',52,'mod_resource','content',0,'/','1s and 0s.jpg',2,67210,'image/jpeg',0,NULL,'Admin User','allrightsreserved',1355853169,1355853174,1);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_active`
--

DROP TABLE IF EXISTS `filter_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_active` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `filtacti_confil_uix` (`contextid`,`filter`),
  KEY `filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores information about which filters are active in which c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_active`
--

LOCK TABLES `filter_active` WRITE;
/*!40000 ALTER TABLE `filter_active` DISABLE KEYS */;
INSERT INTO `filter_active` VALUES (1,'filter/mediaplugin',1,1,1);
/*!40000 ALTER TABLE `filter_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_config`
--

DROP TABLE IF EXISTS `filter_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores per-context configuration settings for filters which ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_config`
--

LOCK TABLES `filter_config` WRITE;
/*!40000 ALTER TABLE `filter_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one folder resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'general',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `assessed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) unsigned NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `warnafter` bigint(10) unsigned NOT NULL DEFAULT '0',
  `blockafter` bigint(10) unsigned NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) unsigned NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) unsigned NOT NULL DEFAULT '0',
  `completionreplies` int(9) unsigned NOT NULL DEFAULT '0',
  `completionposts` int(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `foru_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (1,5,'news','News forum','General news and announcements',0,0,0,0,0,0,1,1,1,0,0,1355265463,0,0,0,0,0,0),(2,3,'news','News forum','General news and announcements',0,0,0,0,0,0,1,1,1,0,0,1355850645,0,0,0,0,0,0),(3,6,'news','News forum','General news and announcements',0,0,0,0,0,0,1,1,1,0,0,1355851001,0,0,0,0,0,0);
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_discussions`
--

DROP TABLE IF EXISTS `forum_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_discussions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forum` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `firstpost` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `usermodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forudisc_use_ix` (`userid`),
  KEY `forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_discussions`
--

LOCK TABLES `forum_discussions` WRITE;
/*!40000 ALTER TABLE `forum_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_posts`
--

DROP TABLE IF EXISTS `forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_posts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) unsigned NOT NULL DEFAULT '0',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `created` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forupost_use_ix` (`userid`),
  KEY `forupost_cre_ix` (`created`),
  KEY `forupost_mai_ix` (`mailed`),
  KEY `forupost_dis_ix` (`discussion`),
  KEY `forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_posts`
--

LOCK TABLES `forum_posts` WRITE;
/*!40000 ALTER TABLE `forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_queue`
--

DROP TABLE IF EXISTS `forum_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_queue` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `discussionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `postid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `foruqueu_use_ix` (`userid`),
  KEY `foruqueu_dis_ix` (`discussionid`),
  KEY `foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_queue`
--

LOCK TABLES `forum_queue` WRITE;
/*!40000 ALTER TABLE `forum_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_read`
--

DROP TABLE IF EXISTS `forum_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_read` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forumid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `discussionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `postid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `firstread` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastread` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `foruread_usefor_ix` (`userid`,`forumid`),
  KEY `foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_read`
--

LOCK TABLES `forum_read` WRITE;
/*!40000 ALTER TABLE `forum_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_subscriptions`
--

DROP TABLE IF EXISTS `forum_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_subscriptions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forum` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forusubs_use_ix` (`userid`),
  KEY `forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_subscriptions`
--

LOCK TABLES `forum_subscriptions` WRITE;
/*!40000 ALTER TABLE `forum_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_track_prefs`
--

DROP TABLE IF EXISTS `forum_track_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_track_prefs` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `forumid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_track_prefs`
--

LOCK TABLES `forum_track_prefs` WRITE;
/*!40000 ALTER TABLE `forum_track_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_track_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary`
--

DROP TABLE IF EXISTS `glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossary` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `displayformat` varchar(50) NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `showall` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `globalglossary` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `entbypage` smallint(3) unsigned NOT NULL DEFAULT '10',
  `editalways` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `assessed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossaries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary`
--

LOCK TABLES `glossary` WRITE;
/*!40000 ALTER TABLE `glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary_alias`
--

DROP TABLE IF EXISTS `glossary_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossary_alias` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entries alias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary_alias`
--

LOCK TABLES `glossary_alias` WRITE;
/*!40000 ALTER TABLE `glossary_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary_categories`
--

DROP TABLE IF EXISTS `glossary_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossary_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary_categories`
--

LOCK TABLES `glossary_categories` WRITE;
/*!40000 ALTER TABLE `glossary_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary_entries`
--

DROP TABLE IF EXISTS `glossary_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossary_entries` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `concept` varchar(255) NOT NULL DEFAULT '',
  `definition` text NOT NULL,
  `definitionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `approved` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `glosentr_use_ix` (`userid`),
  KEY `glosentr_con_ix` (`concept`),
  KEY `glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary_entries`
--

LOCK TABLES `glossary_entries` WRITE;
/*!40000 ALTER TABLE `glossary_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary_entries_categories`
--

DROP TABLE IF EXISTS `glossary_entries_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossary_entries_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `entryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `glosentrcate_cat_ix` (`categoryid`),
  KEY `glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary_entries_categories`
--

LOCK TABLES `glossary_entries_categories` WRITE;
/*!40000 ALTER TABLE `glossary_entries_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary_entries_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary_formats`
--

DROP TABLE IF EXISTS `glossary_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossary_formats` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `popupformatname` varchar(50) NOT NULL DEFAULT '',
  `visible` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) NOT NULL DEFAULT '',
  `defaulthook` varchar(50) NOT NULL DEFAULT '',
  `sortkey` varchar(50) NOT NULL DEFAULT '',
  `sortorder` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary_formats`
--

LOCK TABLES `glossary_formats` WRITE;
/*!40000 ALTER TABLE `glossary_formats` DISABLE KEYS */;
INSERT INTO `glossary_formats` VALUES (1,'continuous','continuous',1,1,'','','',''),(2,'dictionary','dictionary',1,1,'','','',''),(3,'encyclopedia','encyclopedia',1,1,'','','',''),(4,'entrylist','entrylist',1,1,'','','',''),(5,'faq','faq',1,1,'','','',''),(6,'fullwithauthor','fullwithauthor',1,1,'','','',''),(7,'fullwithoutauthor','fullwithoutauthor',1,1,'','','','');
/*!40000 ALTER TABLE `glossary_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_categories`
--

DROP TABLE IF EXISTS `grade_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `parent` bigint(10) unsigned DEFAULT NULL,
  `depth` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gradcate_cou_ix` (`courseid`),
  KEY `gradcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='This table keeps information about categories, used for grou';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_categories`
--

LOCK TABLES `grade_categories` WRITE;
/*!40000 ALTER TABLE `grade_categories` DISABLE KEYS */;
INSERT INTO `grade_categories` VALUES (1,6,NULL,1,'/1/','?',11,0,0,1,0,0,1355851824,1355851824,0);
/*!40000 ALTER TABLE `grade_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_categories_history`
--

DROP TABLE IF EXISTS `grade_categories_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_categories_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned NOT NULL,
  `parent` bigint(10) unsigned DEFAULT NULL,
  `depth` bigint(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gradcatehist_act_ix` (`action`),
  KEY `gradcatehist_old_ix` (`oldid`),
  KEY `gradcatehist_cou_ix` (`courseid`),
  KEY `gradcatehist_par_ix` (`parent`),
  KEY `gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='History of grade_categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_categories_history`
--

LOCK TABLES `grade_categories_history` WRITE;
/*!40000 ALTER TABLE `grade_categories_history` DISABLE KEYS */;
INSERT INTO `grade_categories_history` VALUES (1,1,1,'system',1355851824,2,6,NULL,0,NULL,'?',11,0,0,1,0,0),(2,2,1,'system',1355851824,2,6,NULL,1,'/1/','?',11,0,0,1,0,0);
/*!40000 ALTER TABLE `grade_categories_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_grades`
--

DROP TABLE IF EXISTS `grade_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) unsigned DEFAULT NULL,
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locked` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `exported` bigint(10) unsigned NOT NULL DEFAULT '0',
  `overridden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `excluded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` mediumtext,
  `feedbackformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  `information` mediumtext,
  `informationformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `gradgrad_ite_ix` (`itemid`),
  KEY `gradgrad_use_ix` (`userid`),
  KEY `gradgrad_raw_ix` (`rawscaleid`),
  KEY `gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grade_grades  This table keeps individual grades for each us';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_grades`
--

LOCK TABLES `grade_grades` WRITE;
/*!40000 ALTER TABLE `grade_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_grades_history`
--

DROP TABLE IF EXISTS `grade_grades_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_grades_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `itemid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) unsigned DEFAULT NULL,
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locked` bigint(10) unsigned NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `exported` bigint(10) unsigned NOT NULL DEFAULT '0',
  `overridden` bigint(10) unsigned NOT NULL DEFAULT '0',
  `excluded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` mediumtext,
  `feedbackformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  `information` mediumtext,
  `informationformat` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gradgradhist_act_ix` (`action`),
  KEY `gradgradhist_old_ix` (`oldid`),
  KEY `gradgradhist_ite_ix` (`itemid`),
  KEY `gradgradhist_use_ix` (`userid`),
  KEY `gradgradhist_raw_ix` (`rawscaleid`),
  KEY `gradgradhist_use2_ix` (`usermodified`),
  KEY `gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_grades_history`
--

LOCK TABLES `grade_grades_history` WRITE;
/*!40000 ALTER TABLE `grade_grades_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_grades_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_import_newitem`
--

DROP TABLE IF EXISTS `grade_import_newitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_import_newitem` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) NOT NULL DEFAULT '',
  `importcode` bigint(10) unsigned NOT NULL,
  `importer` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='temporary table for storing new grade_item names from grade ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_import_newitem`
--

LOCK TABLES `grade_import_newitem` WRITE;
/*!40000 ALTER TABLE `grade_import_newitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_import_newitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_import_values`
--

DROP TABLE IF EXISTS `grade_import_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_import_values` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) unsigned DEFAULT NULL,
  `newgradeitem` bigint(10) unsigned DEFAULT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` mediumtext,
  `importcode` bigint(10) unsigned NOT NULL,
  `importer` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gradimpovalu_ite_ix` (`itemid`),
  KEY `gradimpovalu_new_ix` (`newgradeitem`),
  KEY `gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary table for importing grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_import_values`
--

LOCK TABLES `grade_import_values` WRITE;
/*!40000 ALTER TABLE `grade_import_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_import_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_items`
--

DROP TABLE IF EXISTS `grade_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_items` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `categoryid` bigint(10) unsigned DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) unsigned DEFAULT NULL,
  `itemnumber` bigint(10) unsigned DEFAULT NULL,
  `iteminfo` mediumtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` mediumtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `outcomeid` bigint(10) unsigned DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) unsigned DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `graditem_locloc_ix` (`locked`,`locktime`),
  KEY `graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `graditem_gra_ix` (`gradetype`),
  KEY `graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `graditem_cou_ix` (`courseid`),
  KEY `graditem_cat_ix` (`categoryid`),
  KEY `graditem_sca_ix` (`scaleid`),
  KEY `graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='This table keeps information about gradeable items (ie colum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_items`
--

LOCK TABLES `grade_items` WRITE;
/*!40000 ALTER TABLE `grade_items` DISABLE KEYS */;
INSERT INTO `grade_items` VALUES (1,6,NULL,NULL,'course',NULL,1,NULL,NULL,NULL,NULL,1,'100.00000','0.00000',NULL,NULL,'0.00000','1.00000','0.00000','0.00000',1,0,NULL,0,0,0,0,1355851824,1355851824);
/*!40000 ALTER TABLE `grade_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_items_history`
--

DROP TABLE IF EXISTS `grade_items_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_items_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `categoryid` bigint(10) unsigned DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) unsigned DEFAULT NULL,
  `itemnumber` bigint(10) unsigned DEFAULT NULL,
  `iteminfo` mediumtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` mediumtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `outcomeid` bigint(10) unsigned DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `graditemhist_act_ix` (`action`),
  KEY `graditemhist_old_ix` (`oldid`),
  KEY `graditemhist_cou_ix` (`courseid`),
  KEY `graditemhist_cat_ix` (`categoryid`),
  KEY `graditemhist_sca_ix` (`scaleid`),
  KEY `graditemhist_out_ix` (`outcomeid`),
  KEY `graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='History of grade_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_items_history`
--

LOCK TABLES `grade_items_history` WRITE;
/*!40000 ALTER TABLE `grade_items_history` DISABLE KEYS */;
INSERT INTO `grade_items_history` VALUES (1,1,1,'system',1355851824,2,6,NULL,NULL,'course',NULL,1,NULL,NULL,NULL,NULL,1,'100.00000','0.00000',NULL,NULL,'0.00000','1.00000','0.00000','0.00000',1,0,0,0,1);
/*!40000 ALTER TABLE `grade_items_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_letters`
--

DROP TABLE IF EXISTS `grade_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_letters` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Repository for grade letters, for courses and other moodle e';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_letters`
--

LOCK TABLES `grade_letters` WRITE;
/*!40000 ALTER TABLE `grade_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_outcomes`
--

DROP TABLE IF EXISTS `grade_outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_outcomes` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` text NOT NULL,
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `gradoutc_cou_ix` (`courseid`),
  KEY `gradoutc_sca_ix` (`scaleid`),
  KEY `gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table describes the outcomes used in the system. An out';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_outcomes`
--

LOCK TABLES `grade_outcomes` WRITE;
/*!40000 ALTER TABLE `grade_outcomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_outcomes_courses`
--

DROP TABLE IF EXISTS `grade_outcomes_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_outcomes_courses` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `outcomeid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `gradoutccour_cou_ix` (`courseid`),
  KEY `gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores what outcomes are used in what courses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_outcomes_courses`
--

LOCK TABLES `grade_outcomes_courses` WRITE;
/*!40000 ALTER TABLE `grade_outcomes_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_outcomes_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_outcomes_history`
--

DROP TABLE IF EXISTS `grade_outcomes_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_outcomes_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` text NOT NULL,
  `scaleid` bigint(10) unsigned DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `gradoutchist_act_ix` (`action`),
  KEY `gradoutchist_old_ix` (`oldid`),
  KEY `gradoutchist_cou_ix` (`courseid`),
  KEY `gradoutchist_sca_ix` (`scaleid`),
  KEY `gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_outcomes_history`
--

LOCK TABLES `grade_outcomes_history` WRITE;
/*!40000 ALTER TABLE `grade_outcomes_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_outcomes_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_settings`
--

DROP TABLE IF EXISTS `grade_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_settings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gradsett_counam_uix` (`courseid`,`name`),
  KEY `gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gradebook settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_settings`
--

LOCK TABLES `grade_settings` WRITE;
/*!40000 ALTER TABLE `grade_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupings`
--

DROP TABLE IF EXISTS `groupings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `configdata` text,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups. WAS: groups_groupings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupings`
--

LOCK TABLES `groupings` WRITE;
/*!40000 ALTER TABLE `groupings` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupings_groups`
--

DROP TABLE IF EXISTS `groupings_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupings_groups` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeadded` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `grougrou_gro_ix` (`groupingid`),
  KEY `grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a group (note, groups can be in multiple ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupings_groups`
--

LOCK TABLES `groupings_groups` WRITE;
/*!40000 ALTER TABLE `groupings_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupings_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) DEFAULT NULL,
  `picture` bigint(10) unsigned NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_members`
--

DROP TABLE IF EXISTS `groups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_members` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeadded` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `groumemb_gro_ix` (`groupid`),
  KEY `groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_members`
--

LOCK TABLES `groups_members` WRITE;
/*!40000 ALTER TABLE `groups_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imscp`
--

DROP TABLE IF EXISTS `imscp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imscp` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` mediumtext,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one imscp resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imscp`
--

LOCK TABLES `imscp` WRITE;
/*!40000 ALTER TABLE `imscp` DISABLE KEYS */;
/*!40000 ALTER TABLE `imscp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines labels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
/*!40000 ALTER TABLE `label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `practice` smallint(3) unsigned NOT NULL DEFAULT '0',
  `modattempts` smallint(3) unsigned NOT NULL DEFAULT '0',
  `usepassword` smallint(3) unsigned NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `dependency` bigint(10) unsigned NOT NULL DEFAULT '0',
  `conditions` text NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) unsigned NOT NULL DEFAULT '0',
  `ongoing` smallint(3) unsigned NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) unsigned NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) unsigned NOT NULL DEFAULT '5',
  `review` smallint(3) unsigned NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) unsigned NOT NULL DEFAULT '0',
  `feedback` smallint(3) unsigned NOT NULL DEFAULT '1',
  `minquestions` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxpages` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timed` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `retake` smallint(3) unsigned NOT NULL DEFAULT '1',
  `activitylink` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mediafile` varchar(255) NOT NULL DEFAULT '',
  `mediaheight` bigint(10) unsigned NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) unsigned NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) unsigned NOT NULL DEFAULT '0',
  `slideshow` smallint(3) unsigned NOT NULL DEFAULT '0',
  `width` bigint(10) unsigned NOT NULL DEFAULT '640',
  `height` bigint(10) unsigned NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) unsigned NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) unsigned NOT NULL DEFAULT '0',
  `progressbar` smallint(3) unsigned NOT NULL DEFAULT '0',
  `highscores` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) unsigned NOT NULL DEFAULT '0',
  `available` bigint(10) unsigned NOT NULL DEFAULT '0',
  `deadline` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_answers`
--

DROP TABLE IF EXISTS `lesson_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` text,
  `answerformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `response` text,
  `responseformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lessansw_les_ix` (`lessonid`),
  KEY `lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_answers`
--

LOCK TABLES `lesson_answers` WRITE;
/*!40000 ALTER TABLE `lesson_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_attempts`
--

DROP TABLE IF EXISTS `lesson_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_attempts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answerid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `retry` smallint(3) unsigned NOT NULL DEFAULT '0',
  `correct` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useranswer` text,
  `timeseen` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lessatte_use_ix` (`userid`),
  KEY `lessatte_les_ix` (`lessonid`),
  KEY `lessatte_pag_ix` (`pageid`),
  KEY `lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_attempts`
--

LOCK TABLES `lesson_attempts` WRITE;
/*!40000 ALTER TABLE `lesson_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_branch`
--

DROP TABLE IF EXISTS `lesson_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_branch` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `retry` bigint(10) unsigned NOT NULL DEFAULT '0',
  `flag` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timeseen` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lessbran_use_ix` (`userid`),
  KEY `lessbran_les_ix` (`lessonid`),
  KEY `lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_branch`
--

LOCK TABLES `lesson_branch` WRITE;
/*!40000 ALTER TABLE `lesson_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_grades`
--

DROP TABLE IF EXISTS `lesson_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` double unsigned NOT NULL DEFAULT '0',
  `late` smallint(3) unsigned NOT NULL DEFAULT '0',
  `completed` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lessgrad_use_ix` (`userid`),
  KEY `lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_grades`
--

LOCK TABLES `lesson_grades` WRITE;
/*!40000 ALTER TABLE `lesson_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_high_scores`
--

DROP TABLE IF EXISTS `lesson_high_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_high_scores` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `gradeid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `lesshighscor_use_ix` (`userid`),
  KEY `lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='high scores for each lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_high_scores`
--

LOCK TABLES `lesson_high_scores` WRITE;
/*!40000 ALTER TABLE `lesson_high_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_high_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_pages`
--

DROP TABLE IF EXISTS `lesson_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `qtype` smallint(3) unsigned NOT NULL DEFAULT '0',
  `qoption` smallint(3) unsigned NOT NULL DEFAULT '0',
  `layout` smallint(3) unsigned NOT NULL DEFAULT '1',
  `display` smallint(3) unsigned NOT NULL DEFAULT '1',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` text NOT NULL,
  `contentsformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_pages`
--

LOCK TABLES `lesson_pages` WRITE;
/*!40000 ALTER TABLE `lesson_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_timer`
--

DROP TABLE IF EXISTS `lesson_timer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_timer` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `starttime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lessontime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lesstime_use_ix` (`userid`),
  KEY `lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_timer`
--

LOCK TABLES `lesson_timer` WRITE;
/*!40000 ALTER TABLE `lesson_timer` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_timer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) DEFAULT NULL,
  `fullname` text,
  `source` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='store licenses used by moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` VALUES (1,'unknown','Unknown license','',1,2010033100),(2,'allrightsreserved','All rights reserved','http://en.wikipedia.org/wiki/All_rights_reserved',1,2010033100),(3,'public','Public Domain','http://creativecommons.org/licenses/publicdomain/',1,2010033100),(4,'cc','Creative Commons','http://creativecommons.org/licenses/by/3.0/',1,2010033100),(5,'cc-nd','Creative Commons - NoDerivs','http://creativecommons.org/licenses/by-nd/3.0/',1,2010033100),(6,'cc-nc-nd','Creative Commons - No Commercial NoDerivs','http://creativecommons.org/licenses/by-nc-nd/3.0/',1,2010033100),(7,'cc-nc','Creative Commons - No Commercial','http://creativecommons.org/licenses/by-nd/3.0/',1,2010033100),(8,'cc-nc-sa','Creative Commons - No Commercial ShareAlike','http://creativecommons.org/licenses/by-nc-sa/3.0/',1,2010033100),(9,'cc-sa','Creative Commons - ShareAlike','http://creativecommons.org/licenses/by-sa/3.0/',1,2010033100);
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `log_coumodact_ix` (`course`,`module`,`action`),
  KEY `log_tim_ix` (`time`),
  KEY `log_act_ix` (`action`),
  KEY `log_usecou_ix` (`userid`,`course`),
  KEY `log_cmi_ix` (`cmid`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,1352398971,2,'172.20.241.55',1,'user',0,'login','view.php?id=0&course=1','2'),(2,1352399068,2,'172.20.241.55',1,'user',0,'update','view.php?id=2&course=1',''),(3,1352399087,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(4,1352399170,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(5,1354820794,2,'172.20.241.55',1,'user',0,'login','view.php?id=0&course=1','2'),(6,1354820796,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(7,1354820819,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(8,1354820819,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(9,1354820820,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(10,1354824232,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(11,1354824242,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(12,1354827403,2,'172.20.241.55',1,'course',0,'new','view.php?id=2','Orientation to IT Professions (ID 2)'),(13,1354828190,2,'172.20.241.55',1,'user',0,'update','view.php?id=-1&course=1',''),(14,1354829254,2,'172.20.241.55',1,'user',0,'update','view.php?id=-1&course=1',''),(15,1354829337,2,'172.20.241.55',1,'user',0,'update','view.php?id=-1&course=1',''),(16,1354829448,2,'172.20.241.55',1,'user',0,'update','view.php?id=-1&course=1',''),(17,1354829529,2,'172.20.241.55',1,'user',0,'update','view.php?id=-1&course=1',''),(18,1354829674,2,'172.20.241.55',1,'user',0,'update','view.php?id=-1&course=1',''),(19,1354829803,2,'172.20.241.55',1,'user',0,'update','view.php?id=-1&course=1',''),(20,1354830312,2,'172.20.241.55',1,'course',0,'new','view.php?id=3','LAN103 Cybersafety (ID 3)'),(21,1354830514,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(22,1354830647,2,'172.20.241.55',1,'course',0,'new','view.php?id=4','ART-101  Digital Photo (ID 4)'),(23,1354833492,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(24,1354834133,2,'172.20.241.55',1,'course',0,'new','view.php?id=5','LAN-104 Firewall (ID 5)'),(25,1355265439,2,'172.20.241.55',1,'user',0,'login','view.php?id=0&course=1','2'),(26,1355265440,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(27,1355265462,2,'172.20.241.55',5,'course',0,'view','view.php?id=5','5'),(28,1355265482,2,'172.20.241.55',5,'course',0,'view','view.php?id=5','5'),(29,1355265492,2,'172.20.241.55',5,'course',0,'view','view.php?id=5','5'),(30,1355265508,2,'172.20.241.55',5,'course',0,'view','view.php?id=5','5'),(31,1355265510,2,'172.20.241.55',5,'course',0,'view','view.php?id=5','5'),(32,1355265597,2,'172.20.241.55',5,'course',0,'update','edit.php?id=5','5'),(33,1355265597,2,'172.20.241.55',5,'course',0,'view','view.php?id=5','5'),(34,1355850597,0,'172.20.241.55',1,'login',0,'error','index.php','admin'),(35,1355850602,0,'172.20.241.55',1,'login',0,'error','index.php','admin'),(36,1355850605,0,'172.20.241.55',1,'login',0,'error','index.php','admin'),(37,1355850609,2,'172.20.241.55',1,'user',0,'login','view.php?id=0&course=1','2'),(38,1355850610,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(39,1355850643,2,'172.20.241.55',3,'course',0,'view','view.php?id=3','3'),(40,1355850670,2,'172.20.241.55',3,'course',0,'view','view.php?id=3','3'),(41,1355850673,2,'172.20.241.55',3,'course',0,'view','view.php?id=3','3'),(42,1355850688,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(43,1355850941,2,'172.20.241.55',1,'course',0,'new','view.php?id=6','Computer Security- Best Practices (ID 6)'),(44,1355850994,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(45,1355851016,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(46,1355851016,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(47,1355851028,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(48,1355851029,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(49,1355851824,2,'172.20.241.55',6,'course',0,'add mod','../mod/resource/view.php?id=4','resource 1'),(50,1355851824,2,'172.20.241.55',6,'resource',4,'add','view.php?id=4','1'),(51,1355851825,2,'172.20.241.55',6,'resource',4,'view','view.php?id=4','1'),(52,1355851888,2,'172.20.241.55',6,'course',0,'update mod','../mod/resource/view.php?id=4','resource 1'),(53,1355851888,2,'172.20.241.55',6,'resource',4,'update','view.php?id=4','1'),(54,1355851889,2,'172.20.241.55',6,'resource',4,'view','view.php?id=4','1'),(55,1355852038,2,'172.20.241.55',6,'course',0,'update mod','../mod/resource/view.php?id=4','resource 1'),(56,1355852038,2,'172.20.241.55',6,'resource',4,'update','view.php?id=4','1'),(57,1355852040,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(58,1355852052,2,'172.20.241.55',6,'resource',4,'view','view.php?id=4','1'),(59,1355852058,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(60,1355852168,2,'172.20.241.55',6,'course',0,'add mod','../mod/resource/view.php?id=5','resource 2'),(61,1355852168,2,'172.20.241.55',6,'resource',5,'add','view.php?id=5','2'),(62,1355852170,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(63,1355852175,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(64,1355852176,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(65,1355852180,2,'172.20.241.55',6,'resource',5,'view','view.php?id=5','2'),(66,1355852196,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(67,1355852201,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(68,1355852202,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(69,1355852364,2,'172.20.241.55',6,'course',0,'add mod','../mod/resource/view.php?id=6','resource 3'),(70,1355852364,2,'172.20.241.55',6,'resource',6,'add','view.php?id=6','3'),(71,1355852365,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(72,1355852537,2,'172.20.241.55',6,'course',0,'add mod','../mod/resource/view.php?id=7','resource 4'),(73,1355852537,2,'172.20.241.55',6,'resource',7,'add','view.php?id=7','4'),(74,1355852540,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(75,1355852761,2,'172.20.241.55',6,'course',0,'add mod','../mod/resource/view.php?id=8','resource 5'),(76,1355852761,2,'172.20.241.55',6,'resource',8,'add','view.php?id=8','5'),(77,1355852763,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(78,1355853037,2,'172.20.241.55',6,'course',0,'add mod','../mod/resource/view.php?id=9','resource 6'),(79,1355853037,2,'172.20.241.55',6,'resource',9,'add','view.php?id=9','6'),(80,1355853038,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(81,1355853043,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(82,1355853044,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(83,1355853048,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(84,1355853061,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(85,1355853065,2,'172.20.241.55',6,'resource',4,'view','view.php?id=4','1'),(86,1355853075,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(87,1355853078,2,'172.20.241.55',6,'resource',5,'view','view.php?id=5','2'),(88,1355853087,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(89,1355853091,2,'172.20.241.55',6,'resource',6,'view','view.php?id=6','3'),(90,1355853111,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(91,1355853119,2,'172.20.241.55',6,'resource',6,'view','view.php?id=6','3'),(92,1355853174,2,'172.20.241.55',6,'course',0,'update mod','../mod/resource/view.php?id=6','resource 3'),(93,1355853174,2,'172.20.241.55',6,'resource',6,'update','view.php?id=6','3'),(94,1355853176,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(95,1355853239,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(96,1355853245,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(97,1355853246,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(98,1355853268,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(99,1355853276,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(100,1355853419,2,'172.20.241.55',6,'course',0,'update','edit.php?id=6','6'),(101,1355853465,2,'172.20.241.55',6,'course',0,'update','edit.php?id=6','6'),(102,1355853476,2,'172.20.241.55',5,'course',0,'view','view.php?id=5','5'),(103,1355853484,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(104,1355853499,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(105,1355853529,2,'172.20.241.55',6,'course',0,'view','view.php?id=6','6'),(106,1355853569,2,'172.20.241.55',6,'course',0,'update','edit.php?id=6','6'),(107,1355853598,2,'172.20.241.55',1,'course',0,'view','view.php?id=1','1'),(108,1355853623,2,'172.20.241.55',1,'user',0,'logout','view.php?id=2&course=1','2'),(109,1358078894,2,'172.20.241.200',1,'user',0,'login','view.php?id=0&course=1','2'),(110,1358078896,2,'172.20.241.200',1,'course',0,'view','view.php?id=1','1'),(111,1358079624,2,'172.20.241.200',1,'user',0,'change password','view.php?id=2&course=1','2'),(112,1358079633,2,'172.20.241.200',1,'user',0,'logout','view.php?id=2&course=1','2'),(113,1358079644,2,'172.20.241.200',1,'user',0,'login','view.php?id=0&course=1','2'),(114,1358079693,2,'172.20.241.200',1,'user',0,'change password','view.php?id=2&course=1','2'),(115,1358079703,2,'172.20.241.200',1,'user',0,'logout','view.php?id=2&course=1','2'),(116,1358079713,2,'172.20.241.200',1,'user',0,'login','view.php?id=0&course=1','2'),(117,1358079714,2,'172.20.241.200',1,'course',0,'view','view.php?id=1','1'),(118,1358079778,2,'172.20.241.200',1,'user',0,'change password','view.php?id=2&course=1','2'),(119,1358079787,2,'172.20.241.200',1,'user',0,'logout','view.php?id=2&course=1','2'),(120,1358079797,2,'172.20.241.200',1,'user',0,'login','view.php?id=0&course=1','2'),(121,1358079820,2,'172.20.241.200',1,'user',0,'change password','view.php?id=2&course=1','2'),(122,1358079856,2,'172.20.241.200',1,'user',0,'logout','view.php?id=2&course=1','2'),(123,1358079868,2,'172.20.241.200',1,'user',0,'login','view.php?id=0&course=1','2'),(124,1358079869,2,'172.20.241.200',1,'course',0,'view','view.php?id=1','1'),(125,1358079947,2,'172.20.241.200',1,'user',0,'change password','view.php?id=2&course=1','2'),(126,1358079996,2,'172.20.241.200',1,'user',0,'logout','view.php?id=2&course=1','2'),(127,1358080012,2,'172.20.241.200',1,'user',0,'login','view.php?id=0&course=1','2'),(128,1358080013,2,'172.20.241.200',1,'course',0,'view','view.php?id=1','1'),(129,1358080075,2,'172.20.241.200',1,'user',0,'logout','view.php?id=2&course=1','2'),(130,1358080086,0,'172.20.241.200',1,'login',0,'error','index.php','admin'),(131,1358080095,2,'172.20.241.200',1,'user',0,'login','view.php?id=0&course=1','2'),(132,1358080097,2,'172.20.241.200',1,'course',0,'view','view.php?id=1','1'),(133,1358080140,2,'172.20.241.200',1,'user',0,'change password','view.php?id=2&course=1','2'),(134,1358080460,2,'172.20.241.200',1,'user',0,'logout','view.php?id=2&course=1','2'),(135,1358080475,2,'172.20.241.200',1,'user',0,'login','view.php?id=0&course=1','2'),(136,1358080508,2,'172.20.241.200',1,'user',0,'change password','view.php?id=2&course=1','2'),(137,1358080862,2,'172.20.241.200',1,'user',0,'logout','view.php?id=2&course=1','2'),(138,1358080872,2,'172.20.241.200',1,'user',0,'login','view.php?id=0&course=1','2'),(139,1358080874,2,'172.20.241.200',1,'course',0,'view','view.php?id=1','1'),(140,1358081013,2,'172.20.241.200',1,'user',0,'change password','view.php?id=2&course=1','2'),(141,1358081116,2,'172.20.241.200',1,'user',0,'logout','view.php?id=2&course=1','2'),(142,1358081503,0,'172.20.241.200',1,'login',0,'error','index.php','admin'),(143,1358081510,2,'172.20.241.200',1,'user',0,'login','view.php?id=0&course=1','2'),(144,1358081546,2,'172.20.241.200',1,'user',0,'change password','view.php?id=2&course=1','2'),(145,1358081899,2,'172.20.241.200',1,'user',0,'logout','view.php?id=2&course=1','2'),(146,1358081929,2,'172.20.241.200',1,'user',0,'login','view.php?id=0&course=1','2'),(147,1358081932,2,'172.20.241.200',1,'course',0,'view','view.php?id=1','1'),(148,1360798281,0,'172.31.35.3',1,'login',0,'error','index.php','admin'),(149,1360798284,0,'172.31.35.3',1,'login',0,'error','index.php','guest'),(150,1360798293,0,'172.31.35.3',1,'login',0,'error','index.php','guest'),(151,1360798297,0,'172.31.35.3',1,'login',0,'error','index.php','guest'),(152,1360798310,0,'172.31.35.3',1,'login',0,'error','index.php','administrator'),(153,1360798338,0,'172.31.35.3',1,'login',0,'error','index.php','guest');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_display`
--

DROP TABLE IF EXISTS `log_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_display` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `mtable` varchar(30) NOT NULL DEFAULT '',
  `field` varchar(200) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_display`
--

LOCK TABLES `log_display` WRITE;
/*!40000 ALTER TABLE `log_display` DISABLE KEYS */;
INSERT INTO `log_display` VALUES (1,'user','view','user','CONCAT(firstname, \' \', lastname)','moodle'),(2,'course','user report','user','CONCAT(firstname, \' \', lastname)','moodle'),(3,'course','view','course','fullname','moodle'),(4,'course','update','course','fullname','moodle'),(5,'course','enrol','course','fullname','moodle'),(6,'course','unenrol','course','fullname','moodle'),(7,'course','report log','course','fullname','moodle'),(8,'course','report live','course','fullname','moodle'),(9,'course','report outline','course','fullname','moodle'),(10,'course','report participation','course','fullname','moodle'),(11,'course','report stats','course','fullname','moodle'),(12,'message','write','user','CONCAT(firstname, \' \', lastname)','moodle'),(13,'message','read','user','CONCAT(firstname, \' \', lastname)','moodle'),(14,'message','add contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(15,'message','remove contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(16,'message','block contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(17,'message','unblock contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(18,'group','view','groups','name','moodle'),(19,'tag','update','tag','name','moodle'),(20,'assignment','view','assignment','name','mod_assignment'),(21,'assignment','add','assignment','name','mod_assignment'),(22,'assignment','update','assignment','name','mod_assignment'),(23,'assignment','view submission','assignment','name','mod_assignment'),(24,'assignment','upload','assignment','name','mod_assignment'),(25,'chat','view','chat','name','mod_chat'),(26,'chat','add','chat','name','mod_chat'),(27,'chat','update','chat','name','mod_chat'),(28,'chat','report','chat','name','mod_chat'),(29,'chat','talk','chat','name','mod_chat'),(30,'choice','view','choice','name','mod_choice'),(31,'choice','update','choice','name','mod_choice'),(32,'choice','add','choice','name','mod_choice'),(33,'choice','report','choice','name','mod_choice'),(34,'choice','choose','choice','name','mod_choice'),(35,'choice','choose again','choice','name','mod_choice'),(36,'data','view','data','name','mod_data'),(37,'data','add','data','name','mod_data'),(38,'data','update','data','name','mod_data'),(39,'data','record delete','data','name','mod_data'),(40,'data','fields add','data_fields','name','mod_data'),(41,'data','fields update','data_fields','name','mod_data'),(42,'data','templates saved','data','name','mod_data'),(43,'data','templates def','data','name','mod_data'),(44,'feedback','startcomplete','feedback','name','mod_feedback'),(45,'feedback','submit','feedback','name','mod_feedback'),(46,'feedback','delete','feedback','name','mod_feedback'),(47,'feedback','view','feedback','name','mod_feedback'),(48,'feedback','view all','course','shortname','mod_feedback'),(49,'folder','view','folder','name','mod_folder'),(50,'folder','view all','folder','name','mod_folder'),(51,'folder','update','folder','name','mod_folder'),(52,'folder','add','folder','name','mod_folder'),(53,'forum','add','forum','name','mod_forum'),(54,'forum','update','forum','name','mod_forum'),(55,'forum','add discussion','forum_discussions','name','mod_forum'),(56,'forum','add post','forum_posts','subject','mod_forum'),(57,'forum','update post','forum_posts','subject','mod_forum'),(58,'forum','user report','user','CONCAT(firstname, \' \', lastname)','mod_forum'),(59,'forum','move discussion','forum_discussions','name','mod_forum'),(60,'forum','view subscribers','forum','name','mod_forum'),(61,'forum','view discussion','forum_discussions','name','mod_forum'),(62,'forum','view forum','forum','name','mod_forum'),(63,'forum','subscribe','forum','name','mod_forum'),(64,'forum','unsubscribe','forum','name','mod_forum'),(65,'glossary','add','glossary','name','mod_glossary'),(66,'glossary','update','glossary','name','mod_glossary'),(67,'glossary','view','glossary','name','mod_glossary'),(68,'glossary','view all','glossary','name','mod_glossary'),(69,'glossary','add entry','glossary','name','mod_glossary'),(70,'glossary','update entry','glossary','name','mod_glossary'),(71,'glossary','add category','glossary','name','mod_glossary'),(72,'glossary','update category','glossary','name','mod_glossary'),(73,'glossary','delete category','glossary','name','mod_glossary'),(74,'glossary','approve entry','glossary','name','mod_glossary'),(75,'glossary','view entry','glossary_entries','concept','mod_glossary'),(76,'imscp','view','imscp','name','mod_imscp'),(77,'imscp','view all','imscp','name','mod_imscp'),(78,'imscp','update','imscp','name','mod_imscp'),(79,'imscp','add','imscp','name','mod_imscp'),(80,'label','add','label','name','mod_label'),(81,'label','update','label','name','mod_label'),(82,'lesson','start','lesson','name','mod_lesson'),(83,'lesson','end','lesson','name','mod_lesson'),(84,'lesson','view','lesson_pages','title','mod_lesson'),(85,'page','view','page','name','mod_page'),(86,'page','view all','page','name','mod_page'),(87,'page','update','page','name','mod_page'),(88,'page','add','page','name','mod_page'),(89,'quiz','add','quiz','name','mod_quiz'),(90,'quiz','update','quiz','name','mod_quiz'),(91,'quiz','view','quiz','name','mod_quiz'),(92,'quiz','report','quiz','name','mod_quiz'),(93,'quiz','attempt','quiz','name','mod_quiz'),(94,'quiz','submit','quiz','name','mod_quiz'),(95,'quiz','review','quiz','name','mod_quiz'),(96,'quiz','editquestions','quiz','name','mod_quiz'),(97,'quiz','preview','quiz','name','mod_quiz'),(98,'quiz','start attempt','quiz','name','mod_quiz'),(99,'quiz','close attempt','quiz','name','mod_quiz'),(100,'quiz','continue attempt','quiz','name','mod_quiz'),(101,'quiz','edit override','quiz','name','mod_quiz'),(102,'quiz','delete override','quiz','name','mod_quiz'),(103,'resource','view','resource','name','mod_resource'),(104,'resource','view all','resource','name','mod_resource'),(105,'resource','update','resource','name','mod_resource'),(106,'resource','add','resource','name','mod_resource'),(107,'scorm','view','scorm','name','mod_scorm'),(108,'scorm','review','scorm','name','mod_scorm'),(109,'scorm','update','scorm','name','mod_scorm'),(110,'scorm','add','scorm','name','mod_scorm'),(111,'survey','add','survey','name','mod_survey'),(112,'survey','update','survey','name','mod_survey'),(113,'survey','download','survey','name','mod_survey'),(114,'survey','view form','survey','name','mod_survey'),(115,'survey','view graph','survey','name','mod_survey'),(116,'survey','view report','survey','name','mod_survey'),(117,'survey','submit','survey','name','mod_survey'),(118,'url','view','url','name','mod_url'),(119,'url','view all','url','name','mod_url'),(120,'url','update','url','name','mod_url'),(121,'url','add','url','name','mod_url'),(122,'workshop','add','workshop','name','mod_workshop'),(123,'workshop','update','workshop','name','mod_workshop'),(124,'workshop','view','workshop','name','mod_workshop'),(125,'workshop','view all','workshop','name','mod_workshop'),(126,'workshop','add submission','workshop_submissions','title','mod_workshop'),(127,'workshop','update submission','workshop_submissions','title','mod_workshop'),(128,'workshop','view submission','workshop_submissions','title','mod_workshop'),(129,'workshop','add assessment','workshop_submissions','title','mod_workshop'),(130,'workshop','update assessment','workshop_submissions','title','mod_workshop'),(131,'workshop','add example','workshop_submissions','title','mod_workshop'),(132,'workshop','update example','workshop_submissions','title','mod_workshop'),(133,'workshop','view example','workshop_submissions','title','mod_workshop'),(134,'workshop','add reference assessment','workshop_submissions','title','mod_workshop'),(135,'workshop','update reference assessment','workshop_submissions','title','mod_workshop'),(136,'workshop','add example assessment','workshop_submissions','title','mod_workshop'),(137,'workshop','update example assessment','workshop_submissions','title','mod_workshop'),(138,'workshop','update aggregate grades','workshop','name','mod_workshop'),(139,'workshop','update clear aggregated grades','workshop','name','mod_workshop'),(140,'workshop','update clear assessments','workshop','name','mod_workshop');
/*!40000 ALTER TABLE `log_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_queries`
--

DROP TABLE IF EXISTS `log_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_queries` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) unsigned NOT NULL,
  `sqltext` mediumtext NOT NULL,
  `sqlparams` longtext,
  `error` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `info` text,
  `backtrace` text,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Logged database queries.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_queries`
--

LOCK TABLES `log_queries` WRITE;
/*!40000 ALTER TABLE `log_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` text,
  `fullmessage` text,
  `fullmessageformat` smallint(4) unsigned DEFAULT '0',
  `fullmessagehtml` mediumtext,
  `smallmessage` text,
  `notification` tinyint(1) unsigned DEFAULT '0',
  `contexturl` text,
  `contexturlname` text,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mess_use_ix` (`useridfrom`),
  KEY `mess_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_contacts`
--

DROP TABLE IF EXISTS `message_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_contacts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contactid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `blocked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_contacts`
--

LOCK TABLES `message_contacts` WRITE;
/*!40000 ALTER TABLE `message_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_processors`
--

DROP TABLE IF EXISTS `message_processors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='List of message output plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_processors`
--

LOCK TABLES `message_processors` WRITE;
/*!40000 ALTER TABLE `message_processors` DISABLE KEYS */;
INSERT INTO `message_processors` VALUES (1,'email'),(2,'jabber'),(3,'popup');
/*!40000 ALTER TABLE `message_processors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_providers`
--

DROP TABLE IF EXISTS `message_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(200) NOT NULL DEFAULT '',
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='This table stores the message providers (modules and core sy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_providers`
--

LOCK TABLES `message_providers` WRITE;
/*!40000 ALTER TABLE `message_providers` DISABLE KEYS */;
INSERT INTO `message_providers` VALUES (1,'notices','moodle','moodle/site:config'),(2,'errors','moodle','moodle/site:config'),(3,'instantmessage','moodle',NULL),(4,'backup','moodle','moodle/site:config'),(5,'assignment_updates','mod_assignment',NULL),(6,'submission','mod_feedback',NULL),(7,'posts','mod_forum',NULL),(8,'submission','mod_quiz','mod/quiz:emailnotifysubmission'),(9,'confirmation','mod_quiz','mod/quiz:emailconfirmsubmission');
/*!40000 ALTER TABLE `message_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_read`
--

DROP TABLE IF EXISTS `message_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_read` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` text,
  `fullmessage` text,
  `fullmessageformat` smallint(4) unsigned DEFAULT '0',
  `fullmessagehtml` mediumtext,
  `smallmessage` text,
  `notification` tinyint(1) unsigned DEFAULT '0',
  `contexturl` text,
  `contexturlname` text,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messread_use_ix` (`useridfrom`),
  KEY `messread_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_read`
--

LOCK TABLES `message_read` WRITE;
/*!40000 ALTER TABLE `message_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_working`
--

DROP TABLE IF EXISTS `message_working`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) unsigned NOT NULL,
  `processorid` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists all the messages and processors that need to be proces';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_working`
--

LOCK TABLES `message_working` WRITE;
/*!40000 ALTER TABLE `message_working` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_working` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnet_application`
--

DROP TABLE IF EXISTS `mnet_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnet_application` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Information about applications on remote hosts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnet_application`
--

LOCK TABLES `mnet_application` WRITE;
/*!40000 ALTER TABLE `mnet_application` DISABLE KEYS */;
INSERT INTO `mnet_application` VALUES (1,'moodle','Moodle','/mnet/xmlrpc/server.php','/auth/mnet/land.php','/auth/mnet/jump.php'),(2,'mahara','Mahara','/api/xmlrpc/server.php','/auth/xmlrpc/land.php','/auth/xmlrpc/jump.php');
/*!40000 ALTER TABLE `mnet_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnet_host`
--

DROP TABLE IF EXISTS `mnet_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnet_host` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `public_key` mediumtext NOT NULL,
  `public_key_expires` bigint(10) unsigned NOT NULL DEFAULT '0',
  `transport` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `portno` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `applicationid` bigint(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnet_host`
--

LOCK TABLES `mnet_host` WRITE;
/*!40000 ALTER TABLE `mnet_host` DISABLE KEYS */;
INSERT INTO `mnet_host` VALUES (1,0,'http://127.0.0.1','UNKNOWN','','',0,0,0,0,0,0,NULL,1),(2,0,'','','All Hosts','',0,0,0,0,0,0,NULL,1);
/*!40000 ALTER TABLE `mnet_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnet_host2service`
--

DROP TABLE IF EXISTS `mnet_host2service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnet_host2service` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `serviceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `publish` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnet_host2service`
--

LOCK TABLES `mnet_host2service` WRITE;
/*!40000 ALTER TABLE `mnet_host2service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnet_host2service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnet_log`
--

DROP TABLE IF EXISTS `mnet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnet_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `remoteid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `coursename` varchar(40) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnet_log`
--

LOCK TABLES `mnet_log` WRITE;
/*!40000 ALTER TABLE `mnet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnet_remote_rpc`
--

DROP TABLE IF EXISTS `mnet_remote_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnet_remote_rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='This table describes functions that might be called remotely';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnet_remote_rpc`
--

LOCK TABLES `mnet_remote_rpc` WRITE;
/*!40000 ALTER TABLE `mnet_remote_rpc` DISABLE KEYS */;
INSERT INTO `mnet_remote_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1),(15,'send_content_intent','portfolio/mahara/lib.php/send_content_intent','portfolio','mahara',1),(16,'send_content_ready','portfolio/mahara/lib.php/send_content_ready','portfolio','mahara',1);
/*!40000 ALTER TABLE `mnet_remote_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnet_remote_service2rpc`
--

DROP TABLE IF EXISTS `mnet_remote_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnet_remote_service2rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rpcid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnet_remote_service2rpc`
--

LOCK TABLES `mnet_remote_service2rpc` WRITE;
/*!40000 ALTER TABLE `mnet_remote_service2rpc` DISABLE KEYS */;
INSERT INTO `mnet_remote_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15),(16,4,16);
/*!40000 ALTER TABLE `mnet_remote_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnet_rpc`
--

DROP TABLE IF EXISTS `mnet_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnet_rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `help` mediumtext NOT NULL,
  `profile` mediumtext NOT NULL,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(150) DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnet_rpc`
--

LOCK TABLES `mnet_rpc` WRITE;
/*!40000 ALTER TABLE `mnet_rpc` DISABLE KEYS */;
INSERT INTO `mnet_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1,'Return user data for the provided token, compare with user_agent string.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:37:\"The unique ID provided by remotehost.\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:44:\"$userdata Array of user info for remote host\";}}','auth.php','auth_plugin_mnet',0),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1,'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1,'The IdP uses this function to kill child sessions on other hosts','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"A plaintext report of what has happened\";}}','auth.php','auth_plugin_mnet',0),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1,'Receives an array of log entries from an SP and adds them to the mnet_log\ntable','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1,'Returns the user\'s image as a base64 encoded string.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:18:\"The id of the user\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:17:\"The encoded image\";}}','auth.php','auth_plugin_mnet',0),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1,'Returns the theme information and logo url as strings.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:14:\"The theme info\";}}','auth.php','auth_plugin_mnet',0),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1,'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:12:\"The username\";}i:1;a:3:{s:4:\"name\";s:7:\"courses\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1,'Poll the IdP server to let it know that a user it has authenticated is still\nonline','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1,'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:15:\"True on success\";}}','auth.php','auth_plugin_mnet',0),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1,'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for \'All hosts\', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1,'This method has never been implemented in Moodle MNet API','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:11:\"empty array\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1,'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"userdata\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:14:\"user details {\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:19:\"our local course id\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:69:\"true if the enrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1,'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can\'t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:18:\"of the remote user\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:71:\"true if the unenrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1,'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:16:\"ID of our course\";}i:1;a:3:{s:4:\"name\";s:5:\"roles\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(15,'fetch_file','portfolio/mahara/lib.php/fetch_file','portfolio','mahara',1,'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:56:\"the token recieved previously during send_content_intent\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','lib.php','portfolio_plugin_mahara',1);
/*!40000 ALTER TABLE `mnet_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnet_service`
--

DROP TABLE IF EXISTS `mnet_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnet_service` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(40) NOT NULL DEFAULT '',
  `apiversion` varchar(10) NOT NULL DEFAULT '',
  `offer` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnet_service`
--

LOCK TABLES `mnet_service` WRITE;
/*!40000 ALTER TABLE `mnet_service` DISABLE KEYS */;
INSERT INTO `mnet_service` VALUES (1,'sso_idp','','1',1),(2,'sso_sp','','1',1),(3,'mnet_enrol','','1',1),(4,'pf','','1',1);
/*!40000 ALTER TABLE `mnet_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnet_service2rpc`
--

DROP TABLE IF EXISTS `mnet_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnet_service2rpc` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rpcid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnet_service2rpc`
--

LOCK TABLES `mnet_service2rpc` WRITE;
/*!40000 ALTER TABLE `mnet_service2rpc` DISABLE KEYS */;
INSERT INTO `mnet_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15);
/*!40000 ALTER TABLE `mnet_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnet_session`
--

DROP TABLE IF EXISTS `mnet_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnet_session` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(40) NOT NULL DEFAULT '',
  `mnethostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `useragent` varchar(40) NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) unsigned NOT NULL DEFAULT '0',
  `session_id` varchar(40) NOT NULL DEFAULT '',
  `expires` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnet_session`
--

LOCK TABLES `mnet_session` WRITE;
/*!40000 ALTER TABLE `mnet_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnet_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnet_sso_access_control`
--

DROP TABLE IF EXISTS `mnet_sso_access_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnet_sso_access_control` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) unsigned NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnet_sso_access_control`
--

LOCK TABLES `mnet_sso_access_control` WRITE;
/*!40000 ALTER TABLE `mnet_sso_access_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnet_sso_access_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnetservice_enrol_courses`
--

DROP TABLE IF EXISTS `mnetservice_enrol_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnetservice_enrol_courses` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL,
  `remoteid` bigint(10) unsigned NOT NULL,
  `categoryid` bigint(10) unsigned NOT NULL,
  `categoryname` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` mediumtext NOT NULL,
  `summaryformat` smallint(3) unsigned DEFAULT '0',
  `startdate` bigint(10) unsigned NOT NULL,
  `roleid` bigint(10) unsigned NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information fetched via XML-RPC about courses on ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnetservice_enrol_courses`
--

LOCK TABLES `mnetservice_enrol_courses` WRITE;
/*!40000 ALTER TABLE `mnetservice_enrol_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnetservice_enrol_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnetservice_enrol_enrolments`
--

DROP TABLE IF EXISTS `mnetservice_enrol_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mnetservice_enrol_enrolments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `remotecourseid` bigint(10) unsigned NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  `enroltime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `enroltype` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mnetenroenro_use_ix` (`userid`),
  KEY `mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information about enrolments of our local users i';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnetservice_enrol_enrolments`
--

LOCK TABLES `mnetservice_enrol_enrolments` WRITE;
/*!40000 ALTER TABLE `mnetservice_enrol_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnetservice_enrol_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastcron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `modu_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='modules available in the site';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'assignment',2010102600,60,1360797423,'',1),(2,'chat',2010080302,300,1360797423,'',1),(3,'choice',2010101300,0,0,'',1),(4,'data',2010100101,60,0,'',1),(5,'feedback',2010112302,0,0,'',0),(6,'folder',2010101400,0,0,'',1),(7,'forum',2010111500,60,1360797423,'',1),(8,'glossary',2010111500,0,0,'',1),(9,'imscp',2010101400,0,0,'',1),(10,'label',2010080300,0,0,'',1),(11,'lesson',2010081200,0,0,'',1),(12,'page',2010101400,0,0,'',1),(13,'quiz',2010111904,0,0,'',1),(14,'resource',2010101400,0,0,'',1),(15,'scorm',2010092400,300,1360797423,'',1),(16,'survey',2010080300,0,0,'',1),(17,'url',2010101400,0,0,'',1),(18,'wiki',2010102800,0,0,'',1),(19,'workshop',2010111200,0,0,'',1);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_pages`
--

DROP TABLE IF EXISTS `my_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `private` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Extra user pages for the My Moodle system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_pages`
--

LOCK TABLES `my_pages` WRITE;
/*!40000 ALTER TABLE `my_pages` DISABLE KEYS */;
INSERT INTO `my_pages` VALUES (1,NULL,'__default',0,0),(2,NULL,'__default',1,0);
/*!40000 ALTER TABLE `my_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext,
  `contentformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) unsigned DEFAULT NULL,
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `displayoptions` text,
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one page and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_instance`
--

DROP TABLE IF EXISTS `portfolio_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_instance` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='base table (not including config data) for instances of port';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_instance`
--

LOCK TABLES `portfolio_instance` WRITE;
/*!40000 ALTER TABLE `portfolio_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_instance_config`
--

DROP TABLE IF EXISTS `portfolio_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_instance_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `portinstconf_nam_ix` (`name`),
  KEY `portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config for portfolio plugin instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_instance_config`
--

LOCK TABLES `portfolio_instance_config` WRITE;
/*!40000 ALTER TABLE `portfolio_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_instance_user`
--

DROP TABLE IF EXISTS `portfolio_instance_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_instance_user` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `portinstuser_ins_ix` (`instance`),
  KEY `portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user data for portfolio instances.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_instance_user`
--

LOCK TABLES `portfolio_instance_user` WRITE;
/*!40000 ALTER TABLE `portfolio_instance_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_instance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_log`
--

DROP TABLE IF EXISTS `portfolio_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `time` bigint(10) unsigned NOT NULL,
  `portfolio` bigint(10) unsigned NOT NULL,
  `caller_class` varchar(150) NOT NULL DEFAULT '',
  `caller_file` varchar(255) NOT NULL DEFAULT '',
  `caller_sha1` varchar(255) NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) NOT NULL DEFAULT '',
  `continueurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `portlog_use_ix` (`userid`),
  KEY `portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log of portfolio transfers (used to later check for duplicat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_log`
--

LOCK TABLES `portfolio_log` WRITE;
/*!40000 ALTER TABLE `portfolio_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_mahara_queue`
--

DROP TABLE IF EXISTS `portfolio_mahara_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_mahara_queue` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) unsigned NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `portmahaqueu_tok_ix` (`token`),
  KEY `portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maps mahara tokens to transfer ids';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_mahara_queue`
--

LOCK TABLES `portfolio_mahara_queue` WRITE;
/*!40000 ALTER TABLE `portfolio_mahara_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_mahara_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_tempdata`
--

DROP TABLE IF EXISTS `portfolio_tempdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_tempdata` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext,
  `expirytime` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `porttemp_use_ix` (`userid`),
  KEY `porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores temporary data for portfolio exports. the id of this ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_tempdata`
--

LOCK TABLES `portfolio_tempdata` WRITE;
/*!40000 ALTER TABLE `portfolio_tempdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_tempdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `moduleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(128) NOT NULL DEFAULT '',
  `rating` bigint(10) unsigned NOT NULL DEFAULT '0',
  `format` bigint(10) unsigned NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `created` bigint(10) unsigned NOT NULL DEFAULT '0',
  `usermodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_iduse_uix` (`id`,`userid`),
  KEY `post_las_ix` (`lastmodified`),
  KEY `post_mod_ix` (`module`),
  KEY `post_sub_ix` (`subject`),
  KEY `post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `questiontext` text NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` text NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultgrade` decimal(12,7) unsigned NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  `qtype` varchar(20) NOT NULL DEFAULT '',
  `length` bigint(10) unsigned NOT NULL DEFAULT '1',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `createdby` bigint(10) unsigned DEFAULT NULL,
  `modifiedby` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ques_cat_ix` (`category`),
  KEY `ques_par_ix` (`parent`),
  KEY `ques_cre_ix` (`createdby`),
  KEY `ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The questions themselves';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_answers`
--

DROP TABLE IF EXISTS `question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` text NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_answers`
--

LOCK TABLES `question_answers` WRITE;
/*!40000 ALTER TABLE `question_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_attempts`
--

DROP TABLE IF EXISTS `question_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_attempts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `modulename` varchar(20) NOT NULL DEFAULT 'quiz',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Student attempts. This table gets extended by the modules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_attempts`
--

LOCK TABLES `question_attempts` WRITE;
/*!40000 ALTER TABLE `question_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_calculated`
--

DROP TABLE IF EXISTS `question_calculated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_calculated` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tolerance` varchar(20) NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `quescalc_ans_ix` (`answer`),
  KEY `quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_calculated`
--

LOCK TABLES `question_calculated` WRITE;
/*!40000 ALTER TABLE `question_calculated` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_calculated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_calculated_options`
--

DROP TABLE IF EXISTS `question_calculated_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_calculated_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` text,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` text,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` text,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  PRIMARY KEY (`id`),
  KEY `quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_calculated_options`
--

LOCK TABLES `question_calculated_options` WRITE;
/*!40000 ALTER TABLE `question_calculated_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_calculated_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_categories`
--

DROP TABLE IF EXISTS `question_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_categories` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `parent` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `quescate_con_ix` (`contextid`),
  KEY `quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_categories`
--

LOCK TABLES `question_categories` WRITE;
/*!40000 ALTER TABLE `question_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_dataset_definitions`
--

DROP TABLE IF EXISTS `question_dataset_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_dataset_definitions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `itemcount` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_dataset_definitions`
--

LOCK TABLES `question_dataset_definitions` WRITE;
/*!40000 ALTER TABLE `question_dataset_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_dataset_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_dataset_items`
--

DROP TABLE IF EXISTS `question_dataset_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_dataset_items` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) unsigned NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Individual dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_dataset_items`
--

LOCK TABLES `question_dataset_items` WRITE;
/*!40000 ALTER TABLE `question_dataset_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_dataset_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_datasets`
--

DROP TABLE IF EXISTS `question_datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_datasets` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `quesdata_que_ix` (`question`),
  KEY `quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_datasets`
--

LOCK TABLES `question_datasets` WRITE;
/*!40000 ALTER TABLE `question_datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_match`
--

DROP TABLE IF EXISTS `question_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_match` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `subquestions` varchar(255) NOT NULL DEFAULT '',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `quesmatc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines fixed matching questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_match`
--

LOCK TABLES `question_match` WRITE;
/*!40000 ALTER TABLE `question_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_match_sub`
--

DROP TABLE IF EXISTS `question_match_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_match_sub` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `questiontext` text NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `quesmatcsub_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines the subquestions that make up a matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_match_sub`
--

LOCK TABLES `question_match_sub` WRITE;
/*!40000 ALTER TABLE `question_match_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_match_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_multianswer`
--

DROP TABLE IF EXISTS `question_multianswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_multianswer` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sequence` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_multianswer`
--

LOCK TABLES `question_multianswer` WRITE;
/*!40000 ALTER TABLE `question_multianswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_multianswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_multichoice`
--

DROP TABLE IF EXISTS `question_multichoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_multichoice` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `answers` varchar(255) NOT NULL DEFAULT '',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` text NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` text NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` text NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  PRIMARY KEY (`id`),
  KEY `quesmult_que2_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_multichoice`
--

LOCK TABLES `question_multichoice` WRITE;
/*!40000 ALTER TABLE `question_multichoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_multichoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_numerical`
--

DROP TABLE IF EXISTS `question_numerical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_numerical` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tolerance` varchar(255) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `quesnume_ans_ix` (`answer`),
  KEY `quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_numerical`
--

LOCK TABLES `question_numerical` WRITE;
/*!40000 ALTER TABLE `question_numerical` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_numerical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_numerical_options`
--

DROP TABLE IF EXISTS `question_numerical_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_numerical_options` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `instructions` text,
  `instructionsformat` tinyint(2) NOT NULL DEFAULT '0',
  `showunits` smallint(4) unsigned NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) unsigned NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) unsigned NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type numerical This table is also u';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_numerical_options`
--

LOCK TABLES `question_numerical_options` WRITE;
/*!40000 ALTER TABLE `question_numerical_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_numerical_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_numerical_units`
--

DROP TABLE IF EXISTS `question_numerical_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_numerical_units` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions. This table is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_numerical_units`
--

LOCK TABLES `question_numerical_units` WRITE;
/*!40000 ALTER TABLE `question_numerical_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_numerical_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_randomsamatch`
--

DROP TABLE IF EXISTS `question_randomsamatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_randomsamatch` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `choose` bigint(10) unsigned NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `quesrand_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_randomsamatch`
--

LOCK TABLES `question_randomsamatch` WRITE;
/*!40000 ALTER TABLE `question_randomsamatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_randomsamatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_sessions`
--

DROP TABLE IF EXISTS `question_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_sessions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `attemptid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `questionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `newest` bigint(10) unsigned NOT NULL DEFAULT '0',
  `newgraded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` text NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `quessess_att_ix` (`attemptid`),
  KEY `quessess_que_ix` (`questionid`),
  KEY `quessess_new_ix` (`newest`),
  KEY `quessess_new2_ix` (`newgraded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gives ids of the newest open and newest graded states';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_sessions`
--

LOCK TABLES `question_sessions` WRITE;
/*!40000 ALTER TABLE `question_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_shortanswer`
--

DROP TABLE IF EXISTS `question_shortanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_shortanswer` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answers` varchar(255) NOT NULL DEFAULT '',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `quesshor_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_shortanswer`
--

LOCK TABLES `question_shortanswer` WRITE;
/*!40000 ALTER TABLE `question_shortanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_shortanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_states`
--

DROP TABLE IF EXISTS `question_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_states` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `attempt` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  `timestamp` bigint(10) unsigned NOT NULL DEFAULT '0',
  `event` smallint(4) unsigned NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `quesstat_att_ix` (`attempt`),
  KEY `quesstat_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user responses to an attempt, and percentage grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_states`
--

LOCK TABLES `question_states` WRITE;
/*!40000 ALTER TABLE `question_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_truefalse`
--

DROP TABLE IF EXISTS `question_truefalse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_truefalse` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) unsigned NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_truefalse`
--

LOCK TABLES `question_truefalse` WRITE;
/*!40000 ALTER TABLE `question_truefalse` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_truefalse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `optionflags` bigint(10) unsigned NOT NULL DEFAULT '0',
  `penaltyscheme` smallint(4) unsigned NOT NULL DEFAULT '0',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-2',
  `review` bigint(10) unsigned NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` text NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timelimit` bigint(10) unsigned NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `popup` smallint(4) NOT NULL DEFAULT '0',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Main information about each quiz';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_attempts`
--

DROP TABLE IF EXISTS `quiz_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_attempts` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timefinish` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `layout` text NOT NULL,
  `preview` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `quizatte_uni_uix` (`uniqueid`),
  KEY `quizatte_use_ix` (`userid`),
  KEY `quizatte_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores various attempts on a quiz';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_attempts`
--

LOCK TABLES `quiz_attempts` WRITE;
/*!40000 ALTER TABLE `quiz_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_feedback`
--

DROP TABLE IF EXISTS `quiz_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_feedback` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedbacktext` text NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on which grade band their o';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_feedback`
--

LOCK TABLES `quiz_feedback` WRITE;
/*!40000 ALTER TABLE `quiz_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_grades`
--

DROP TABLE IF EXISTS `quiz_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `quizgrad_use_ix` (`userid`),
  KEY `quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overall grade for each user on the quiz, based on their ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_grades`
--

LOCK TABLES `quiz_grades` WRITE;
/*!40000 ALTER TABLE `quiz_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_overrides`
--

DROP TABLE IF EXISTS `quiz_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_overrides` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned DEFAULT NULL,
  `userid` bigint(10) unsigned DEFAULT NULL,
  `timeopen` bigint(10) unsigned DEFAULT NULL,
  `timeclose` bigint(10) unsigned DEFAULT NULL,
  `timelimit` bigint(10) unsigned DEFAULT NULL,
  `attempts` mediumint(6) unsigned DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quizover_qui_ix` (`quiz`),
  KEY `quizover_gro_ix` (`groupid`),
  KEY `quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to quiz settings on a per-user and per-group b';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_overrides`
--

LOCK TABLES `quiz_overrides` WRITE;
/*!40000 ALTER TABLE `quiz_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question_instances`
--

DROP TABLE IF EXISTS `quiz_question_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_question_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `quizquesinst_qui_ix` (`quiz`),
  KEY `quizquesinst_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the maximum possible grade (weight) for each question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question_instances`
--

LOCK TABLES `quiz_question_instances` WRITE;
/*!40000 ALTER TABLE `quiz_question_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_question_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question_regrade`
--

DROP TABLE IF EXISTS `quiz_question_regrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_question_regrade` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) unsigned NOT NULL,
  `attemptid` bigint(10) unsigned NOT NULL,
  `newgrade` decimal(12,7) NOT NULL,
  `oldgrade` decimal(12,7) NOT NULL,
  `regraded` smallint(4) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table records which question attempts need regrading an';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question_regrade`
--

LOCK TABLES `quiz_question_regrade` WRITE;
/*!40000 ALTER TABLE `quiz_question_regrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_question_regrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question_response_stats`
--

DROP TABLE IF EXISTS `quiz_question_response_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_question_response_stats` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) unsigned NOT NULL,
  `questionid` bigint(10) unsigned NOT NULL,
  `subqid` bigint(10) unsigned NOT NULL,
  `aid` bigint(10) unsigned NOT NULL,
  `response` longtext,
  `rcount` bigint(10) unsigned DEFAULT NULL,
  `credit` decimal(15,5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quiz question responses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question_response_stats`
--

LOCK TABLES `quiz_question_response_stats` WRITE;
/*!40000 ALTER TABLE `quiz_question_response_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_question_response_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question_statistics`
--

DROP TABLE IF EXISTS `quiz_question_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_question_statistics` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) unsigned NOT NULL,
  `questionid` bigint(10) unsigned NOT NULL,
  `subquestion` smallint(4) unsigned NOT NULL,
  `s` bigint(10) unsigned NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) unsigned DEFAULT NULL,
  `negcovar` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) unsigned DEFAULT NULL,
  `facility` decimal(15,10) unsigned DEFAULT NULL,
  `subquestions` mediumtext,
  `maxgrade` decimal(12,7) unsigned DEFAULT NULL,
  `positions` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default comment for the table, please edit me';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question_statistics`
--

LOCK TABLES `quiz_question_statistics` WRITE;
/*!40000 ALTER TABLE `quiz_question_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_question_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_report`
--

DROP TABLE IF EXISTS `quiz_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_report` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` bigint(10) unsigned NOT NULL,
  `lastcron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `cron` bigint(10) unsigned NOT NULL DEFAULT '0',
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Lists all the installed quiz reports and their display order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_report`
--

LOCK TABLES `quiz_report` WRITE;
/*!40000 ALTER TABLE `quiz_report` DISABLE KEYS */;
INSERT INTO `quiz_report` VALUES (1,'overview',10000,0,0,NULL),(2,'responses',9000,0,0,NULL),(3,'grading',6000,0,0,NULL),(4,'statistics',8000,1360797423,18000,'quizreport/statistics:view');
/*!40000 ALTER TABLE `quiz_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_statistics`
--

DROP TABLE IF EXISTS `quiz_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_statistics` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) unsigned NOT NULL,
  `groupid` bigint(10) unsigned NOT NULL,
  `allattempts` smallint(4) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `firstattemptscount` bigint(10) unsigned NOT NULL,
  `allattemptscount` bigint(10) unsigned NOT NULL,
  `firstattemptsavg` decimal(15,5) unsigned DEFAULT NULL,
  `allattemptsavg` decimal(15,5) unsigned DEFAULT NULL,
  `median` decimal(15,5) unsigned DEFAULT NULL,
  `standarddeviation` decimal(15,5) unsigned DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) unsigned DEFAULT NULL,
  `standarderror` decimal(15,10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table to cache results from analysis done in statistics repo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_statistics`
--

LOCK TABLES `quiz_statistics` WRITE;
/*!40000 ALTER TABLE `quiz_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL,
  `itemid` bigint(10) unsigned NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_hubs`
--

DROP TABLE IF EXISTS `registration_hubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_hubs` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `hubname` varchar(255) NOT NULL DEFAULT '',
  `huburl` varchar(255) NOT NULL DEFAULT '',
  `confirmed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hub where the site is registered on with their associated to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_hubs`
--

LOCK TABLES `registration_hubs` WRITE;
/*!40000 ALTER TABLE `registration_hubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_hubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_customlang`
--

DROP TABLE IF EXISTS `report_customlang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_customlang` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) NOT NULL DEFAULT '',
  `componentid` bigint(10) unsigned NOT NULL,
  `stringid` varchar(255) NOT NULL DEFAULT '',
  `original` longtext NOT NULL,
  `master` longtext,
  `local` longtext,
  `timemodified` bigint(10) unsigned NOT NULL,
  `timecustomized` bigint(10) unsigned DEFAULT NULL,
  `outdated` smallint(3) unsigned DEFAULT '0',
  `modified` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `repocust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `repocust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the working checkout of all strings and their custo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_customlang`
--

LOCK TABLES `report_customlang` WRITE;
/*!40000 ALTER TABLE `report_customlang` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_customlang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_customlang_components`
--

DROP TABLE IF EXISTS `report_customlang_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_customlang_components` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the list of all installed plugins that provide thei';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_customlang_components`
--

LOCK TABLES `report_customlang_components` WRITE;
/*!40000 ALTER TABLE `report_customlang_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_customlang_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository`
--

DROP TABLE IF EXISTS `repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) unsigned DEFAULT '1',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository`
--

LOCK TABLES `repository` WRITE;
/*!40000 ALTER TABLE `repository` DISABLE KEYS */;
INSERT INTO `repository` VALUES (1,'local',1,1),(2,'recent',1,2),(3,'upload',1,3),(4,'user',1,4);
/*!40000 ALTER TABLE `repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_instance_config`
--

DROP TABLE IF EXISTS `repository_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_instance_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The config for intances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_instance_config`
--

LOCK TABLES `repository_instance_config` WRITE;
/*!40000 ALTER TABLE `repository_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_instances`
--

DROP TABLE IF EXISTS `repository_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_instances` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `typeid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contextid` bigint(10) unsigned NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `readonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_instances`
--

LOCK TABLES `repository_instances` WRITE;
/*!40000 ALTER TABLE `repository_instances` DISABLE KEYS */;
INSERT INTO `repository_instances` VALUES (1,'',1,0,1,NULL,NULL,1292778867,1292778867,0),(2,'',2,0,1,NULL,NULL,1292778867,1292778867,0),(3,'',3,0,1,NULL,NULL,1292778867,1292778867,0),(4,'',4,0,1,NULL,NULL,1292778868,1292778868,0);
/*!40000 ALTER TABLE `repository_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) unsigned DEFAULT NULL,
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `displayoptions` text,
  `filterfiles` smallint(4) unsigned NOT NULL DEFAULT '0',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reso_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Each record is one resource and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (1,6,'Week 1 Content','<p>Week 1 will cover the topic of Mouse Security.<br /><br />How can you configure your mouse to operate as securely as possible? We go in-depth on both optical and ball mice.</p>',1,0,0,NULL,1,'a:2:{s:12:\"printheading\";i:0;s:10:\"printintro\";i:1;}',0,3,1355852038),(2,6,'Week 2 Content','<p>In Week 2 we will be covering Keyboard Security!<br /><br />How can you know that you are typing what you think you are typing on the keyboard when you are typing?</p>',1,0,0,NULL,0,'a:2:{s:12:\"printheading\";i:0;s:10:\"printintro\";i:1;}',0,1,1355852168),(3,6,'Week 3 Content','<p>Now that we are in Week 3 and have covered the security of our Keyboard and Mice, we are delving into the deeper levels.</p>\r\n<p>As our keyboard and mice are called input devices, what exactly are they inputting into our computers? Shouldn\'t we be aware of the malicious things these devices can do? Of Course! Lets analyze the Bits!!!!</p>',1,0,0,NULL,0,'a:2:{s:12:\"printheading\";i:0;s:10:\"printintro\";i:1;}',0,2,1355853174),(4,6,'Week 4 Content','<p>The bits are flowing from Week 3! Where do the bits go after passing through some randomy designed circuits?<br /><br />In Week 4 we now cover the Hard Drive, the data storage point. Whenever secure transactions and secure mouse movments are performed on your PC, what incriminating evidence is being recorded on your hard drive? Lets Find out!</p>',1,0,0,NULL,0,'a:2:{s:12:\"printheading\";i:0;s:10:\"printintro\";i:1;}',0,1,1355852537),(5,6,'Week 5 Content','<p>Week 5 will be covering the User\'s failure to complete the most basic of computing tasks. PC hardware and software performance speeds decrease with excessive amounts of unintelligable user input.</p>\r\n<p>In week 5, we focus on you oh user of unintelligable input!</p>',1,0,0,NULL,0,'a:2:{s:12:\"printheading\";i:0;s:10:\"printintro\";i:1;}',0,1,1355852760),(6,6,'Week 6 Content','<p>Week 6 is the ending week of this course and covers appropriate content for the end of Best Practices.</p>\r\n<p>Sometimes PCs just don\'t want to work. Most common solution to a broken or sad working PC is to buy a new one. We won\'t blame you!</p>\r\n<p>Lets review the common System Failure Points and give ourselves a reason to buy a new PC!</p>',1,0,0,NULL,0,'a:2:{s:12:\"printheading\";i:0;s:10:\"printintro\";i:1;}',0,1,1355853037);
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_old`
--

DROP TABLE IF EXISTS `resource_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `alltext` mediumtext NOT NULL,
  `popup` text NOT NULL,
  `options` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `cmid` bigint(10) unsigned DEFAULT NULL,
  `newmodule` varchar(50) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  `migrated` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `resoold_old_uix` (`oldid`),
  KEY `resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of all old resource instances from 1.9';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_old`
--

LOCK TABLES `resource_old` WRITE;
/*!40000 ALTER TABLE `resource_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `archetype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_sor_uix` (`sortorder`),
  UNIQUE KEY `role_nam_uix` (`name`),
  UNIQUE KEY `role_sho_uix` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='moodle roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Manager','manager','Managers can access course and modify them, they usually do not participate in courses.',1,'manager'),(2,'Course creator','coursecreator','Course creators can create new courses.',2,'coursecreator'),(3,'Teacher','editingteacher','Teachers can do anything within a course, including changing the activities and grading students.',3,'editingteacher'),(4,'Non-editing teacher','teacher','Non-editing teachers can teach in courses and grade students, but may not alter activities.',4,'teacher'),(5,'Student','student','Students generally have fewer privileges within a course.',5,'student'),(6,'Guest','guest','Guests have minimal privileges and usually can not enter text anywhere.',6,'guest'),(7,'Authenticated user','user','All logged in users.',7,'user'),(8,'Authenticated user on frontpage','frontpage','All logged in users in the frontpage course.',8,'frontpage');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_allow_assign`
--

DROP TABLE IF EXISTS `role_allow_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_allow_assign` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `allowassign` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `rolealloassi_rol_ix` (`roleid`),
  KEY `rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_allow_assign`
--

LOCK TABLES `role_allow_assign` WRITE;
/*!40000 ALTER TABLE `role_allow_assign` DISABLE KEYS */;
INSERT INTO `role_allow_assign` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,3,4),(7,3,5);
/*!40000 ALTER TABLE `role_allow_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_allow_override`
--

DROP TABLE IF EXISTS `role_allow_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_allow_override` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `rolealloover_rol_ix` (`roleid`),
  KEY `rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_allow_override`
--

LOCK TABLES `role_allow_override` WRITE;
/*!40000 ALTER TABLE `role_allow_override` DISABLE KEYS */;
INSERT INTO `role_allow_override` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,3,4),(10,3,5),(11,3,6);
/*!40000 ALTER TABLE `role_allow_override` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_allow_switch`
--

DROP TABLE IF EXISTS `role_allow_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_allow_switch` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL,
  `allowswitch` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `rolealloswit_rol_ix` (`roleid`),
  KEY `rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='This table stores which which other roles a user is allowed ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_allow_switch`
--

LOCK TABLES `role_allow_switch` WRITE;
/*!40000 ALTER TABLE `role_allow_switch` DISABLE KEYS */;
INSERT INTO `role_allow_switch` VALUES (1,1,3),(2,1,4),(3,1,5),(4,1,6),(5,3,4),(6,3,5),(7,3,6),(8,4,5),(9,4,6);
/*!40000 ALTER TABLE `role_allow_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_assignments`
--

DROP TABLE IF EXISTS `role_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_assignments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modifierid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `roleassi_sor_ix` (`sortorder`),
  KEY `roleassi_rol_ix` (`roleid`),
  KEY `roleassi_con_ix` (`contextid`),
  KEY `roleassi_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='assigning roles in different context';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_assignments`
--

LOCK TABLES `role_assignments` WRITE;
/*!40000 ALTER TABLE `role_assignments` DISABLE KEYS */;
INSERT INTO `role_assignments` VALUES (1,5,44,8,1355850953,2,'',0,0),(2,5,44,7,1355850954,2,'',0,0),(3,5,44,3,1355850955,2,'',0,0),(4,5,44,9,1355850956,2,'',0,0),(5,5,44,6,1355850957,2,'',0,0),(6,5,44,4,1355850959,2,'',0,0),(7,5,44,5,1355850960,2,'',0,0),(8,5,44,2,1355850965,2,'',0,0);
/*!40000 ALTER TABLE `role_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_capabilities`
--

DROP TABLE IF EXISTS `role_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_capabilities` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `capability` varchar(255) NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modifierid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `rolecapa_rol_ix` (`roleid`),
  KEY `rolecapa_con_ix` (`contextid`),
  KEY `rolecapa_mod_ix` (`modifierid`),
  KEY `rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB AUTO_INCREMENT=860 DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_capabilities`
--

LOCK TABLES `role_capabilities` WRITE;
/*!40000 ALTER TABLE `role_capabilities` DISABLE KEYS */;
INSERT INTO `role_capabilities` VALUES (1,1,1,'moodle/site:readallmessages',1,1292778855,0),(2,1,3,'moodle/site:readallmessages',1,1292778855,0),(3,1,1,'moodle/site:sendmessage',1,1292778855,0),(4,1,7,'moodle/site:sendmessage',1,1292778855,0),(5,1,1,'moodle/site:approvecourse',1,1292778855,0),(6,1,3,'moodle/backup:backupcourse',1,1292778855,0),(7,1,1,'moodle/backup:backupcourse',1,1292778855,0),(8,1,3,'moodle/backup:backupsection',1,1292778855,0),(9,1,1,'moodle/backup:backupsection',1,1292778855,0),(10,1,3,'moodle/backup:backupactivity',1,1292778855,0),(11,1,1,'moodle/backup:backupactivity',1,1292778855,0),(12,1,3,'moodle/backup:backuptargethub',1,1292778855,0),(13,1,1,'moodle/backup:backuptargethub',1,1292778855,0),(14,1,3,'moodle/backup:backuptargetimport',1,1292778855,0),(15,1,1,'moodle/backup:backuptargetimport',1,1292778855,0),(16,1,3,'moodle/backup:downloadfile',1,1292778855,0),(17,1,1,'moodle/backup:downloadfile',1,1292778855,0),(18,1,3,'moodle/backup:configure',1,1292778855,0),(19,1,1,'moodle/backup:configure',1,1292778855,0),(20,1,1,'moodle/backup:userinfo',1,1292778855,0),(21,1,1,'moodle/backup:anonymise',1,1292778855,0),(22,1,3,'moodle/restore:restorecourse',1,1292778855,0),(23,1,1,'moodle/restore:restorecourse',1,1292778855,0),(24,1,3,'moodle/restore:restoresection',1,1292778855,0),(25,1,1,'moodle/restore:restoresection',1,1292778855,0),(26,1,3,'moodle/restore:restoreactivity',1,1292778855,0),(27,1,1,'moodle/restore:restoreactivity',1,1292778855,0),(28,1,3,'moodle/restore:restoretargethub',1,1292778855,0),(29,1,1,'moodle/restore:restoretargethub',1,1292778855,0),(30,1,3,'moodle/restore:restoretargetimport',1,1292778855,0),(31,1,1,'moodle/restore:restoretargetimport',1,1292778855,0),(32,1,3,'moodle/restore:uploadfile',1,1292778855,0),(33,1,1,'moodle/restore:uploadfile',1,1292778855,0),(34,1,3,'moodle/restore:configure',1,1292778855,0),(35,1,1,'moodle/restore:configure',1,1292778855,0),(36,1,2,'moodle/restore:rolldates',1,1292778855,0),(37,1,1,'moodle/restore:rolldates',1,1292778855,0),(38,1,1,'moodle/restore:userinfo',1,1292778855,0),(39,1,1,'moodle/restore:createuser',1,1292778855,0),(40,1,3,'moodle/site:manageblocks',1,1292778855,0),(41,1,1,'moodle/site:manageblocks',1,1292778855,0),(42,1,4,'moodle/site:accessallgroups',1,1292778855,0),(43,1,3,'moodle/site:accessallgroups',1,1292778855,0),(44,1,1,'moodle/site:accessallgroups',1,1292778855,0),(45,1,4,'moodle/site:viewfullnames',1,1292778855,0),(46,1,3,'moodle/site:viewfullnames',1,1292778855,0),(47,1,1,'moodle/site:viewfullnames',1,1292778855,0),(48,1,4,'moodle/site:viewreports',1,1292778855,0),(49,1,3,'moodle/site:viewreports',1,1292778855,0),(50,1,1,'moodle/site:viewreports',1,1292778855,0),(51,1,3,'moodle/site:trustcontent',1,1292778855,0),(52,1,1,'moodle/site:trustcontent',1,1292778855,0),(53,1,1,'moodle/site:uploadusers',1,1292778855,0),(54,1,3,'moodle/filter:manage',1,1292778855,0),(55,1,2,'moodle/filter:manage',1,1292778855,0),(56,1,1,'moodle/filter:manage',1,1292778855,0),(57,1,1,'moodle/user:create',1,1292778855,0),(58,1,1,'moodle/user:delete',1,1292778855,0),(59,1,1,'moodle/user:update',1,1292778855,0),(60,1,6,'moodle/user:viewdetails',1,1292778855,0),(61,1,5,'moodle/user:viewdetails',1,1292778855,0),(62,1,4,'moodle/user:viewdetails',1,1292778855,0),(63,1,3,'moodle/user:viewdetails',1,1292778855,0),(64,1,1,'moodle/user:viewdetails',1,1292778855,0),(65,1,1,'moodle/user:viewalldetails',1,1292778855,0),(66,1,4,'moodle/user:viewhiddendetails',1,1292778855,0),(67,1,3,'moodle/user:viewhiddendetails',1,1292778855,0),(68,1,1,'moodle/user:viewhiddendetails',1,1292778856,0),(69,1,1,'moodle/user:loginas',1,1292778856,0),(70,1,1,'moodle/user:managesyspages',1,1292778856,0),(71,1,7,'moodle/user:manageownblocks',1,1292778856,0),(72,1,7,'moodle/user:manageownfiles',1,1292778856,0),(73,1,1,'moodle/my:configsyspages',1,1292778856,0),(74,1,3,'moodle/role:assign',1,1292778856,0),(75,1,1,'moodle/role:assign',1,1292778856,0),(76,1,4,'moodle/role:review',1,1292778856,0),(77,1,3,'moodle/role:review',1,1292778856,0),(78,1,1,'moodle/role:review',1,1292778856,0),(79,1,1,'moodle/role:override',1,1292778856,0),(80,1,3,'moodle/role:safeoverride',1,1292778856,0),(81,1,1,'moodle/role:manage',1,1292778856,0),(82,1,3,'moodle/role:switchroles',1,1292778856,0),(83,1,1,'moodle/role:switchroles',1,1292778856,0),(84,1,1,'moodle/category:manage',1,1292778856,0),(85,1,2,'moodle/category:viewhiddencategories',1,1292778856,0),(86,1,1,'moodle/category:viewhiddencategories',1,1292778856,0),(87,1,1,'moodle/cohort:manage',1,1292778856,0),(88,1,1,'moodle/cohort:assign',1,1292778856,0),(89,1,3,'moodle/cohort:view',1,1292778856,0),(90,1,1,'moodle/cohort:view',1,1292778856,0),(91,1,2,'moodle/course:create',1,1292778856,0),(92,1,1,'moodle/course:create',1,1292778856,0),(93,1,7,'moodle/course:request',1,1292778856,0),(94,1,3,'moodle/course:delete',1,1292778856,0),(95,1,1,'moodle/course:delete',1,1292778856,0),(96,1,3,'moodle/course:update',1,1292778856,0),(97,1,1,'moodle/course:update',1,1292778856,0),(98,1,1,'moodle/course:view',1,1292778856,0),(99,1,3,'moodle/course:enrolreview',1,1292778856,0),(100,1,1,'moodle/course:enrolreview',1,1292778856,0),(101,1,3,'moodle/course:enrolconfig',1,1292778856,0),(102,1,1,'moodle/course:enrolconfig',1,1292778856,0),(103,1,4,'moodle/course:bulkmessaging',1,1292778856,0),(104,1,3,'moodle/course:bulkmessaging',1,1292778856,0),(105,1,1,'moodle/course:bulkmessaging',1,1292778856,0),(106,1,4,'moodle/course:viewhiddenuserfields',1,1292778856,0),(107,1,3,'moodle/course:viewhiddenuserfields',1,1292778856,0),(108,1,1,'moodle/course:viewhiddenuserfields',1,1292778856,0),(109,1,2,'moodle/course:viewhiddencourses',1,1292778856,0),(110,1,4,'moodle/course:viewhiddencourses',1,1292778856,0),(111,1,3,'moodle/course:viewhiddencourses',1,1292778856,0),(112,1,1,'moodle/course:viewhiddencourses',1,1292778856,0),(113,1,3,'moodle/course:visibility',1,1292778856,0),(114,1,1,'moodle/course:visibility',1,1292778856,0),(115,1,3,'moodle/course:managefiles',1,1292778856,0),(116,1,1,'moodle/course:managefiles',1,1292778856,0),(117,1,3,'moodle/course:manageactivities',1,1292778856,0),(118,1,1,'moodle/course:manageactivities',1,1292778856,0),(119,1,3,'moodle/course:activityvisibility',1,1292778856,0),(120,1,1,'moodle/course:activityvisibility',1,1292778856,0),(121,1,4,'moodle/course:viewhiddenactivities',1,1292778856,0),(122,1,3,'moodle/course:viewhiddenactivities',1,1292778856,0),(123,1,1,'moodle/course:viewhiddenactivities',1,1292778856,0),(124,1,5,'moodle/course:viewparticipants',1,1292778856,0),(125,1,4,'moodle/course:viewparticipants',1,1292778856,0),(126,1,3,'moodle/course:viewparticipants',1,1292778856,0),(127,1,1,'moodle/course:viewparticipants',1,1292778856,0),(128,1,3,'moodle/course:changefullname',1,1292778856,0),(129,1,1,'moodle/course:changefullname',1,1292778856,0),(130,1,3,'moodle/course:changeshortname',1,1292778856,0),(131,1,1,'moodle/course:changeshortname',1,1292778856,0),(132,1,3,'moodle/course:changeidnumber',1,1292778856,0),(133,1,1,'moodle/course:changeidnumber',1,1292778856,0),(134,1,3,'moodle/course:changecategory',1,1292778856,0),(135,1,1,'moodle/course:changecategory',1,1292778856,0),(136,1,3,'moodle/course:changesummary',1,1292778856,0),(137,1,1,'moodle/course:changesummary',1,1292778856,0),(138,1,1,'moodle/site:viewparticipants',1,1292778856,0),(139,1,5,'moodle/course:viewscales',1,1292778856,0),(140,1,4,'moodle/course:viewscales',1,1292778856,0),(141,1,3,'moodle/course:viewscales',1,1292778856,0),(142,1,1,'moodle/course:viewscales',1,1292778856,0),(143,1,3,'moodle/course:managescales',1,1292778856,0),(144,1,1,'moodle/course:managescales',1,1292778856,0),(145,1,3,'moodle/course:managegroups',1,1292778856,0),(146,1,1,'moodle/course:managegroups',1,1292778856,0),(147,1,3,'moodle/course:reset',1,1292778856,0),(148,1,1,'moodle/course:reset',1,1292778856,0),(149,1,6,'moodle/blog:view',1,1292778856,0),(150,1,7,'moodle/blog:view',1,1292778856,0),(151,1,5,'moodle/blog:view',1,1292778856,0),(152,1,4,'moodle/blog:view',1,1292778856,0),(153,1,3,'moodle/blog:view',1,1292778856,0),(154,1,1,'moodle/blog:view',1,1292778856,0),(155,1,6,'moodle/blog:search',1,1292778856,0),(156,1,7,'moodle/blog:search',1,1292778856,0),(157,1,5,'moodle/blog:search',1,1292778856,0),(158,1,4,'moodle/blog:search',1,1292778856,0),(159,1,3,'moodle/blog:search',1,1292778856,0),(160,1,1,'moodle/blog:search',1,1292778856,0),(161,1,1,'moodle/blog:viewdrafts',1,1292778856,0),(162,1,7,'moodle/blog:create',1,1292778856,0),(163,1,1,'moodle/blog:create',1,1292778856,0),(164,1,4,'moodle/blog:manageentries',1,1292778856,0),(165,1,3,'moodle/blog:manageentries',1,1292778856,0),(166,1,1,'moodle/blog:manageentries',1,1292778856,0),(167,1,5,'moodle/blog:manageexternal',1,1292778856,0),(168,1,7,'moodle/blog:manageexternal',1,1292778856,0),(169,1,4,'moodle/blog:manageexternal',1,1292778856,0),(170,1,3,'moodle/blog:manageexternal',1,1292778856,0),(171,1,1,'moodle/blog:manageexternal',1,1292778856,0),(172,1,5,'moodle/blog:associatecourse',1,1292778856,0),(173,1,7,'moodle/blog:associatecourse',1,1292778856,0),(174,1,4,'moodle/blog:associatecourse',1,1292778856,0),(175,1,3,'moodle/blog:associatecourse',1,1292778856,0),(176,1,1,'moodle/blog:associatecourse',1,1292778856,0),(177,1,5,'moodle/blog:associatemodule',1,1292778856,0),(178,1,7,'moodle/blog:associatemodule',1,1292778856,0),(179,1,4,'moodle/blog:associatemodule',1,1292778856,0),(180,1,3,'moodle/blog:associatemodule',1,1292778856,0),(181,1,1,'moodle/blog:associatemodule',1,1292778856,0),(182,1,7,'moodle/calendar:manageownentries',1,1292778856,0),(183,1,1,'moodle/calendar:manageownentries',1,1292778856,0),(184,1,4,'moodle/calendar:managegroupentries',1,1292778856,0),(185,1,3,'moodle/calendar:managegroupentries',1,1292778856,0),(186,1,1,'moodle/calendar:managegroupentries',1,1292778856,0),(187,1,4,'moodle/calendar:manageentries',1,1292778856,0),(188,1,3,'moodle/calendar:manageentries',1,1292778856,0),(189,1,1,'moodle/calendar:manageentries',1,1292778856,0),(190,1,1,'moodle/user:editprofile',1,1292778856,0),(191,1,6,'moodle/user:editownprofile',-1000,1292778856,0),(192,1,7,'moodle/user:editownprofile',1,1292778856,0),(193,1,1,'moodle/user:editownprofile',1,1292778856,0),(194,1,6,'moodle/user:changeownpassword',-1000,1292778856,0),(195,1,7,'moodle/user:changeownpassword',1,1292778856,0),(196,1,1,'moodle/user:changeownpassword',1,1292778856,0),(197,1,5,'moodle/user:readuserposts',1,1292778856,0),(198,1,4,'moodle/user:readuserposts',1,1292778856,0),(199,1,3,'moodle/user:readuserposts',1,1292778856,0),(200,1,1,'moodle/user:readuserposts',1,1292778856,0),(201,1,5,'moodle/user:readuserblogs',1,1292778856,0),(202,1,4,'moodle/user:readuserblogs',1,1292778856,0),(203,1,3,'moodle/user:readuserblogs',1,1292778856,0),(204,1,1,'moodle/user:readuserblogs',1,1292778856,0),(205,1,1,'moodle/user:editmessageprofile',1,1292778856,0),(206,1,6,'moodle/user:editownmessageprofile',-1000,1292778856,0),(207,1,7,'moodle/user:editownmessageprofile',1,1292778856,0),(208,1,1,'moodle/user:editownmessageprofile',1,1292778856,0),(209,1,3,'moodle/question:managecategory',1,1292778856,0),(210,1,1,'moodle/question:managecategory',1,1292778856,0),(211,1,3,'moodle/question:add',1,1292778856,0),(212,1,1,'moodle/question:add',1,1292778856,0),(213,1,3,'moodle/question:editmine',1,1292778856,0),(214,1,1,'moodle/question:editmine',1,1292778856,0),(215,1,3,'moodle/question:editall',1,1292778856,0),(216,1,1,'moodle/question:editall',1,1292778856,0),(217,1,3,'moodle/question:viewmine',1,1292778856,0),(218,1,1,'moodle/question:viewmine',1,1292778856,0),(219,1,3,'moodle/question:viewall',1,1292778856,0),(220,1,1,'moodle/question:viewall',1,1292778856,0),(221,1,3,'moodle/question:usemine',1,1292778856,0),(222,1,1,'moodle/question:usemine',1,1292778856,0),(223,1,3,'moodle/question:useall',1,1292778856,0),(224,1,1,'moodle/question:useall',1,1292778856,0),(225,1,3,'moodle/question:movemine',1,1292778856,0),(226,1,1,'moodle/question:movemine',1,1292778856,0),(227,1,3,'moodle/question:moveall',1,1292778856,0),(228,1,1,'moodle/question:moveall',1,1292778856,0),(229,1,1,'moodle/question:config',1,1292778856,0),(230,1,5,'moodle/question:flag',1,1292778856,0),(231,1,4,'moodle/question:flag',1,1292778856,0),(232,1,3,'moodle/question:flag',1,1292778856,0),(233,1,2,'moodle/question:flag',1,1292778856,0),(234,1,1,'moodle/question:flag',1,1292778856,0),(235,1,4,'moodle/site:doclinks',1,1292778856,0),(236,1,3,'moodle/site:doclinks',1,1292778856,0),(237,1,1,'moodle/site:doclinks',1,1292778856,0),(238,1,3,'moodle/course:sectionvisibility',1,1292778856,0),(239,1,1,'moodle/course:sectionvisibility',1,1292778856,0),(240,1,3,'moodle/course:useremail',1,1292778856,0),(241,1,1,'moodle/course:useremail',1,1292778856,0),(242,1,3,'moodle/course:viewhiddensections',1,1292778856,0),(243,1,1,'moodle/course:viewhiddensections',1,1292778856,0),(244,1,3,'moodle/course:setcurrentsection',1,1292778856,0),(245,1,1,'moodle/course:setcurrentsection',1,1292778856,0),(246,1,4,'moodle/grade:viewall',1,1292778856,0),(247,1,3,'moodle/grade:viewall',1,1292778856,0),(248,1,1,'moodle/grade:viewall',1,1292778856,0),(249,1,5,'moodle/grade:view',1,1292778856,0),(250,1,4,'moodle/grade:viewhidden',1,1292778856,0),(251,1,3,'moodle/grade:viewhidden',1,1292778856,0),(252,1,1,'moodle/grade:viewhidden',1,1292778856,0),(253,1,3,'moodle/grade:import',1,1292778856,0),(254,1,1,'moodle/grade:import',1,1292778856,0),(255,1,4,'moodle/grade:export',1,1292778856,0),(256,1,3,'moodle/grade:export',1,1292778856,0),(257,1,1,'moodle/grade:export',1,1292778856,0),(258,1,3,'moodle/grade:manage',1,1292778856,0),(259,1,1,'moodle/grade:manage',1,1292778856,0),(260,1,3,'moodle/grade:edit',1,1292778856,0),(261,1,1,'moodle/grade:edit',1,1292778856,0),(262,1,3,'moodle/grade:manageoutcomes',1,1292778856,0),(263,1,1,'moodle/grade:manageoutcomes',1,1292778856,0),(264,1,3,'moodle/grade:manageletters',1,1292778856,0),(265,1,1,'moodle/grade:manageletters',1,1292778856,0),(266,1,3,'moodle/grade:hide',1,1292778856,0),(267,1,1,'moodle/grade:hide',1,1292778856,0),(268,1,3,'moodle/grade:lock',1,1292778856,0),(269,1,1,'moodle/grade:lock',1,1292778856,0),(270,1,3,'moodle/grade:unlock',1,1292778856,0),(271,1,1,'moodle/grade:unlock',1,1292778856,0),(272,1,7,'moodle/my:manageblocks',1,1292778856,0),(273,1,4,'moodle/notes:view',1,1292778856,0),(274,1,3,'moodle/notes:view',1,1292778856,0),(275,1,1,'moodle/notes:view',1,1292778856,0),(276,1,4,'moodle/notes:manage',1,1292778856,0),(277,1,3,'moodle/notes:manage',1,1292778856,0),(278,1,1,'moodle/notes:manage',1,1292778856,0),(279,1,4,'moodle/tag:manage',1,1292778856,0),(280,1,3,'moodle/tag:manage',1,1292778856,0),(281,1,1,'moodle/tag:manage',1,1292778856,0),(282,1,1,'moodle/tag:create',1,1292778856,0),(283,1,7,'moodle/tag:create',1,1292778856,0),(284,1,1,'moodle/tag:edit',1,1292778856,0),(285,1,7,'moodle/tag:edit',1,1292778856,0),(286,1,4,'moodle/tag:editblocks',1,1292778856,0),(287,1,3,'moodle/tag:editblocks',1,1292778856,0),(288,1,1,'moodle/tag:editblocks',1,1292778856,0),(289,1,6,'moodle/block:view',1,1292778856,0),(290,1,7,'moodle/block:view',1,1292778856,0),(291,1,5,'moodle/block:view',1,1292778856,0),(292,1,4,'moodle/block:view',1,1292778856,0),(293,1,3,'moodle/block:view',1,1292778856,0),(294,1,2,'moodle/block:view',1,1292778856,0),(295,1,3,'moodle/block:edit',1,1292778856,0),(296,1,2,'moodle/block:edit',1,1292778856,0),(297,1,7,'moodle/portfolio:export',1,1292778856,0),(298,1,5,'moodle/portfolio:export',1,1292778856,0),(299,1,4,'moodle/portfolio:export',1,1292778856,0),(300,1,3,'moodle/portfolio:export',1,1292778856,0),(301,1,2,'moodle/portfolio:export',1,1292778856,0),(302,1,7,'moodle/comment:view',1,1292778856,0),(303,1,5,'moodle/comment:view',1,1292778856,0),(304,1,4,'moodle/comment:view',1,1292778856,0),(305,1,3,'moodle/comment:view',1,1292778856,0),(306,1,2,'moodle/comment:view',1,1292778856,0),(307,1,1,'moodle/comment:view',1,1292778856,0),(308,1,7,'moodle/comment:post',1,1292778856,0),(309,1,5,'moodle/comment:post',1,1292778856,0),(310,1,4,'moodle/comment:post',1,1292778856,0),(311,1,3,'moodle/comment:post',1,1292778856,0),(312,1,2,'moodle/comment:post',1,1292778856,0),(313,1,1,'moodle/comment:post',1,1292778856,0),(314,1,3,'moodle/comment:delete',1,1292778856,0),(315,1,2,'moodle/comment:delete',1,1292778856,0),(316,1,1,'moodle/comment:delete',1,1292778856,0),(317,1,1,'moodle/webservice:createtoken',1,1292778856,0),(318,1,7,'moodle/rating:view',1,1292778856,0),(319,1,5,'moodle/rating:view',1,1292778856,0),(320,1,4,'moodle/rating:view',1,1292778856,0),(321,1,3,'moodle/rating:view',1,1292778856,0),(322,1,1,'moodle/rating:view',1,1292778856,0),(323,1,7,'moodle/rating:viewany',1,1292778856,0),(324,1,5,'moodle/rating:viewany',1,1292778856,0),(325,1,4,'moodle/rating:viewany',1,1292778856,0),(326,1,3,'moodle/rating:viewany',1,1292778856,0),(327,1,1,'moodle/rating:viewany',1,1292778856,0),(328,1,7,'moodle/rating:viewall',1,1292778856,0),(329,1,5,'moodle/rating:viewall',1,1292778856,0),(330,1,4,'moodle/rating:viewall',1,1292778856,0),(331,1,3,'moodle/rating:viewall',1,1292778856,0),(332,1,1,'moodle/rating:viewall',1,1292778856,0),(333,1,7,'moodle/rating:rate',1,1292778856,0),(334,1,5,'moodle/rating:rate',1,1292778856,0),(335,1,4,'moodle/rating:rate',1,1292778856,0),(336,1,3,'moodle/rating:rate',1,1292778856,0),(337,1,1,'moodle/rating:rate',1,1292778856,0),(338,1,1,'moodle/course:publish',1,1292778856,0),(339,1,4,'moodle/course:markcomplete',1,1292778856,0),(340,1,3,'moodle/course:markcomplete',1,1292778856,0),(341,1,2,'moodle/course:markcomplete',1,1292778856,0),(342,1,1,'moodle/course:markcomplete',1,1292778856,0),(343,1,1,'moodle/community:add',1,1292778856,0),(344,1,4,'moodle/community:add',1,1292778856,0),(345,1,3,'moodle/community:add',1,1292778856,0),(346,1,2,'moodle/community:add',1,1292778856,0),(347,1,1,'moodle/community:download',1,1292778856,0),(348,1,3,'moodle/community:download',1,1292778856,0),(349,1,2,'moodle/community:download',1,1292778856,0),(350,1,6,'mod/assignment:view',1,1292778856,0),(351,1,5,'mod/assignment:view',1,1292778856,0),(352,1,4,'mod/assignment:view',1,1292778856,0),(353,1,3,'mod/assignment:view',1,1292778856,0),(354,1,1,'mod/assignment:view',1,1292778856,0),(355,1,5,'mod/assignment:submit',1,1292778856,0),(356,1,4,'mod/assignment:grade',1,1292778856,0),(357,1,3,'mod/assignment:grade',1,1292778856,0),(358,1,1,'mod/assignment:grade',1,1292778856,0),(359,1,4,'mod/assignment:exportownsubmission',1,1292778856,0),(360,1,3,'mod/assignment:exportownsubmission',1,1292778856,0),(361,1,1,'mod/assignment:exportownsubmission',1,1292778856,0),(362,1,5,'mod/assignment:exportownsubmission',1,1292778856,0),(363,1,5,'mod/chat:chat',1,1292778857,0),(364,1,4,'mod/chat:chat',1,1292778857,0),(365,1,3,'mod/chat:chat',1,1292778857,0),(366,1,1,'mod/chat:chat',1,1292778857,0),(367,1,5,'mod/chat:readlog',1,1292778857,0),(368,1,4,'mod/chat:readlog',1,1292778857,0),(369,1,3,'mod/chat:readlog',1,1292778857,0),(370,1,1,'mod/chat:readlog',1,1292778857,0),(371,1,4,'mod/chat:deletelog',1,1292778857,0),(372,1,3,'mod/chat:deletelog',1,1292778857,0),(373,1,1,'mod/chat:deletelog',1,1292778857,0),(374,1,4,'mod/chat:exportparticipatedsession',1,1292778857,0),(375,1,3,'mod/chat:exportparticipatedsession',1,1292778857,0),(376,1,1,'mod/chat:exportparticipatedsession',1,1292778857,0),(377,1,4,'mod/chat:exportsession',1,1292778857,0),(378,1,3,'mod/chat:exportsession',1,1292778857,0),(379,1,1,'mod/chat:exportsession',1,1292778857,0),(380,1,5,'mod/choice:choose',1,1292778857,0),(381,1,4,'mod/choice:choose',1,1292778857,0),(382,1,3,'mod/choice:choose',1,1292778857,0),(383,1,4,'mod/choice:readresponses',1,1292778857,0),(384,1,3,'mod/choice:readresponses',1,1292778857,0),(385,1,1,'mod/choice:readresponses',1,1292778857,0),(386,1,4,'mod/choice:deleteresponses',1,1292778857,0),(387,1,3,'mod/choice:deleteresponses',1,1292778857,0),(388,1,1,'mod/choice:deleteresponses',1,1292778857,0),(389,1,4,'mod/choice:downloadresponses',1,1292778857,0),(390,1,3,'mod/choice:downloadresponses',1,1292778857,0),(391,1,1,'mod/choice:downloadresponses',1,1292778857,0),(392,1,8,'mod/data:viewentry',1,1292778857,0),(393,1,6,'mod/data:viewentry',1,1292778857,0),(394,1,5,'mod/data:viewentry',1,1292778857,0),(395,1,4,'mod/data:viewentry',1,1292778857,0),(396,1,3,'mod/data:viewentry',1,1292778857,0),(397,1,1,'mod/data:viewentry',1,1292778857,0),(398,1,5,'mod/data:writeentry',1,1292778857,0),(399,1,4,'mod/data:writeentry',1,1292778857,0),(400,1,3,'mod/data:writeentry',1,1292778857,0),(401,1,1,'mod/data:writeentry',1,1292778857,0),(402,1,5,'mod/data:comment',1,1292778857,0),(403,1,4,'mod/data:comment',1,1292778857,0),(404,1,3,'mod/data:comment',1,1292778857,0),(405,1,1,'mod/data:comment',1,1292778857,0),(406,1,4,'mod/data:rate',1,1292778857,0),(407,1,3,'mod/data:rate',1,1292778857,0),(408,1,1,'mod/data:rate',1,1292778857,0),(409,1,4,'mod/data:viewrating',1,1292778857,0),(410,1,3,'mod/data:viewrating',1,1292778857,0),(411,1,1,'mod/data:viewrating',1,1292778857,0),(412,1,4,'mod/data:viewanyrating',1,1292778857,0),(413,1,3,'mod/data:viewanyrating',1,1292778857,0),(414,1,1,'mod/data:viewanyrating',1,1292778857,0),(415,1,4,'mod/data:viewallratings',1,1292778857,0),(416,1,3,'mod/data:viewallratings',1,1292778857,0),(417,1,1,'mod/data:viewallratings',1,1292778857,0),(418,1,4,'mod/data:approve',1,1292778857,0),(419,1,3,'mod/data:approve',1,1292778857,0),(420,1,1,'mod/data:approve',1,1292778857,0),(421,1,4,'mod/data:manageentries',1,1292778857,0),(422,1,3,'mod/data:manageentries',1,1292778857,0),(423,1,1,'mod/data:manageentries',1,1292778857,0),(424,1,4,'mod/data:managecomments',1,1292778857,0),(425,1,3,'mod/data:managecomments',1,1292778857,0),(426,1,1,'mod/data:managecomments',1,1292778857,0),(427,1,3,'mod/data:managetemplates',1,1292778857,0),(428,1,1,'mod/data:managetemplates',1,1292778857,0),(429,1,4,'mod/data:viewalluserpresets',1,1292778857,0),(430,1,3,'mod/data:viewalluserpresets',1,1292778857,0),(431,1,1,'mod/data:viewalluserpresets',1,1292778857,0),(432,1,1,'mod/data:manageuserpresets',1,1292778857,0),(433,1,1,'mod/data:exportentry',1,1292778857,0),(434,1,4,'mod/data:exportentry',1,1292778857,0),(435,1,3,'mod/data:exportentry',1,1292778857,0),(436,1,1,'mod/data:exportownentry',1,1292778857,0),(437,1,4,'mod/data:exportownentry',1,1292778857,0),(438,1,3,'mod/data:exportownentry',1,1292778857,0),(439,1,5,'mod/data:exportownentry',1,1292778857,0),(440,1,1,'mod/data:exportallentries',1,1292778857,0),(441,1,4,'mod/data:exportallentries',1,1292778857,0),(442,1,3,'mod/data:exportallentries',1,1292778857,0),(443,1,6,'mod/feedback:view',1,1292778858,0),(444,1,5,'mod/feedback:view',1,1292778858,0),(445,1,4,'mod/feedback:view',1,1292778858,0),(446,1,3,'mod/feedback:view',1,1292778858,0),(447,1,1,'mod/feedback:view',1,1292778858,0),(448,1,5,'mod/feedback:complete',1,1292778858,0),(449,1,5,'mod/feedback:viewanalysepage',1,1292778858,0),(450,1,3,'mod/feedback:viewanalysepage',1,1292778858,0),(451,1,1,'mod/feedback:viewanalysepage',1,1292778858,0),(452,1,3,'mod/feedback:deletesubmissions',1,1292778858,0),(453,1,1,'mod/feedback:deletesubmissions',1,1292778858,0),(454,1,1,'mod/feedback:mapcourse',1,1292778858,0),(455,1,3,'mod/feedback:edititems',1,1292778858,0),(456,1,1,'mod/feedback:edititems',1,1292778858,0),(457,1,3,'mod/feedback:createprivatetemplate',1,1292778858,0),(458,1,1,'mod/feedback:createprivatetemplate',1,1292778858,0),(459,1,3,'mod/feedback:createpublictemplate',1,1292778858,0),(460,1,1,'mod/feedback:createpublictemplate',1,1292778858,0),(461,1,3,'mod/feedback:deletetemplate',1,1292778858,0),(462,1,1,'mod/feedback:deletetemplate',1,1292778858,0),(463,1,4,'mod/feedback:viewreports',1,1292778858,0),(464,1,3,'mod/feedback:viewreports',1,1292778858,0),(465,1,1,'mod/feedback:viewreports',1,1292778858,0),(466,1,4,'mod/feedback:receivemail',1,1292778858,0),(467,1,3,'mod/feedback:receivemail',1,1292778858,0),(468,1,6,'mod/folder:view',1,1292778858,0),(469,1,7,'mod/folder:view',1,1292778858,0),(470,1,3,'mod/folder:managefiles',1,1292778858,0),(471,1,8,'mod/forum:viewdiscussion',1,1292778858,0),(472,1,6,'mod/forum:viewdiscussion',1,1292778858,0),(473,1,5,'mod/forum:viewdiscussion',1,1292778858,0),(474,1,4,'mod/forum:viewdiscussion',1,1292778858,0),(475,1,3,'mod/forum:viewdiscussion',1,1292778858,0),(476,1,1,'mod/forum:viewdiscussion',1,1292778858,0),(477,1,4,'mod/forum:viewhiddentimedposts',1,1292778858,0),(478,1,3,'mod/forum:viewhiddentimedposts',1,1292778858,0),(479,1,1,'mod/forum:viewhiddentimedposts',1,1292778858,0),(480,1,5,'mod/forum:startdiscussion',1,1292778858,0),(481,1,4,'mod/forum:startdiscussion',1,1292778858,0),(482,1,3,'mod/forum:startdiscussion',1,1292778858,0),(483,1,1,'mod/forum:startdiscussion',1,1292778858,0),(484,1,5,'mod/forum:replypost',1,1292778858,0),(485,1,4,'mod/forum:replypost',1,1292778858,0),(486,1,3,'mod/forum:replypost',1,1292778858,0),(487,1,1,'mod/forum:replypost',1,1292778858,0),(488,1,4,'mod/forum:addnews',1,1292778858,0),(489,1,3,'mod/forum:addnews',1,1292778858,0),(490,1,1,'mod/forum:addnews',1,1292778858,0),(491,1,4,'mod/forum:replynews',1,1292778858,0),(492,1,3,'mod/forum:replynews',1,1292778858,0),(493,1,1,'mod/forum:replynews',1,1292778858,0),(494,1,5,'mod/forum:viewrating',1,1292778858,0),(495,1,4,'mod/forum:viewrating',1,1292778858,0),(496,1,3,'mod/forum:viewrating',1,1292778858,0),(497,1,1,'mod/forum:viewrating',1,1292778858,0),(498,1,4,'mod/forum:viewanyrating',1,1292778858,0),(499,1,3,'mod/forum:viewanyrating',1,1292778858,0),(500,1,1,'mod/forum:viewanyrating',1,1292778858,0),(501,1,4,'mod/forum:viewallratings',1,1292778858,0),(502,1,3,'mod/forum:viewallratings',1,1292778858,0),(503,1,1,'mod/forum:viewallratings',1,1292778858,0),(504,1,4,'mod/forum:rate',1,1292778858,0),(505,1,3,'mod/forum:rate',1,1292778858,0),(506,1,1,'mod/forum:rate',1,1292778858,0),(507,1,5,'mod/forum:createattachment',1,1292778858,0),(508,1,4,'mod/forum:createattachment',1,1292778858,0),(509,1,3,'mod/forum:createattachment',1,1292778858,0),(510,1,1,'mod/forum:createattachment',1,1292778858,0),(511,1,5,'mod/forum:deleteownpost',1,1292778858,0),(512,1,4,'mod/forum:deleteownpost',1,1292778858,0),(513,1,3,'mod/forum:deleteownpost',1,1292778858,0),(514,1,1,'mod/forum:deleteownpost',1,1292778858,0),(515,1,4,'mod/forum:deleteanypost',1,1292778858,0),(516,1,3,'mod/forum:deleteanypost',1,1292778858,0),(517,1,1,'mod/forum:deleteanypost',1,1292778858,0),(518,1,4,'mod/forum:splitdiscussions',1,1292778858,0),(519,1,3,'mod/forum:splitdiscussions',1,1292778858,0),(520,1,1,'mod/forum:splitdiscussions',1,1292778858,0),(521,1,4,'mod/forum:movediscussions',1,1292778858,0),(522,1,3,'mod/forum:movediscussions',1,1292778858,0),(523,1,1,'mod/forum:movediscussions',1,1292778858,0),(524,1,4,'mod/forum:editanypost',1,1292778858,0),(525,1,3,'mod/forum:editanypost',1,1292778858,0),(526,1,1,'mod/forum:editanypost',1,1292778858,0),(527,1,4,'mod/forum:viewqandawithoutposting',1,1292778858,0),(528,1,3,'mod/forum:viewqandawithoutposting',1,1292778858,0),(529,1,1,'mod/forum:viewqandawithoutposting',1,1292778858,0),(530,1,4,'mod/forum:viewsubscribers',1,1292778858,0),(531,1,3,'mod/forum:viewsubscribers',1,1292778858,0),(532,1,1,'mod/forum:viewsubscribers',1,1292778858,0),(533,1,4,'mod/forum:managesubscriptions',1,1292778858,0),(534,1,3,'mod/forum:managesubscriptions',1,1292778858,0),(535,1,1,'mod/forum:managesubscriptions',1,1292778858,0),(536,1,4,'mod/forum:initialsubscriptions',1,1292778858,0),(537,1,3,'mod/forum:initialsubscriptions',1,1292778858,0),(538,1,5,'mod/forum:initialsubscriptions',1,1292778858,0),(539,1,4,'mod/forum:postwithoutthrottling',1,1292778858,0),(540,1,3,'mod/forum:postwithoutthrottling',1,1292778858,0),(541,1,1,'mod/forum:postwithoutthrottling',1,1292778858,0),(542,1,4,'mod/forum:exportdiscussion',1,1292778858,0),(543,1,3,'mod/forum:exportdiscussion',1,1292778858,0),(544,1,1,'mod/forum:exportdiscussion',1,1292778858,0),(545,1,4,'mod/forum:exportpost',1,1292778858,0),(546,1,3,'mod/forum:exportpost',1,1292778858,0),(547,1,1,'mod/forum:exportpost',1,1292778858,0),(548,1,4,'mod/forum:exportownpost',1,1292778858,0),(549,1,3,'mod/forum:exportownpost',1,1292778858,0),(550,1,1,'mod/forum:exportownpost',1,1292778858,0),(551,1,5,'mod/forum:exportownpost',1,1292778858,0),(552,1,5,'mod/glossary:write',1,1292778859,0),(553,1,4,'mod/glossary:write',1,1292778859,0),(554,1,3,'mod/glossary:write',1,1292778859,0),(555,1,1,'mod/glossary:write',1,1292778859,0),(556,1,4,'mod/glossary:manageentries',1,1292778859,0),(557,1,3,'mod/glossary:manageentries',1,1292778859,0),(558,1,1,'mod/glossary:manageentries',1,1292778859,0),(559,1,4,'mod/glossary:managecategories',1,1292778859,0),(560,1,3,'mod/glossary:managecategories',1,1292778859,0),(561,1,1,'mod/glossary:managecategories',1,1292778859,0),(562,1,5,'mod/glossary:comment',1,1292778859,0),(563,1,4,'mod/glossary:comment',1,1292778859,0),(564,1,3,'mod/glossary:comment',1,1292778859,0),(565,1,1,'mod/glossary:comment',1,1292778859,0),(566,1,4,'mod/glossary:managecomments',1,1292778859,0),(567,1,3,'mod/glossary:managecomments',1,1292778859,0),(568,1,1,'mod/glossary:managecomments',1,1292778859,0),(569,1,4,'mod/glossary:import',1,1292778859,0),(570,1,3,'mod/glossary:import',1,1292778859,0),(571,1,1,'mod/glossary:import',1,1292778859,0),(572,1,4,'mod/glossary:export',1,1292778859,0),(573,1,3,'mod/glossary:export',1,1292778859,0),(574,1,1,'mod/glossary:export',1,1292778859,0),(575,1,4,'mod/glossary:approve',1,1292778859,0),(576,1,3,'mod/glossary:approve',1,1292778859,0),(577,1,1,'mod/glossary:approve',1,1292778859,0),(578,1,4,'mod/glossary:rate',1,1292778859,0),(579,1,3,'mod/glossary:rate',1,1292778859,0),(580,1,1,'mod/glossary:rate',1,1292778859,0),(581,1,4,'mod/glossary:viewrating',1,1292778859,0),(582,1,3,'mod/glossary:viewrating',1,1292778859,0),(583,1,1,'mod/glossary:viewrating',1,1292778859,0),(584,1,4,'mod/glossary:viewanyrating',1,1292778859,0),(585,1,3,'mod/glossary:viewanyrating',1,1292778859,0),(586,1,1,'mod/glossary:viewanyrating',1,1292778859,0),(587,1,4,'mod/glossary:viewallratings',1,1292778859,0),(588,1,3,'mod/glossary:viewallratings',1,1292778859,0),(589,1,1,'mod/glossary:viewallratings',1,1292778859,0),(590,1,4,'mod/glossary:exportentry',1,1292778859,0),(591,1,3,'mod/glossary:exportentry',1,1292778859,0),(592,1,1,'mod/glossary:exportentry',1,1292778859,0),(593,1,4,'mod/glossary:exportownentry',1,1292778859,0),(594,1,3,'mod/glossary:exportownentry',1,1292778859,0),(595,1,1,'mod/glossary:exportownentry',1,1292778859,0),(596,1,5,'mod/glossary:exportownentry',1,1292778859,0),(597,1,6,'mod/imscp:view',1,1292778859,0),(598,1,7,'mod/imscp:view',1,1292778859,0),(599,1,3,'mod/lesson:edit',1,1292778860,0),(600,1,1,'mod/lesson:edit',1,1292778860,0),(601,1,4,'mod/lesson:manage',1,1292778860,0),(602,1,3,'mod/lesson:manage',1,1292778860,0),(603,1,1,'mod/lesson:manage',1,1292778860,0),(604,1,6,'mod/page:view',1,1292778860,0),(605,1,7,'mod/page:view',1,1292778860,0),(606,1,6,'mod/quiz:view',1,1292778860,0),(607,1,5,'mod/quiz:view',1,1292778860,0),(608,1,4,'mod/quiz:view',1,1292778860,0),(609,1,3,'mod/quiz:view',1,1292778860,0),(610,1,1,'mod/quiz:view',1,1292778860,0),(611,1,5,'mod/quiz:attempt',1,1292778860,0),(612,1,5,'mod/quiz:reviewmyattempts',1,1292778860,0),(613,1,3,'mod/quiz:manage',1,1292778860,0),(614,1,1,'mod/quiz:manage',1,1292778860,0),(615,1,3,'mod/quiz:manageoverrides',1,1292778860,0),(616,1,1,'mod/quiz:manageoverrides',1,1292778860,0),(617,1,4,'mod/quiz:preview',1,1292778860,0),(618,1,3,'mod/quiz:preview',1,1292778860,0),(619,1,1,'mod/quiz:preview',1,1292778860,0),(620,1,4,'mod/quiz:grade',1,1292778860,0),(621,1,3,'mod/quiz:grade',1,1292778860,0),(622,1,1,'mod/quiz:grade',1,1292778860,0),(623,1,4,'mod/quiz:regrade',1,1292778860,0),(624,1,3,'mod/quiz:regrade',1,1292778860,0),(625,1,1,'mod/quiz:regrade',1,1292778860,0),(626,1,4,'mod/quiz:viewreports',1,1292778860,0),(627,1,3,'mod/quiz:viewreports',1,1292778860,0),(628,1,1,'mod/quiz:viewreports',1,1292778860,0),(629,1,3,'mod/quiz:deleteattempts',1,1292778860,0),(630,1,1,'mod/quiz:deleteattempts',1,1292778860,0),(631,1,6,'mod/resource:view',1,1292778860,0),(632,1,7,'mod/resource:view',1,1292778860,0),(633,1,4,'mod/scorm:viewreport',1,1292778861,0),(634,1,3,'mod/scorm:viewreport',1,1292778861,0),(635,1,1,'mod/scorm:viewreport',1,1292778861,0),(636,1,5,'mod/scorm:skipview',1,1292778861,0),(637,1,5,'mod/scorm:savetrack',1,1292778861,0),(638,1,4,'mod/scorm:savetrack',1,1292778861,0),(639,1,3,'mod/scorm:savetrack',1,1292778861,0),(640,1,1,'mod/scorm:savetrack',1,1292778861,0),(641,1,5,'mod/scorm:viewscores',1,1292778861,0),(642,1,4,'mod/scorm:viewscores',1,1292778861,0),(643,1,3,'mod/scorm:viewscores',1,1292778861,0),(644,1,1,'mod/scorm:viewscores',1,1292778861,0),(645,1,4,'mod/scorm:deleteresponses',1,1292778861,0),(646,1,3,'mod/scorm:deleteresponses',1,1292778861,0),(647,1,1,'mod/scorm:deleteresponses',1,1292778861,0),(648,1,5,'mod/survey:participate',1,1292778861,0),(649,1,4,'mod/survey:participate',1,1292778861,0),(650,1,3,'mod/survey:participate',1,1292778861,0),(651,1,1,'mod/survey:participate',1,1292778861,0),(652,1,4,'mod/survey:readresponses',1,1292778861,0),(653,1,3,'mod/survey:readresponses',1,1292778861,0),(654,1,1,'mod/survey:readresponses',1,1292778861,0),(655,1,4,'mod/survey:download',1,1292778861,0),(656,1,3,'mod/survey:download',1,1292778861,0),(657,1,1,'mod/survey:download',1,1292778861,0),(658,1,6,'mod/url:view',1,1292778862,0),(659,1,7,'mod/url:view',1,1292778862,0),(660,1,6,'mod/wiki:viewpage',1,1292778862,0),(661,1,5,'mod/wiki:viewpage',1,1292778862,0),(662,1,4,'mod/wiki:viewpage',1,1292778862,0),(663,1,3,'mod/wiki:viewpage',1,1292778862,0),(664,1,1,'mod/wiki:viewpage',1,1292778862,0),(665,1,5,'mod/wiki:editpage',1,1292778862,0),(666,1,4,'mod/wiki:editpage',1,1292778862,0),(667,1,3,'mod/wiki:editpage',1,1292778862,0),(668,1,1,'mod/wiki:editpage',1,1292778862,0),(669,1,5,'mod/wiki:createpage',1,1292778862,0),(670,1,4,'mod/wiki:createpage',1,1292778862,0),(671,1,3,'mod/wiki:createpage',1,1292778862,0),(672,1,1,'mod/wiki:createpage',1,1292778862,0),(673,1,5,'mod/wiki:viewcomment',1,1292778862,0),(674,1,4,'mod/wiki:viewcomment',1,1292778862,0),(675,1,3,'mod/wiki:viewcomment',1,1292778862,0),(676,1,1,'mod/wiki:viewcomment',1,1292778862,0),(677,1,5,'mod/wiki:editcomment',1,1292778862,0),(678,1,4,'mod/wiki:editcomment',1,1292778862,0),(679,1,3,'mod/wiki:editcomment',1,1292778862,0),(680,1,1,'mod/wiki:editcomment',1,1292778862,0),(681,1,4,'mod/wiki:managecomment',1,1292778862,0),(682,1,3,'mod/wiki:managecomment',1,1292778862,0),(683,1,1,'mod/wiki:managecomment',1,1292778862,0),(684,1,4,'mod/wiki:overridelock',1,1292778862,0),(685,1,3,'mod/wiki:overridelock',1,1292778862,0),(686,1,1,'mod/wiki:overridelock',1,1292778862,0),(687,1,4,'mod/wiki:managewiki',1,1292778862,0),(688,1,3,'mod/wiki:managewiki',1,1292778862,0),(689,1,1,'mod/wiki:managewiki',1,1292778862,0),(690,1,6,'mod/workshop:view',1,1292778863,0),(691,1,5,'mod/workshop:view',1,1292778863,0),(692,1,4,'mod/workshop:view',1,1292778863,0),(693,1,3,'mod/workshop:view',1,1292778863,0),(694,1,1,'mod/workshop:view',1,1292778863,0),(695,1,4,'mod/workshop:switchphase',1,1292778863,0),(696,1,3,'mod/workshop:switchphase',1,1292778863,0),(697,1,1,'mod/workshop:switchphase',1,1292778863,0),(698,1,3,'mod/workshop:editdimensions',1,1292778863,0),(699,1,1,'mod/workshop:editdimensions',1,1292778863,0),(700,1,5,'mod/workshop:submit',1,1292778863,0),(701,1,5,'mod/workshop:peerassess',1,1292778863,0),(702,1,4,'mod/workshop:manageexamples',1,1292778863,0),(703,1,3,'mod/workshop:manageexamples',1,1292778863,0),(704,1,1,'mod/workshop:manageexamples',1,1292778863,0),(705,1,4,'mod/workshop:allocate',1,1292778863,0),(706,1,3,'mod/workshop:allocate',1,1292778863,0),(707,1,1,'mod/workshop:allocate',1,1292778863,0),(708,1,4,'mod/workshop:publishsubmissions',1,1292778863,0),(709,1,3,'mod/workshop:publishsubmissions',1,1292778863,0),(710,1,1,'mod/workshop:publishsubmissions',1,1292778863,0),(711,1,5,'mod/workshop:viewauthornames',1,1292778863,0),(712,1,4,'mod/workshop:viewauthornames',1,1292778863,0),(713,1,3,'mod/workshop:viewauthornames',1,1292778863,0),(714,1,1,'mod/workshop:viewauthornames',1,1292778863,0),(715,1,4,'mod/workshop:viewreviewernames',1,1292778863,0),(716,1,3,'mod/workshop:viewreviewernames',1,1292778863,0),(717,1,1,'mod/workshop:viewreviewernames',1,1292778863,0),(718,1,4,'mod/workshop:viewallsubmissions',1,1292778863,0),(719,1,3,'mod/workshop:viewallsubmissions',1,1292778863,0),(720,1,1,'mod/workshop:viewallsubmissions',1,1292778863,0),(721,1,5,'mod/workshop:viewpublishedsubmissions',1,1292778863,0),(722,1,4,'mod/workshop:viewpublishedsubmissions',1,1292778863,0),(723,1,3,'mod/workshop:viewpublishedsubmissions',1,1292778863,0),(724,1,1,'mod/workshop:viewpublishedsubmissions',1,1292778863,0),(725,1,4,'mod/workshop:viewallassessments',1,1292778863,0),(726,1,3,'mod/workshop:viewallassessments',1,1292778863,0),(727,1,1,'mod/workshop:viewallassessments',1,1292778863,0),(728,1,4,'mod/workshop:overridegrades',1,1292778863,0),(729,1,3,'mod/workshop:overridegrades',1,1292778863,0),(730,1,1,'mod/workshop:overridegrades',1,1292778863,0),(731,1,1,'enrol/authorize:config',1,1292778863,0),(732,1,1,'enrol/authorize:manage',1,1292778863,0),(733,1,3,'enrol/authorize:manage',1,1292778863,0),(734,1,1,'enrol/authorize:unenrol',1,1292778863,0),(735,1,1,'enrol/authorize:managepayments',1,1292778863,0),(736,1,1,'enrol/authorize:uploadcsv',1,1292778863,0),(737,1,3,'enrol/cohort:config',1,1292778864,0),(738,1,1,'enrol/cohort:config',1,1292778864,0),(739,1,1,'enrol/guest:config',1,1292778864,0),(740,1,3,'enrol/guest:config',1,1292778864,0),(741,1,1,'enrol/ldap:manage',1,1292778864,0),(742,1,1,'enrol/manual:config',1,1292778864,0),(743,1,1,'enrol/manual:enrol',1,1292778864,0),(744,1,3,'enrol/manual:enrol',1,1292778864,0),(745,1,1,'enrol/manual:manage',1,1292778864,0),(746,1,3,'enrol/manual:manage',1,1292778864,0),(747,1,1,'enrol/manual:unenrol',1,1292778864,0),(748,1,3,'enrol/manual:unenrol',1,1292778864,0),(749,1,1,'enrol/meta:config',1,1292778864,0),(750,1,3,'enrol/meta:config',1,1292778864,0),(751,1,1,'enrol/meta:selectaslinked',1,1292778864,0),(752,1,1,'enrol/paypal:config',1,1292778864,0),(753,1,1,'enrol/paypal:manage',1,1292778864,0),(754,1,3,'enrol/paypal:manage',1,1292778864,0),(755,1,1,'enrol/paypal:unenrol',1,1292778864,0),(756,1,3,'enrol/self:config',1,1292778864,0),(757,1,1,'enrol/self:config',1,1292778864,0),(758,1,3,'enrol/self:manage',1,1292778864,0),(759,1,1,'enrol/self:manage',1,1292778864,0),(760,1,5,'enrol/self:unenrolself',1,1292778864,0),(761,1,3,'enrol/self:unenrol',1,1292778864,0),(762,1,1,'enrol/self:unenrol',1,1292778864,0),(763,1,7,'block/online_users:viewlist',1,1292778865,0),(764,1,6,'block/online_users:viewlist',1,1292778865,0),(765,1,5,'block/online_users:viewlist',1,1292778865,0),(766,1,4,'block/online_users:viewlist',1,1292778865,0),(767,1,3,'block/online_users:viewlist',1,1292778865,0),(768,1,1,'block/online_users:viewlist',1,1292778865,0),(769,1,4,'block/rss_client:manageownfeeds',1,1292778865,0),(770,1,3,'block/rss_client:manageownfeeds',1,1292778865,0),(771,1,1,'block/rss_client:manageownfeeds',1,1292778865,0),(772,1,1,'block/rss_client:manageanyfeeds',1,1292778865,0),(773,1,4,'report/courseoverview:view',1,1292778866,0),(774,1,3,'report/courseoverview:view',1,1292778866,0),(775,1,1,'report/courseoverview:view',1,1292778866,0),(776,1,1,'report/customlang:view',1,1292778866,0),(777,1,1,'report/customlang:edit',1,1292778866,0),(778,1,1,'report/questioninstances:view',1,1292778866,0),(779,1,1,'report/security:view',1,1292778866,0),(780,1,1,'report/unittest:view',1,1292778866,0),(781,1,4,'coursereport/completion:view',1,1292778866,0),(782,1,3,'coursereport/completion:view',1,1292778866,0),(783,1,1,'coursereport/completion:view',1,1292778866,0),(784,1,4,'coursereport/log:view',1,1292778866,0),(785,1,3,'coursereport/log:view',1,1292778866,0),(786,1,1,'coursereport/log:view',1,1292778866,0),(787,1,4,'coursereport/log:viewlive',1,1292778866,0),(788,1,3,'coursereport/log:viewlive',1,1292778866,0),(789,1,1,'coursereport/log:viewlive',1,1292778866,0),(790,1,4,'coursereport/log:viewtoday',1,1292778866,0),(791,1,3,'coursereport/log:viewtoday',1,1292778866,0),(792,1,1,'coursereport/log:viewtoday',1,1292778866,0),(793,1,4,'coursereport/outline:view',1,1292778866,0),(794,1,3,'coursereport/outline:view',1,1292778866,0),(795,1,1,'coursereport/outline:view',1,1292778866,0),(796,1,4,'coursereport/participation:view',1,1292778866,0),(797,1,3,'coursereport/participation:view',1,1292778866,0),(798,1,1,'coursereport/participation:view',1,1292778866,0),(799,1,4,'coursereport/progress:view',1,1292778866,0),(800,1,3,'coursereport/progress:view',1,1292778866,0),(801,1,1,'coursereport/progress:view',1,1292778866,0),(802,1,4,'coursereport/stats:view',1,1292778866,0),(803,1,3,'coursereport/stats:view',1,1292778866,0),(804,1,1,'coursereport/stats:view',1,1292778866,0),(805,1,4,'gradeexport/ods:view',1,1292778866,0),(806,1,3,'gradeexport/ods:view',1,1292778866,0),(807,1,1,'gradeexport/ods:view',1,1292778866,0),(808,1,1,'gradeexport/ods:publish',1,1292778866,0),(809,1,4,'gradeexport/txt:view',1,1292778866,0),(810,1,3,'gradeexport/txt:view',1,1292778866,0),(811,1,1,'gradeexport/txt:view',1,1292778866,0),(812,1,1,'gradeexport/txt:publish',1,1292778866,0),(813,1,4,'gradeexport/xls:view',1,1292778866,0),(814,1,3,'gradeexport/xls:view',1,1292778866,0),(815,1,1,'gradeexport/xls:view',1,1292778866,0),(816,1,1,'gradeexport/xls:publish',1,1292778866,0),(817,1,4,'gradeexport/xml:view',1,1292778866,0),(818,1,3,'gradeexport/xml:view',1,1292778866,0),(819,1,1,'gradeexport/xml:view',1,1292778866,0),(820,1,1,'gradeexport/xml:publish',1,1292778866,0),(821,1,3,'gradeimport/csv:view',1,1292778866,0),(822,1,1,'gradeimport/csv:view',1,1292778866,0),(823,1,3,'gradeimport/xml:view',1,1292778866,0),(824,1,1,'gradeimport/xml:view',1,1292778866,0),(825,1,1,'gradeimport/xml:publish',1,1292778866,0),(826,1,4,'gradereport/grader:view',1,1292778866,0),(827,1,3,'gradereport/grader:view',1,1292778866,0),(828,1,1,'gradereport/grader:view',1,1292778866,0),(829,1,4,'gradereport/outcomes:view',1,1292778867,0),(830,1,3,'gradereport/outcomes:view',1,1292778867,0),(831,1,1,'gradereport/outcomes:view',1,1292778867,0),(832,1,5,'gradereport/overview:view',1,1292778867,0),(833,1,1,'gradereport/overview:view',1,1292778867,0),(834,1,5,'gradereport/user:view',1,1292778867,0),(835,1,4,'gradereport/user:view',1,1292778867,0),(836,1,3,'gradereport/user:view',1,1292778867,0),(837,1,1,'gradereport/user:view',1,1292778867,0),(838,1,7,'repository/alfresco:view',1,1292778867,0),(839,1,7,'repository/boxnet:view',1,1292778867,0),(840,1,7,'repository/coursefiles:view',1,1292778867,0),(841,1,7,'repository/dropbox:view',1,1292778867,0),(842,1,7,'repository/filesystem:view',1,1292778867,0),(843,1,7,'repository/flickr:view',1,1292778867,0),(844,1,7,'repository/flickr_public:view',1,1292778867,0),(845,1,7,'repository/googledocs:view',1,1292778867,0),(846,1,7,'repository/local:view',1,1292778867,0),(847,1,7,'repository/merlot:view',1,1292778867,0),(848,1,7,'repository/picasa:view',1,1292778867,0),(849,1,7,'repository/recent:view',1,1292778867,0),(850,1,7,'repository/s3:view',1,1292778867,0),(851,1,7,'repository/upload:view',1,1292778867,0),(852,1,7,'repository/url:view',1,1292778867,0),(853,1,7,'repository/user:view',1,1292778868,0),(854,1,7,'repository/webdav:view',1,1292778868,0),(855,1,7,'repository/wikimedia:view',1,1292778868,0),(856,1,7,'repository/youtube:view',1,1292778868,0),(857,1,4,'quizreport/statistics:view',1,1292778869,0),(858,1,3,'quizreport/statistics:view',1,1292778869,0),(859,1,1,'quizreport/statistics:view',1,1292778869,0);
/*!40000 ALTER TABLE `role_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_context_levels`
--

DROP TABLE IF EXISTS `role_context_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_context_levels` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL,
  `contextlevel` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Lists which roles can be assigned at which context levels. T';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_context_levels`
--

LOCK TABLES `role_context_levels` WRITE;
/*!40000 ALTER TABLE `role_context_levels` DISABLE KEYS */;
INSERT INTO `role_context_levels` VALUES (1,1,10),(4,2,10),(2,1,40),(5,2,40),(3,1,50),(6,3,50),(8,4,50),(10,5,50),(7,3,70),(9,4,70),(11,5,70);
/*!40000 ALTER TABLE `role_context_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_names`
--

DROP TABLE IF EXISTS `role_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_names` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `contextid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `rolename_rol_ix` (`roleid`),
  KEY `rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role names in native strings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_names`
--

LOCK TABLES `role_names` WRITE;
/*!40000 ALTER TABLE `role_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_sortorder`
--

DROP TABLE IF EXISTS `role_sortorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_sortorder` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `roleid` bigint(10) unsigned NOT NULL,
  `contextid` bigint(10) unsigned NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `rolesort_use_ix` (`userid`),
  KEY `rolesort_rol_ix` (`roleid`),
  KEY `rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sort order of course managers in a course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_sortorder`
--

LOCK TABLES `role_sortorder` WRITE;
/*!40000 ALTER TABLE `role_sortorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_sortorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scale`
--

DROP TABLE IF EXISTS `scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scale` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` text NOT NULL,
  `description` text NOT NULL,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `scal_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines grading scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scale`
--

LOCK TABLES `scale` WRITE;
/*!40000 ALTER TABLE `scale` DISABLE KEYS */;
/*!40000 ALTER TABLE `scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scale_history`
--

DROP TABLE IF EXISTS `scale_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scale_history` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` bigint(10) unsigned NOT NULL DEFAULT '0',
  `oldid` bigint(10) unsigned NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  `loggeduser` bigint(10) unsigned DEFAULT NULL,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scalhist_act_ix` (`action`),
  KEY `scalhist_old_ix` (`oldid`),
  KEY `scalhist_cou_ix` (`courseid`),
  KEY `scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scale_history`
--

LOCK TABLES `scale_history` WRITE;
/*!40000 ALTER TABLE `scale_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `scale_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorm`
--

DROP TABLE IF EXISTS `scorm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorm` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scormtype` varchar(50) NOT NULL DEFAULT 'local',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `version` varchar(9) NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` bigint(10) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) DEFAULT NULL,
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `revision` bigint(10) unsigned NOT NULL DEFAULT '0',
  `launch` bigint(10) unsigned NOT NULL DEFAULT '0',
  `skipview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `hidenav` tinyint(1) NOT NULL DEFAULT '0',
  `auto` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `popup` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `width` bigint(10) unsigned NOT NULL DEFAULT '100',
  `height` bigint(10) unsigned NOT NULL DEFAULT '600',
  `timeopen` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeclose` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorm`
--

LOCK TABLES `scorm` WRITE;
/*!40000 ALTER TABLE `scorm` DISABLE KEYS */;
/*!40000 ALTER TABLE `scorm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorm_scoes`
--

DROP TABLE IF EXISTS `scorm_scoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorm_scoes` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) unsigned NOT NULL DEFAULT '0',
  `manifest` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `parent` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `launch` text NOT NULL,
  `scormtype` varchar(5) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorm_scoes`
--

LOCK TABLES `scorm_scoes` WRITE;
/*!40000 ALTER TABLE `scorm_scoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `scorm_scoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorm_scoes_data`
--

DROP TABLE IF EXISTS `scorm_scoes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorm_scoes_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorm_scoes_data`
--

LOCK TABLES `scorm_scoes_data` WRITE;
/*!40000 ALTER TABLE `scorm_scoes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `scorm_scoes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorm_scoes_track`
--

DROP TABLE IF EXISTS `scorm_scoes_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorm_scoes_track` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `attempt` bigint(10) unsigned NOT NULL DEFAULT '1',
  `element` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scorscoetrac_usescoscoatte_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `scorscoetrac_use_ix` (`userid`),
  KEY `scorscoetrac_ele_ix` (`element`),
  KEY `scorscoetrac_sco_ix` (`scormid`),
  KEY `scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to track SCOes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorm_scoes_track`
--

LOCK TABLES `scorm_scoes_track` WRITE;
/*!40000 ALTER TABLE `scorm_scoes_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `scorm_scoes_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorm_seq_mapinfo`
--

DROP TABLE IF EXISTS `scorm_seq_mapinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorm_seq_mapinfo` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `scorseqmapi_sco_ix` (`scoid`),
  KEY `scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorm_seq_mapinfo`
--

LOCK TABLES `scorm_seq_mapinfo` WRITE;
/*!40000 ALTER TABLE `scorm_seq_mapinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `scorm_seq_mapinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorm_seq_objective`
--

DROP TABLE IF EXISTS `scorm_seq_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorm_seq_objective` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) unsigned NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorm_seq_objective`
--

LOCK TABLES `scorm_seq_objective` WRITE;
/*!40000 ALTER TABLE `scorm_seq_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `scorm_seq_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorm_seq_rolluprule`
--

DROP TABLE IF EXISTS `scorm_seq_rolluprule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorm_seq_rolluprule` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) NOT NULL DEFAULT '',
  `minimumcount` bigint(10) unsigned NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) unsigned NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `action` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorm_seq_rolluprule`
--

LOCK TABLES `scorm_seq_rolluprule` WRITE;
/*!40000 ALTER TABLE `scorm_seq_rolluprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `scorm_seq_rolluprule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorm_seq_rolluprulecond`
--

DROP TABLE IF EXISTS `scorm_seq_rolluprulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorm_seq_rolluprulecond` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `scorseqroll_sco2_ix` (`scoid`),
  KEY `scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorm_seq_rolluprulecond`
--

LOCK TABLES `scorm_seq_rolluprulecond` WRITE;
/*!40000 ALTER TABLE `scorm_seq_rolluprulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `scorm_seq_rolluprulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorm_seq_rulecond`
--

DROP TABLE IF EXISTS `scorm_seq_rulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorm_seq_rulecond` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `scorseqrule_sco2_ix` (`scoid`),
  KEY `scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorm_seq_rulecond`
--

LOCK TABLES `scorm_seq_rulecond` WRITE;
/*!40000 ALTER TABLE `scorm_seq_rulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `scorm_seq_rulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorm_seq_ruleconds`
--

DROP TABLE IF EXISTS `scorm_seq_ruleconds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorm_seq_ruleconds` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `action` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorm_seq_ruleconds`
--

LOCK TABLES `scorm_seq_ruleconds` WRITE;
/*!40000 ALTER TABLE `scorm_seq_ruleconds` DISABLE KEYS */;
/*!40000 ALTER TABLE `scorm_seq_ruleconds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sid` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned NOT NULL,
  `sessdata` longtext,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `firstip` varchar(45) DEFAULT NULL,
  `lastip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sess_sid_uix` (`sid`),
  KEY `sess_sta_ix` (`state`),
  KEY `sess_tim_ix` (`timecreated`),
  KEY `sess_tim2_ix` (`timemodified`),
  KEY `sess_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Database based session storage - now recommended';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (3,0,'k3tmjoc436b5pemoqtb1k0a6k4',0,'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo4OntzOjg6Im5hdmNhY2hlIjtPOjg6InN0ZENsYXNzIjoxOntzOjEwOiJuYXZpZ2F0aW9uIjthOjA6e319czoxODoiY2FsX2NvdXJzZV9yZWZlcmVyIjtpOjE7czoxNToiY2FsX3Nob3dfZ2xvYmFsIjtiOjE7czoxNToiY2FsX3Nob3dfZ3JvdXBzIjtiOjE7czoxNToiY2FsX3Nob3dfY291cnNlIjtiOjE7czoxMzoiY2FsX3Nob3dfdXNlciI7YjoxO3M6MTc6ImNhbF9jb3Vyc2VzX3Nob3duIjthOjA6e31zOjE1OiJjYWxfdXNlcnNfc2hvd24iO2I6MDt9VVNFUnxPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtpOjA7czoxMDoibW5ldGhvc3RpZCI7czoxOiIxIjtzOjY6ImFjY2VzcyI7YTo0OntzOjI6InJhIjthOjE6e3M6MjoiLzEiO2E6MTp7aTo2O3M6MToiNiI7fX1zOjQ6InJkZWYiO2E6MTp7czo0OiIvMTo2IjthOjIwOntzOjE3OiJtb2QvcmVzb3VyY2U6dmlldyI7czoxOiIxIjtzOjEyOiJtb2QvdXJsOnZpZXciO3M6MToiMSI7czoxNzoibW9kL3dpa2k6dmlld3BhZ2UiO3M6MToiMSI7czoxNzoibW9kL3dvcmtzaG9wOnZpZXciO3M6MToiMSI7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO3M6MToiMSI7czoxODoibW9vZGxlL2Jsb2c6c2VhcmNoIjtzOjE6IjEiO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO3M6MToiMSI7czoyOToibW9vZGxlL3VzZXI6Y2hhbmdlb3ducGFzc3dvcmQiO3M6NToiLTEwMDAiO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7czo1OiItMTAwMCI7czoyNjoibW9vZGxlL3VzZXI6ZWRpdG93bnByb2ZpbGUiO3M6NToiLTEwMDAiO3M6MjM6Im1vb2RsZS91c2VyOnZpZXdkZXRhaWxzIjtzOjE6IjEiO3M6Mjc6ImJsb2NrL29ubGluZV91c2Vyczp2aWV3bGlzdCI7czoxOiIxIjtzOjE5OiJtb2QvYXNzaWdubWVudDp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vZC9kYXRhOnZpZXdlbnRyeSI7czoxOiIxIjtzOjE3OiJtb2QvZmVlZGJhY2s6dmlldyI7czoxOiIxIjtzOjE1OiJtb2QvZm9sZGVyOnZpZXciO3M6MToiMSI7czoyNDoibW9kL2ZvcnVtOnZpZXdkaXNjdXNzaW9uIjtzOjE6IjEiO3M6MTQ6Im1vZC9pbXNjcDp2aWV3IjtzOjE6IjEiO3M6MTM6Im1vZC9wYWdlOnZpZXciO3M6MToiMSI7czoxMzoibW9kL3F1aXo6dmlldyI7czoxOiIxIjt9fXM6NjoibG9hZGVkIjthOjM6e2k6MDtzOjQ6Ii8xLzIiO2k6MTtzOjQ6Ii8xLzciO2k6MjtzOjQ6Ii8xLzgiO31zOjQ6InRpbWUiO2k6MTM1MjQwMDg0Mzt9czo3OiJzZXNza2V5IjtzOjEwOiJTblN2TVZ1dklZIjtzOjEwOiJwcmVmZXJlbmNlIjthOjA6e31zOjU6ImVucm9sIjthOjI6e3M6ODoiZW5yb2xsZWQiO2E6MDp7fXM6OToidGVtcGd1ZXN0IjthOjA6e319czoyNToiYWpheF91cGRhdGFibGVfdXNlcl9wcmVmcyI7YTo0OntzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNCI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8zIjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrM2hpZGRlbiI7czo0OiJib29sIjt9fQ==',1352400843,1352400846,'172.20.241.55','172.20.241.55'),(6,0,'ckemflel3rhotno6qgf9bmg2h7',0,'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo4OntzOjg6Im5hdmNhY2hlIjtPOjg6InN0ZENsYXNzIjoxOntzOjEwOiJuYXZpZ2F0aW9uIjthOjA6e319czoxODoiY2FsX2NvdXJzZV9yZWZlcmVyIjtpOjE7czoxNToiY2FsX3Nob3dfZ2xvYmFsIjtiOjE7czoxNToiY2FsX3Nob3dfZ3JvdXBzIjtiOjE7czoxNToiY2FsX3Nob3dfY291cnNlIjtiOjE7czoxMzoiY2FsX3Nob3dfdXNlciI7YjoxO3M6MTc6ImNhbF9jb3Vyc2VzX3Nob3duIjthOjA6e31zOjE1OiJjYWxfdXNlcnNfc2hvd24iO2I6MDt9VVNFUnxPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtpOjA7czoxMDoibW5ldGhvc3RpZCI7czoxOiIxIjtzOjY6ImFjY2VzcyI7YTo0OntzOjI6InJhIjthOjE6e3M6MjoiLzEiO2E6MTp7aTo2O3M6MToiNiI7fX1zOjQ6InJkZWYiO2E6MTp7czo0OiIvMTo2IjthOjIwOntzOjE0OiJtb2QvaW1zY3A6dmlldyI7czoxOiIxIjtzOjEzOiJtb2QvcGFnZTp2aWV3IjtzOjE6IjEiO3M6MTM6Im1vZC9xdWl6OnZpZXciO3M6MToiMSI7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO3M6MToiMSI7czoxMjoibW9kL3VybDp2aWV3IjtzOjE6IjEiO3M6MTc6Im1vZC93aWtpOnZpZXdwYWdlIjtzOjE6IjEiO3M6MTc6Im1vZC93b3Jrc2hvcDp2aWV3IjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7czoxOiIxIjtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtzOjU6Ii0xMDAwIjtzOjMzOiJtb29kbGUvdXNlcjplZGl0b3dubWVzc2FnZXByb2ZpbGUiO3M6NToiLTEwMDAiO3M6MjY6Im1vb2RsZS91c2VyOmVkaXRvd25wcm9maWxlIjtzOjU6Ii0xMDAwIjtzOjIzOiJtb29kbGUvdXNlcjp2aWV3ZGV0YWlscyI7czoxOiIxIjtzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO3M6MToiMSI7czoxOToibW9kL2Fzc2lnbm1lbnQ6dmlldyI7czoxOiIxIjtzOjE4OiJtb2QvZGF0YTp2aWV3ZW50cnkiO3M6MToiMSI7czoxNzoibW9kL2ZlZWRiYWNrOnZpZXciO3M6MToiMSI7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtzOjE6IjEiO3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7czoxOiIxIjt9fXM6NjoibG9hZGVkIjthOjM6e2k6MDtzOjQ6Ii8xLzIiO2k6MTtzOjQ6Ii8xLzciO2k6MjtzOjQ6Ii8xLzgiO31zOjQ6InRpbWUiO2k6MTM1NTg1MzYyNTt9czo1OiJlbnJvbCI7YToyOntzOjg6ImVucm9sbGVkIjthOjA6e31zOjk6InRlbXBndWVzdCI7YTowOnt9fXM6MTA6InByZWZlcmVuY2UiO2E6MDp7fXM6MjU6ImFqYXhfdXBkYXRhYmxlX3VzZXJfcHJlZnMiO2E6NDp7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMyI7czozOiJpbnQiO3M6MTI6ImJsb2NrNGhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazNoaWRkZW4iO3M6NDoiYm9vbCI7fXM6Nzoic2Vzc2tleSI7czoxMDoiN2NrY1VHQWh2NyI7fQ==',1355853623,1355853626,'172.20.241.55','172.20.241.55'),(29,0,'fec927v5ontnmq6vu6m52e5847',0,'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo4OntzOjg6Im5hdmNhY2hlIjtPOjg6InN0ZENsYXNzIjoxOntzOjEwOiJuYXZpZ2F0aW9uIjthOjA6e319czoxODoiY2FsX2NvdXJzZV9yZWZlcmVyIjtpOjE7czoxNToiY2FsX3Nob3dfZ2xvYmFsIjtiOjE7czoxNToiY2FsX3Nob3dfZ3JvdXBzIjtiOjE7czoxNToiY2FsX3Nob3dfY291cnNlIjtiOjE7czoxMzoiY2FsX3Nob3dfdXNlciI7YjoxO3M6MTc6ImNhbF9jb3Vyc2VzX3Nob3duIjthOjA6e31zOjE1OiJjYWxfdXNlcnNfc2hvd24iO2I6MDt9VVNFUnxPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtpOjA7czoxMDoibW5ldGhvc3RpZCI7czoxOiIxIjtzOjY6ImFjY2VzcyI7YTo0OntzOjI6InJhIjthOjE6e3M6MjoiLzEiO2E6MTp7aTo2O3M6MToiNiI7fX1zOjQ6InJkZWYiO2E6MTp7czo0OiIvMTo2IjthOjIwOntzOjEzOiJtb2QvcXVpejp2aWV3IjtzOjE6IjEiO3M6MTc6Im1vZC9yZXNvdXJjZTp2aWV3IjtzOjE6IjEiO3M6MTI6Im1vZC91cmw6dmlldyI7czoxOiIxIjtzOjE3OiJtb2Qvd2lraTp2aWV3cGFnZSI7czoxOiIxIjtzOjE3OiJtb2Qvd29ya3Nob3A6dmlldyI7czoxOiIxIjtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7czoxOiIxIjtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO3M6MToiMSI7czoxNjoibW9vZGxlL2Jsb2c6dmlldyI7czoxOiIxIjtzOjI5OiJtb29kbGUvdXNlcjpjaGFuZ2Vvd25wYXNzd29yZCI7czo1OiItMTAwMCI7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtzOjU6Ii0xMDAwIjtzOjI2OiJtb29kbGUvdXNlcjplZGl0b3ducHJvZmlsZSI7czo1OiItMTAwMCI7czoyMzoibW9vZGxlL3VzZXI6dmlld2RldGFpbHMiO3M6MToiMSI7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtzOjE6IjEiO3M6MTk6Im1vZC9hc3NpZ25tZW50OnZpZXciO3M6MToiMSI7czoxODoibW9kL2RhdGE6dmlld2VudHJ5IjtzOjE6IjEiO3M6MTc6Im1vZC9mZWVkYmFjazp2aWV3IjtzOjE6IjEiO3M6MTU6Im1vZC9mb2xkZXI6dmlldyI7czoxOiIxIjtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO3M6MToiMSI7czoxNDoibW9kL2ltc2NwOnZpZXciO3M6MToiMSI7czoxMzoibW9kL3BhZ2U6dmlldyI7czoxOiIxIjt9fXM6NjoibG9hZGVkIjthOjM6e2k6MDtzOjQ6Ii8xLzIiO2k6MTtzOjQ6Ii8xLzciO2k6MjtzOjQ6Ii8xLzgiO31zOjQ6InRpbWUiO2k6MTM1ODA4NDc1ODt9czo3OiJzZXNza2V5IjtzOjEwOiI3enZZZ2NhZUNqIjtzOjU6ImVucm9sIjthOjI6e3M6ODoiZW5yb2xsZWQiO2E6MDp7fXM6OToidGVtcGd1ZXN0IjthOjA6e319czoxMDoicHJlZmVyZW5jZSI7YTowOnt9czoyNToiYWpheF91cGRhdGFibGVfdXNlcl9wcmVmcyI7YTo0OntzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNCI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8zIjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrM2hpZGRlbiI7czo0OiJib29sIjt9fQ==',1358084758,1358084760,'172.20.241.200','172.20.241.200'),(30,0,'tmi7nif31gat171cqgruuhjq11',0,'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjoxMTp7czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YTowOnt9fXM6MTg6ImNhbF9jb3Vyc2VfcmVmZXJlciI7aToxO3M6MTU6ImNhbF9zaG93X2dsb2JhbCI7YjoxO3M6MTU6ImNhbF9zaG93X2dyb3VwcyI7YjoxO3M6MTU6ImNhbF9zaG93X2NvdXJzZSI7YjoxO3M6MTM6ImNhbF9zaG93X3VzZXIiO2I6MTtzOjE3OiJjYWxfY291cnNlc19zaG93biI7YTowOnt9czoxNToiY2FsX3VzZXJzX3Nob3duIjtiOjA7czo4OiJ3YW50c3VybCI7czoyNzoiaHR0cHM6Ly8xNzIuMjUuMzUuMTAvYWRtaW4vIjtzOjc6ImZyb211cmwiO3M6MjE6Imh0dHBzOi8vMTcyLjI1LjM1LjEwLyI7czoxMDoibG9naW5jb3VudCI7aTo2O31VU0VSfE86ODoic3RkQ2xhc3MiOjc6e3M6MjoiaWQiO2k6MDtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6NjoiYWNjZXNzIjthOjQ6e3M6MjoicmEiO2E6MTp7czoyOiIvMSI7YToxOntpOjY7czoxOiI2Ijt9fXM6NDoicmRlZiI7YToxOntzOjQ6Ii8xOjYiO2E6MjA6e3M6MTc6Im1vZC93aWtpOnZpZXdwYWdlIjtzOjE6IjEiO3M6MTc6Im1vZC93b3Jrc2hvcDp2aWV3IjtzOjE6IjEiO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtzOjE6IjEiO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7czoxOiIxIjtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtzOjE6IjEiO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtzOjU6Ii0xMDAwIjtzOjMzOiJtb29kbGUvdXNlcjplZGl0b3dubWVzc2FnZXByb2ZpbGUiO3M6NToiLTEwMDAiO3M6MjY6Im1vb2RsZS91c2VyOmVkaXRvd25wcm9maWxlIjtzOjU6Ii0xMDAwIjtzOjIzOiJtb29kbGUvdXNlcjp2aWV3ZGV0YWlscyI7czoxOiIxIjtzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO3M6MToiMSI7czoxOToibW9kL2Fzc2lnbm1lbnQ6dmlldyI7czoxOiIxIjtzOjE4OiJtb2QvZGF0YTp2aWV3ZW50cnkiO3M6MToiMSI7czoxNzoibW9kL2ZlZWRiYWNrOnZpZXciO3M6MToiMSI7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtzOjE6IjEiO3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7czoxOiIxIjtzOjE0OiJtb2QvaW1zY3A6dmlldyI7czoxOiIxIjtzOjEzOiJtb2QvcGFnZTp2aWV3IjtzOjE6IjEiO3M6MTM6Im1vZC9xdWl6OnZpZXciO3M6MToiMSI7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO3M6MToiMSI7czoxMjoibW9kL3VybDp2aWV3IjtzOjE6IjEiO319czo2OiJsb2FkZWQiO2E6Mzp7aTowO3M6NDoiLzEvMiI7aToxO3M6NDoiLzEvNyI7aToyO3M6NDoiLzEvOCI7fXM6NDoidGltZSI7aToxMzYwNzk4MjQ4O31zOjc6InNlc3NrZXkiO3M6MTA6InlQTnMxSHhodHYiO3M6NToiZW5yb2wiO2E6Mjp7czo4OiJlbnJvbGxlZCI7YTowOnt9czo5OiJ0ZW1wZ3Vlc3QiO2E6MDp7fX1zOjEwOiJwcmVmZXJlbmNlIjthOjA6e31zOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjQ6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV80IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzMiO3M6MzoiaW50IjtzOjEyOiJibG9jazRoaWRkZW4iO3M6NDoiYm9vbCI7czoxMjoiYmxvY2szaGlkZGVuIjtzOjQ6ImJvb2wiO319',1360798248,1360798689,'172.31.35.3','172.31.35.3');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_daily`
--

DROP TABLE IF EXISTS `stats_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_daily` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stat2` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `statdail_cou_ix` (`courseid`),
  KEY `statdail_tim_ix` (`timeend`),
  KEY `statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_daily`
--

LOCK TABLES `stats_daily` WRITE;
/*!40000 ALTER TABLE `stats_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_monthly`
--

DROP TABLE IF EXISTS `stats_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_monthly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stat2` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `statmont_cou_ix` (`courseid`),
  KEY `statmont_tim_ix` (`timeend`),
  KEY `statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_monthly`
--

LOCK TABLES `stats_monthly` WRITE;
/*!40000 ALTER TABLE `stats_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_user_daily`
--

DROP TABLE IF EXISTS `stats_user_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_user_daily` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statsreads` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statswrites` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `statuserdail_cou_ix` (`courseid`),
  KEY `statuserdail_use_ix` (`userid`),
  KEY `statuserdail_rol_ix` (`roleid`),
  KEY `statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_user_daily`
--

LOCK TABLES `stats_user_daily` WRITE;
/*!40000 ALTER TABLE `stats_user_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_user_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_user_monthly`
--

DROP TABLE IF EXISTS `stats_user_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_user_monthly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statsreads` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statswrites` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `statusermont_cou_ix` (`courseid`),
  KEY `statusermont_use_ix` (`userid`),
  KEY `statusermont_rol_ix` (`roleid`),
  KEY `statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_user_monthly`
--

LOCK TABLES `stats_user_monthly` WRITE;
/*!40000 ALTER TABLE `stats_user_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_user_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_user_weekly`
--

DROP TABLE IF EXISTS `stats_user_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_user_weekly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statsreads` bigint(10) unsigned NOT NULL DEFAULT '0',
  `statswrites` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `statuserweek_cou_ix` (`courseid`),
  KEY `statuserweek_use_ix` (`userid`),
  KEY `statuserweek_rol_ix` (`roleid`),
  KEY `statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_user_weekly`
--

LOCK TABLES `stats_user_weekly` WRITE;
/*!40000 ALTER TABLE `stats_user_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_user_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_weekly`
--

DROP TABLE IF EXISTS `stats_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_weekly` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `roleid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) unsigned NOT NULL DEFAULT '0',
  `stat2` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `statweek_cou_ix` (`courseid`),
  KEY `statweek_tim_ix` (`timeend`),
  KEY `statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_weekly`
--

LOCK TABLES `stats_weekly` WRITE;
/*!40000 ALTER TABLE `stats_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `template` bigint(10) unsigned NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `questions` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `surv_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (1,0,0,0,985017600,985017600,'collesaname','collesaintro',0,'25,26,27,28,29,30,43,44'),(2,0,0,0,985017600,985017600,'collespname','collespintro',0,'31,32,33,34,35,36,43,44'),(3,0,0,0,985017600,985017600,'collesapname','collesapintro',0,'37,38,39,40,41,42,43,44'),(4,0,0,0,985017600,985017600,'attlsname','attlsintro',0,'65,67,68'),(5,0,0,0,985017600,985017600,'ciqname','ciqintro',0,'69,70,71,72,73');
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_analysis`
--

DROP TABLE IF EXISTS `survey_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_analysis` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survanal_use_ix` (`userid`),
  KEY `survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='text about each survey submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_analysis`
--

LOCK TABLES `survey_analysis` WRITE;
/*!40000 ALTER TABLE `survey_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_answers`
--

DROP TABLE IF EXISTS `survey_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_answers` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `survey` bigint(10) unsigned NOT NULL DEFAULT '0',
  `question` bigint(10) unsigned NOT NULL DEFAULT '0',
  `time` bigint(10) unsigned NOT NULL DEFAULT '0',
  `answer1` text NOT NULL,
  `answer2` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survansw_use_ix` (`userid`),
  KEY `survansw_sur_ix` (`survey`),
  KEY `survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answers`
--

LOCK TABLES `survey_answers` WRITE;
/*!40000 ALTER TABLE `survey_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_questions`
--

DROP TABLE IF EXISTS `survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_questions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL DEFAULT '',
  `shorttext` varchar(30) NOT NULL DEFAULT '',
  `multi` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(50) NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_questions`
--

LOCK TABLES `survey_questions` WRITE;
/*!40000 ALTER TABLE `survey_questions` DISABLE KEYS */;
INSERT INTO `survey_questions` VALUES (1,'colles1','colles1short','','',1,'scaletimes5'),(2,'colles2','colles2short','','',1,'scaletimes5'),(3,'colles3','colles3short','','',1,'scaletimes5'),(4,'colles4','colles4short','','',1,'scaletimes5'),(5,'colles5','colles5short','','',1,'scaletimes5'),(6,'colles6','colles6short','','',1,'scaletimes5'),(7,'colles7','colles7short','','',1,'scaletimes5'),(8,'colles8','colles8short','','',1,'scaletimes5'),(9,'colles9','colles9short','','',1,'scaletimes5'),(10,'colles10','colles10short','','',1,'scaletimes5'),(11,'colles11','colles11short','','',1,'scaletimes5'),(12,'colles12','colles12short','','',1,'scaletimes5'),(13,'colles13','colles13short','','',1,'scaletimes5'),(14,'colles14','colles14short','','',1,'scaletimes5'),(15,'colles15','colles15short','','',1,'scaletimes5'),(16,'colles16','colles16short','','',1,'scaletimes5'),(17,'colles17','colles17short','','',1,'scaletimes5'),(18,'colles18','colles18short','','',1,'scaletimes5'),(19,'colles19','colles19short','','',1,'scaletimes5'),(20,'colles20','colles20short','','',1,'scaletimes5'),(21,'colles21','colles21short','','',1,'scaletimes5'),(22,'colles22','colles22short','','',1,'scaletimes5'),(23,'colles23','colles23short','','',1,'scaletimes5'),(24,'colles24','colles24short','','',1,'scaletimes5'),(25,'collesm1','collesm1short','1,2,3,4','collesmintro',1,'scaletimes5'),(26,'collesm2','collesm2short','5,6,7,8','collesmintro',1,'scaletimes5'),(27,'collesm3','collesm3short','9,10,11,12','collesmintro',1,'scaletimes5'),(28,'collesm4','collesm4short','13,14,15,16','collesmintro',1,'scaletimes5'),(29,'collesm5','collesm5short','17,18,19,20','collesmintro',1,'scaletimes5'),(30,'collesm6','collesm6short','21,22,23,24','collesmintro',1,'scaletimes5'),(31,'collesm1','collesm1short','1,2,3,4','collesmintro',2,'scaletimes5'),(32,'collesm2','collesm2short','5,6,7,8','collesmintro',2,'scaletimes5'),(33,'collesm3','collesm3short','9,10,11,12','collesmintro',2,'scaletimes5'),(34,'collesm4','collesm4short','13,14,15,16','collesmintro',2,'scaletimes5'),(35,'collesm5','collesm5short','17,18,19,20','collesmintro',2,'scaletimes5'),(36,'collesm6','collesm6short','21,22,23,24','collesmintro',2,'scaletimes5'),(37,'collesm1','collesm1short','1,2,3,4','collesmintro',3,'scaletimes5'),(38,'collesm2','collesm2short','5,6,7,8','collesmintro',3,'scaletimes5'),(39,'collesm3','collesm3short','9,10,11,12','collesmintro',3,'scaletimes5'),(40,'collesm4','collesm4short','13,14,15,16','collesmintro',3,'scaletimes5'),(41,'collesm5','collesm5short','17,18,19,20','collesmintro',3,'scaletimes5'),(42,'collesm6','collesm6short','21,22,23,24','collesmintro',3,'scaletimes5'),(43,'howlong','','','',1,'howlongoptions'),(44,'othercomments','','','',0,NULL),(45,'attls1','attls1short','','',1,'scaleagree5'),(46,'attls2','attls2short','','',1,'scaleagree5'),(47,'attls3','attls3short','','',1,'scaleagree5'),(48,'attls4','attls4short','','',1,'scaleagree5'),(49,'attls5','attls5short','','',1,'scaleagree5'),(50,'attls6','attls6short','','',1,'scaleagree5'),(51,'attls7','attls7short','','',1,'scaleagree5'),(52,'attls8','attls8short','','',1,'scaleagree5'),(53,'attls9','attls9short','','',1,'scaleagree5'),(54,'attls10','attls10short','','',1,'scaleagree5'),(55,'attls11','attls11short','','',1,'scaleagree5'),(56,'attls12','attls12short','','',1,'scaleagree5'),(57,'attls13','attls13short','','',1,'scaleagree5'),(58,'attls14','attls14short','','',1,'scaleagree5'),(59,'attls15','attls15short','','',1,'scaleagree5'),(60,'attls16','attls16short','','',1,'scaleagree5'),(61,'attls17','attls17short','','',1,'scaleagree5'),(62,'attls18','attls18short','','',1,'scaleagree5'),(63,'attls19','attls19short','','',1,'scaleagree5'),(64,'attls20','attls20short','','',1,'scaleagree5'),(65,'attlsm1','attlsm1','45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64','attlsmintro',1,'scaleagree5'),(66,'-','-','-','-',0,'-'),(67,'attlsm2','attlsm2','63,62,59,57,55,49,52,50,48,47','attlsmintro',-1,'scaleagree5'),(68,'attlsm3','attlsm3','46,54,45,51,60,53,56,58,61,64','attlsmintro',-1,'scaleagree5'),(69,'ciq1','ciq1short','','',0,NULL),(70,'ciq2','ciq2short','','',0,NULL),(71,'ciq3','ciq3short','','',0,NULL),(72,'ciq4','ciq4short','','',0,NULL),(73,'ciq5','ciq5short','','',0,NULL);
/*!40000 ALTER TABLE `survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rawname` varchar(255) NOT NULL DEFAULT '',
  `tagtype` varchar(255) DEFAULT NULL,
  `description` text,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `flag` smallint(4) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_nam_uix` (`name`),
  KEY `tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag table - this generic table will replace the old "tags" t';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_correlation`
--

DROP TABLE IF EXISTS `tag_correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_correlation` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) unsigned NOT NULL,
  `correlatedtags` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The rationale for the ''tag_correlation'' table is performance';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_correlation`
--

LOCK TABLES `tag_correlation` WRITE;
/*!40000 ALTER TABLE `tag_correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_instance`
--

DROP TABLE IF EXISTS `tag_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_instance` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) unsigned NOT NULL,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) unsigned NOT NULL,
  `tiuserid` bigint(10) unsigned NOT NULL,
  `ordering` bigint(10) unsigned DEFAULT NULL,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag_instance table holds the information of associations bet';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_instance`
--

LOCK TABLES `tag_instance` WRITE;
/*!40000 ALTER TABLE `tag_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezone` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rules for calculating local wall clock time for users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezone`
--

LOCK TABLES `timezone` WRITE;
/*!40000 ALTER TABLE `timezone` DISABLE KEYS */;
/*!40000 ALTER TABLE `timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgrade_log`
--

DROP TABLE IF EXISTS `upgrade_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrade_log` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `info` varchar(255) NOT NULL DEFAULT '',
  `details` text,
  `backtrace` text,
  `userid` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `upgrlog_tim_ix` (`timemodified`),
  KEY `upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8 COMMENT='Upgrade logging';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgrade_log`
--

LOCK TABLES `upgrade_log` WRITE;
/*!40000 ALTER TABLE `upgrade_log` DISABLE KEYS */;
INSERT INTO `upgrade_log` VALUES (1,0,NULL,'2010112400','Upgrade savepoint reached',NULL,'',0,1292778856),(2,0,NULL,'2010112400','Core installed',NULL,'',0,1292778856),(3,0,'mod_assignment',NULL,'Starting plugin installation',NULL,'',0,1292778856),(4,0,'mod_assignment',NULL,'Plugin installed',NULL,'',0,1292778856),(5,0,'mod_chat',NULL,'Starting plugin installation',NULL,'',0,1292778856),(6,0,'mod_chat',NULL,'Plugin installed',NULL,'',0,1292778857),(7,0,'mod_choice',NULL,'Starting plugin installation',NULL,'',0,1292778857),(8,0,'mod_choice',NULL,'Plugin installed',NULL,'',0,1292778857),(9,0,'mod_data',NULL,'Starting plugin installation',NULL,'',0,1292778857),(10,0,'mod_data',NULL,'Plugin installed',NULL,'',0,1292778857),(11,0,'mod_feedback',NULL,'Starting plugin installation',NULL,'',0,1292778857),(12,0,'mod_feedback',NULL,'Plugin installed',NULL,'',0,1292778858),(13,0,'mod_folder',NULL,'Starting plugin installation',NULL,'',0,1292778858),(14,0,'mod_folder',NULL,'Plugin installed',NULL,'',0,1292778858),(15,0,'mod_forum',NULL,'Starting plugin installation',NULL,'',0,1292778858),(16,0,'mod_forum',NULL,'Plugin installed',NULL,'',0,1292778859),(17,0,'mod_glossary',NULL,'Starting plugin installation',NULL,'',0,1292778859),(18,0,'mod_glossary',NULL,'Plugin installed',NULL,'',0,1292778859),(19,0,'mod_imscp',NULL,'Starting plugin installation',NULL,'',0,1292778859),(20,0,'mod_imscp',NULL,'Plugin installed',NULL,'',0,1292778859),(21,0,'mod_label',NULL,'Starting plugin installation',NULL,'',0,1292778859),(22,0,'mod_label',NULL,'Plugin installed',NULL,'',0,1292778859),(23,0,'mod_lesson',NULL,'Starting plugin installation',NULL,'',0,1292778859),(24,0,'mod_lesson',NULL,'Plugin installed',NULL,'',0,1292778860),(25,0,'mod_page',NULL,'Starting plugin installation',NULL,'',0,1292778860),(26,0,'mod_page',NULL,'Plugin installed',NULL,'',0,1292778860),(27,0,'mod_quiz',NULL,'Starting plugin installation',NULL,'',0,1292778860),(28,0,'mod_quiz',NULL,'Plugin installed',NULL,'',0,1292778860),(29,0,'mod_resource',NULL,'Starting plugin installation',NULL,'',0,1292778860),(30,0,'mod_resource',NULL,'Plugin installed',NULL,'',0,1292778860),(31,0,'mod_scorm',NULL,'Starting plugin installation',NULL,'',0,1292778860),(32,0,'mod_scorm',NULL,'Plugin installed',NULL,'',0,1292778861),(33,0,'mod_survey',NULL,'Starting plugin installation',NULL,'',0,1292778861),(34,0,'mod_survey',NULL,'Plugin installed',NULL,'',0,1292778861),(35,0,'mod_url',NULL,'Starting plugin installation',NULL,'',0,1292778861),(36,0,'mod_url',NULL,'Plugin installed',NULL,'',0,1292778862),(37,0,'mod_wiki',NULL,'Starting plugin installation',NULL,'',0,1292778862),(38,0,'mod_wiki',NULL,'Plugin installed',NULL,'',0,1292778862),(39,0,'mod_workshop',NULL,'Starting plugin installation',NULL,'',0,1292778862),(40,0,'mod_workshop',NULL,'Plugin installed',NULL,'',0,1292778863),(41,0,'auth_cas',NULL,'Starting plugin installation',NULL,'',0,1292778863),(42,0,'auth_cas','2010072600','Upgrade savepoint reached',NULL,'',0,1292778863),(43,0,'auth_cas','2010072600','Plugin installed',NULL,'',0,1292778863),(44,0,'auth_db',NULL,'Starting plugin installation',NULL,'',0,1292778863),(45,0,'auth_db','2009112400','Upgrade savepoint reached',NULL,'',0,1292778863),(46,0,'auth_db','2009112400','Plugin installed',NULL,'',0,1292778863),(47,0,'auth_fc',NULL,'Starting plugin installation',NULL,'',0,1292778863),(48,0,'auth_fc','2009112400','Upgrade savepoint reached',NULL,'',0,1292778863),(49,0,'auth_fc','2009112400','Plugin installed',NULL,'',0,1292778863),(50,0,'auth_imap',NULL,'Starting plugin installation',NULL,'',0,1292778863),(51,0,'auth_imap','2009112400','Upgrade savepoint reached',NULL,'',0,1292778863),(52,0,'auth_imap','2009112400','Plugin installed',NULL,'',0,1292778863),(53,0,'auth_ldap',NULL,'Starting plugin installation',NULL,'',0,1292778863),(54,0,'auth_ldap','2010072600','Upgrade savepoint reached',NULL,'',0,1292778863),(55,0,'auth_ldap','2010072600','Plugin installed',NULL,'',0,1292778863),(56,0,'auth_mnet',NULL,'Starting plugin installation',NULL,'',0,1292778863),(57,0,'auth_mnet','2010071300','Upgrade savepoint reached',NULL,'',0,1292778863),(58,0,'auth_mnet','2010071300','Plugin installed',NULL,'',0,1292778863),(59,0,'auth_nntp',NULL,'Starting plugin installation',NULL,'',0,1292778863),(60,0,'auth_nntp','2009112400','Upgrade savepoint reached',NULL,'',0,1292778863),(61,0,'auth_nntp','2009112400','Plugin installed',NULL,'',0,1292778863),(62,0,'auth_pam',NULL,'Starting plugin installation',NULL,'',0,1292778863),(63,0,'auth_pam','2009112400','Upgrade savepoint reached',NULL,'',0,1292778863),(64,0,'auth_pam','2009112400','Plugin installed',NULL,'',0,1292778863),(65,0,'auth_pop3',NULL,'Starting plugin installation',NULL,'',0,1292778863),(66,0,'auth_pop3','2009112400','Upgrade savepoint reached',NULL,'',0,1292778863),(67,0,'auth_pop3','2009112400','Plugin installed',NULL,'',0,1292778863),(68,0,'auth_radius',NULL,'Starting plugin installation',NULL,'',0,1292778863),(69,0,'auth_radius','2009112400','Upgrade savepoint reached',NULL,'',0,1292778863),(70,0,'auth_radius','2009112400','Plugin installed',NULL,'',0,1292778863),(71,0,'auth_shibboleth',NULL,'Starting plugin installation',NULL,'',0,1292778863),(72,0,'auth_shibboleth','2009112400','Upgrade savepoint reached',NULL,'',0,1292778863),(73,0,'auth_shibboleth','2009112400','Plugin installed',NULL,'',0,1292778863),(74,0,'enrol_authorize',NULL,'Starting plugin installation',NULL,'',0,1292778863),(75,0,'enrol_authorize','2010081203','Upgrade savepoint reached',NULL,'',0,1292778863),(76,0,'enrol_authorize','2010081203','Plugin installed',NULL,'',0,1292778863),(77,0,'enrol_category',NULL,'Starting plugin installation',NULL,'',0,1292778863),(78,0,'enrol_category','2010061500','Upgrade savepoint reached',NULL,'',0,1292778864),(79,0,'enrol_category','2010061500','Plugin installed',NULL,'',0,1292778864),(80,0,'enrol_cohort',NULL,'Starting plugin installation',NULL,'',0,1292778864),(81,0,'enrol_cohort','2010073100','Upgrade savepoint reached',NULL,'',0,1292778864),(82,0,'enrol_cohort','2010073100','Plugin installed',NULL,'',0,1292778864),(83,0,'enrol_database',NULL,'Starting plugin installation',NULL,'',0,1292778864),(84,0,'enrol_database','2010073100','Upgrade savepoint reached',NULL,'',0,1292778864),(85,0,'enrol_database','2010073100','Plugin installed',NULL,'',0,1292778864),(86,0,'enrol_flatfile',NULL,'Starting plugin installation',NULL,'',0,1292778864),(87,0,'enrol_flatfile','2010091400','Upgrade savepoint reached',NULL,'',0,1292778864),(88,0,'enrol_flatfile','2010091400','Plugin installed',NULL,'',0,1292778864),(89,0,'enrol_guest',NULL,'Starting plugin installation',NULL,'',0,1292778864),(90,0,'enrol_guest','2010081800','Upgrade savepoint reached',NULL,'',0,1292778864),(91,0,'enrol_guest','2010081800','Plugin installed',NULL,'',0,1292778864),(92,0,'enrol_imsenterprise',NULL,'Starting plugin installation',NULL,'',0,1292778864),(93,0,'enrol_imsenterprise','2010071200','Upgrade savepoint reached',NULL,'',0,1292778864),(94,0,'enrol_imsenterprise','2010071200','Plugin installed',NULL,'',0,1292778864),(95,0,'enrol_ldap',NULL,'Starting plugin installation',NULL,'',0,1292778864),(96,0,'enrol_ldap','2010071100','Upgrade savepoint reached',NULL,'',0,1292778864),(97,0,'enrol_ldap','2010071100','Plugin installed',NULL,'',0,1292778864),(98,0,'enrol_manual',NULL,'Starting plugin installation',NULL,'',0,1292778864),(99,0,'enrol_manual','2010071200','Upgrade savepoint reached',NULL,'',0,1292778864),(100,0,'enrol_manual','2010071200','Plugin installed',NULL,'',0,1292778864),(101,0,'enrol_meta',NULL,'Starting plugin installation',NULL,'',0,1292778864),(102,0,'enrol_meta','2010073100','Upgrade savepoint reached',NULL,'',0,1292778864),(103,0,'enrol_meta','2010073100','Plugin installed',NULL,'',0,1292778864),(104,0,'enrol_mnet',NULL,'Starting plugin installation',NULL,'',0,1292778864),(105,0,'enrol_mnet','2010071701','Upgrade savepoint reached',NULL,'',0,1292778864),(106,0,'enrol_mnet','2010071701','Plugin installed',NULL,'',0,1292778864),(107,0,'enrol_paypal',NULL,'Starting plugin installation',NULL,'',0,1292778864),(108,0,'enrol_paypal','2010073100','Upgrade savepoint reached',NULL,'',0,1292778864),(109,0,'enrol_paypal','2010073100','Plugin installed',NULL,'',0,1292778864),(110,0,'enrol_self',NULL,'Starting plugin installation',NULL,'',0,1292778864),(111,0,'enrol_self','2010090501','Upgrade savepoint reached',NULL,'',0,1292778864),(112,0,'enrol_self','2010090501','Plugin installed',NULL,'',0,1292778864),(113,0,'message_email',NULL,'Starting plugin installation',NULL,'',0,1292778864),(114,0,'message_email','2010090501','Upgrade savepoint reached',NULL,'',0,1292778864),(115,0,'message_email','2010090501','Plugin installed',NULL,'',0,1292778864),(116,0,'message_jabber',NULL,'Starting plugin installation',NULL,'',0,1292778864),(117,0,'message_jabber','2010090501','Upgrade savepoint reached',NULL,'',0,1292778864),(118,0,'message_jabber','2010090501','Plugin installed',NULL,'',0,1292778864),(119,0,'message_popup',NULL,'Starting plugin installation',NULL,'',0,1292778864),(120,0,'message_popup','2010090501','Upgrade savepoint reached',NULL,'',0,1292778864),(121,0,'message_popup','2010090501','Plugin installed',NULL,'',0,1292778864),(122,0,'block_activity_modules',NULL,'Starting plugin installation',NULL,'',0,1292778864),(123,0,'block_activity_modules',NULL,'Plugin installed',NULL,'',0,1292778864),(124,0,'block_admin_bookmarks',NULL,'Starting plugin installation',NULL,'',0,1292778864),(125,0,'block_admin_bookmarks',NULL,'Plugin installed',NULL,'',0,1292778864),(126,0,'block_blog_menu',NULL,'Starting plugin installation',NULL,'',0,1292778864),(127,0,'block_blog_menu',NULL,'Plugin installed',NULL,'',0,1292778864),(128,0,'block_blog_recent',NULL,'Starting plugin installation',NULL,'',0,1292778864),(129,0,'block_blog_recent',NULL,'Plugin installed',NULL,'',0,1292778864),(130,0,'block_blog_tags',NULL,'Starting plugin installation',NULL,'',0,1292778864),(131,0,'block_blog_tags',NULL,'Plugin installed',NULL,'',0,1292778864),(132,0,'block_calendar_month',NULL,'Starting plugin installation',NULL,'',0,1292778864),(133,0,'block_calendar_month',NULL,'Plugin installed',NULL,'',0,1292778864),(134,0,'block_calendar_upcoming',NULL,'Starting plugin installation',NULL,'',0,1292778864),(135,0,'block_calendar_upcoming',NULL,'Plugin installed',NULL,'',0,1292778864),(136,0,'block_comments',NULL,'Starting plugin installation',NULL,'',0,1292778864),(137,0,'block_comments',NULL,'Plugin installed',NULL,'',0,1292778864),(138,0,'block_community',NULL,'Starting plugin installation',NULL,'',0,1292778864),(139,0,'block_community',NULL,'Plugin installed',NULL,'',0,1292778865),(140,0,'block_completionstatus',NULL,'Starting plugin installation',NULL,'',0,1292778865),(141,0,'block_completionstatus',NULL,'Plugin installed',NULL,'',0,1292778865),(142,0,'block_course_list',NULL,'Starting plugin installation',NULL,'',0,1292778865),(143,0,'block_course_list',NULL,'Plugin installed',NULL,'',0,1292778865),(144,0,'block_course_overview',NULL,'Starting plugin installation',NULL,'',0,1292778865),(145,0,'block_course_overview',NULL,'Plugin installed',NULL,'',0,1292778865),(146,0,'block_course_summary',NULL,'Starting plugin installation',NULL,'',0,1292778865),(147,0,'block_course_summary',NULL,'Plugin installed',NULL,'',0,1292778865),(148,0,'block_feedback',NULL,'Starting plugin installation',NULL,'',0,1292778865),(149,0,'block_feedback',NULL,'Plugin installed',NULL,'',0,1292778865),(150,0,'block_glossary_random',NULL,'Starting plugin installation',NULL,'',0,1292778865),(151,0,'block_glossary_random',NULL,'Plugin installed',NULL,'',0,1292778865),(152,0,'block_html',NULL,'Starting plugin installation',NULL,'',0,1292778865),(153,0,'block_html',NULL,'Plugin installed',NULL,'',0,1292778865),(154,0,'block_login',NULL,'Starting plugin installation',NULL,'',0,1292778865),(155,0,'block_login',NULL,'Plugin installed',NULL,'',0,1292778865),(156,0,'block_mentees',NULL,'Starting plugin installation',NULL,'',0,1292778865),(157,0,'block_mentees',NULL,'Plugin installed',NULL,'',0,1292778865),(158,0,'block_messages',NULL,'Starting plugin installation',NULL,'',0,1292778865),(159,0,'block_messages',NULL,'Plugin installed',NULL,'',0,1292778865),(160,0,'block_mnet_hosts',NULL,'Starting plugin installation',NULL,'',0,1292778865),(161,0,'block_mnet_hosts',NULL,'Plugin installed',NULL,'',0,1292778865),(162,0,'block_myprofile',NULL,'Starting plugin installation',NULL,'',0,1292778865),(163,0,'block_myprofile',NULL,'Plugin installed',NULL,'',0,1292778865),(164,0,'block_navigation',NULL,'Starting plugin installation',NULL,'',0,1292778865),(165,0,'block_navigation',NULL,'Plugin installed',NULL,'',0,1292778865),(166,0,'block_news_items',NULL,'Starting plugin installation',NULL,'',0,1292778865),(167,0,'block_news_items',NULL,'Plugin installed',NULL,'',0,1292778865),(168,0,'block_online_users',NULL,'Starting plugin installation',NULL,'',0,1292778865),(169,0,'block_online_users',NULL,'Plugin installed',NULL,'',0,1292778865),(170,0,'block_participants',NULL,'Starting plugin installation',NULL,'',0,1292778865),(171,0,'block_participants',NULL,'Plugin installed',NULL,'',0,1292778865),(172,0,'block_private_files',NULL,'Starting plugin installation',NULL,'',0,1292778865),(173,0,'block_private_files',NULL,'Plugin installed',NULL,'',0,1292778865),(174,0,'block_quiz_results',NULL,'Starting plugin installation',NULL,'',0,1292778865),(175,0,'block_quiz_results',NULL,'Plugin installed',NULL,'',0,1292778865),(176,0,'block_recent_activity',NULL,'Starting plugin installation',NULL,'',0,1292778865),(177,0,'block_recent_activity',NULL,'Plugin installed',NULL,'',0,1292778865),(178,0,'block_rss_client',NULL,'Starting plugin installation',NULL,'',0,1292778865),(179,0,'block_rss_client',NULL,'Plugin installed',NULL,'',0,1292778865),(180,0,'block_search',NULL,'Starting plugin installation',NULL,'',0,1292778865),(181,0,'block_search',NULL,'Plugin installed',NULL,'',0,1292778865),(182,0,'block_search_forums',NULL,'Starting plugin installation',NULL,'',0,1292778865),(183,0,'block_search_forums',NULL,'Plugin installed',NULL,'',0,1292778865),(184,0,'block_section_links',NULL,'Starting plugin installation',NULL,'',0,1292778865),(185,0,'block_section_links',NULL,'Plugin installed',NULL,'',0,1292778865),(186,0,'block_selfcompletion',NULL,'Starting plugin installation',NULL,'',0,1292778865),(187,0,'block_selfcompletion',NULL,'Plugin installed',NULL,'',0,1292778865),(188,0,'block_settings',NULL,'Starting plugin installation',NULL,'',0,1292778865),(189,0,'block_settings',NULL,'Plugin installed',NULL,'',0,1292778865),(190,0,'block_site_main_menu',NULL,'Starting plugin installation',NULL,'',0,1292778865),(191,0,'block_site_main_menu',NULL,'Plugin installed',NULL,'',0,1292778865),(192,0,'block_social_activities',NULL,'Starting plugin installation',NULL,'',0,1292778865),(193,0,'block_social_activities',NULL,'Plugin installed',NULL,'',0,1292778865),(194,0,'block_tag_flickr',NULL,'Starting plugin installation',NULL,'',0,1292778865),(195,0,'block_tag_flickr',NULL,'Plugin installed',NULL,'',0,1292778865),(196,0,'block_tag_youtube',NULL,'Starting plugin installation',NULL,'',0,1292778865),(197,0,'block_tag_youtube',NULL,'Plugin installed',NULL,'',0,1292778865),(198,0,'block_tags',NULL,'Starting plugin installation',NULL,'',0,1292778865),(199,0,'block_tags',NULL,'Plugin installed',NULL,'',0,1292778865),(200,0,'filter_emoticon',NULL,'Starting plugin installation',NULL,'',0,1292778865),(201,0,'filter_emoticon','2010102300','Upgrade savepoint reached',NULL,'',0,1292778865),(202,0,'filter_emoticon','2010102300','Plugin installed',NULL,'',0,1292778865),(203,0,'filter_mediaplugin',NULL,'Starting plugin installation',NULL,'',0,1292778865),(204,0,'filter_mediaplugin','2010070900','Upgrade savepoint reached',NULL,'',0,1292778865),(205,0,'filter_mediaplugin','2010070900','Plugin installed',NULL,'',0,1292778866),(206,0,'filter_tex',NULL,'Starting plugin installation',NULL,'',0,1292778866),(207,0,'filter_tex','2010073000','Upgrade savepoint reached',NULL,'',0,1292778866),(208,0,'filter_tex','2010073000','Plugin installed',NULL,'',0,1292778866),(209,0,'filter_urltolink',NULL,'Starting plugin installation',NULL,'',0,1292778866),(210,0,'filter_urltolink','2010100500','Upgrade savepoint reached',NULL,'',0,1292778866),(211,0,'filter_urltolink','2010100500','Plugin installed',NULL,'',0,1292778866),(212,0,'editor_textarea',NULL,'Starting plugin installation',NULL,'',0,1292778866),(213,0,'editor_textarea','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(214,0,'editor_textarea','2010090501','Plugin installed',NULL,'',0,1292778866),(215,0,'editor_tinymce',NULL,'Starting plugin installation',NULL,'',0,1292778866),(216,0,'editor_tinymce','2010093000','Upgrade savepoint reached',NULL,'',0,1292778866),(217,0,'editor_tinymce','2010093000','Plugin installed',NULL,'',0,1292778866),(218,0,'report_courseoverview',NULL,'Starting plugin installation',NULL,'',0,1292778866),(219,0,'report_courseoverview','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(220,0,'report_courseoverview','2010090501','Plugin installed',NULL,'',0,1292778866),(221,0,'report_customlang',NULL,'Starting plugin installation',NULL,'',0,1292778866),(222,0,'report_customlang','2010111500','Upgrade savepoint reached',NULL,'',0,1292778866),(223,0,'report_customlang','2010111500','Plugin installed',NULL,'',0,1292778866),(224,0,'report_questioninstances',NULL,'Starting plugin installation',NULL,'',0,1292778866),(225,0,'report_questioninstances','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(226,0,'report_questioninstances','2010090501','Plugin installed',NULL,'',0,1292778866),(227,0,'report_security',NULL,'Starting plugin installation',NULL,'',0,1292778866),(228,0,'report_security','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(229,0,'report_security','2010090501','Plugin installed',NULL,'',0,1292778866),(230,0,'report_unittest',NULL,'Starting plugin installation',NULL,'',0,1292778866),(231,0,'report_unittest','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(232,0,'report_unittest','2010090501','Plugin installed',NULL,'',0,1292778866),(233,0,'report_unsuproles',NULL,'Starting plugin installation',NULL,'',0,1292778866),(234,0,'report_unsuproles','2010071800','Upgrade savepoint reached',NULL,'',0,1292778866),(235,0,'report_unsuproles','2010071800','Plugin installed',NULL,'',0,1292778866),(236,0,'coursereport_completion',NULL,'Starting plugin installation',NULL,'',0,1292778866),(237,0,'coursereport_completion','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(238,0,'coursereport_completion','2010090501','Plugin installed',NULL,'',0,1292778866),(239,0,'coursereport_log',NULL,'Starting plugin installation',NULL,'',0,1292778866),(240,0,'coursereport_log','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(241,0,'coursereport_log','2010090501','Plugin installed',NULL,'',0,1292778866),(242,0,'coursereport_outline',NULL,'Starting plugin installation',NULL,'',0,1292778866),(243,0,'coursereport_outline','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(244,0,'coursereport_outline','2010090501','Plugin installed',NULL,'',0,1292778866),(245,0,'coursereport_participation',NULL,'Starting plugin installation',NULL,'',0,1292778866),(246,0,'coursereport_participation','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(247,0,'coursereport_participation','2010090501','Plugin installed',NULL,'',0,1292778866),(248,0,'coursereport_progress',NULL,'Starting plugin installation',NULL,'',0,1292778866),(249,0,'coursereport_progress','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(250,0,'coursereport_progress','2010090501','Plugin installed',NULL,'',0,1292778866),(251,0,'coursereport_stats',NULL,'Starting plugin installation',NULL,'',0,1292778866),(252,0,'coursereport_stats','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(253,0,'coursereport_stats','2010090501','Plugin installed',NULL,'',0,1292778866),(254,0,'gradeexport_ods',NULL,'Starting plugin installation',NULL,'',0,1292778866),(255,0,'gradeexport_ods','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(256,0,'gradeexport_ods','2010090501','Plugin installed',NULL,'',0,1292778866),(257,0,'gradeexport_txt',NULL,'Starting plugin installation',NULL,'',0,1292778866),(258,0,'gradeexport_txt','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(259,0,'gradeexport_txt','2010090501','Plugin installed',NULL,'',0,1292778866),(260,0,'gradeexport_xls',NULL,'Starting plugin installation',NULL,'',0,1292778866),(261,0,'gradeexport_xls','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(262,0,'gradeexport_xls','2010090501','Plugin installed',NULL,'',0,1292778866),(263,0,'gradeexport_xml',NULL,'Starting plugin installation',NULL,'',0,1292778866),(264,0,'gradeexport_xml','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(265,0,'gradeexport_xml','2010090501','Plugin installed',NULL,'',0,1292778866),(266,0,'gradeimport_csv',NULL,'Starting plugin installation',NULL,'',0,1292778866),(267,0,'gradeimport_csv','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(268,0,'gradeimport_csv','2010090501','Plugin installed',NULL,'',0,1292778866),(269,0,'gradeimport_xml',NULL,'Starting plugin installation',NULL,'',0,1292778866),(270,0,'gradeimport_xml','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(271,0,'gradeimport_xml','2010090501','Plugin installed',NULL,'',0,1292778866),(272,0,'gradereport_grader',NULL,'Starting plugin installation',NULL,'',0,1292778866),(273,0,'gradereport_grader','2010090501','Upgrade savepoint reached',NULL,'',0,1292778866),(274,0,'gradereport_grader','2010090501','Plugin installed',NULL,'',0,1292778867),(275,0,'gradereport_outcomes',NULL,'Starting plugin installation',NULL,'',0,1292778867),(276,0,'gradereport_outcomes','2010090501','Upgrade savepoint reached',NULL,'',0,1292778867),(277,0,'gradereport_outcomes','2010090501','Plugin installed',NULL,'',0,1292778867),(278,0,'gradereport_overview',NULL,'Starting plugin installation',NULL,'',0,1292778867),(279,0,'gradereport_overview','2010090501','Upgrade savepoint reached',NULL,'',0,1292778867),(280,0,'gradereport_overview','2010090501','Plugin installed',NULL,'',0,1292778867),(281,0,'gradereport_user',NULL,'Starting plugin installation',NULL,'',0,1292778867),(282,0,'gradereport_user','2010090501','Upgrade savepoint reached',NULL,'',0,1292778867),(283,0,'gradereport_user','2010090501','Plugin installed',NULL,'',0,1292778867),(284,0,'mnetservice_enrol',NULL,'Starting plugin installation',NULL,'',0,1292778867),(285,0,'mnetservice_enrol','2010071700','Upgrade savepoint reached',NULL,'',0,1292778867),(286,0,'mnetservice_enrol','2010071700','Plugin installed',NULL,'',0,1292778867),(287,0,'webservice_amf',NULL,'Starting plugin installation',NULL,'',0,1292778867),(288,0,'webservice_amf','2009101900','Upgrade savepoint reached',NULL,'',0,1292778867),(289,0,'webservice_amf','2009101900','Plugin installed',NULL,'',0,1292778867),(290,0,'webservice_rest',NULL,'Starting plugin installation',NULL,'',0,1292778867),(291,0,'webservice_rest','2009100800','Upgrade savepoint reached',NULL,'',0,1292778867),(292,0,'webservice_rest','2009100800','Plugin installed',NULL,'',0,1292778867),(293,0,'webservice_soap',NULL,'Starting plugin installation',NULL,'',0,1292778867),(294,0,'webservice_soap','2009101900','Upgrade savepoint reached',NULL,'',0,1292778867),(295,0,'webservice_soap','2009101900','Plugin installed',NULL,'',0,1292778867),(296,0,'webservice_xmlrpc',NULL,'Starting plugin installation',NULL,'',0,1292778867),(297,0,'webservice_xmlrpc','2009101900','Upgrade savepoint reached',NULL,'',0,1292778867),(298,0,'webservice_xmlrpc','2009101900','Plugin installed',NULL,'',0,1292778867),(299,0,'repository_alfresco',NULL,'Starting plugin installation',NULL,'',0,1292778867),(300,0,'repository_alfresco','2010050700','Upgrade savepoint reached',NULL,'',0,1292778867),(301,0,'repository_alfresco','2010050700','Plugin installed',NULL,'',0,1292778867),(302,0,'repository_boxnet',NULL,'Starting plugin installation',NULL,'',0,1292778867),(303,0,'repository_boxnet','2009080105','Upgrade savepoint reached',NULL,'',0,1292778867),(304,0,'repository_boxnet','2009080105','Plugin installed',NULL,'',0,1292778867),(305,0,'repository_coursefiles',NULL,'Starting plugin installation',NULL,'',0,1292778867),(306,0,'repository_coursefiles','2010083100','Upgrade savepoint reached',NULL,'',0,1292778867),(307,0,'repository_coursefiles','2010083100','Plugin installed',NULL,'',0,1292778867),(308,0,'repository_dropbox',NULL,'Starting plugin installation',NULL,'',0,1292778867),(309,0,'repository_dropbox','2010051400','Upgrade savepoint reached',NULL,'',0,1292778867),(310,0,'repository_dropbox','2010051400','Plugin installed',NULL,'',0,1292778867),(311,0,'repository_filesystem',NULL,'Starting plugin installation',NULL,'',0,1292778867),(312,0,'repository_filesystem','2009080102','Upgrade savepoint reached',NULL,'',0,1292778867),(313,0,'repository_filesystem','2009080102','Plugin installed',NULL,'',0,1292778867),(314,0,'repository_flickr',NULL,'Starting plugin installation',NULL,'',0,1292778867),(315,0,'repository_flickr','2009080102','Upgrade savepoint reached',NULL,'',0,1292778867),(316,0,'repository_flickr','2009080102','Plugin installed',NULL,'',0,1292778867),(317,0,'repository_flickr_public',NULL,'Starting plugin installation',NULL,'',0,1292778867),(318,0,'repository_flickr_public','2009080102','Upgrade savepoint reached',NULL,'',0,1292778867),(319,0,'repository_flickr_public','2009080102','Plugin installed',NULL,'',0,1292778867),(320,0,'repository_googledocs',NULL,'Starting plugin installation',NULL,'',0,1292778867),(321,0,'repository_googledocs','2009080102','Upgrade savepoint reached',NULL,'',0,1292778867),(322,0,'repository_googledocs','2009080102','Plugin installed',NULL,'',0,1292778867),(323,0,'repository_local',NULL,'Starting plugin installation',NULL,'',0,1292778867),(324,0,'repository_local','2009080102','Upgrade savepoint reached',NULL,'',0,1292778867),(325,0,'repository_local','2009080102','Plugin installed',NULL,'',0,1292778867),(326,0,'repository_merlot',NULL,'Starting plugin installation',NULL,'',0,1292778867),(327,0,'repository_merlot','2009111301','Upgrade savepoint reached',NULL,'',0,1292778867),(328,0,'repository_merlot','2009111301','Plugin installed',NULL,'',0,1292778867),(329,0,'repository_picasa',NULL,'Starting plugin installation',NULL,'',0,1292778867),(330,0,'repository_picasa','2009080102','Upgrade savepoint reached',NULL,'',0,1292778867),(331,0,'repository_picasa','2009080102','Plugin installed',NULL,'',0,1292778867),(332,0,'repository_recent',NULL,'Starting plugin installation',NULL,'',0,1292778867),(333,0,'repository_recent','2010042202','Upgrade savepoint reached',NULL,'',0,1292778867),(334,0,'repository_recent','2010042202','Plugin installed',NULL,'',0,1292778867),(335,0,'repository_s3',NULL,'Starting plugin installation',NULL,'',0,1292778867),(336,0,'repository_s3','2009080102','Upgrade savepoint reached',NULL,'',0,1292778867),(337,0,'repository_s3','2009080102','Plugin installed',NULL,'',0,1292778867),(338,0,'repository_upload',NULL,'Starting plugin installation',NULL,'',0,1292778867),(339,0,'repository_upload','2009080102','Upgrade savepoint reached',NULL,'',0,1292778867),(340,0,'repository_upload','2009080102','Plugin installed',NULL,'',0,1292778867),(341,0,'repository_url',NULL,'Starting plugin installation',NULL,'',0,1292778867),(342,0,'repository_url','2009080102','Upgrade savepoint reached',NULL,'',0,1292778867),(343,0,'repository_url','2009080102','Plugin installed',NULL,'',0,1292778868),(344,0,'repository_user',NULL,'Starting plugin installation',NULL,'',0,1292778868),(345,0,'repository_user','2010052700','Upgrade savepoint reached',NULL,'',0,1292778868),(346,0,'repository_user','2010052700','Plugin installed',NULL,'',0,1292778868),(347,0,'repository_webdav',NULL,'Starting plugin installation',NULL,'',0,1292778868),(348,0,'repository_webdav','2009080102','Upgrade savepoint reached',NULL,'',0,1292778868),(349,0,'repository_webdav','2009080102','Plugin installed',NULL,'',0,1292778868),(350,0,'repository_wikimedia',NULL,'Starting plugin installation',NULL,'',0,1292778868),(351,0,'repository_wikimedia','2009080102','Upgrade savepoint reached',NULL,'',0,1292778868),(352,0,'repository_wikimedia','2009080102','Plugin installed',NULL,'',0,1292778868),(353,0,'repository_youtube',NULL,'Starting plugin installation',NULL,'',0,1292778868),(354,0,'repository_youtube','2009080102','Upgrade savepoint reached',NULL,'',0,1292778868),(355,0,'repository_youtube','2009080102','Plugin installed',NULL,'',0,1292778868),(356,0,'portfolio_boxnet',NULL,'Starting plugin installation',NULL,'',0,1292778868),(357,0,'portfolio_boxnet','2010090501','Upgrade savepoint reached',NULL,'',0,1292778868),(358,0,'portfolio_boxnet','2010090501','Plugin installed',NULL,'',0,1292778868),(359,0,'portfolio_download',NULL,'Starting plugin installation',NULL,'',0,1292778868),(360,0,'portfolio_download','2010090501','Upgrade savepoint reached',NULL,'',0,1292778868),(361,0,'portfolio_download','2010090501','Plugin installed',NULL,'',0,1292778868),(362,0,'portfolio_flickr',NULL,'Starting plugin installation',NULL,'',0,1292778868),(363,0,'portfolio_flickr','2010090501','Upgrade savepoint reached',NULL,'',0,1292778868),(364,0,'portfolio_flickr','2010090501','Plugin installed',NULL,'',0,1292778868),(365,0,'portfolio_googledocs',NULL,'Starting plugin installation',NULL,'',0,1292778868),(366,0,'portfolio_googledocs','2010090501','Upgrade savepoint reached',NULL,'',0,1292778868),(367,0,'portfolio_googledocs','2010090501','Plugin installed',NULL,'',0,1292778868),(368,0,'portfolio_mahara',NULL,'Starting plugin installation',NULL,'',0,1292778868),(369,0,'portfolio_mahara','2010090501','Upgrade savepoint reached',NULL,'',0,1292778868),(370,0,'portfolio_mahara','2010090501','Plugin installed',NULL,'',0,1292778868),(371,0,'portfolio_picasa',NULL,'Starting plugin installation',NULL,'',0,1292778868),(372,0,'portfolio_picasa','2010090501','Upgrade savepoint reached',NULL,'',0,1292778868),(373,0,'portfolio_picasa','2010090501','Plugin installed',NULL,'',0,1292778868),(374,0,'qtype_calculated',NULL,'Starting plugin installation',NULL,'',0,1292778868),(375,0,'qtype_calculated','2010090501','Upgrade savepoint reached',NULL,'',0,1292778868),(376,0,'qtype_calculated','2010090501','Plugin installed',NULL,'',0,1292778868),(377,0,'qtype_essay',NULL,'Starting plugin installation',NULL,'',0,1292778868),(378,0,'qtype_essay','2010090501','Upgrade savepoint reached',NULL,'',0,1292778868),(379,0,'qtype_essay','2010090501','Plugin installed',NULL,'',0,1292778868),(380,0,'qtype_match',NULL,'Starting plugin installation',NULL,'',0,1292778868),(381,0,'qtype_match','2010090501','Upgrade savepoint reached',NULL,'',0,1292778868),(382,0,'qtype_match','2010090501','Plugin installed',NULL,'',0,1292778868),(383,0,'qtype_multianswer',NULL,'Starting plugin installation',NULL,'',0,1292778868),(384,0,'qtype_multianswer','2010090501','Upgrade savepoint reached',NULL,'',0,1292778868),(385,0,'qtype_multianswer','2010090501','Plugin installed',NULL,'',0,1292778868),(386,0,'qtype_multichoice',NULL,'Starting plugin installation',NULL,'',0,1292778868),(387,0,'qtype_multichoice','2010090501','Upgrade savepoint reached',NULL,'',0,1292778868),(388,0,'qtype_multichoice','2010090501','Plugin installed',NULL,'',0,1292778868),(389,0,'qtype_numerical',NULL,'Starting plugin installation',NULL,'',0,1292778868),(390,0,'qtype_numerical','2010090501','Upgrade savepoint reached',NULL,'',0,1292778869),(391,0,'qtype_numerical','2010090501','Plugin installed',NULL,'',0,1292778869),(392,0,'qtype_randomsamatch',NULL,'Starting plugin installation',NULL,'',0,1292778869),(393,0,'qtype_randomsamatch','2010090501','Upgrade savepoint reached',NULL,'',0,1292778869),(394,0,'qtype_randomsamatch','2010090501','Plugin installed',NULL,'',0,1292778869),(395,0,'qtype_shortanswer',NULL,'Starting plugin installation',NULL,'',0,1292778869),(396,0,'qtype_shortanswer','2010090501','Upgrade savepoint reached',NULL,'',0,1292778869),(397,0,'qtype_shortanswer','2010090501','Plugin installed',NULL,'',0,1292778869),(398,0,'qtype_truefalse',NULL,'Starting plugin installation',NULL,'',0,1292778869),(399,0,'qtype_truefalse','2010090501','Upgrade savepoint reached',NULL,'',0,1292778869),(400,0,'qtype_truefalse','2010090501','Plugin installed',NULL,'',0,1292778869),(401,0,'assignment_online',NULL,'Starting plugin installation',NULL,'',0,1292778869),(402,0,'assignment_online','2010090501','Upgrade savepoint reached',NULL,'',0,1292778869),(403,0,'assignment_online','2010090501','Plugin installed',NULL,'',0,1292778869),(404,0,'quiz_overview',NULL,'Starting plugin installation',NULL,'',0,1292778869),(405,0,'quiz_overview','2009091400','Upgrade savepoint reached',NULL,'',0,1292778869),(406,0,'quiz_overview','2009091400','Plugin installed',NULL,'',0,1292778869),(407,0,'quiz_statistics',NULL,'Starting plugin installation',NULL,'',0,1292778869),(408,0,'quiz_statistics','2008112100','Upgrade savepoint reached',NULL,'',0,1292778869),(409,0,'quiz_statistics','2008112100','Plugin installed',NULL,'',0,1292778869),(410,0,'workshopform_accumulative',NULL,'Starting plugin installation',NULL,'',0,1292778869),(411,0,'workshopform_accumulative','2010091700','Upgrade savepoint reached',NULL,'',0,1292778869),(412,0,'workshopform_accumulative','2010091700','Plugin installed',NULL,'',0,1292778869),(413,0,'workshopform_comments',NULL,'Starting plugin installation',NULL,'',0,1292778869),(414,0,'workshopform_comments','2010091700','Upgrade savepoint reached',NULL,'',0,1292778869),(415,0,'workshopform_comments','2010091700','Plugin installed',NULL,'',0,1292778869),(416,0,'workshopform_numerrors',NULL,'Starting plugin installation',NULL,'',0,1292778869),(417,0,'workshopform_numerrors','2010091700','Upgrade savepoint reached',NULL,'',0,1292778869),(418,0,'workshopform_numerrors','2010091700','Plugin installed',NULL,'',0,1292778869),(419,0,'workshopform_rubric',NULL,'Starting plugin installation',NULL,'',0,1292778870),(420,0,'workshopform_rubric','2010091700','Upgrade savepoint reached',NULL,'',0,1292778870),(421,0,'workshopform_rubric','2010091700','Plugin installed',NULL,'',0,1292778870),(422,0,'workshopeval_best',NULL,'Starting plugin installation',NULL,'',0,1292778870),(423,0,'workshopeval_best','2010090501','Upgrade savepoint reached',NULL,'',0,1292778870),(424,0,'workshopeval_best','2010090501','Plugin installed',NULL,'',0,1292778870);
/*!40000 ALTER TABLE `upgrade_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url`
--

DROP TABLE IF EXISTS `url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` text,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `externalurl` text,
  `display` smallint(4) unsigned NOT NULL DEFAULT '0',
  `displayoptions` text,
  `parameters` text,
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one url resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url`
--

LOCK TABLES `url` WRITE;
/*!40000 ALTER TABLE `url` DISABLE KEYS */;
/*!40000 ALTER TABLE `url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `idnumber` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `emailstop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `icq` varchar(15) NOT NULL DEFAULT '',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `phone1` varchar(20) NOT NULL DEFAULT '',
  `phone2` varchar(20) NOT NULL DEFAULT '',
  `institution` varchar(40) NOT NULL DEFAULT '',
  `department` varchar(30) NOT NULL DEFAULT '',
  `address` varchar(70) NOT NULL DEFAULT '',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) unsigned NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(45) NOT NULL DEFAULT '',
  `secret` varchar(15) NOT NULL DEFAULT '',
  `picture` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `mailformat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `htmleditor` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ajax` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `autosubscribe` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) unsigned NOT NULL DEFAULT '0',
  `imagealt` varchar(255) DEFAULT NULL,
  `screenreader` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_mneuse_uix` (`mnethostid`,`username`),
  KEY `user_del_ix` (`deleted`),
  KEY `user_con_ix` (`confirmed`),
  KEY `user_fir_ix` (`firstname`),
  KEY `user_las_ix` (`lastname`),
  KEY `user_cit_ix` (`city`),
  KEY `user_cou_ix` (`country`),
  KEY `user_las2_ix` (`lastaccess`),
  KEY `user_ema_ix` (`email`),
  KEY `user_aut_ix` (`auth`),
  KEY `user_idn_ix` (`idnumber`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='One record for each person';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'manual',1,0,0,0,1,'guest','33a52559671d53aebbeafe374ece1905','','Guest User',' ','root@localhost',0,'','','','','','','','','','','','','en','','99',0,0,0,0,'','',0,'','This user is a special user that allows read-only access to some courses.',0,1,0,2,1,1,1,0,0,1292778855,0,NULL,0),(2,'manual',1,0,0,0,1,'admin','b6347991381aaca3f852489b45e8cbe1','','Admin','User','your@email.com',0,'','','','','','','','','','','guess','US','en','','99',1292778855,1358081931,1358081510,1358081929,'172.20.241.200','',0,'',NULL,0,1,0,1,1,1,1,0,0,1352399068,0,'',0),(3,'manual',1,0,0,0,1,'dorfman','b6347991381aaca3f852489b45e8cbe1','','Kent		','Dorfman','kDorfman@faber.edu',0,'','','','','','','','','','','guess','US','en','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1354828190,1354828190,0,'',0),(4,'manual',1,0,0,0,1,'neidermeyer','03a93fd97e57a59a9d53051e46c1620a','','Doug ','Neidermeyer','Neidermeyer@faber.edu',0,'','','','','','','','','','','guess','US','en','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1354829254,1354829254,0,'',0),(5,'manual',1,0,0,0,1,'pepperidge','b6347991381aaca3f852489b45e8cbe1','','Mandy','Pepperidge','Pepperidge@faber.edu',0,'','','','','','','','','','','guess','US','en','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1354829337,1354829337,0,'',0),(6,'manual',1,0,0,0,1,'jansen','b6347991381aaca3f852489b45e8cbe1','','Babs','Jansen','Jansen@faber.edu',0,'','','','','','','','','','','guess','US','en','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1354829448,1354829448,0,'',0),(7,'manual',1,0,0,0,1,'diller','b6347991381aaca3f852489b45e8cbe1','','Chip','Diller@faber.edu','Diller@faber.edu',0,'','','','','','','','','','','guess','US','en','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1354829529,1354829529,0,'',0),(8,'manual',1,0,0,0,1,'blutarsky','b6347991381aaca3f852489b45e8cbe1','','John','Blutarsky','Blutarsky@faber.edu',0,'','','','','','','','','','','guess','US','en','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1354829674,1354829674,0,'',0),(9,'manual',1,0,0,0,1,'hoover','b6347991381aaca3f852489b45e8cbe1','','Robert','Hoover','Hoover@faber.edu',0,'','','','','','','','','','','guess','US','en','','99',0,0,0,0,'','',0,'','',1,1,0,2,1,0,1,0,1354829803,1354829803,0,'',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_enrolments`
--

DROP TABLE IF EXISTS `user_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_enrolments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` bigint(10) unsigned NOT NULL DEFAULT '0',
  `enrolid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `timestart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeend` bigint(10) unsigned NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `userenro_enr_ix` (`enrolid`),
  KEY `userenro_use_ix` (`userid`),
  KEY `userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Users participating in courses (aka enrolled users) - everyb';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_enrolments`
--

LOCK TABLES `user_enrolments` WRITE;
/*!40000 ALTER TABLE `user_enrolments` DISABLE KEYS */;
INSERT INTO `user_enrolments` VALUES (1,0,13,8,1355788800,0,0,1355850953,1355850953),(2,0,13,7,1355788800,0,0,1355850954,1355850954),(3,0,13,3,1355788800,0,0,1355850955,1355850955),(4,0,13,9,1355788800,0,0,1355850956,1355850956),(5,0,13,6,1355788800,0,0,1355850957,1355850957),(6,0,13,4,1355788800,0,0,1355850959,1355850959),(7,0,13,5,1355788800,0,0,1355850960,1355850960),(8,0,13,2,1355788800,0,0,1355850965,1355850965);
/*!40000 ALTER TABLE `user_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info_category`
--

DROP TABLE IF EXISTS `user_info_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info_category` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info_category`
--

LOCK TABLES `user_info_category` WRITE;
/*!40000 ALTER TABLE `user_info_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info_data`
--

DROP TABLE IF EXISTS `user_info_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info_data` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fieldid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `dataformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info_data`
--

LOCK TABLES `user_info_data` WRITE;
/*!40000 ALTER TABLE `user_info_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info_field`
--

DROP TABLE IF EXISTS `user_info_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info_field` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) NOT NULL DEFAULT 'shortname',
  `name` longtext NOT NULL,
  `datatype` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `categoryid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sortorder` bigint(10) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `visible` smallint(4) unsigned NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `signup` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `defaultdata` longtext,
  `defaultdataformat` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info_field`
--

LOCK TABLES `user_info_field` WRITE;
/*!40000 ALTER TABLE `user_info_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_lastaccess`
--

DROP TABLE IF EXISTS `user_lastaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_lastaccess` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `courseid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userlast_usecou_uix` (`userid`,`courseid`),
  KEY `userlast_use_ix` (`userid`),
  KEY `userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_lastaccess`
--

LOCK TABLES `user_lastaccess` WRITE;
/*!40000 ALTER TABLE `user_lastaccess` DISABLE KEYS */;
INSERT INTO `user_lastaccess` VALUES (1,2,2,1354827406),(2,2,3,1355850643),(3,2,4,1354830650),(4,2,5,1355853476),(5,2,6,1355853529);
/*!40000 ALTER TABLE `user_lastaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,2,'message_provider_moodle_notices_loggedin','email'),(2,2,'message_provider_moodle_notices_loggedoff','email'),(3,2,'message_provider_moodle_errors_loggedin','email'),(4,2,'message_provider_moodle_errors_loggedoff','email'),(5,2,'message_provider_moodle_instantmessage_loggedin','popup'),(6,2,'message_provider_moodle_instantmessage_loggedoff','email,popup'),(7,2,'message_provider_moodle_backup_loggedin','email'),(8,2,'message_provider_moodle_backup_loggedoff','email'),(9,2,'message_provider_mod_assignment_assignment_updates_loggedin','email'),(10,2,'message_provider_mod_assignment_assignment_updates_loggedoff','email'),(11,2,'message_provider_mod_feedback_submission_loggedin','email'),(12,2,'message_provider_mod_feedback_submission_loggedoff','email'),(13,2,'message_provider_mod_forum_posts_loggedin','email'),(14,2,'message_provider_mod_forum_posts_loggedoff','email'),(15,2,'message_provider_mod_quiz_submission_loggedin','email'),(16,2,'message_provider_mod_quiz_submission_loggedoff','email'),(17,2,'message_provider_mod_quiz_confirmation_loggedin','email'),(18,2,'message_provider_mod_quiz_confirmation_loggedoff','email'),(19,2,'email_bounce_count','1'),(20,2,'email_send_count','1'),(21,3,'auth_forcepasswordchange','0'),(22,3,'email_bounce_count','1'),(23,3,'email_send_count','1'),(24,3,'message_provider_moodle_notices_loggedin','email'),(25,3,'message_provider_moodle_notices_loggedoff','email'),(26,3,'message_provider_moodle_errors_loggedin','email'),(27,3,'message_provider_moodle_errors_loggedoff','email'),(28,3,'message_provider_moodle_instantmessage_loggedin','popup'),(29,3,'message_provider_moodle_instantmessage_loggedoff','email,popup'),(30,3,'message_provider_moodle_backup_loggedin','email'),(31,3,'message_provider_moodle_backup_loggedoff','email'),(32,3,'message_provider_mod_assignment_assignment_updates_loggedin','email'),(33,3,'message_provider_mod_assignment_assignment_updates_loggedoff','email'),(34,3,'message_provider_mod_feedback_submission_loggedin','email'),(35,3,'message_provider_mod_feedback_submission_loggedoff','email'),(36,3,'message_provider_mod_forum_posts_loggedin','email'),(37,3,'message_provider_mod_forum_posts_loggedoff','email'),(38,3,'message_provider_mod_quiz_submission_loggedin','email'),(39,3,'message_provider_mod_quiz_submission_loggedoff','email'),(40,3,'message_provider_mod_quiz_confirmation_loggedin','email'),(41,3,'message_provider_mod_quiz_confirmation_loggedoff','email'),(42,4,'auth_forcepasswordchange','0'),(43,4,'email_bounce_count','1'),(44,4,'email_send_count','1'),(45,4,'message_provider_moodle_notices_loggedin','email'),(46,4,'message_provider_moodle_notices_loggedoff','email'),(47,4,'message_provider_moodle_errors_loggedin','email'),(48,4,'message_provider_moodle_errors_loggedoff','email'),(49,4,'message_provider_moodle_instantmessage_loggedin','popup'),(50,4,'message_provider_moodle_instantmessage_loggedoff','email,popup'),(51,4,'message_provider_moodle_backup_loggedin','email'),(52,4,'message_provider_moodle_backup_loggedoff','email'),(53,4,'message_provider_mod_assignment_assignment_updates_loggedin','email'),(54,4,'message_provider_mod_assignment_assignment_updates_loggedoff','email'),(55,4,'message_provider_mod_feedback_submission_loggedin','email'),(56,4,'message_provider_mod_feedback_submission_loggedoff','email'),(57,4,'message_provider_mod_forum_posts_loggedin','email'),(58,4,'message_provider_mod_forum_posts_loggedoff','email'),(59,4,'message_provider_mod_quiz_submission_loggedin','email'),(60,4,'message_provider_mod_quiz_submission_loggedoff','email'),(61,4,'message_provider_mod_quiz_confirmation_loggedin','email'),(62,4,'message_provider_mod_quiz_confirmation_loggedoff','email'),(63,5,'auth_forcepasswordchange','0'),(64,5,'email_bounce_count','1'),(65,5,'email_send_count','1'),(66,5,'message_provider_moodle_notices_loggedin','email'),(67,5,'message_provider_moodle_notices_loggedoff','email'),(68,5,'message_provider_moodle_errors_loggedin','email'),(69,5,'message_provider_moodle_errors_loggedoff','email'),(70,5,'message_provider_moodle_instantmessage_loggedin','popup'),(71,5,'message_provider_moodle_instantmessage_loggedoff','email,popup'),(72,5,'message_provider_moodle_backup_loggedin','email'),(73,5,'message_provider_moodle_backup_loggedoff','email'),(74,5,'message_provider_mod_assignment_assignment_updates_loggedin','email'),(75,5,'message_provider_mod_assignment_assignment_updates_loggedoff','email'),(76,5,'message_provider_mod_feedback_submission_loggedin','email'),(77,5,'message_provider_mod_feedback_submission_loggedoff','email'),(78,5,'message_provider_mod_forum_posts_loggedin','email'),(79,5,'message_provider_mod_forum_posts_loggedoff','email'),(80,5,'message_provider_mod_quiz_submission_loggedin','email'),(81,5,'message_provider_mod_quiz_submission_loggedoff','email'),(82,5,'message_provider_mod_quiz_confirmation_loggedin','email'),(83,5,'message_provider_mod_quiz_confirmation_loggedoff','email'),(84,6,'auth_forcepasswordchange','0'),(85,6,'email_bounce_count','1'),(86,6,'email_send_count','1'),(87,6,'message_provider_moodle_notices_loggedin','email'),(88,6,'message_provider_moodle_notices_loggedoff','email'),(89,6,'message_provider_moodle_errors_loggedin','email'),(90,6,'message_provider_moodle_errors_loggedoff','email'),(91,6,'message_provider_moodle_instantmessage_loggedin','popup'),(92,6,'message_provider_moodle_instantmessage_loggedoff','email,popup'),(93,6,'message_provider_moodle_backup_loggedin','email'),(94,6,'message_provider_moodle_backup_loggedoff','email'),(95,6,'message_provider_mod_assignment_assignment_updates_loggedin','email'),(96,6,'message_provider_mod_assignment_assignment_updates_loggedoff','email'),(97,6,'message_provider_mod_feedback_submission_loggedin','email'),(98,6,'message_provider_mod_feedback_submission_loggedoff','email'),(99,6,'message_provider_mod_forum_posts_loggedin','email'),(100,6,'message_provider_mod_forum_posts_loggedoff','email'),(101,6,'message_provider_mod_quiz_submission_loggedin','email'),(102,6,'message_provider_mod_quiz_submission_loggedoff','email'),(103,6,'message_provider_mod_quiz_confirmation_loggedin','email'),(104,6,'message_provider_mod_quiz_confirmation_loggedoff','email'),(105,7,'auth_forcepasswordchange','0'),(106,7,'email_bounce_count','1'),(107,7,'email_send_count','1'),(108,7,'message_provider_moodle_notices_loggedin','email'),(109,7,'message_provider_moodle_notices_loggedoff','email'),(110,7,'message_provider_moodle_errors_loggedin','email'),(111,7,'message_provider_moodle_errors_loggedoff','email'),(112,7,'message_provider_moodle_instantmessage_loggedin','popup'),(113,7,'message_provider_moodle_instantmessage_loggedoff','email,popup'),(114,7,'message_provider_moodle_backup_loggedin','email'),(115,7,'message_provider_moodle_backup_loggedoff','email'),(116,7,'message_provider_mod_assignment_assignment_updates_loggedin','email'),(117,7,'message_provider_mod_assignment_assignment_updates_loggedoff','email'),(118,7,'message_provider_mod_feedback_submission_loggedin','email'),(119,7,'message_provider_mod_feedback_submission_loggedoff','email'),(120,7,'message_provider_mod_forum_posts_loggedin','email'),(121,7,'message_provider_mod_forum_posts_loggedoff','email'),(122,7,'message_provider_mod_quiz_submission_loggedin','email'),(123,7,'message_provider_mod_quiz_submission_loggedoff','email'),(124,7,'message_provider_mod_quiz_confirmation_loggedin','email'),(125,7,'message_provider_mod_quiz_confirmation_loggedoff','email'),(126,8,'auth_forcepasswordchange','0'),(127,8,'email_bounce_count','1'),(128,8,'email_send_count','1'),(129,8,'message_provider_moodle_notices_loggedin','email'),(130,8,'message_provider_moodle_notices_loggedoff','email'),(131,8,'message_provider_moodle_errors_loggedin','email'),(132,8,'message_provider_moodle_errors_loggedoff','email'),(133,8,'message_provider_moodle_instantmessage_loggedin','popup'),(134,8,'message_provider_moodle_instantmessage_loggedoff','email,popup'),(135,8,'message_provider_moodle_backup_loggedin','email'),(136,8,'message_provider_moodle_backup_loggedoff','email'),(137,8,'message_provider_mod_assignment_assignment_updates_loggedin','email'),(138,8,'message_provider_mod_assignment_assignment_updates_loggedoff','email'),(139,8,'message_provider_mod_feedback_submission_loggedin','email'),(140,8,'message_provider_mod_feedback_submission_loggedoff','email'),(141,8,'message_provider_mod_forum_posts_loggedin','email'),(142,8,'message_provider_mod_forum_posts_loggedoff','email'),(143,8,'message_provider_mod_quiz_submission_loggedin','email'),(144,8,'message_provider_mod_quiz_submission_loggedoff','email'),(145,8,'message_provider_mod_quiz_confirmation_loggedin','email'),(146,8,'message_provider_mod_quiz_confirmation_loggedoff','email'),(147,9,'auth_forcepasswordchange','0'),(148,9,'email_bounce_count','1'),(149,9,'email_send_count','1'),(150,9,'message_provider_moodle_notices_loggedin','email'),(151,9,'message_provider_moodle_notices_loggedoff','email'),(152,9,'message_provider_moodle_errors_loggedin','email'),(153,9,'message_provider_moodle_errors_loggedoff','email'),(154,9,'message_provider_moodle_instantmessage_loggedin','popup'),(155,9,'message_provider_moodle_instantmessage_loggedoff','email,popup'),(156,9,'message_provider_moodle_backup_loggedin','email'),(157,9,'message_provider_moodle_backup_loggedoff','email'),(158,9,'message_provider_mod_assignment_assignment_updates_loggedin','email'),(159,9,'message_provider_mod_assignment_assignment_updates_loggedoff','email'),(160,9,'message_provider_mod_feedback_submission_loggedin','email'),(161,9,'message_provider_mod_feedback_submission_loggedoff','email'),(162,9,'message_provider_mod_forum_posts_loggedin','email'),(163,9,'message_provider_mod_forum_posts_loggedoff','email'),(164,9,'message_provider_mod_quiz_submission_loggedin','email'),(165,9,'message_provider_mod_quiz_submission_loggedoff','email'),(166,9,'message_provider_mod_quiz_confirmation_loggedin','email'),(167,9,'message_provider_mod_quiz_confirmation_loggedoff','email');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_private_key`
--

DROP TABLE IF EXISTS `user_private_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_private_key` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `script` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) unsigned NOT NULL,
  `instance` bigint(10) unsigned DEFAULT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) unsigned DEFAULT NULL,
  `timecreated` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userprivkey_scrval_ix` (`script`,`value`),
  KEY `userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='access keys used in cookieless scripts - rss, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_private_key`
--

LOCK TABLES `user_private_key` WRITE;
/*!40000 ALTER TABLE `user_private_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_private_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webdav_locks`
--

DROP TABLE IF EXISTS `webdav_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webdav_locks` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `expiry` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `recursive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created` bigint(10) unsigned NOT NULL DEFAULT '0',
  `modified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webdlock_tok_uix` (`token`),
  KEY `webdlock_pat_ix` (`path`),
  KEY `webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource locks for WebDAV users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webdav_locks`
--

LOCK TABLES `webdav_locks` WRITE;
/*!40000 ALTER TABLE `webdav_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `webdav_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki`
--

DROP TABLE IF EXISTS `wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'Wiki',
  `intro` mediumtext,
  `introformat` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `editbegin` bigint(10) unsigned NOT NULL DEFAULT '0',
  `editend` bigint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Wiki activity configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki`
--

LOCK TABLES `wiki` WRITE;
/*!40000 ALTER TABLE `wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_links`
--

DROP TABLE IF EXISTS `wiki_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_links` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `frompageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `topageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wikilink_fro_ix` (`frompageid`),
  KEY `wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Page wiki links';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_links`
--

LOCK TABLES `wiki_links` WRITE;
/*!40000 ALTER TABLE `wiki_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_locks`
--

DROP TABLE IF EXISTS `wiki_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_locks` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sectionname` varchar(255) DEFAULT NULL,
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `lockedat` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Manages page locks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_locks`
--

LOCK TABLES `wiki_locks` WRITE;
/*!40000 ALTER TABLE `wiki_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_pages` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'title',
  `cachedcontent` mediumtext NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timerendered` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageviews` bigint(10) unsigned NOT NULL DEFAULT '0',
  `readonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_subwikis`
--

DROP TABLE IF EXISTS `wiki_subwikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_subwikis` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores subwiki instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_subwikis`
--

LOCK TABLES `wiki_subwikis` WRITE;
/*!40000 ALTER TABLE `wiki_subwikis` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_subwikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_synonyms`
--

DROP TABLE IF EXISTS `wiki_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_synonyms` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages synonyms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_synonyms`
--

LOCK TABLES `wiki_synonyms` WRITE;
/*!40000 ALTER TABLE `wiki_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_versions`
--

DROP TABLE IF EXISTS `wiki_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_versions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `contentformat` varchar(20) NOT NULL DEFAULT 'creole',
  `version` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki page history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_versions`
--

LOCK TABLES `wiki_versions` WRITE;
/*!40000 ALTER TABLE `wiki_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop`
--

DROP TABLE IF EXISTS `workshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `instructauthors` longtext,
  `instructauthorsformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `instructreviewers` longtext,
  `instructreviewersformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL,
  `phase` smallint(3) unsigned DEFAULT '0',
  `useexamples` tinyint(2) unsigned DEFAULT '0',
  `usepeerassessment` tinyint(2) unsigned DEFAULT '0',
  `useselfassessment` tinyint(2) unsigned DEFAULT '0',
  `grade` decimal(10,5) unsigned DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) unsigned DEFAULT '20.00000',
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `evaluation` varchar(30) NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) unsigned DEFAULT '0',
  `nattachments` smallint(3) unsigned DEFAULT '0',
  `latesubmissions` tinyint(2) unsigned DEFAULT '0',
  `maxbytes` bigint(10) unsigned DEFAULT '100000',
  `examplesmode` smallint(3) unsigned DEFAULT '0',
  `submissionstart` bigint(10) unsigned DEFAULT '0',
  `submissionend` bigint(10) unsigned DEFAULT '0',
  `assessmentstart` bigint(10) unsigned DEFAULT '0',
  `assessmentend` bigint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about the module instances and ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop`
--

LOCK TABLES `workshop` WRITE;
/*!40000 ALTER TABLE `workshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_aggregations`
--

DROP TABLE IF EXISTS `workshop_aggregations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_aggregations` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `userid` bigint(10) unsigned NOT NULL,
  `gradinggrade` decimal(10,5) unsigned DEFAULT NULL,
  `timegraded` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `workaggr_wor_ix` (`workshopid`),
  KEY `workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aggregated grades for assessment are stored here. The aggreg';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_aggregations`
--

LOCK TABLES `workshop_aggregations` WRITE;
/*!40000 ALTER TABLE `workshop_aggregations` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_aggregations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_assessments`
--

DROP TABLE IF EXISTS `workshop_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_assessments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) unsigned NOT NULL,
  `reviewerid` bigint(10) unsigned NOT NULL,
  `weight` bigint(10) unsigned NOT NULL DEFAULT '1',
  `timecreated` bigint(10) unsigned DEFAULT '0',
  `timemodified` bigint(10) unsigned DEFAULT '0',
  `grade` decimal(10,5) unsigned DEFAULT NULL,
  `gradinggrade` decimal(10,5) unsigned DEFAULT NULL,
  `gradinggradeover` decimal(10,5) unsigned DEFAULT NULL,
  `gradinggradeoverby` bigint(10) unsigned DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) unsigned DEFAULT '0',
  `feedbackreviewer` longtext,
  `feedbackreviewerformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `workasse_sub_ix` (`submissionid`),
  KEY `workasse_gra_ix` (`gradinggradeoverby`),
  KEY `workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the made assessment and automatically calculated ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_assessments`
--

LOCK TABLES `workshop_assessments` WRITE;
/*!40000 ALTER TABLE `workshop_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_assessments_old`
--

DROP TABLE IF EXISTS `workshop_assessments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_assessments_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `submissionid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timegraded` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) unsigned NOT NULL DEFAULT '0',
  `mailed` smallint(3) unsigned NOT NULL DEFAULT '0',
  `resubmission` smallint(3) unsigned NOT NULL DEFAULT '0',
  `donotuse` smallint(3) unsigned NOT NULL DEFAULT '0',
  `generalcomment` text,
  `teachercomment` text,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workasseold_use_ix` (`userid`),
  KEY `workasseold_mai_ix` (`mailed`),
  KEY `workasseold_wor_ix` (`workshopid`),
  KEY `workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_assessments table to be dropped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_assessments_old`
--

LOCK TABLES `workshop_assessments_old` WRITE;
/*!40000 ALTER TABLE `workshop_assessments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_assessments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_comments_old`
--

DROP TABLE IF EXISTS `workshop_comments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_comments_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workcommold_use_ix` (`userid`),
  KEY `workcommold_mai_ix` (`mailed`),
  KEY `workcommold_wor_ix` (`workshopid`),
  KEY `workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_comments table to be dropped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_comments_old`
--

LOCK TABLES `workshop_comments_old` WRITE;
/*!40000 ALTER TABLE `workshop_comments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_comments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_elements_old`
--

DROP TABLE IF EXISTS `workshop_elements_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_elements_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` smallint(3) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `scale` smallint(3) unsigned NOT NULL DEFAULT '0',
  `maxscore` smallint(3) unsigned NOT NULL DEFAULT '1',
  `weight` smallint(3) unsigned NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_elements table to be dropped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_elements_old`
--

LOCK TABLES `workshop_elements_old` WRITE;
/*!40000 ALTER TABLE `workshop_elements_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_elements_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_grades`
--

DROP TABLE IF EXISTS `workshop_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_grades` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) unsigned NOT NULL,
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `dimensionid` bigint(10) unsigned NOT NULL,
  `grade` decimal(10,5) unsigned NOT NULL,
  `peercomment` longtext,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='How the reviewers filled-up the grading forms, given grades ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_grades`
--

LOCK TABLES `workshop_grades` WRITE;
/*!40000 ALTER TABLE `workshop_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_grades_old`
--

DROP TABLE IF EXISTS `workshop_grades_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_grades_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` bigint(10) unsigned NOT NULL DEFAULT '0',
  `feedback` text NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workgradold_wor_ix` (`workshopid`),
  KEY `workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_grades_old`
--

LOCK TABLES `workshop_grades_old` WRITE;
/*!40000 ALTER TABLE `workshop_grades_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_grades_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_old`
--

DROP TABLE IF EXISTS `workshop_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `wtype` smallint(3) unsigned NOT NULL DEFAULT '0',
  `nelements` smallint(3) unsigned NOT NULL DEFAULT '1',
  `nattachments` smallint(3) unsigned NOT NULL DEFAULT '0',
  `phase` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `format` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `includeself` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) unsigned NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) unsigned NOT NULL DEFAULT '0',
  `submissionend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) unsigned NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) unsigned NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) unsigned NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) unsigned NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) unsigned NOT NULL DEFAULT '0',
  `overallocation` smallint(3) unsigned NOT NULL DEFAULT '0',
  `timemodified` bigint(10) unsigned NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) unsigned NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) unsigned NOT NULL DEFAULT '0',
  `usepassword` smallint(3) unsigned NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop table to be dropped later in Moodle 2.x';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_old`
--

LOCK TABLES `workshop_old` WRITE;
/*!40000 ALTER TABLE `workshop_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_rubrics_old`
--

DROP TABLE IF EXISTS `workshop_rubrics_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_rubrics_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` bigint(10) unsigned NOT NULL DEFAULT '0',
  `rubricno` smallint(3) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_rubrics_old`
--

LOCK TABLES `workshop_rubrics_old` WRITE;
/*!40000 ALTER TABLE `workshop_rubrics_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_rubrics_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_stockcomments_old`
--

DROP TABLE IF EXISTS `workshop_stockcomments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_stockcomments_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `elementno` bigint(10) unsigned NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_stockcomments table to be dropped later in M';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_stockcomments_old`
--

LOCK TABLES `workshop_stockcomments_old` WRITE;
/*!40000 ALTER TABLE `workshop_stockcomments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_stockcomments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_submissions`
--

DROP TABLE IF EXISTS `workshop_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_submissions` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `example` tinyint(2) unsigned DEFAULT '0',
  `authorid` bigint(10) unsigned NOT NULL,
  `timecreated` bigint(10) unsigned NOT NULL,
  `timemodified` bigint(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `contentformat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) unsigned NOT NULL DEFAULT '0',
  `attachment` tinyint(2) unsigned DEFAULT '0',
  `grade` decimal(10,5) unsigned DEFAULT NULL,
  `gradeover` decimal(10,5) unsigned DEFAULT NULL,
  `gradeoverby` bigint(10) unsigned DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) unsigned DEFAULT '0',
  `timegraded` bigint(10) unsigned DEFAULT NULL,
  `published` tinyint(2) unsigned DEFAULT '0',
  `late` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `worksubm_wor_ix` (`workshopid`),
  KEY `worksubm_gra_ix` (`gradeoverby`),
  KEY `worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the submission and the aggregation of the grade f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_submissions`
--

LOCK TABLES `workshop_submissions` WRITE;
/*!40000 ALTER TABLE `workshop_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshop_submissions_old`
--

DROP TABLE IF EXISTS `workshop_submissions_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshop_submissions_old` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mailed` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `gradinggrade` smallint(3) unsigned NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) unsigned NOT NULL DEFAULT '0',
  `late` smallint(3) unsigned NOT NULL DEFAULT '0',
  `nassessments` bigint(10) unsigned NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `worksubmold_use_ix` (`userid`),
  KEY `worksubmold_mai_ix` (`mailed`),
  KEY `worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_submissions table to be dropped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshop_submissions_old`
--

LOCK TABLES `workshop_submissions_old` WRITE;
/*!40000 ALTER TABLE `workshop_submissions_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshop_submissions_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshopeval_best_settings`
--

DROP TABLE IF EXISTS `workshopeval_best_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshopeval_best_settings` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `comparison` smallint(3) unsigned DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Settings for the grading evaluation subplugin Comparison wit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshopeval_best_settings`
--

LOCK TABLES `workshopeval_best_settings` WRITE;
/*!40000 ALTER TABLE `workshopeval_best_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshopeval_best_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshopform_accumulative`
--

DROP TABLE IF EXISTS `workshopform_accumulative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshopform_accumulative` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Accumulative gradin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshopform_accumulative`
--

LOCK TABLES `workshopform_accumulative` WRITE;
/*!40000 ALTER TABLE `workshopform_accumulative` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshopform_accumulative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshopform_comments`
--

DROP TABLE IF EXISTS `workshopform_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshopform_comments` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Comments strategy f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshopform_comments`
--

LOCK TABLES `workshopform_comments` WRITE;
/*!40000 ALTER TABLE `workshopform_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshopform_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshopform_numerrors`
--

DROP TABLE IF EXISTS `workshopform_numerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshopform_numerrors` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  `descriptiontrust` bigint(10) unsigned DEFAULT NULL,
  `grade0` varchar(50) DEFAULT NULL,
  `grade1` varchar(50) DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Number of errors gr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshopform_numerrors`
--

LOCK TABLES `workshopform_numerrors` WRITE;
/*!40000 ALTER TABLE `workshopform_numerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshopform_numerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshopform_numerrors_map`
--

DROP TABLE IF EXISTS `workshopform_numerrors_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshopform_numerrors_map` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `nonegative` bigint(10) unsigned NOT NULL,
  `grade` decimal(10,5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This maps the number of errors to a percentual grade for sub';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshopform_numerrors_map`
--

LOCK TABLES `workshopform_numerrors_map` WRITE;
/*!40000 ALTER TABLE `workshopform_numerrors_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshopform_numerrors_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshopform_rubric`
--

DROP TABLE IF EXISTS `workshopform_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshopform_rubric` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `sort` bigint(10) unsigned DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Rubric grading stra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshopform_rubric`
--

LOCK TABLES `workshopform_rubric` WRITE;
/*!40000 ALTER TABLE `workshopform_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshopform_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshopform_rubric_config`
--

DROP TABLE IF EXISTS `workshopform_rubric_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshopform_rubric_config` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) unsigned NOT NULL,
  `layout` varchar(30) DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration table for the Rubric grading strategy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshopform_rubric_config`
--

LOCK TABLES `workshopform_rubric_config` WRITE;
/*!40000 ALTER TABLE `workshopform_rubric_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshopform_rubric_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshopform_rubric_levels`
--

DROP TABLE IF EXISTS `workshopform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshopform_rubric_levels` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) unsigned NOT NULL,
  `grade` decimal(10,5) unsigned NOT NULL,
  `definition` longtext,
  `definitionformat` smallint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The definition of rubric rating scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshopform_rubric_levels`
--

LOCK TABLES `workshopform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `workshopform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshopform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-13 23:38:59
