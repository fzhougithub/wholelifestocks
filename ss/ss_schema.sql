-- MySQL dump 10.13  Distrib 5.6.43-84.3, for Linux (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	5.6.29-76.2-log

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
-- Current Database: `mybb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mybb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mybb`;

--
-- Table structure for table `mybb_adminlog`
--

DROP TABLE IF EXISTS `mybb_adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_adminlog` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `ipaddress` varchar(50) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  KEY `module` (`module`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_adminoptions`
--

DROP TABLE IF EXISTS `mybb_adminoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_adminoptions` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `cpstyle` varchar(50) NOT NULL DEFAULT '',
  `codepress` int(1) NOT NULL DEFAULT '1',
  `notes` text NOT NULL,
  `permissions` text NOT NULL,
  `defaultviews` text NOT NULL,
  `loginattempts` int(10) unsigned NOT NULL DEFAULT '0',
  `loginlockoutexpiry` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_adminsessions`
--

DROP TABLE IF EXISTS `mybb_adminsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_adminsessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `loginkey` varchar(50) NOT NULL DEFAULT '',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `lastactive` bigint(30) NOT NULL DEFAULT '0',
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_adminviews`
--

DROP TABLE IF EXISTS `mybb_adminviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_adminviews` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(6) NOT NULL DEFAULT '',
  `visibility` int(1) NOT NULL DEFAULT '0',
  `fields` text NOT NULL,
  `conditions` text NOT NULL,
  `custom_profile_fields` text NOT NULL,
  `sortby` varchar(20) NOT NULL DEFAULT '',
  `sortorder` varchar(4) NOT NULL DEFAULT '',
  `perpage` int(4) NOT NULL DEFAULT '0',
  `view_type` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_announcements`
--

DROP TABLE IF EXISTS `mybb_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_announcements` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `startdate` bigint(30) NOT NULL DEFAULT '0',
  `enddate` bigint(30) NOT NULL DEFAULT '0',
  `allowhtml` int(1) NOT NULL DEFAULT '0',
  `allowmycode` int(1) NOT NULL DEFAULT '0',
  `allowsmilies` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_attachments`
--

DROP TABLE IF EXISTS `mybb_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_attachments` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0',
  `posthash` varchar(50) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(120) NOT NULL DEFAULT '',
  `filetype` varchar(120) NOT NULL DEFAULT '',
  `filesize` int(10) NOT NULL DEFAULT '0',
  `attachname` varchar(120) NOT NULL DEFAULT '',
  `downloads` int(10) unsigned NOT NULL DEFAULT '0',
  `dateuploaded` bigint(30) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  `thumbnail` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  KEY `posthash` (`posthash`),
  KEY `pid` (`pid`,`visible`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_attachtypes`
--

DROP TABLE IF EXISTS `mybb_attachtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_attachtypes` (
  `atid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `mimetype` varchar(120) NOT NULL DEFAULT '',
  `extension` varchar(10) NOT NULL DEFAULT '',
  `maxsize` int(15) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`atid`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_awaitingactivation`
--

DROP TABLE IF EXISTS `mybb_awaitingactivation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_awaitingactivation` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `code` varchar(100) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT '',
  `oldgroup` bigint(30) NOT NULL DEFAULT '0',
  `misc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_badwords`
--

DROP TABLE IF EXISTS `mybb_badwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_badwords` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `badword` varchar(100) NOT NULL DEFAULT '',
  `replacement` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_banfilters`
--

DROP TABLE IF EXISTS `mybb_banfilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_banfilters` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(200) NOT NULL DEFAULT '',
  `type` int(1) NOT NULL DEFAULT '0',
  `lastuse` bigint(30) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_banned`
--

DROP TABLE IF EXISTS `mybb_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_banned` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `oldgroup` int(10) unsigned NOT NULL DEFAULT '0',
  `oldadditionalgroups` text NOT NULL,
  `olddisplaygroup` int(11) NOT NULL DEFAULT '0',
  `admin` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `bantime` varchar(50) NOT NULL DEFAULT '',
  `lifted` bigint(30) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  KEY `uid` (`uid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_calendarpermissions`
--

DROP TABLE IF EXISTS `mybb_calendarpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_calendarpermissions` (
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `canviewcalendar` int(1) NOT NULL DEFAULT '0',
  `canaddevents` int(1) NOT NULL DEFAULT '0',
  `canbypasseventmod` int(1) NOT NULL DEFAULT '0',
  `canmoderateevents` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_calendars`
--

DROP TABLE IF EXISTS `mybb_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_calendars` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `disporder` int(10) unsigned NOT NULL DEFAULT '0',
  `startofweek` int(1) NOT NULL DEFAULT '0',
  `showbirthdays` int(1) NOT NULL DEFAULT '0',
  `eventlimit` int(3) NOT NULL DEFAULT '0',
  `moderation` int(1) NOT NULL DEFAULT '0',
  `allowhtml` int(1) NOT NULL DEFAULT '0',
  `allowmycode` int(1) NOT NULL DEFAULT '0',
  `allowimgcode` int(1) NOT NULL DEFAULT '0',
  `allowvideocode` int(1) NOT NULL DEFAULT '0',
  `allowsmilies` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_captcha`
--

DROP TABLE IF EXISTS `mybb_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_captcha` (
  `imagehash` varchar(32) NOT NULL DEFAULT '',
  `imagestring` varchar(8) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  KEY `imagehash` (`imagehash`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_datacache`
--

DROP TABLE IF EXISTS `mybb_datacache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_datacache` (
  `title` varchar(50) NOT NULL DEFAULT '',
  `cache` mediumtext NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_delayedmoderation`
--

DROP TABLE IF EXISTS `mybb_delayedmoderation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_delayedmoderation` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `delaydateline` bigint(30) NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tids` text NOT NULL,
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `inputs` text NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_events`
--

DROP TABLE IF EXISTS `mybb_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_events` (
  `eid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `visible` int(1) NOT NULL DEFAULT '0',
  `private` int(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `timezone` varchar(4) NOT NULL DEFAULT '0',
  `ignoretimezone` int(1) NOT NULL DEFAULT '0',
  `usingtime` int(1) NOT NULL DEFAULT '0',
  `repeats` text NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `daterange` (`starttime`,`endtime`),
  KEY `private` (`private`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_forumpermissions`
--

DROP TABLE IF EXISTS `mybb_forumpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_forumpermissions` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `canview` int(1) NOT NULL DEFAULT '0',
  `canviewthreads` int(1) NOT NULL DEFAULT '0',
  `canonlyviewownthreads` int(1) NOT NULL DEFAULT '0',
  `candlattachments` int(1) NOT NULL DEFAULT '0',
  `canpostthreads` int(1) NOT NULL DEFAULT '0',
  `canpostreplys` int(1) NOT NULL DEFAULT '0',
  `canpostattachments` int(1) NOT NULL DEFAULT '0',
  `canratethreads` int(1) NOT NULL DEFAULT '0',
  `caneditposts` int(1) NOT NULL DEFAULT '0',
  `candeleteposts` int(1) NOT NULL DEFAULT '0',
  `candeletethreads` int(1) NOT NULL DEFAULT '0',
  `caneditattachments` int(1) NOT NULL DEFAULT '0',
  `canpostpolls` int(1) NOT NULL DEFAULT '0',
  `canvotepolls` int(1) NOT NULL DEFAULT '0',
  `cansearch` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_forums`
--

DROP TABLE IF EXISTS `mybb_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_forums` (
  `fid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `linkto` varchar(180) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentlist` text NOT NULL,
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  `open` int(1) NOT NULL DEFAULT '0',
  `threads` int(10) unsigned NOT NULL DEFAULT '0',
  `posts` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastposter` varchar(120) NOT NULL DEFAULT '',
  `lastposteruid` int(10) unsigned NOT NULL DEFAULT '0',
  `lastposttid` int(10) NOT NULL DEFAULT '0',
  `lastpostsubject` varchar(120) NOT NULL DEFAULT '',
  `allowhtml` int(1) NOT NULL DEFAULT '0',
  `allowmycode` int(1) NOT NULL DEFAULT '0',
  `allowsmilies` int(1) NOT NULL DEFAULT '0',
  `allowimgcode` int(1) NOT NULL DEFAULT '0',
  `allowvideocode` int(1) NOT NULL DEFAULT '0',
  `allowpicons` int(1) NOT NULL DEFAULT '0',
  `allowtratings` int(1) NOT NULL DEFAULT '0',
  `status` int(4) NOT NULL DEFAULT '1',
  `usepostcounts` int(1) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  `showinjump` int(1) NOT NULL DEFAULT '0',
  `modposts` int(1) NOT NULL DEFAULT '0',
  `modthreads` int(1) NOT NULL DEFAULT '0',
  `mod_edit_posts` int(1) NOT NULL DEFAULT '0',
  `modattachments` int(1) NOT NULL DEFAULT '0',
  `style` smallint(5) unsigned NOT NULL DEFAULT '0',
  `overridestyle` int(1) NOT NULL DEFAULT '0',
  `rulestype` smallint(1) NOT NULL DEFAULT '0',
  `rulestitle` varchar(200) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `unapprovedthreads` int(10) unsigned NOT NULL DEFAULT '0',
  `unapprovedposts` int(10) unsigned NOT NULL DEFAULT '0',
  `defaultdatecut` smallint(4) unsigned NOT NULL DEFAULT '0',
  `defaultsortby` varchar(10) NOT NULL DEFAULT '',
  `defaultsortorder` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_forumsread`
--

DROP TABLE IF EXISTS `mybb_forumsread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_forumsread` (
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `fid` (`fid`,`uid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_forumsubscriptions`
--

DROP TABLE IF EXISTS `mybb_forumsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_forumsubscriptions` (
  `fsid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_groupleaders`
--

DROP TABLE IF EXISTS `mybb_groupleaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_groupleaders` (
  `lid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `canmanagemembers` int(1) NOT NULL DEFAULT '0',
  `canmanagerequests` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_helpdocs`
--

DROP TABLE IF EXISTS `mybb_helpdocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_helpdocs` (
  `hid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `document` text NOT NULL,
  `usetranslation` int(1) NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '0',
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_helpsections`
--

DROP TABLE IF EXISTS `mybb_helpsections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_helpsections` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `usetranslation` int(1) NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '0',
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_icons`
--

DROP TABLE IF EXISTS `mybb_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_icons` (
  `iid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `path` varchar(220) NOT NULL DEFAULT '',
  PRIMARY KEY (`iid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_joinrequests`
--

DROP TABLE IF EXISTS `mybb_joinrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_joinrequests` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(250) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_mailerrors`
--

DROP TABLE IF EXISTS `mybb_mailerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_mailerrors` (
  `eid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `toaddress` varchar(150) NOT NULL DEFAULT '',
  `fromaddress` varchar(150) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `error` text NOT NULL,
  `smtperror` varchar(200) NOT NULL DEFAULT '',
  `smtpcode` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_maillogs`
--

DROP TABLE IF EXISTS `mybb_maillogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_maillogs` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `fromuid` int(10) unsigned NOT NULL DEFAULT '0',
  `fromemail` varchar(200) NOT NULL DEFAULT '',
  `touid` bigint(30) NOT NULL DEFAULT '0',
  `toemail` varchar(200) NOT NULL DEFAULT '',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `ipaddress` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_mailqueue`
--

DROP TABLE IF EXISTS `mybb_mailqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_mailqueue` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mailto` varchar(200) NOT NULL,
  `mailfrom` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `headers` text NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_massemails`
--

DROP TABLE IF EXISTS `mybb_massemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_massemails` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(200) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `htmlmessage` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `format` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `senddate` bigint(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `totalcount` int(10) unsigned NOT NULL DEFAULT '0',
  `conditions` text NOT NULL,
  `perpage` smallint(4) NOT NULL DEFAULT '50',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_moderatorlog`
--

DROP TABLE IF EXISTS `mybb_moderatorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_moderatorlog` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `action` text NOT NULL,
  `data` text NOT NULL,
  `ipaddress` varchar(50) NOT NULL DEFAULT '',
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_moderators`
--

DROP TABLE IF EXISTS `mybb_moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_moderators` (
  `mid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `isgroup` int(1) unsigned NOT NULL DEFAULT '0',
  `caneditposts` int(1) NOT NULL DEFAULT '0',
  `candeleteposts` int(1) NOT NULL DEFAULT '0',
  `canviewips` int(1) NOT NULL DEFAULT '0',
  `canopenclosethreads` int(1) NOT NULL DEFAULT '0',
  `canmanagethreads` int(1) NOT NULL DEFAULT '0',
  `canmovetononmodforum` int(1) NOT NULL DEFAULT '0',
  `canusecustomtools` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `uid` (`id`,`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_modtools`
--

DROP TABLE IF EXISTS `mybb_modtools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_modtools` (
  `tid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `forums` text NOT NULL,
  `type` char(1) NOT NULL DEFAULT '',
  `postoptions` text NOT NULL,
  `threadoptions` text NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_mycode`
--

DROP TABLE IF EXISTS `mybb_mycode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_mycode` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `regex` text NOT NULL,
  `replacement` text NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `parseorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_polls`
--

DROP TABLE IF EXISTS `mybb_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_polls` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `question` varchar(200) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `options` text NOT NULL,
  `votes` text NOT NULL,
  `numoptions` smallint(5) unsigned NOT NULL DEFAULT '0',
  `numvotes` text NOT NULL,
  `timeout` bigint(30) NOT NULL DEFAULT '0',
  `closed` int(1) NOT NULL DEFAULT '0',
  `multiple` int(1) NOT NULL DEFAULT '0',
  `public` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_pollvotes`
--

DROP TABLE IF EXISTS `mybb_pollvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_pollvotes` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `voteoption` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `pid` (`pid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_posts`
--

DROP TABLE IF EXISTS `mybb_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_posts` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `replyto` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `icon` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(80) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `ipaddress` varchar(30) NOT NULL DEFAULT '',
  `longipaddress` int(11) NOT NULL DEFAULT '0',
  `includesig` int(1) NOT NULL DEFAULT '0',
  `smilieoff` int(1) NOT NULL DEFAULT '0',
  `edituid` int(10) unsigned NOT NULL DEFAULT '0',
  `edittime` int(10) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  `posthash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `tid` (`tid`,`uid`),
  KEY `uid` (`uid`),
  KEY `visible` (`visible`),
  KEY `dateline` (`dateline`),
  KEY `longipaddress` (`longipaddress`),
  FULLTEXT KEY `message` (`message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_privatemessages`
--

DROP TABLE IF EXISTS `mybb_privatemessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_privatemessages` (
  `pmid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `toid` int(10) unsigned NOT NULL DEFAULT '0',
  `fromid` int(10) unsigned NOT NULL DEFAULT '0',
  `recipients` text NOT NULL,
  `folder` smallint(5) unsigned NOT NULL DEFAULT '1',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `icon` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `deletetime` bigint(30) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `statustime` bigint(30) NOT NULL DEFAULT '0',
  `includesig` int(1) NOT NULL DEFAULT '0',
  `smilieoff` int(1) NOT NULL DEFAULT '0',
  `receipt` int(1) NOT NULL DEFAULT '0',
  `readtime` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `uid` (`uid`,`folder`),
  KEY `toid` (`toid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_profilefields`
--

DROP TABLE IF EXISTS `mybb_profilefields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_profilefields` (
  `fid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` text NOT NULL,
  `length` smallint(5) unsigned NOT NULL DEFAULT '0',
  `maxlength` smallint(5) unsigned NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `editable` int(1) NOT NULL DEFAULT '0',
  `hidden` int(1) NOT NULL DEFAULT '0',
  `postnum` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_promotionlogs`
--

DROP TABLE IF EXISTS `mybb_promotionlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_promotionlogs` (
  `plid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `oldusergroup` varchar(200) NOT NULL DEFAULT '0',
  `newusergroup` smallint(6) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `type` varchar(9) NOT NULL DEFAULT 'primary',
  PRIMARY KEY (`plid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_promotions`
--

DROP TABLE IF EXISTS `mybb_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_promotions` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `logging` tinyint(1) NOT NULL DEFAULT '0',
  `posts` int(11) NOT NULL DEFAULT '0',
  `posttype` char(2) NOT NULL DEFAULT '',
  `registered` int(11) NOT NULL DEFAULT '0',
  `registeredtype` varchar(20) NOT NULL DEFAULT '',
  `reputations` int(11) NOT NULL DEFAULT '0',
  `reputationtype` char(2) NOT NULL DEFAULT '',
  `referrals` int(11) NOT NULL DEFAULT '0',
  `referralstype` char(2) NOT NULL DEFAULT '',
  `requirements` varchar(200) NOT NULL DEFAULT '',
  `originalusergroup` varchar(120) NOT NULL DEFAULT '0',
  `newusergroup` smallint(5) unsigned NOT NULL DEFAULT '0',
  `usergrouptype` varchar(120) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_reportedposts`
--

DROP TABLE IF EXISTS `mybb_reportedposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_reportedposts` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `reportstatus` int(1) NOT NULL DEFAULT '0',
  `reason` varchar(250) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  KEY `fid` (`fid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_reputation`
--

DROP TABLE IF EXISTS `mybb_reputation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_reputation` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `adduid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `reputation` bigint(30) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `uid` (`uid`),
  KEY `pid` (`pid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_searchlog`
--

DROP TABLE IF EXISTS `mybb_searchlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_searchlog` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `ipaddress` varchar(120) NOT NULL DEFAULT '',
  `threads` longtext NOT NULL,
  `posts` longtext NOT NULL,
  `resulttype` varchar(10) NOT NULL DEFAULT '',
  `querycache` text NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_sessions`
--

DROP TABLE IF EXISTS `mybb_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_sessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `time` bigint(30) NOT NULL DEFAULT '0',
  `location` varchar(150) NOT NULL DEFAULT '',
  `useragent` varchar(100) NOT NULL DEFAULT '',
  `anonymous` int(1) NOT NULL DEFAULT '0',
  `nopermission` int(1) NOT NULL DEFAULT '0',
  `location1` int(10) NOT NULL DEFAULT '0',
  `location2` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`),
  KEY `location1` (`location1`),
  KEY `location2` (`location2`),
  KEY `time` (`time`),
  KEY `uid` (`uid`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_settinggroups`
--

DROP TABLE IF EXISTS `mybb_settinggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_settinggroups` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(220) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `isdefault` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_settings`
--

DROP TABLE IF EXISTS `mybb_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_settings` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `optionscode` text NOT NULL,
  `value` text NOT NULL,
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `gid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `isdefault` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_smilies`
--

DROP TABLE IF EXISTS `mybb_smilies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_smilies` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `find` varchar(120) NOT NULL DEFAULT '',
  `image` varchar(220) NOT NULL DEFAULT '',
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `showclickable` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_spiders`
--

DROP TABLE IF EXISTS `mybb_spiders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_spiders` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `theme` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(20) NOT NULL DEFAULT '',
  `usergroup` int(10) unsigned NOT NULL DEFAULT '0',
  `useragent` varchar(200) NOT NULL DEFAULT '',
  `lastvisit` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_stats`
--

DROP TABLE IF EXISTS `mybb_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_stats` (
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `numusers` int(10) unsigned NOT NULL DEFAULT '0',
  `numthreads` int(10) unsigned NOT NULL DEFAULT '0',
  `numposts` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_tasklog`
--

DROP TABLE IF EXISTS `mybb_tasklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_tasklog` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_tasks`
--

DROP TABLE IF EXISTS `mybb_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_tasks` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `file` varchar(30) NOT NULL DEFAULT '',
  `minute` varchar(200) NOT NULL DEFAULT '',
  `hour` varchar(200) NOT NULL DEFAULT '',
  `day` varchar(100) NOT NULL DEFAULT '',
  `month` varchar(30) NOT NULL DEFAULT '',
  `weekday` varchar(15) NOT NULL DEFAULT '',
  `nextrun` bigint(30) NOT NULL DEFAULT '0',
  `lastrun` bigint(30) NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `logging` int(1) NOT NULL DEFAULT '0',
  `locked` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_templategroups`
--

DROP TABLE IF EXISTS `mybb_templategroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_templategroups` (
  `gid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_templates`
--

DROP TABLE IF EXISTS `mybb_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_templates` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `template` text NOT NULL,
  `sid` int(10) NOT NULL DEFAULT '0',
  `version` varchar(20) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT '',
  `dateline` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=595 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_templatesets`
--

DROP TABLE IF EXISTS `mybb_templatesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_templatesets` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_themes`
--

DROP TABLE IF EXISTS `mybb_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_themes` (
  `tid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `def` smallint(1) NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `stylesheets` text NOT NULL,
  `allowedgroups` text NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_themestylesheets`
--

DROP TABLE IF EXISTS `mybb_themestylesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_themestylesheets` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `attachedto` text NOT NULL,
  `stylesheet` text NOT NULL,
  `cachefile` varchar(100) NOT NULL DEFAULT '',
  `lastmodified` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadprefixes`
--

DROP TABLE IF EXISTS `mybb_threadprefixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadprefixes` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(120) NOT NULL DEFAULT '',
  `displaystyle` varchar(200) NOT NULL DEFAULT '',
  `forums` text NOT NULL,
  `groups` text NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadratings`
--

DROP TABLE IF EXISTS `mybb_threadratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadratings` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ipaddress` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  KEY `tid` (`tid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threads`
--

DROP TABLE IF EXISTS `mybb_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threads` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `prefix` smallint(5) unsigned NOT NULL DEFAULT '0',
  `icon` smallint(5) unsigned NOT NULL DEFAULT '0',
  `poll` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(80) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `firstpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` bigint(30) NOT NULL DEFAULT '0',
  `lastposter` varchar(120) NOT NULL DEFAULT '',
  `lastposteruid` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(100) NOT NULL DEFAULT '0',
  `replies` int(100) NOT NULL DEFAULT '0',
  `closed` varchar(30) NOT NULL DEFAULT '',
  `sticky` int(1) NOT NULL DEFAULT '0',
  `numratings` smallint(5) unsigned NOT NULL DEFAULT '0',
  `totalratings` smallint(5) unsigned NOT NULL DEFAULT '0',
  `notes` text NOT NULL,
  `visible` int(1) NOT NULL DEFAULT '0',
  `unapprovedposts` int(10) unsigned NOT NULL DEFAULT '0',
  `attachmentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `deletetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `fid` (`fid`,`visible`,`sticky`),
  KEY `dateline` (`dateline`),
  KEY `lastpost` (`lastpost`,`fid`),
  KEY `firstpost` (`firstpost`),
  KEY `uid` (`uid`),
  FULLTEXT KEY `subject` (`subject`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadsread`
--

DROP TABLE IF EXISTS `mybb_threadsread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadsread` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `tid` (`tid`,`uid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadsubscriptions`
--

DROP TABLE IF EXISTS `mybb_threadsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadsubscriptions` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `notification` int(1) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `subscriptionkey` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`,`notification`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadviews`
--

DROP TABLE IF EXISTS `mybb_threadviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadviews` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_upgrade_data`
--

DROP TABLE IF EXISTS `mybb_upgrade_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_upgrade_data` (
  `title` varchar(30) NOT NULL,
  `contents` text NOT NULL,
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_userfields`
--

DROP TABLE IF EXISTS `mybb_userfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_userfields` (
  `ufid` int(10) unsigned NOT NULL DEFAULT '0',
  `fid1` text NOT NULL,
  `fid2` text NOT NULL,
  `fid3` text NOT NULL,
  PRIMARY KEY (`ufid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_usergroups`
--

DROP TABLE IF EXISTS `mybb_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_usergroups` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(2) NOT NULL DEFAULT '2',
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `namestyle` varchar(200) NOT NULL DEFAULT '{username}',
  `usertitle` varchar(120) NOT NULL DEFAULT '',
  `stars` smallint(4) NOT NULL DEFAULT '0',
  `starimage` varchar(120) NOT NULL DEFAULT '',
  `image` varchar(120) NOT NULL DEFAULT '',
  `disporder` smallint(6) unsigned NOT NULL,
  `isbannedgroup` int(1) NOT NULL DEFAULT '0',
  `canview` int(1) NOT NULL DEFAULT '0',
  `canviewthreads` int(1) NOT NULL DEFAULT '0',
  `canviewprofiles` int(1) NOT NULL DEFAULT '0',
  `candlattachments` int(1) NOT NULL DEFAULT '0',
  `canpostthreads` int(1) NOT NULL DEFAULT '0',
  `canpostreplys` int(1) NOT NULL DEFAULT '0',
  `canpostattachments` int(1) NOT NULL DEFAULT '0',
  `canratethreads` int(1) NOT NULL DEFAULT '0',
  `caneditposts` int(1) NOT NULL DEFAULT '0',
  `candeleteposts` int(1) NOT NULL DEFAULT '0',
  `candeletethreads` int(1) NOT NULL DEFAULT '0',
  `caneditattachments` int(1) NOT NULL DEFAULT '0',
  `canpostpolls` int(1) NOT NULL DEFAULT '0',
  `canvotepolls` int(1) NOT NULL DEFAULT '0',
  `canundovotes` int(1) NOT NULL DEFAULT '0',
  `canusepms` int(1) NOT NULL DEFAULT '0',
  `cansendpms` int(1) NOT NULL DEFAULT '0',
  `cantrackpms` int(1) NOT NULL DEFAULT '0',
  `candenypmreceipts` int(1) NOT NULL DEFAULT '0',
  `pmquota` int(3) NOT NULL DEFAULT '0',
  `maxpmrecipients` int(4) NOT NULL DEFAULT '5',
  `cansendemail` int(1) NOT NULL DEFAULT '0',
  `cansendemailoverride` int(1) NOT NULL DEFAULT '0',
  `maxemails` int(3) NOT NULL DEFAULT '5',
  `canviewmemberlist` int(1) NOT NULL DEFAULT '0',
  `canviewcalendar` int(1) NOT NULL DEFAULT '0',
  `canaddevents` int(1) NOT NULL DEFAULT '0',
  `canbypasseventmod` int(1) NOT NULL DEFAULT '0',
  `canmoderateevents` int(1) NOT NULL DEFAULT '0',
  `canviewonline` int(1) NOT NULL DEFAULT '0',
  `canviewwolinvis` int(1) NOT NULL DEFAULT '0',
  `canviewonlineips` int(1) NOT NULL DEFAULT '0',
  `cancp` int(1) NOT NULL DEFAULT '0',
  `issupermod` int(1) NOT NULL DEFAULT '0',
  `cansearch` int(1) NOT NULL DEFAULT '0',
  `canusercp` int(1) NOT NULL DEFAULT '0',
  `canuploadavatars` int(1) NOT NULL DEFAULT '0',
  `canratemembers` int(1) NOT NULL DEFAULT '0',
  `canchangename` int(1) NOT NULL DEFAULT '0',
  `showforumteam` int(1) NOT NULL DEFAULT '0',
  `usereputationsystem` int(1) NOT NULL DEFAULT '0',
  `cangivereputations` int(1) NOT NULL DEFAULT '0',
  `reputationpower` bigint(30) NOT NULL DEFAULT '0',
  `maxreputationsday` bigint(30) NOT NULL DEFAULT '0',
  `maxreputationsperuser` bigint(30) NOT NULL DEFAULT '0',
  `maxreputationsperthread` bigint(30) NOT NULL DEFAULT '0',
  `candisplaygroup` int(1) NOT NULL DEFAULT '0',
  `attachquota` bigint(30) NOT NULL DEFAULT '0',
  `cancustomtitle` int(1) NOT NULL DEFAULT '0',
  `canwarnusers` int(1) NOT NULL DEFAULT '0',
  `canreceivewarnings` int(1) NOT NULL DEFAULT '0',
  `maxwarningsday` int(3) NOT NULL DEFAULT '3',
  `canmodcp` int(1) NOT NULL DEFAULT '0',
  `showinbirthdaylist` int(1) NOT NULL DEFAULT '0',
  `canoverridepm` int(1) NOT NULL DEFAULT '0',
  `canusesig` int(1) NOT NULL DEFAULT '0',
  `canusesigxposts` bigint(30) NOT NULL DEFAULT '0',
  `signofollow` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_users`
--

DROP TABLE IF EXISTS `mybb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(120) NOT NULL DEFAULT '',
  `password` varchar(120) NOT NULL DEFAULT '',
  `salt` varchar(10) NOT NULL DEFAULT '',
  `loginkey` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(220) NOT NULL DEFAULT '',
  `postnum` int(10) NOT NULL DEFAULT '0',
  `avatar` varchar(200) NOT NULL DEFAULT '',
  `avatardimensions` varchar(10) NOT NULL DEFAULT '',
  `avatartype` varchar(10) NOT NULL DEFAULT '0',
  `usergroup` smallint(5) unsigned NOT NULL DEFAULT '0',
  `additionalgroups` varchar(200) NOT NULL DEFAULT '',
  `displaygroup` smallint(5) unsigned NOT NULL DEFAULT '0',
  `usertitle` varchar(250) NOT NULL DEFAULT '',
  `regdate` bigint(30) NOT NULL DEFAULT '0',
  `lastactive` bigint(30) NOT NULL DEFAULT '0',
  `lastvisit` bigint(30) NOT NULL DEFAULT '0',
  `lastpost` bigint(30) NOT NULL DEFAULT '0',
  `website` varchar(200) NOT NULL DEFAULT '',
  `icq` varchar(10) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(75) NOT NULL DEFAULT '',
  `birthday` varchar(15) NOT NULL DEFAULT '',
  `birthdayprivacy` varchar(4) NOT NULL DEFAULT 'all',
  `signature` text NOT NULL,
  `allownotices` int(1) NOT NULL DEFAULT '0',
  `hideemail` int(1) NOT NULL DEFAULT '0',
  `subscriptionmethod` int(1) NOT NULL DEFAULT '0',
  `invisible` int(1) NOT NULL DEFAULT '0',
  `receivepms` int(1) NOT NULL DEFAULT '0',
  `receivefrombuddy` int(1) NOT NULL DEFAULT '0',
  `pmnotice` int(1) NOT NULL DEFAULT '0',
  `pmnotify` int(1) NOT NULL DEFAULT '0',
  `threadmode` varchar(8) NOT NULL DEFAULT '',
  `showsigs` int(1) NOT NULL DEFAULT '0',
  `showavatars` int(1) NOT NULL DEFAULT '0',
  `showquickreply` int(1) NOT NULL DEFAULT '0',
  `showredirect` int(1) NOT NULL DEFAULT '0',
  `ppp` smallint(6) NOT NULL DEFAULT '0',
  `tpp` smallint(6) NOT NULL DEFAULT '0',
  `daysprune` smallint(6) NOT NULL DEFAULT '0',
  `dateformat` varchar(4) NOT NULL DEFAULT '',
  `timeformat` varchar(4) NOT NULL DEFAULT '',
  `timezone` varchar(4) NOT NULL DEFAULT '',
  `dst` int(1) NOT NULL DEFAULT '0',
  `dstcorrection` int(1) NOT NULL DEFAULT '0',
  `buddylist` text NOT NULL,
  `ignorelist` text NOT NULL,
  `style` smallint(5) unsigned NOT NULL DEFAULT '0',
  `away` int(1) NOT NULL DEFAULT '0',
  `awaydate` int(10) unsigned NOT NULL DEFAULT '0',
  `returndate` varchar(15) NOT NULL DEFAULT '',
  `awayreason` varchar(200) NOT NULL DEFAULT '',
  `pmfolders` text NOT NULL,
  `notepad` text NOT NULL,
  `referrer` int(10) unsigned NOT NULL DEFAULT '0',
  `referrals` int(10) unsigned NOT NULL DEFAULT '0',
  `reputation` bigint(30) NOT NULL DEFAULT '0',
  `regip` varchar(50) NOT NULL DEFAULT '',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  `longregip` int(11) NOT NULL DEFAULT '0',
  `longlastip` int(11) NOT NULL DEFAULT '0',
  `language` varchar(50) NOT NULL DEFAULT '',
  `timeonline` bigint(30) NOT NULL DEFAULT '0',
  `showcodebuttons` int(1) NOT NULL DEFAULT '1',
  `totalpms` int(10) NOT NULL DEFAULT '0',
  `unreadpms` int(10) NOT NULL DEFAULT '0',
  `warningpoints` int(3) NOT NULL DEFAULT '0',
  `moderateposts` int(1) NOT NULL DEFAULT '0',
  `moderationtime` bigint(30) NOT NULL DEFAULT '0',
  `suspendposting` int(1) NOT NULL DEFAULT '0',
  `suspensiontime` bigint(30) NOT NULL DEFAULT '0',
  `suspendsignature` int(1) NOT NULL DEFAULT '0',
  `suspendsigtime` bigint(30) NOT NULL DEFAULT '0',
  `coppauser` int(1) NOT NULL DEFAULT '0',
  `classicpostbit` int(1) NOT NULL DEFAULT '0',
  `loginattempts` tinyint(2) NOT NULL DEFAULT '1',
  `usernotes` text NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `usergroup` (`usergroup`),
  KEY `birthday` (`birthday`),
  KEY `longregip` (`longregip`),
  KEY `longlastip` (`longlastip`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_usertitles`
--

DROP TABLE IF EXISTS `mybb_usertitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_usertitles` (
  `utid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `posts` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `stars` smallint(4) NOT NULL DEFAULT '0',
  `starimage` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`utid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_warninglevels`
--

DROP TABLE IF EXISTS `mybb_warninglevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_warninglevels` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `percentage` int(3) NOT NULL DEFAULT '0',
  `action` text NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_warnings`
--

DROP TABLE IF EXISTS `mybb_warnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_warnings` (
  `wid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL DEFAULT '',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `issuedby` int(10) unsigned NOT NULL DEFAULT '0',
  `expires` bigint(30) NOT NULL DEFAULT '0',
  `expired` int(1) NOT NULL DEFAULT '0',
  `daterevoked` bigint(30) NOT NULL DEFAULT '0',
  `revokedby` int(10) unsigned NOT NULL DEFAULT '0',
  `revokereason` text NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`wid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_warningtypes`
--

DROP TABLE IF EXISTS `mybb_warningtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_warningtypes` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `expirationtime` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `mybb2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mybb2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mybb2`;

--
-- Table structure for table `mybb_adminlog`
--

DROP TABLE IF EXISTS `mybb_adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_adminlog` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `ipaddress` varchar(50) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  KEY `module` (`module`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_adminoptions`
--

DROP TABLE IF EXISTS `mybb_adminoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_adminoptions` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `cpstyle` varchar(50) NOT NULL DEFAULT '',
  `codepress` int(1) NOT NULL DEFAULT '1',
  `notes` text NOT NULL,
  `permissions` text NOT NULL,
  `defaultviews` text NOT NULL,
  `loginattempts` int(10) unsigned NOT NULL DEFAULT '0',
  `loginlockoutexpiry` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_adminsessions`
--

DROP TABLE IF EXISTS `mybb_adminsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_adminsessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `loginkey` varchar(50) NOT NULL DEFAULT '',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `lastactive` bigint(30) NOT NULL DEFAULT '0',
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_adminviews`
--

DROP TABLE IF EXISTS `mybb_adminviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_adminviews` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(6) NOT NULL DEFAULT '',
  `visibility` int(1) NOT NULL DEFAULT '0',
  `fields` text NOT NULL,
  `conditions` text NOT NULL,
  `custom_profile_fields` text NOT NULL,
  `sortby` varchar(20) NOT NULL DEFAULT '',
  `sortorder` varchar(4) NOT NULL DEFAULT '',
  `perpage` int(4) NOT NULL DEFAULT '0',
  `view_type` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_announcements`
--

DROP TABLE IF EXISTS `mybb_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_announcements` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `startdate` bigint(30) NOT NULL DEFAULT '0',
  `enddate` bigint(30) NOT NULL DEFAULT '0',
  `allowhtml` int(1) NOT NULL DEFAULT '0',
  `allowmycode` int(1) NOT NULL DEFAULT '0',
  `allowsmilies` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_attachments`
--

DROP TABLE IF EXISTS `mybb_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_attachments` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0',
  `posthash` varchar(50) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(120) NOT NULL DEFAULT '',
  `filetype` varchar(120) NOT NULL DEFAULT '',
  `filesize` int(10) NOT NULL DEFAULT '0',
  `attachname` varchar(120) NOT NULL DEFAULT '',
  `downloads` int(10) unsigned NOT NULL DEFAULT '0',
  `dateuploaded` bigint(30) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  `thumbnail` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  KEY `posthash` (`posthash`),
  KEY `pid` (`pid`,`visible`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_attachtypes`
--

DROP TABLE IF EXISTS `mybb_attachtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_attachtypes` (
  `atid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `mimetype` varchar(120) NOT NULL DEFAULT '',
  `extension` varchar(10) NOT NULL DEFAULT '',
  `maxsize` int(15) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`atid`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_awaitingactivation`
--

DROP TABLE IF EXISTS `mybb_awaitingactivation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_awaitingactivation` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `code` varchar(100) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT '',
  `oldgroup` bigint(30) NOT NULL DEFAULT '0',
  `misc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_badwords`
--

DROP TABLE IF EXISTS `mybb_badwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_badwords` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `badword` varchar(100) NOT NULL DEFAULT '',
  `replacement` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_banfilters`
--

DROP TABLE IF EXISTS `mybb_banfilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_banfilters` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(200) NOT NULL DEFAULT '',
  `type` int(1) NOT NULL DEFAULT '0',
  `lastuse` bigint(30) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_banned`
--

DROP TABLE IF EXISTS `mybb_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_banned` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `oldgroup` int(10) unsigned NOT NULL DEFAULT '0',
  `oldadditionalgroups` text NOT NULL,
  `olddisplaygroup` int(11) NOT NULL DEFAULT '0',
  `admin` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `bantime` varchar(50) NOT NULL DEFAULT '',
  `lifted` bigint(30) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  KEY `uid` (`uid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_calendarpermissions`
--

DROP TABLE IF EXISTS `mybb_calendarpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_calendarpermissions` (
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `canviewcalendar` int(1) NOT NULL DEFAULT '0',
  `canaddevents` int(1) NOT NULL DEFAULT '0',
  `canbypasseventmod` int(1) NOT NULL DEFAULT '0',
  `canmoderateevents` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_calendars`
--

DROP TABLE IF EXISTS `mybb_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_calendars` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `disporder` int(10) unsigned NOT NULL DEFAULT '0',
  `startofweek` int(1) NOT NULL DEFAULT '0',
  `showbirthdays` int(1) NOT NULL DEFAULT '0',
  `eventlimit` int(3) NOT NULL DEFAULT '0',
  `moderation` int(1) NOT NULL DEFAULT '0',
  `allowhtml` int(1) NOT NULL DEFAULT '0',
  `allowmycode` int(1) NOT NULL DEFAULT '0',
  `allowimgcode` int(1) NOT NULL DEFAULT '0',
  `allowvideocode` int(1) NOT NULL DEFAULT '0',
  `allowsmilies` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_captcha`
--

DROP TABLE IF EXISTS `mybb_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_captcha` (
  `imagehash` varchar(32) NOT NULL DEFAULT '',
  `imagestring` varchar(8) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  KEY `imagehash` (`imagehash`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_datacache`
--

DROP TABLE IF EXISTS `mybb_datacache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_datacache` (
  `title` varchar(50) NOT NULL DEFAULT '',
  `cache` mediumtext NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_delayedmoderation`
--

DROP TABLE IF EXISTS `mybb_delayedmoderation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_delayedmoderation` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `delaydateline` bigint(30) NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tids` text NOT NULL,
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `inputs` text NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_events`
--

DROP TABLE IF EXISTS `mybb_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_events` (
  `eid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `visible` int(1) NOT NULL DEFAULT '0',
  `private` int(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `timezone` varchar(4) NOT NULL DEFAULT '0',
  `ignoretimezone` int(1) NOT NULL DEFAULT '0',
  `usingtime` int(1) NOT NULL DEFAULT '0',
  `repeats` text NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `daterange` (`starttime`,`endtime`),
  KEY `private` (`private`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_forumpermissions`
--

DROP TABLE IF EXISTS `mybb_forumpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_forumpermissions` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `canview` int(1) NOT NULL DEFAULT '0',
  `canviewthreads` int(1) NOT NULL DEFAULT '0',
  `canonlyviewownthreads` int(1) NOT NULL DEFAULT '0',
  `candlattachments` int(1) NOT NULL DEFAULT '0',
  `canpostthreads` int(1) NOT NULL DEFAULT '0',
  `canpostreplys` int(1) NOT NULL DEFAULT '0',
  `canpostattachments` int(1) NOT NULL DEFAULT '0',
  `canratethreads` int(1) NOT NULL DEFAULT '0',
  `caneditposts` int(1) NOT NULL DEFAULT '0',
  `candeleteposts` int(1) NOT NULL DEFAULT '0',
  `candeletethreads` int(1) NOT NULL DEFAULT '0',
  `caneditattachments` int(1) NOT NULL DEFAULT '0',
  `canpostpolls` int(1) NOT NULL DEFAULT '0',
  `canvotepolls` int(1) NOT NULL DEFAULT '0',
  `cansearch` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_forums`
--

DROP TABLE IF EXISTS `mybb_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_forums` (
  `fid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `linkto` varchar(180) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentlist` text NOT NULL,
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  `open` int(1) NOT NULL DEFAULT '0',
  `threads` int(10) unsigned NOT NULL DEFAULT '0',
  `posts` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastposter` varchar(120) NOT NULL DEFAULT '',
  `lastposteruid` int(10) unsigned NOT NULL DEFAULT '0',
  `lastposttid` int(10) NOT NULL DEFAULT '0',
  `lastpostsubject` varchar(120) NOT NULL DEFAULT '',
  `allowhtml` int(1) NOT NULL DEFAULT '0',
  `allowmycode` int(1) NOT NULL DEFAULT '0',
  `allowsmilies` int(1) NOT NULL DEFAULT '0',
  `allowimgcode` int(1) NOT NULL DEFAULT '0',
  `allowvideocode` int(1) NOT NULL DEFAULT '0',
  `allowpicons` int(1) NOT NULL DEFAULT '0',
  `allowtratings` int(1) NOT NULL DEFAULT '0',
  `status` int(4) NOT NULL DEFAULT '1',
  `usepostcounts` int(1) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  `showinjump` int(1) NOT NULL DEFAULT '0',
  `modposts` int(1) NOT NULL DEFAULT '0',
  `modthreads` int(1) NOT NULL DEFAULT '0',
  `mod_edit_posts` int(1) NOT NULL DEFAULT '0',
  `modattachments` int(1) NOT NULL DEFAULT '0',
  `style` smallint(5) unsigned NOT NULL DEFAULT '0',
  `overridestyle` int(1) NOT NULL DEFAULT '0',
  `rulestype` smallint(1) NOT NULL DEFAULT '0',
  `rulestitle` varchar(200) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `unapprovedthreads` int(10) unsigned NOT NULL DEFAULT '0',
  `unapprovedposts` int(10) unsigned NOT NULL DEFAULT '0',
  `defaultdatecut` smallint(4) unsigned NOT NULL DEFAULT '0',
  `defaultsortby` varchar(10) NOT NULL DEFAULT '',
  `defaultsortorder` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_forumsread`
--

DROP TABLE IF EXISTS `mybb_forumsread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_forumsread` (
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `fid` (`fid`,`uid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_forumsubscriptions`
--

DROP TABLE IF EXISTS `mybb_forumsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_forumsubscriptions` (
  `fsid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_groupleaders`
--

DROP TABLE IF EXISTS `mybb_groupleaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_groupleaders` (
  `lid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `canmanagemembers` int(1) NOT NULL DEFAULT '0',
  `canmanagerequests` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_helpdocs`
--

DROP TABLE IF EXISTS `mybb_helpdocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_helpdocs` (
  `hid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `document` text NOT NULL,
  `usetranslation` int(1) NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '0',
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_helpsections`
--

DROP TABLE IF EXISTS `mybb_helpsections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_helpsections` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `usetranslation` int(1) NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '0',
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_icons`
--

DROP TABLE IF EXISTS `mybb_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_icons` (
  `iid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `path` varchar(220) NOT NULL DEFAULT '',
  PRIMARY KEY (`iid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_joinrequests`
--

DROP TABLE IF EXISTS `mybb_joinrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_joinrequests` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(250) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_mailerrors`
--

DROP TABLE IF EXISTS `mybb_mailerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_mailerrors` (
  `eid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `toaddress` varchar(150) NOT NULL DEFAULT '',
  `fromaddress` varchar(150) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `error` text NOT NULL,
  `smtperror` varchar(200) NOT NULL DEFAULT '',
  `smtpcode` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_maillogs`
--

DROP TABLE IF EXISTS `mybb_maillogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_maillogs` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `fromuid` int(10) unsigned NOT NULL DEFAULT '0',
  `fromemail` varchar(200) NOT NULL DEFAULT '',
  `touid` bigint(30) NOT NULL DEFAULT '0',
  `toemail` varchar(200) NOT NULL DEFAULT '',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `ipaddress` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_mailqueue`
--

DROP TABLE IF EXISTS `mybb_mailqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_mailqueue` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mailto` varchar(200) NOT NULL,
  `mailfrom` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `headers` text NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_massemails`
--

DROP TABLE IF EXISTS `mybb_massemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_massemails` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(200) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `htmlmessage` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `format` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `senddate` bigint(30) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `totalcount` int(10) unsigned NOT NULL DEFAULT '0',
  `conditions` text NOT NULL,
  `perpage` smallint(4) NOT NULL DEFAULT '50',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_moderatorlog`
--

DROP TABLE IF EXISTS `mybb_moderatorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_moderatorlog` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `action` text NOT NULL,
  `data` text NOT NULL,
  `ipaddress` varchar(50) NOT NULL DEFAULT '',
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_moderators`
--

DROP TABLE IF EXISTS `mybb_moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_moderators` (
  `mid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `isgroup` int(1) unsigned NOT NULL DEFAULT '0',
  `caneditposts` int(1) NOT NULL DEFAULT '0',
  `candeleteposts` int(1) NOT NULL DEFAULT '0',
  `canviewips` int(1) NOT NULL DEFAULT '0',
  `canopenclosethreads` int(1) NOT NULL DEFAULT '0',
  `canmanagethreads` int(1) NOT NULL DEFAULT '0',
  `canmovetononmodforum` int(1) NOT NULL DEFAULT '0',
  `canusecustomtools` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `uid` (`id`,`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_modtools`
--

DROP TABLE IF EXISTS `mybb_modtools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_modtools` (
  `tid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `forums` text NOT NULL,
  `type` char(1) NOT NULL DEFAULT '',
  `postoptions` text NOT NULL,
  `threadoptions` text NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_mycode`
--

DROP TABLE IF EXISTS `mybb_mycode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_mycode` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `regex` text NOT NULL,
  `replacement` text NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `parseorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_polls`
--

DROP TABLE IF EXISTS `mybb_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_polls` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `question` varchar(200) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `options` text NOT NULL,
  `votes` text NOT NULL,
  `numoptions` smallint(5) unsigned NOT NULL DEFAULT '0',
  `numvotes` text NOT NULL,
  `timeout` bigint(30) NOT NULL DEFAULT '0',
  `closed` int(1) NOT NULL DEFAULT '0',
  `multiple` int(1) NOT NULL DEFAULT '0',
  `public` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_pollvotes`
--

DROP TABLE IF EXISTS `mybb_pollvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_pollvotes` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `voteoption` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `pid` (`pid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_posts`
--

DROP TABLE IF EXISTS `mybb_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_posts` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `replyto` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `icon` smallint(5) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(80) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `ipaddress` varchar(30) NOT NULL DEFAULT '',
  `longipaddress` int(11) NOT NULL DEFAULT '0',
  `includesig` int(1) NOT NULL DEFAULT '0',
  `smilieoff` int(1) NOT NULL DEFAULT '0',
  `edituid` int(10) unsigned NOT NULL DEFAULT '0',
  `edittime` int(10) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  `posthash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `tid` (`tid`,`uid`),
  KEY `uid` (`uid`),
  KEY `visible` (`visible`),
  KEY `dateline` (`dateline`),
  KEY `longipaddress` (`longipaddress`),
  FULLTEXT KEY `message` (`message`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_privatemessages`
--

DROP TABLE IF EXISTS `mybb_privatemessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_privatemessages` (
  `pmid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `toid` int(10) unsigned NOT NULL DEFAULT '0',
  `fromid` int(10) unsigned NOT NULL DEFAULT '0',
  `recipients` text NOT NULL,
  `folder` smallint(5) unsigned NOT NULL DEFAULT '1',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `icon` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `deletetime` bigint(30) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `statustime` bigint(30) NOT NULL DEFAULT '0',
  `includesig` int(1) NOT NULL DEFAULT '0',
  `smilieoff` int(1) NOT NULL DEFAULT '0',
  `receipt` int(1) NOT NULL DEFAULT '0',
  `readtime` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `uid` (`uid`,`folder`),
  KEY `toid` (`toid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_profilefields`
--

DROP TABLE IF EXISTS `mybb_profilefields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_profilefields` (
  `fid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` text NOT NULL,
  `length` smallint(5) unsigned NOT NULL DEFAULT '0',
  `maxlength` smallint(5) unsigned NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `editable` int(1) NOT NULL DEFAULT '0',
  `hidden` int(1) NOT NULL DEFAULT '0',
  `postnum` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_promotionlogs`
--

DROP TABLE IF EXISTS `mybb_promotionlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_promotionlogs` (
  `plid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `oldusergroup` varchar(200) NOT NULL DEFAULT '0',
  `newusergroup` smallint(6) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `type` varchar(9) NOT NULL DEFAULT 'primary',
  PRIMARY KEY (`plid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_promotions`
--

DROP TABLE IF EXISTS `mybb_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_promotions` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `logging` tinyint(1) NOT NULL DEFAULT '0',
  `posts` int(11) NOT NULL DEFAULT '0',
  `posttype` char(2) NOT NULL DEFAULT '',
  `registered` int(11) NOT NULL DEFAULT '0',
  `registeredtype` varchar(20) NOT NULL DEFAULT '',
  `reputations` int(11) NOT NULL DEFAULT '0',
  `reputationtype` char(2) NOT NULL DEFAULT '',
  `referrals` int(11) NOT NULL DEFAULT '0',
  `referralstype` char(2) NOT NULL DEFAULT '',
  `requirements` varchar(200) NOT NULL DEFAULT '',
  `originalusergroup` varchar(120) NOT NULL DEFAULT '0',
  `newusergroup` smallint(5) unsigned NOT NULL DEFAULT '0',
  `usergrouptype` varchar(120) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_reportedposts`
--

DROP TABLE IF EXISTS `mybb_reportedposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_reportedposts` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `reportstatus` int(1) NOT NULL DEFAULT '0',
  `reason` varchar(250) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  KEY `fid` (`fid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_reputation`
--

DROP TABLE IF EXISTS `mybb_reputation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_reputation` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `adduid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `reputation` bigint(30) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `uid` (`uid`),
  KEY `pid` (`pid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_searchlog`
--

DROP TABLE IF EXISTS `mybb_searchlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_searchlog` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `ipaddress` varchar(120) NOT NULL DEFAULT '',
  `threads` longtext NOT NULL,
  `posts` longtext NOT NULL,
  `resulttype` varchar(10) NOT NULL DEFAULT '',
  `querycache` text NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_sessions`
--

DROP TABLE IF EXISTS `mybb_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_sessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `time` bigint(30) NOT NULL DEFAULT '0',
  `location` varchar(150) NOT NULL DEFAULT '',
  `useragent` varchar(100) NOT NULL DEFAULT '',
  `anonymous` int(1) NOT NULL DEFAULT '0',
  `nopermission` int(1) NOT NULL DEFAULT '0',
  `location1` int(10) NOT NULL DEFAULT '0',
  `location2` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`),
  KEY `location1` (`location1`),
  KEY `location2` (`location2`),
  KEY `time` (`time`),
  KEY `uid` (`uid`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_settinggroups`
--

DROP TABLE IF EXISTS `mybb_settinggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_settinggroups` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(220) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `isdefault` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_settings`
--

DROP TABLE IF EXISTS `mybb_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_settings` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `optionscode` text NOT NULL,
  `value` text NOT NULL,
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `gid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `isdefault` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_smilies`
--

DROP TABLE IF EXISTS `mybb_smilies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_smilies` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `find` varchar(120) NOT NULL DEFAULT '',
  `image` varchar(220) NOT NULL DEFAULT '',
  `disporder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `showclickable` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_spiders`
--

DROP TABLE IF EXISTS `mybb_spiders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_spiders` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `theme` int(10) unsigned NOT NULL DEFAULT '0',
  `language` varchar(20) NOT NULL DEFAULT '',
  `usergroup` int(10) unsigned NOT NULL DEFAULT '0',
  `useragent` varchar(200) NOT NULL DEFAULT '',
  `lastvisit` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_stats`
--

DROP TABLE IF EXISTS `mybb_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_stats` (
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `numusers` int(10) unsigned NOT NULL DEFAULT '0',
  `numthreads` int(10) unsigned NOT NULL DEFAULT '0',
  `numposts` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_tasklog`
--

DROP TABLE IF EXISTS `mybb_tasklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_tasklog` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_tasks`
--

DROP TABLE IF EXISTS `mybb_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_tasks` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `file` varchar(30) NOT NULL DEFAULT '',
  `minute` varchar(200) NOT NULL DEFAULT '',
  `hour` varchar(200) NOT NULL DEFAULT '',
  `day` varchar(100) NOT NULL DEFAULT '',
  `month` varchar(30) NOT NULL DEFAULT '',
  `weekday` varchar(15) NOT NULL DEFAULT '',
  `nextrun` bigint(30) NOT NULL DEFAULT '0',
  `lastrun` bigint(30) NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `logging` int(1) NOT NULL DEFAULT '0',
  `locked` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_templategroups`
--

DROP TABLE IF EXISTS `mybb_templategroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_templategroups` (
  `gid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_templates`
--

DROP TABLE IF EXISTS `mybb_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_templates` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `template` text NOT NULL,
  `sid` int(10) NOT NULL DEFAULT '0',
  `version` varchar(20) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT '',
  `dateline` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=595 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_templatesets`
--

DROP TABLE IF EXISTS `mybb_templatesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_templatesets` (
  `sid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_themes`
--

DROP TABLE IF EXISTS `mybb_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_themes` (
  `tid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `def` smallint(1) NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `stylesheets` text NOT NULL,
  `allowedgroups` text NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_themestylesheets`
--

DROP TABLE IF EXISTS `mybb_themestylesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_themestylesheets` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `attachedto` text NOT NULL,
  `stylesheet` text NOT NULL,
  `cachefile` varchar(100) NOT NULL DEFAULT '',
  `lastmodified` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadprefixes`
--

DROP TABLE IF EXISTS `mybb_threadprefixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadprefixes` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(120) NOT NULL DEFAULT '',
  `displaystyle` varchar(200) NOT NULL DEFAULT '',
  `forums` text NOT NULL,
  `groups` text NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadratings`
--

DROP TABLE IF EXISTS `mybb_threadratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadratings` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ipaddress` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  KEY `tid` (`tid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threads`
--

DROP TABLE IF EXISTS `mybb_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threads` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(120) NOT NULL DEFAULT '',
  `prefix` smallint(5) unsigned NOT NULL DEFAULT '0',
  `icon` smallint(5) unsigned NOT NULL DEFAULT '0',
  `poll` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(80) NOT NULL DEFAULT '',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `firstpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` bigint(30) NOT NULL DEFAULT '0',
  `lastposter` varchar(120) NOT NULL DEFAULT '',
  `lastposteruid` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(100) NOT NULL DEFAULT '0',
  `replies` int(100) NOT NULL DEFAULT '0',
  `closed` varchar(30) NOT NULL DEFAULT '',
  `sticky` int(1) NOT NULL DEFAULT '0',
  `numratings` smallint(5) unsigned NOT NULL DEFAULT '0',
  `totalratings` smallint(5) unsigned NOT NULL DEFAULT '0',
  `notes` text NOT NULL,
  `visible` int(1) NOT NULL DEFAULT '0',
  `unapprovedposts` int(10) unsigned NOT NULL DEFAULT '0',
  `attachmentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `deletetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `fid` (`fid`,`visible`,`sticky`),
  KEY `dateline` (`dateline`),
  KEY `lastpost` (`lastpost`,`fid`),
  KEY `firstpost` (`firstpost`),
  KEY `uid` (`uid`),
  FULLTEXT KEY `subject` (`subject`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadsread`
--

DROP TABLE IF EXISTS `mybb_threadsread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadsread` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `tid` (`tid`,`uid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadsubscriptions`
--

DROP TABLE IF EXISTS `mybb_threadsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadsubscriptions` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `notification` int(1) NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `subscriptionkey` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`,`notification`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_threadviews`
--

DROP TABLE IF EXISTS `mybb_threadviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_threadviews` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_userfields`
--

DROP TABLE IF EXISTS `mybb_userfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_userfields` (
  `ufid` int(10) unsigned NOT NULL DEFAULT '0',
  `fid1` text NOT NULL,
  `fid2` text NOT NULL,
  `fid3` text NOT NULL,
  PRIMARY KEY (`ufid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_usergroups`
--

DROP TABLE IF EXISTS `mybb_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_usergroups` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(2) NOT NULL DEFAULT '2',
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `namestyle` varchar(200) NOT NULL DEFAULT '{username}',
  `usertitle` varchar(120) NOT NULL DEFAULT '',
  `stars` smallint(4) NOT NULL DEFAULT '0',
  `starimage` varchar(120) NOT NULL DEFAULT '',
  `image` varchar(120) NOT NULL DEFAULT '',
  `disporder` smallint(6) unsigned NOT NULL,
  `isbannedgroup` int(1) NOT NULL DEFAULT '0',
  `canview` int(1) NOT NULL DEFAULT '0',
  `canviewthreads` int(1) NOT NULL DEFAULT '0',
  `canviewprofiles` int(1) NOT NULL DEFAULT '0',
  `candlattachments` int(1) NOT NULL DEFAULT '0',
  `canpostthreads` int(1) NOT NULL DEFAULT '0',
  `canpostreplys` int(1) NOT NULL DEFAULT '0',
  `canpostattachments` int(1) NOT NULL DEFAULT '0',
  `canratethreads` int(1) NOT NULL DEFAULT '0',
  `caneditposts` int(1) NOT NULL DEFAULT '0',
  `candeleteposts` int(1) NOT NULL DEFAULT '0',
  `candeletethreads` int(1) NOT NULL DEFAULT '0',
  `caneditattachments` int(1) NOT NULL DEFAULT '0',
  `canpostpolls` int(1) NOT NULL DEFAULT '0',
  `canvotepolls` int(1) NOT NULL DEFAULT '0',
  `canundovotes` int(1) NOT NULL DEFAULT '0',
  `canusepms` int(1) NOT NULL DEFAULT '0',
  `cansendpms` int(1) NOT NULL DEFAULT '0',
  `cantrackpms` int(1) NOT NULL DEFAULT '0',
  `candenypmreceipts` int(1) NOT NULL DEFAULT '0',
  `pmquota` int(3) NOT NULL DEFAULT '0',
  `maxpmrecipients` int(4) NOT NULL DEFAULT '5',
  `cansendemail` int(1) NOT NULL DEFAULT '0',
  `cansendemailoverride` int(1) NOT NULL DEFAULT '0',
  `maxemails` int(3) NOT NULL DEFAULT '5',
  `canviewmemberlist` int(1) NOT NULL DEFAULT '0',
  `canviewcalendar` int(1) NOT NULL DEFAULT '0',
  `canaddevents` int(1) NOT NULL DEFAULT '0',
  `canbypasseventmod` int(1) NOT NULL DEFAULT '0',
  `canmoderateevents` int(1) NOT NULL DEFAULT '0',
  `canviewonline` int(1) NOT NULL DEFAULT '0',
  `canviewwolinvis` int(1) NOT NULL DEFAULT '0',
  `canviewonlineips` int(1) NOT NULL DEFAULT '0',
  `cancp` int(1) NOT NULL DEFAULT '0',
  `issupermod` int(1) NOT NULL DEFAULT '0',
  `cansearch` int(1) NOT NULL DEFAULT '0',
  `canusercp` int(1) NOT NULL DEFAULT '0',
  `canuploadavatars` int(1) NOT NULL DEFAULT '0',
  `canratemembers` int(1) NOT NULL DEFAULT '0',
  `canchangename` int(1) NOT NULL DEFAULT '0',
  `showforumteam` int(1) NOT NULL DEFAULT '0',
  `usereputationsystem` int(1) NOT NULL DEFAULT '0',
  `cangivereputations` int(1) NOT NULL DEFAULT '0',
  `reputationpower` bigint(30) NOT NULL DEFAULT '0',
  `maxreputationsday` bigint(30) NOT NULL DEFAULT '0',
  `maxreputationsperuser` bigint(30) NOT NULL DEFAULT '0',
  `maxreputationsperthread` bigint(30) NOT NULL DEFAULT '0',
  `candisplaygroup` int(1) NOT NULL DEFAULT '0',
  `attachquota` bigint(30) NOT NULL DEFAULT '0',
  `cancustomtitle` int(1) NOT NULL DEFAULT '0',
  `canwarnusers` int(1) NOT NULL DEFAULT '0',
  `canreceivewarnings` int(1) NOT NULL DEFAULT '0',
  `maxwarningsday` int(3) NOT NULL DEFAULT '3',
  `canmodcp` int(1) NOT NULL DEFAULT '0',
  `showinbirthdaylist` int(1) NOT NULL DEFAULT '0',
  `canoverridepm` int(1) NOT NULL DEFAULT '0',
  `canusesig` int(1) NOT NULL DEFAULT '0',
  `canusesigxposts` bigint(30) NOT NULL DEFAULT '0',
  `signofollow` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_users`
--

DROP TABLE IF EXISTS `mybb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(120) NOT NULL DEFAULT '',
  `password` varchar(120) NOT NULL DEFAULT '',
  `salt` varchar(10) NOT NULL DEFAULT '',
  `loginkey` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(220) NOT NULL DEFAULT '',
  `postnum` int(10) NOT NULL DEFAULT '0',
  `avatar` varchar(200) NOT NULL DEFAULT '',
  `avatardimensions` varchar(10) NOT NULL DEFAULT '',
  `avatartype` varchar(10) NOT NULL DEFAULT '0',
  `usergroup` smallint(5) unsigned NOT NULL DEFAULT '0',
  `additionalgroups` varchar(200) NOT NULL DEFAULT '',
  `displaygroup` smallint(5) unsigned NOT NULL DEFAULT '0',
  `usertitle` varchar(250) NOT NULL DEFAULT '',
  `regdate` bigint(30) NOT NULL DEFAULT '0',
  `lastactive` bigint(30) NOT NULL DEFAULT '0',
  `lastvisit` bigint(30) NOT NULL DEFAULT '0',
  `lastpost` bigint(30) NOT NULL DEFAULT '0',
  `website` varchar(200) NOT NULL DEFAULT '',
  `icq` varchar(10) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(75) NOT NULL DEFAULT '',
  `birthday` varchar(15) NOT NULL DEFAULT '',
  `birthdayprivacy` varchar(4) NOT NULL DEFAULT 'all',
  `signature` text NOT NULL,
  `allownotices` int(1) NOT NULL DEFAULT '0',
  `hideemail` int(1) NOT NULL DEFAULT '0',
  `subscriptionmethod` int(1) NOT NULL DEFAULT '0',
  `invisible` int(1) NOT NULL DEFAULT '0',
  `receivepms` int(1) NOT NULL DEFAULT '0',
  `receivefrombuddy` int(1) NOT NULL DEFAULT '0',
  `pmnotice` int(1) NOT NULL DEFAULT '0',
  `pmnotify` int(1) NOT NULL DEFAULT '0',
  `threadmode` varchar(8) NOT NULL DEFAULT '',
  `showsigs` int(1) NOT NULL DEFAULT '0',
  `showavatars` int(1) NOT NULL DEFAULT '0',
  `showquickreply` int(1) NOT NULL DEFAULT '0',
  `showredirect` int(1) NOT NULL DEFAULT '0',
  `ppp` smallint(6) NOT NULL DEFAULT '0',
  `tpp` smallint(6) NOT NULL DEFAULT '0',
  `daysprune` smallint(6) NOT NULL DEFAULT '0',
  `dateformat` varchar(4) NOT NULL DEFAULT '',
  `timeformat` varchar(4) NOT NULL DEFAULT '',
  `timezone` varchar(4) NOT NULL DEFAULT '',
  `dst` int(1) NOT NULL DEFAULT '0',
  `dstcorrection` int(1) NOT NULL DEFAULT '0',
  `buddylist` text NOT NULL,
  `ignorelist` text NOT NULL,
  `style` smallint(5) unsigned NOT NULL DEFAULT '0',
  `away` int(1) NOT NULL DEFAULT '0',
  `awaydate` int(10) unsigned NOT NULL DEFAULT '0',
  `returndate` varchar(15) NOT NULL DEFAULT '',
  `awayreason` varchar(200) NOT NULL DEFAULT '',
  `pmfolders` text NOT NULL,
  `notepad` text NOT NULL,
  `referrer` int(10) unsigned NOT NULL DEFAULT '0',
  `referrals` int(10) unsigned NOT NULL DEFAULT '0',
  `reputation` bigint(30) NOT NULL DEFAULT '0',
  `regip` varchar(50) NOT NULL DEFAULT '',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  `longregip` int(11) NOT NULL DEFAULT '0',
  `longlastip` int(11) NOT NULL DEFAULT '0',
  `language` varchar(50) NOT NULL DEFAULT '',
  `timeonline` bigint(30) NOT NULL DEFAULT '0',
  `showcodebuttons` int(1) NOT NULL DEFAULT '1',
  `totalpms` int(10) NOT NULL DEFAULT '0',
  `unreadpms` int(10) NOT NULL DEFAULT '0',
  `warningpoints` int(3) NOT NULL DEFAULT '0',
  `moderateposts` int(1) NOT NULL DEFAULT '0',
  `moderationtime` bigint(30) NOT NULL DEFAULT '0',
  `suspendposting` int(1) NOT NULL DEFAULT '0',
  `suspensiontime` bigint(30) NOT NULL DEFAULT '0',
  `suspendsignature` int(1) NOT NULL DEFAULT '0',
  `suspendsigtime` bigint(30) NOT NULL DEFAULT '0',
  `coppauser` int(1) NOT NULL DEFAULT '0',
  `classicpostbit` int(1) NOT NULL DEFAULT '0',
  `loginattempts` tinyint(2) NOT NULL DEFAULT '1',
  `usernotes` text NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `usergroup` (`usergroup`),
  KEY `birthday` (`birthday`),
  KEY `longregip` (`longregip`),
  KEY `longlastip` (`longlastip`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_usertitles`
--

DROP TABLE IF EXISTS `mybb_usertitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_usertitles` (
  `utid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `posts` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `stars` smallint(4) NOT NULL DEFAULT '0',
  `starimage` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`utid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_warninglevels`
--

DROP TABLE IF EXISTS `mybb_warninglevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_warninglevels` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `percentage` int(3) NOT NULL DEFAULT '0',
  `action` text NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_warnings`
--

DROP TABLE IF EXISTS `mybb_warnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_warnings` (
  `wid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL DEFAULT '',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` bigint(30) NOT NULL DEFAULT '0',
  `issuedby` int(10) unsigned NOT NULL DEFAULT '0',
  `expires` bigint(30) NOT NULL DEFAULT '0',
  `expired` int(1) NOT NULL DEFAULT '0',
  `daterevoked` bigint(30) NOT NULL DEFAULT '0',
  `revokedby` int(10) unsigned NOT NULL DEFAULT '0',
  `revokereason` text NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`wid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mybb_warningtypes`
--

DROP TABLE IF EXISTS `mybb_warningtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mybb_warningtypes` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `expirationtime` bigint(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime DEFAULT NULL,
  `interval_value` int(11) DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` datetime DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) unsigned NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `innodb_index_stats`
--

DROP TABLE IF EXISTS `innodb_index_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innodb_index_stats` (
  `database_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `index_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `stat_value` bigint(20) unsigned NOT NULL,
  `sample_size` bigint(20) unsigned DEFAULT NULL,
  `stat_description` varchar(1024) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`database_name`,`table_name`,`index_name`,`stat_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `innodb_table_stats`
--

DROP TABLE IF EXISTS `innodb_table_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innodb_table_stats` (
  `database_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `n_rows` bigint(20) unsigned NOT NULL,
  `clustered_index_size` bigint(20) unsigned NOT NULL,
  `sum_of_other_index_sizes` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`database_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ndb_binlog_index`
--

DROP TABLE IF EXISTS `ndb_binlog_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndb_binlog_index` (
  `Position` bigint(20) unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint(20) unsigned NOT NULL,
  `inserts` int(10) unsigned NOT NULL,
  `updates` int(10) unsigned NOT NULL,
  `deletes` int(10) unsigned NOT NULL,
  `schemaops` int(10) unsigned NOT NULL,
  `orig_server_id` int(10) unsigned NOT NULL,
  `orig_epoch` bigint(20) unsigned NOT NULL,
  `gci` int(10) unsigned NOT NULL,
  PRIMARY KEY (`epoch`,`orig_server_id`,`orig_epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proc`
--

DROP TABLE IF EXISTS `proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procs_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxies_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(64) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_master_info`
--

DROP TABLE IF EXISTS `slave_master_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slave_master_info` (
  `Number_of_lines` int(10) unsigned NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` bigint(20) unsigned NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'The host name of the master.',
  `User_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The user name used to connect to the master.',
  `User_password` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The password used to connect to the master.',
  `Port` int(10) unsigned NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` int(10) unsigned NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` tinyint(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` tinyint(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` float NOT NULL,
  `Bind` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The master server uuid.',
  `Retry_count` bigint(20) unsigned NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` tinyint(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  PRIMARY KEY (`Host`,`Port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Master Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_relay_log_info`
--

DROP TABLE IF EXISTS `slave_relay_log_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slave_relay_log_info` (
  `Number_of_lines` int(10) unsigned NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` bigint(20) unsigned NOT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` bigint(20) unsigned NOT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` int(11) NOT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` int(10) unsigned NOT NULL,
  `Id` int(10) unsigned NOT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Relay Log Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_worker_info`
--

DROP TABLE IF EXISTS `slave_worker_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slave_worker_info` (
  `Id` int(10) unsigned NOT NULL,
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Relay_log_pos` bigint(20) unsigned NOT NULL,
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Master_log_pos` bigint(20) unsigned NOT NULL,
  `Checkpoint_relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_relay_log_pos` bigint(20) unsigned NOT NULL,
  `Checkpoint_master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_master_log_pos` bigint(20) unsigned NOT NULL,
  `Checkpoint_seqno` int(10) unsigned NOT NULL,
  `Checkpoint_group_size` int(10) unsigned NOT NULL,
  `Checkpoint_group_bitmap` blob NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Worker Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT '0',
  `Is_DST` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password` char(41) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL DEFAULT '0',
  `max_updates` int(11) unsigned NOT NULL DEFAULT '0',
  `max_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8_bin DEFAULT '',
  `authentication_string` text COLLATE utf8_bin,
  `password_expired` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `query_time` time NOT NULL,
  `lock_time` time NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `s`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `s` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `s`;

--
-- Table structure for table `AAPL_history`
--

DROP TABLE IF EXISTS `AAPL_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AAPL_history` (
  `Ticker` varchar(10) NOT NULL,
  `Date` datetime NOT NULL,
  `Open` decimal(10,2) DEFAULT NULL,
  `High` decimal(10,2) DEFAULT NULL,
  `Low` decimal(10,2) DEFAULT NULL,
  `Close` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(10,2) DEFAULT NULL,
  `AdjustClose` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Abase`
--

DROP TABLE IF EXISTS `Abase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Abase` (
  `Symbol` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Qtoday` decimal(10,2) DEFAULT NULL,
  `Q3days` decimal(10,2) DEFAULT NULL,
  `Q5days` decimal(10,2) DEFAULT NULL,
  `Q10days` decimal(10,2) DEFAULT NULL,
  `Q20days` decimal(10,2) DEFAULT NULL,
  `Q60days` decimal(10,2) DEFAULT NULL,
  `Qyear` decimal(10,2) DEFAULT NULL,
  `Quntilnow` decimal(10,2) DEFAULT NULL,
  `Popen` decimal(10,2) DEFAULT NULL,
  `Phigh` decimal(10,2) DEFAULT NULL,
  `Plow` decimal(10,2) DEFAULT NULL,
  `Pclose` decimal(10,2) DEFAULT NULL,
  `Total` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_channel`
--

DROP TABLE IF EXISTS `O_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_channel` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_channeldown`
--

DROP TABLE IF EXISTS `O_channeldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_channeldown` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_channelup`
--

DROP TABLE IF EXISTS `O_channelup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_channelup` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_doublebottom`
--

DROP TABLE IF EXISTS `O_doublebottom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_doublebottom` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_doublebtop`
--

DROP TABLE IF EXISTS `O_doublebtop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_doublebtop` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_downgrade`
--

DROP TABLE IF EXISTS `O_downgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_downgrade` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_headshoulder`
--

DROP TABLE IF EXISTS `O_headshoulder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_headshoulder` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_mostactive`
--

DROP TABLE IF EXISTS `O_mostactive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_mostactive` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_mostvolitle`
--

DROP TABLE IF EXISTS `O_mostvolitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_mostvolitle` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_multiplebottom`
--

DROP TABLE IF EXISTS `O_multiplebottom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_multiplebottom` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_multipledown`
--

DROP TABLE IF EXISTS `O_multipledown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_multipledown` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_multipletop`
--

DROP TABLE IF EXISTS `O_multipletop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_multipletop` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_newhigh`
--

DROP TABLE IF EXISTS `O_newhigh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_newhigh` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_newlow`
--

DROP TABLE IF EXISTS `O_newlow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_newlow` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_overbought`
--

DROP TABLE IF EXISTS `O_overbought`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_overbought` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_oversold`
--

DROP TABLE IF EXISTS `O_oversold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_oversold` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_topgainer`
--

DROP TABLE IF EXISTS `O_topgainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_topgainer` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_toplooser`
--

DROP TABLE IF EXISTS `O_toplooser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_toplooser` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_triangledown`
--

DROP TABLE IF EXISTS `O_triangledown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_triangledown` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_triangleup`
--

DROP TABLE IF EXISTS `O_triangleup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_triangleup` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_unusualvolume`
--

DROP TABLE IF EXISTS `O_unusualvolume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_unusualvolume` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_upgrade`
--

DROP TABLE IF EXISTS `O_upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_upgrade` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_wedge`
--

DROP TABLE IF EXISTS `O_wedge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_wedge` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_wedgedown`
--

DROP TABLE IF EXISTS `O_wedgedown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_wedgedown` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `O_wedgeup`
--

DROP TABLE IF EXISTS `O_wedgeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `O_wedgeup` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_channel`
--

DROP TABLE IF EXISTS `T_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_channel` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_channeldown`
--

DROP TABLE IF EXISTS `T_channeldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_channeldown` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_channelup`
--

DROP TABLE IF EXISTS `T_channelup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_channelup` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_doublebottom`
--

DROP TABLE IF EXISTS `T_doublebottom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_doublebottom` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_doublebtop`
--

DROP TABLE IF EXISTS `T_doublebtop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_doublebtop` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_downgrade`
--

DROP TABLE IF EXISTS `T_downgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_downgrade` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_headshoulder`
--

DROP TABLE IF EXISTS `T_headshoulder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_headshoulder` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_mostactive`
--

DROP TABLE IF EXISTS `T_mostactive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_mostactive` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_mostvolitle`
--

DROP TABLE IF EXISTS `T_mostvolitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_mostvolitle` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_multiplebottom`
--

DROP TABLE IF EXISTS `T_multiplebottom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_multiplebottom` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_multipledown`
--

DROP TABLE IF EXISTS `T_multipledown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_multipledown` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_multipletop`
--

DROP TABLE IF EXISTS `T_multipletop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_multipletop` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_newhigh`
--

DROP TABLE IF EXISTS `T_newhigh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_newhigh` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_newlow`
--

DROP TABLE IF EXISTS `T_newlow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_newlow` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_overbought`
--

DROP TABLE IF EXISTS `T_overbought`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_overbought` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_oversold`
--

DROP TABLE IF EXISTS `T_oversold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_oversold` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_topgainer`
--

DROP TABLE IF EXISTS `T_topgainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_topgainer` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_toplooser`
--

DROP TABLE IF EXISTS `T_toplooser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_toplooser` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_triangledown`
--

DROP TABLE IF EXISTS `T_triangledown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_triangledown` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_triangleup`
--

DROP TABLE IF EXISTS `T_triangleup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_triangleup` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_unusualvolume`
--

DROP TABLE IF EXISTS `T_unusualvolume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_unusualvolume` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_upgrade`
--

DROP TABLE IF EXISTS `T_upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_upgrade` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_wedge`
--

DROP TABLE IF EXISTS `T_wedge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_wedge` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_wedgedown`
--

DROP TABLE IF EXISTS `T_wedgedown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_wedgedown` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_wedgeup`
--

DROP TABLE IF EXISTS `T_wedgeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_wedgeup` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `Ticker` varchar(10) NOT NULL,
  `Price` decimal(10,2) DEFAULT '0.00',
  `Pmin` decimal(10,2) DEFAULT NULL,
  `Pmax` decimal(10,2) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  `breakoutdate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Trig_alerts_insert BEFORE INSERT ON alerts FOR EACH ROW begin
SET NEW.CreatedDate = IFNULL(NEW.CreatedDate, NOW()),
NEW.LastModifiedDate = IFNULL(NEW.LastModifiedDate, NOW());
end */;;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Trig_alerts_update BEFORE UPDATE ON alerts FOR EACH ROW begin
SET NEW.LastModifiedDate = CASE
WHEN NEW.LastModifiedDate IS NULL THEN NOW()
WHEN NEW.LastModifiedDate = OLD.LastModifiedDate THEN NOW()
ELSE NEW.LastModifiedDate
END,NEW.CreatedDate = IFNULL(NEW.CreatedDate, OLD.CreatedDate);
end */;;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Trig_alerts_delete BEFORE DELETE ON alerts FOR EACH ROW begin
insert into alerts_history values(null,old.ticker,old.price,old.pmin,old.pmax,old.reason,old.createddate,old.lastmodifieddate);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `alerts_history`
--

DROP TABLE IF EXISTS `alerts_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Ticker` varchar(10) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Pmin` decimal(10,2) DEFAULT NULL,
  `Pmax` decimal(10,2) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `lastmodifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1301 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alerts_range`
--

DROP TABLE IF EXISTS `alerts_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts_range` (
  `ticker` varchar(10) NOT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `minpmin` decimal(10,2) DEFAULT NULL,
  `maxpmax` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `all_daily`
--

DROP TABLE IF EXISTS `all_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_daily` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cramer`
--

DROP TABLE IF EXISTS `cramer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cramer` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docs`
--

DROP TABLE IF EXISTS `docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(10) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `path` varchar(500) NOT NULL,
  `createddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `down_auto`
--

DROP TABLE IF EXISTS `down_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `down_auto` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `down_daily`
--

DROP TABLE IF EXISTS `down_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `down_daily` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadlist`
--

DROP TABLE IF EXISTS `downloadlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadlist` (
  `table_name` varchar(64) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadlist_overview`
--

DROP TABLE IF EXISTS `downloadlist_overview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadlist_overview` (
  `table_name` varchar(64) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `downloadlist_owner`
--

DROP TABLE IF EXISTS `downloadlist_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadlist_owner` (
  `table_name` varchar(64) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fz`
--

DROP TABLE IF EXISTS `fz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fz` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `Ticker` varchar(10) NOT NULL,
  `Date` datetime NOT NULL,
  `Open` decimal(10,2) DEFAULT NULL,
  `High` decimal(10,2) DEFAULT NULL,
  `Low` decimal(10,2) DEFAULT NULL,
  `Close` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(10,2) DEFAULT NULL,
  `AdjustClose` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Ticker`,`Date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history_price`
--

DROP TABLE IF EXISTS `history_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_price` (
  `Ticker` varchar(10) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(10,2) DEFAULT NULL,
  KEY `ind_history_price` (`Ticker`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history_tmp`
--

DROP TABLE IF EXISTS `history_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_tmp` (
  `ticker` varchar(10) NOT NULL DEFAULT '',
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keep_history`
--

DROP TABLE IF EXISTS `keep_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keep_history` (
  `Ticker` varchar(10) NOT NULL,
  `Date` datetime NOT NULL,
  `Open` decimal(10,2) DEFAULT NULL,
  `High` decimal(10,2) DEFAULT NULL,
  `Low` decimal(10,2) DEFAULT NULL,
  `Close` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(10,2) DEFAULT NULL,
  `AdjustClose` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mz`
--

DROP TABLE IF EXISTS `mz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mz` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticker` varchar(10) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `url` varchar(1000) NOT NULL,
  `path` varchar(500) NOT NULL,
  `createddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=829 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticker` varchar(10) NOT NULL,
  `strikeprice` decimal(10,2) NOT NULL,
  `symbol` varchar(50) NOT NULL,
  `createddate` datetime NOT NULL,
  `owner` varchar(20) NOT NULL DEFAULT 'root',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `num` int(11) DEFAULT NULL,
  `Ticker` char(10) NOT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `OutstandingShares` decimal(20,2) DEFAULT NULL,
  `FloatShares` decimal(20,2) DEFAULT NULL,
  `InsiderOwnership` decimal(20,2) DEFAULT NULL,
  `InsiderTransactions` decimal(20,2) DEFAULT NULL,
  `InstitutionalOwnership` decimal(10,2) DEFAULT NULL,
  `InstitutionalTransactions` decimal(20,2) DEFAULT NULL,
  `FloatShort` decimal(20,2) DEFAULT NULL,
  `ShortRatio` decimal(10,2) DEFAULT NULL,
  `AverageVolume` decimal(20,2) DEFAULT NULL,
  `Price` decimal(20,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(20,2) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `lastmodifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research`
--

DROP TABLE IF EXISTS `research`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticker` varchar(10) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `createddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research2`
--

DROP TABLE IF EXISTS `research2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research2` (
  `id` int(11) NOT NULL DEFAULT '0',
  `ticker` varchar(10) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `createddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_bak`
--

DROP TABLE IF EXISTS `research_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_bak` (
  `id` int(11) NOT NULL DEFAULT '0',
  `ticker` varchar(10) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `createddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seven_compare_result`
--

DROP TABLE IF EXISTS `seven_compare_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seven_compare_result` (
  `symbol` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `df` decimal(15,2) DEFAULT NULL,
  `a1` decimal(10,2) DEFAULT NULL,
  `b1` decimal(10,2) DEFAULT NULL,
  `a3` decimal(10,2) DEFAULT NULL,
  `b3` decimal(10,2) DEFAULT NULL,
  `a5` decimal(10,2) DEFAULT NULL,
  `b5` decimal(10,2) DEFAULT NULL,
  `a10` decimal(10,2) DEFAULT NULL,
  `b10` decimal(10,2) DEFAULT NULL,
  `a20` decimal(10,2) DEFAULT NULL,
  `b20` decimal(10,2) DEFAULT NULL,
  `a60` decimal(10,2) DEFAULT NULL,
  `b60` decimal(10,2) DEFAULT NULL,
  `ayr` decimal(10,2) DEFAULT NULL,
  `byr` decimal(10,2) DEFAULT NULL,
  `ascore` decimal(17,2) DEFAULT NULL,
  `bscore` decimal(17,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seven_daily`
--

DROP TABLE IF EXISTS `seven_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seven_daily` (
  `symbol` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `Qtoday` decimal(10,2) DEFAULT NULL,
  `Q3days` decimal(10,2) DEFAULT NULL,
  `Q5days` decimal(10,2) DEFAULT NULL,
  `Q10days` decimal(10,2) DEFAULT NULL,
  `Q20days` decimal(10,2) DEFAULT NULL,
  `Q60days` decimal(10,2) DEFAULT NULL,
  `Qyear` decimal(10,2) DEFAULT NULL,
  `Popen` decimal(10,2) DEFAULT NULL,
  `Phigh` decimal(10,2) DEFAULT NULL,
  `Plow` decimal(10,2) DEFAULT NULL,
  `Pclose` decimal(10,2) DEFAULT NULL,
  `Total` varchar(30) DEFAULT NULL,
  `Score` decimal(20,6) DEFAULT NULL,
  `createddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastmodifieddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`symbol`,`createddate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seven_history`
--

DROP TABLE IF EXISTS `seven_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seven_history` (
  `symbol` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `Qtoday` decimal(10,2) DEFAULT NULL,
  `Q3days` decimal(10,2) DEFAULT NULL,
  `Q5days` decimal(10,2) DEFAULT NULL,
  `Q10days` decimal(10,2) DEFAULT NULL,
  `Q20days` decimal(10,2) DEFAULT NULL,
  `Q60days` decimal(10,2) DEFAULT NULL,
  `Qyear` decimal(10,2) DEFAULT NULL,
  `Popen` decimal(10,2) DEFAULT NULL,
  `Phigh` decimal(10,2) DEFAULT NULL,
  `Plow` decimal(10,2) DEFAULT NULL,
  `Pclose` decimal(10,2) DEFAULT NULL,
  `Total` varchar(30) DEFAULT NULL,
  `Score` decimal(20,6) DEFAULT NULL,
  `createddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastmodifieddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`symbol`,`createddate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `single_base`
--

DROP TABLE IF EXISTS `single_base`;
/*!50001 DROP VIEW IF EXISTS `single_base`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `single_base` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ss1`
--

DROP TABLE IF EXISTS `ss1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(50) DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ss2`
--

DROP TABLE IF EXISTS `ss2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(50) DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ss3`
--

DROP TABLE IF EXISTS `ss3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(50) DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ss4`
--

DROP TABLE IF EXISTS `ss4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(50) DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ss5`
--

DROP TABLE IF EXISTS `ss5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(50) DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ss6`
--

DROP TABLE IF EXISTS `ss6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss6` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(50) DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ss7`
--

DROP TABLE IF EXISTS `ss7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss7` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(50) DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ss8`
--

DROP TABLE IF EXISTS `ss8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss8` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(50) DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2464 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `table_size`
--

DROP TABLE IF EXISTS `table_size`;
/*!50001 DROP VIEW IF EXISTS `table_size`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `table_size` AS SELECT 
 1 AS `table_name`,
 1 AS `table_rows`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tmp_abase`
--

DROP TABLE IF EXISTS `tmp_abase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_abase` (
  `symbol` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Qtoday` decimal(10,2) DEFAULT NULL,
  `Q3days` decimal(10,2) DEFAULT NULL,
  `Q5days` decimal(10,2) DEFAULT NULL,
  `Q10days` decimal(10,2) DEFAULT NULL,
  `Q20days` decimal(10,2) DEFAULT NULL,
  `Q60days` decimal(10,2) DEFAULT NULL,
  `Qyear` decimal(10,2) DEFAULT NULL,
  `Quntilnow` decimal(10,2) DEFAULT NULL,
  `Popen` decimal(10,2) DEFAULT NULL,
  `Phigh` decimal(10,2) DEFAULT NULL,
  `Plow` decimal(10,2) DEFAULT NULL,
  `Pclose` decimal(10,2) DEFAULT NULL,
  `Total` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_auto`
--

DROP TABLE IF EXISTS `tmp_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_auto` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_day`
--

DROP TABLE IF EXISTS `tmp_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_day` (
  `No` int(11) DEFAULT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_history`
--

DROP TABLE IF EXISTS `tmp_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_history` (
  `Date` datetime DEFAULT NULL,
  `Open` decimal(10,2) DEFAULT NULL,
  `High` decimal(10,2) DEFAULT NULL,
  `Low` decimal(10,2) DEFAULT NULL,
  `Close` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(10,2) DEFAULT NULL,
  `AdjustClose` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_owner`
--

DROP TABLE IF EXISTS `tmp_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_owner` (
  `num` int(11) DEFAULT NULL,
  `Ticker` char(10) NOT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `OutstandingShares` decimal(20,2) DEFAULT NULL,
  `FloatShares` decimal(20,2) DEFAULT NULL,
  `InsiderOwnership` decimal(20,2) DEFAULT NULL,
  `InsiderTransactions` decimal(20,2) DEFAULT NULL,
  `InstitutionalOwnership` decimal(10,2) DEFAULT NULL,
  `InstitutionalTransactions` decimal(20,2) DEFAULT NULL,
  `FloatShort` decimal(20,2) DEFAULT NULL,
  `ShortRatio` decimal(10,2) DEFAULT NULL,
  `AverageVolume` decimal(20,2) DEFAULT NULL,
  `Price` decimal(20,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_trend`
--

DROP TABLE IF EXISTS `tmp_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_trend` (
  `Num` int(11) DEFAULT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  `Beta` decimal(10,2) DEFAULT NULL,
  `AvgTrueRange` decimal(4,2) DEFAULT NULL,
  `20DSMA` decimal(10,2) DEFAULT NULL,
  `50DSMA` decimal(10,2) DEFAULT NULL,
  `200DSMA` decimal(10,2) DEFAULT NULL,
  `52WHigh` decimal(10,2) DEFAULT NULL,
  `52WLow` decimal(10,2) DEFAULT NULL,
  `RSI14` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `ChangefromOpen` decimal(4,2) DEFAULT NULL,
  `Gap` decimal(10,2) DEFAULT NULL,
  `Volume` decimal(12,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trendwork`
--

DROP TABLE IF EXISTS `trendwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trendwork` (
  `table_name` varchar(64) NOT NULL,
  `URL` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `up_auto`
--

DROP TABLE IF EXISTS `up_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_auto` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `up_daily`
--

DROP TABLE IF EXISTS `up_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_daily` (
  `No` int(11) NOT NULL,
  `Ticker` varchar(10) NOT NULL,
  `Company` varchar(200) DEFAULT NULL,
  `Sector` varchar(60) DEFAULT NULL,
  `Industry` varchar(60) DEFAULT NULL,
  `Country` char(20) DEFAULT NULL,
  `MarketCap` decimal(20,2) DEFAULT NULL,
  `PE` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ChangeRate` decimal(10,2) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `LastModifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`Ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `v_Conglomerates`
--

DROP TABLE IF EXISTS `v_Conglomerates`;
/*!50001 DROP VIEW IF EXISTS `v_Conglomerates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_Conglomerates` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_Consumer_Goods`
--

DROP TABLE IF EXISTS `v_Consumer_Goods`;
/*!50001 DROP VIEW IF EXISTS `v_Consumer_Goods`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_Consumer_Goods` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_Financial`
--

DROP TABLE IF EXISTS `v_Financial`;
/*!50001 DROP VIEW IF EXISTS `v_Financial`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_Financial` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_Healthcare`
--

DROP TABLE IF EXISTS `v_Healthcare`;
/*!50001 DROP VIEW IF EXISTS `v_Healthcare`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_Healthcare` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_Industrial_Goods`
--

DROP TABLE IF EXISTS `v_Industrial_Goods`;
/*!50001 DROP VIEW IF EXISTS `v_Industrial_Goods`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_Industrial_Goods` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_Services`
--

DROP TABLE IF EXISTS `v_Services`;
/*!50001 DROP VIEW IF EXISTS `v_Services`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_Services` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_Technology`
--

DROP TABLE IF EXISTS `v_Technology`;
/*!50001 DROP VIEW IF EXISTS `v_Technology`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_Technology` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_Utilities`
--

DROP TABLE IF EXISTS `v_Utilities`;
/*!50001 DROP VIEW IF EXISTS `v_Utilities`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_Utilities` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_alerts`
--

DROP TABLE IF EXISTS `v_alerts`;
/*!50001 DROP VIEW IF EXISTS `v_alerts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_alerts` AS SELECT 
 1 AS `Ticker`,
 1 AS `Price`,
 1 AS `Pmin`,
 1 AS `Pmax`,
 1 AS `reason`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_basic_materials`
--

DROP TABLE IF EXISTS `v_basic_materials`;
/*!50001 DROP VIEW IF EXISTS `v_basic_materials`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_basic_materials` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_bottom`
--

DROP TABLE IF EXISTS `v_bottom`;
/*!50001 DROP VIEW IF EXISTS `v_bottom`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_bottom` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_digged`
--

DROP TABLE IF EXISTS `v_digged`;
/*!50001 DROP VIEW IF EXISTS `v_digged`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_digged` AS SELECT 
 1 AS `ticker`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_down`
--

DROP TABLE IF EXISTS `v_down`;
/*!50001 DROP VIEW IF EXISTS `v_down`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_down` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_history_age`
--

DROP TABLE IF EXISTS `v_history_age`;
/*!50001 DROP VIEW IF EXISTS `v_history_age`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_history_age` AS SELECT 
 1 AS `ticker`,
 1 AS `days`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_history_current`
--

DROP TABLE IF EXISTS `v_history_current`;
/*!50001 DROP VIEW IF EXISTS `v_history_current`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_history_current` AS SELECT 
 1 AS `Ticker`,
 1 AS `Date`,
 1 AS `Open`,
 1 AS `High`,
 1 AS `Low`,
 1 AS `Close`,
 1 AS `Volume`,
 1 AS `AdjustClose`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_history_ticker`
--

DROP TABLE IF EXISTS `v_history_ticker`;
/*!50001 DROP VIEW IF EXISTS `v_history_ticker`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_history_ticker` AS SELECT 
 1 AS `ticker`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_seven_calendar`
--

DROP TABLE IF EXISTS `v_seven_calendar`;
/*!50001 DROP VIEW IF EXISTS `v_seven_calendar`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_seven_calendar` AS SELECT 
 1 AS `date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_strong`
--

DROP TABLE IF EXISTS `v_strong`;
/*!50001 DROP VIEW IF EXISTS `v_strong`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_strong` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_top`
--

DROP TABLE IF EXISTS `v_top`;
/*!50001 DROP VIEW IF EXISTS `v_top`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_top` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_up`
--

DROP TABLE IF EXISTS `v_up`;
/*!50001 DROP VIEW IF EXISTS `v_up`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_up` AS SELECT 
 1 AS `No`,
 1 AS `Ticker`,
 1 AS `Company`,
 1 AS `Sector`,
 1 AS `Industry`,
 1 AS `Country`,
 1 AS `MarketCap`,
 1 AS `PE`,
 1 AS `Price`,
 1 AS `ChangeRate`,
 1 AS `Volume`,
 1 AS `createddate`,
 1 AS `LastModifieddate`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `mybb`
--

USE `mybb`;

--
-- Current Database: `mybb2`
--

USE `mybb2`;

--
-- Current Database: `mysql`
--

USE `mysql`;

--
-- Current Database: `s`
--

USE `s`;

--
-- Final view structure for view `single_base`
--

/*!50001 DROP VIEW IF EXISTS `single_base`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `single_base` AS select `up_daily`.`No` AS `No`,`up_daily`.`Ticker` AS `Ticker`,`up_daily`.`Company` AS `Company`,`up_daily`.`Sector` AS `Sector`,`up_daily`.`Industry` AS `Industry`,`up_daily`.`Country` AS `Country`,`up_daily`.`MarketCap` AS `MarketCap`,`up_daily`.`PE` AS `PE`,`up_daily`.`Price` AS `Price`,`up_daily`.`ChangeRate` AS `ChangeRate`,`up_daily`.`Volume` AS `Volume`,`up_daily`.`createddate` AS `createddate`,`up_daily`.`LastModifieddate` AS `LastModifieddate` from `up_daily` union select `down_daily`.`No` AS `No`,`down_daily`.`Ticker` AS `Ticker`,`down_daily`.`Company` AS `Company`,`down_daily`.`Sector` AS `Sector`,`down_daily`.`Industry` AS `Industry`,`down_daily`.`Country` AS `Country`,`down_daily`.`MarketCap` AS `MarketCap`,`down_daily`.`PE` AS `PE`,`down_daily`.`Price` AS `Price`,`down_daily`.`ChangeRate` AS `ChangeRate`,`down_daily`.`Volume` AS `Volume`,`down_daily`.`createddate` AS `createddate`,`down_daily`.`LastModifieddate` AS `LastModifieddate` from `down_daily` union select `fz`.`No` AS `No`,`fz`.`Ticker` AS `Ticker`,`fz`.`Company` AS `Company`,`fz`.`Sector` AS `Sector`,`fz`.`Industry` AS `Industry`,`fz`.`Country` AS `Country`,`fz`.`MarketCap` AS `MarketCap`,`fz`.`PE` AS `PE`,`fz`.`Price` AS `Price`,`fz`.`ChangeRate` AS `ChangeRate`,`fz`.`Volume` AS `Volume`,`fz`.`createddate` AS `createddate`,`fz`.`LastModifieddate` AS `LastModifieddate` from `fz` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `table_size`
--

/*!50001 DROP VIEW IF EXISTS `table_size`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_size` AS select `information_schema`.`tables`.`TABLE_NAME` AS `table_name`,`information_schema`.`tables`.`TABLE_ROWS` AS `table_rows` from `information_schema`.`tables` where ((`information_schema`.`tables`.`TABLE_SCHEMA` = 's') and (`information_schema`.`tables`.`TABLE_ROWS` > 0)) order by `information_schema`.`tables`.`TABLE_ROWS` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_Conglomerates`
--

/*!50001 DROP VIEW IF EXISTS `v_Conglomerates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_Conglomerates` AS select `all_daily`.`No` AS `No`,`all_daily`.`Ticker` AS `Ticker`,`all_daily`.`Company` AS `Company`,`all_daily`.`Sector` AS `Sector`,`all_daily`.`Industry` AS `Industry`,`all_daily`.`Country` AS `Country`,`all_daily`.`MarketCap` AS `MarketCap`,`all_daily`.`PE` AS `PE`,`all_daily`.`Price` AS `Price`,`all_daily`.`ChangeRate` AS `ChangeRate`,`all_daily`.`Volume` AS `Volume`,`all_daily`.`createddate` AS `createddate`,`all_daily`.`LastModifieddate` AS `LastModifieddate` from `all_daily` where (`all_daily`.`Sector` = 'Conglomerates') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_Consumer_Goods`
--

/*!50001 DROP VIEW IF EXISTS `v_Consumer_Goods`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_Consumer_Goods` AS select `all_daily`.`No` AS `No`,`all_daily`.`Ticker` AS `Ticker`,`all_daily`.`Company` AS `Company`,`all_daily`.`Sector` AS `Sector`,`all_daily`.`Industry` AS `Industry`,`all_daily`.`Country` AS `Country`,`all_daily`.`MarketCap` AS `MarketCap`,`all_daily`.`PE` AS `PE`,`all_daily`.`Price` AS `Price`,`all_daily`.`ChangeRate` AS `ChangeRate`,`all_daily`.`Volume` AS `Volume`,`all_daily`.`createddate` AS `createddate`,`all_daily`.`LastModifieddate` AS `LastModifieddate` from `all_daily` where (`all_daily`.`Sector` = 'Consumer Goods') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_Financial`
--

/*!50001 DROP VIEW IF EXISTS `v_Financial`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_Financial` AS select `all_daily`.`No` AS `No`,`all_daily`.`Ticker` AS `Ticker`,`all_daily`.`Company` AS `Company`,`all_daily`.`Sector` AS `Sector`,`all_daily`.`Industry` AS `Industry`,`all_daily`.`Country` AS `Country`,`all_daily`.`MarketCap` AS `MarketCap`,`all_daily`.`PE` AS `PE`,`all_daily`.`Price` AS `Price`,`all_daily`.`ChangeRate` AS `ChangeRate`,`all_daily`.`Volume` AS `Volume`,`all_daily`.`createddate` AS `createddate`,`all_daily`.`LastModifieddate` AS `LastModifieddate` from `all_daily` where (`all_daily`.`Sector` = 'Financial') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_Healthcare`
--

/*!50001 DROP VIEW IF EXISTS `v_Healthcare`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_Healthcare` AS select `all_daily`.`No` AS `No`,`all_daily`.`Ticker` AS `Ticker`,`all_daily`.`Company` AS `Company`,`all_daily`.`Sector` AS `Sector`,`all_daily`.`Industry` AS `Industry`,`all_daily`.`Country` AS `Country`,`all_daily`.`MarketCap` AS `MarketCap`,`all_daily`.`PE` AS `PE`,`all_daily`.`Price` AS `Price`,`all_daily`.`ChangeRate` AS `ChangeRate`,`all_daily`.`Volume` AS `Volume`,`all_daily`.`createddate` AS `createddate`,`all_daily`.`LastModifieddate` AS `LastModifieddate` from `all_daily` where (`all_daily`.`Sector` = 'Healthcare') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_Industrial_Goods`
--

/*!50001 DROP VIEW IF EXISTS `v_Industrial_Goods`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_Industrial_Goods` AS select `all_daily`.`No` AS `No`,`all_daily`.`Ticker` AS `Ticker`,`all_daily`.`Company` AS `Company`,`all_daily`.`Sector` AS `Sector`,`all_daily`.`Industry` AS `Industry`,`all_daily`.`Country` AS `Country`,`all_daily`.`MarketCap` AS `MarketCap`,`all_daily`.`PE` AS `PE`,`all_daily`.`Price` AS `Price`,`all_daily`.`ChangeRate` AS `ChangeRate`,`all_daily`.`Volume` AS `Volume`,`all_daily`.`createddate` AS `createddate`,`all_daily`.`LastModifieddate` AS `LastModifieddate` from `all_daily` where (`all_daily`.`Sector` = 'Industrial Goods') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_Services`
--

/*!50001 DROP VIEW IF EXISTS `v_Services`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_Services` AS select `all_daily`.`No` AS `No`,`all_daily`.`Ticker` AS `Ticker`,`all_daily`.`Company` AS `Company`,`all_daily`.`Sector` AS `Sector`,`all_daily`.`Industry` AS `Industry`,`all_daily`.`Country` AS `Country`,`all_daily`.`MarketCap` AS `MarketCap`,`all_daily`.`PE` AS `PE`,`all_daily`.`Price` AS `Price`,`all_daily`.`ChangeRate` AS `ChangeRate`,`all_daily`.`Volume` AS `Volume`,`all_daily`.`createddate` AS `createddate`,`all_daily`.`LastModifieddate` AS `LastModifieddate` from `all_daily` where (`all_daily`.`Sector` = 'Services') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_Technology`
--

/*!50001 DROP VIEW IF EXISTS `v_Technology`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_Technology` AS select `all_daily`.`No` AS `No`,`all_daily`.`Ticker` AS `Ticker`,`all_daily`.`Company` AS `Company`,`all_daily`.`Sector` AS `Sector`,`all_daily`.`Industry` AS `Industry`,`all_daily`.`Country` AS `Country`,`all_daily`.`MarketCap` AS `MarketCap`,`all_daily`.`PE` AS `PE`,`all_daily`.`Price` AS `Price`,`all_daily`.`ChangeRate` AS `ChangeRate`,`all_daily`.`Volume` AS `Volume`,`all_daily`.`createddate` AS `createddate`,`all_daily`.`LastModifieddate` AS `LastModifieddate` from `all_daily` where (`all_daily`.`Sector` = 'Technology') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_Utilities`
--

/*!50001 DROP VIEW IF EXISTS `v_Utilities`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_Utilities` AS select `all_daily`.`No` AS `No`,`all_daily`.`Ticker` AS `Ticker`,`all_daily`.`Company` AS `Company`,`all_daily`.`Sector` AS `Sector`,`all_daily`.`Industry` AS `Industry`,`all_daily`.`Country` AS `Country`,`all_daily`.`MarketCap` AS `MarketCap`,`all_daily`.`PE` AS `PE`,`all_daily`.`Price` AS `Price`,`all_daily`.`ChangeRate` AS `ChangeRate`,`all_daily`.`Volume` AS `Volume`,`all_daily`.`createddate` AS `createddate`,`all_daily`.`LastModifieddate` AS `LastModifieddate` from `all_daily` where (`all_daily`.`Sector` = 'Utilities') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_alerts`
--

/*!50001 DROP VIEW IF EXISTS `v_alerts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_alerts` AS select `alerts`.`Ticker` AS `Ticker`,`alerts`.`Price` AS `Price`,`alerts`.`Pmin` AS `Pmin`,`alerts`.`Pmax` AS `Pmax`,`alerts`.`reason` AS `reason`,`alerts`.`createddate` AS `createddate`,`alerts`.`LastModifieddate` AS `LastModifieddate` from `alerts` union select `alerts_history`.`Ticker` AS `ticker`,`alerts_history`.`Price` AS `price`,`alerts_history`.`Pmin` AS `pmin`,`alerts_history`.`Pmax` AS `pmax`,`alerts_history`.`reason` AS `reason`,`alerts_history`.`createddate` AS `createddate`,`alerts_history`.`lastmodifieddate` AS `lastmodifieddate` from `alerts_history` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_basic_materials`
--

/*!50001 DROP VIEW IF EXISTS `v_basic_materials`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_basic_materials` AS select `all_daily`.`No` AS `No`,`all_daily`.`Ticker` AS `Ticker`,`all_daily`.`Company` AS `Company`,`all_daily`.`Sector` AS `Sector`,`all_daily`.`Industry` AS `Industry`,`all_daily`.`Country` AS `Country`,`all_daily`.`MarketCap` AS `MarketCap`,`all_daily`.`PE` AS `PE`,`all_daily`.`Price` AS `Price`,`all_daily`.`ChangeRate` AS `ChangeRate`,`all_daily`.`Volume` AS `Volume`,`all_daily`.`createddate` AS `createddate`,`all_daily`.`LastModifieddate` AS `LastModifieddate` from `all_daily` where (`all_daily`.`Sector` = 'Basic Materials') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_bottom`
--

/*!50001 DROP VIEW IF EXISTS `v_bottom`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_bottom` AS select `O_doublebottom`.`No` AS `No`,`O_doublebottom`.`Ticker` AS `Ticker`,`O_doublebottom`.`Company` AS `Company`,`O_doublebottom`.`Sector` AS `Sector`,`O_doublebottom`.`Industry` AS `Industry`,`O_doublebottom`.`Country` AS `Country`,`O_doublebottom`.`MarketCap` AS `MarketCap`,`O_doublebottom`.`PE` AS `PE`,`O_doublebottom`.`Price` AS `Price`,`O_doublebottom`.`ChangeRate` AS `ChangeRate`,`O_doublebottom`.`Volume` AS `Volume`,`O_doublebottom`.`createddate` AS `createddate`,`O_doublebottom`.`LastModifieddate` AS `LastModifieddate` from `O_doublebottom` union select `O_multiplebottom`.`No` AS `No`,`O_multiplebottom`.`Ticker` AS `Ticker`,`O_multiplebottom`.`Company` AS `Company`,`O_multiplebottom`.`Sector` AS `Sector`,`O_multiplebottom`.`Industry` AS `Industry`,`O_multiplebottom`.`Country` AS `Country`,`O_multiplebottom`.`MarketCap` AS `MarketCap`,`O_multiplebottom`.`PE` AS `PE`,`O_multiplebottom`.`Price` AS `Price`,`O_multiplebottom`.`ChangeRate` AS `ChangeRate`,`O_multiplebottom`.`Volume` AS `Volume`,`O_multiplebottom`.`createddate` AS `createddate`,`O_multiplebottom`.`LastModifieddate` AS `LastModifieddate` from `O_multiplebottom` union select `O_oversold`.`No` AS `No`,`O_oversold`.`Ticker` AS `Ticker`,`O_oversold`.`Company` AS `Company`,`O_oversold`.`Sector` AS `Sector`,`O_oversold`.`Industry` AS `Industry`,`O_oversold`.`Country` AS `Country`,`O_oversold`.`MarketCap` AS `MarketCap`,`O_oversold`.`PE` AS `PE`,`O_oversold`.`Price` AS `Price`,`O_oversold`.`ChangeRate` AS `ChangeRate`,`O_oversold`.`Volume` AS `Volume`,`O_oversold`.`createddate` AS `createddate`,`O_oversold`.`LastModifieddate` AS `LastModifieddate` from `O_oversold` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_digged`
--

/*!50001 DROP VIEW IF EXISTS `v_digged`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_digged` AS select `news`.`ticker` AS `ticker` from `news` union select `research`.`ticker` AS `ticker` from `research` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_down`
--

/*!50001 DROP VIEW IF EXISTS `v_down`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_down` AS select `O_channeldown`.`No` AS `No`,`O_channeldown`.`Ticker` AS `Ticker`,`O_channeldown`.`Company` AS `Company`,`O_channeldown`.`Sector` AS `Sector`,`O_channeldown`.`Industry` AS `Industry`,`O_channeldown`.`Country` AS `Country`,`O_channeldown`.`MarketCap` AS `MarketCap`,`O_channeldown`.`PE` AS `PE`,`O_channeldown`.`Price` AS `Price`,`O_channeldown`.`ChangeRate` AS `ChangeRate`,`O_channeldown`.`Volume` AS `Volume`,`O_channeldown`.`createddate` AS `createddate`,`O_channeldown`.`LastModifieddate` AS `LastModifieddate` from `O_channeldown` union select `O_downgrade`.`No` AS `No`,`O_downgrade`.`Ticker` AS `Ticker`,`O_downgrade`.`Company` AS `Company`,`O_downgrade`.`Sector` AS `Sector`,`O_downgrade`.`Industry` AS `Industry`,`O_downgrade`.`Country` AS `Country`,`O_downgrade`.`MarketCap` AS `MarketCap`,`O_downgrade`.`PE` AS `PE`,`O_downgrade`.`Price` AS `Price`,`O_downgrade`.`ChangeRate` AS `ChangeRate`,`O_downgrade`.`Volume` AS `Volume`,`O_downgrade`.`createddate` AS `createddate`,`O_downgrade`.`LastModifieddate` AS `LastModifieddate` from `O_downgrade` union select `O_wedgedown`.`No` AS `No`,`O_wedgedown`.`Ticker` AS `Ticker`,`O_wedgedown`.`Company` AS `Company`,`O_wedgedown`.`Sector` AS `Sector`,`O_wedgedown`.`Industry` AS `Industry`,`O_wedgedown`.`Country` AS `Country`,`O_wedgedown`.`MarketCap` AS `MarketCap`,`O_wedgedown`.`PE` AS `PE`,`O_wedgedown`.`Price` AS `Price`,`O_wedgedown`.`ChangeRate` AS `ChangeRate`,`O_wedgedown`.`Volume` AS `Volume`,`O_wedgedown`.`createddate` AS `createddate`,`O_wedgedown`.`LastModifieddate` AS `LastModifieddate` from `O_wedgedown` union select `O_newlow`.`No` AS `No`,`O_newlow`.`Ticker` AS `Ticker`,`O_newlow`.`Company` AS `Company`,`O_newlow`.`Sector` AS `Sector`,`O_newlow`.`Industry` AS `Industry`,`O_newlow`.`Country` AS `Country`,`O_newlow`.`MarketCap` AS `MarketCap`,`O_newlow`.`PE` AS `PE`,`O_newlow`.`Price` AS `Price`,`O_newlow`.`ChangeRate` AS `ChangeRate`,`O_newlow`.`Volume` AS `Volume`,`O_newlow`.`createddate` AS `createddate`,`O_newlow`.`LastModifieddate` AS `LastModifieddate` from `O_newlow` union select `O_triangledown`.`No` AS `No`,`O_triangledown`.`Ticker` AS `Ticker`,`O_triangledown`.`Company` AS `Company`,`O_triangledown`.`Sector` AS `Sector`,`O_triangledown`.`Industry` AS `Industry`,`O_triangledown`.`Country` AS `Country`,`O_triangledown`.`MarketCap` AS `MarketCap`,`O_triangledown`.`PE` AS `PE`,`O_triangledown`.`Price` AS `Price`,`O_triangledown`.`ChangeRate` AS `ChangeRate`,`O_triangledown`.`Volume` AS `Volume`,`O_triangledown`.`createddate` AS `createddate`,`O_triangledown`.`LastModifieddate` AS `LastModifieddate` from `O_triangledown` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_history_age`
--

/*!50001 DROP VIEW IF EXISTS `v_history_age`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_history_age` AS select `history`.`Ticker` AS `ticker`,count(1) AS `days` from `history` group by `history`.`Ticker` order by 2 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_history_current`
--

/*!50001 DROP VIEW IF EXISTS `v_history_current`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_history_current` AS select `history`.`Ticker` AS `Ticker`,`history`.`Date` AS `Date`,`history`.`Open` AS `Open`,`history`.`High` AS `High`,`history`.`Low` AS `Low`,`history`.`Close` AS `Close`,`history`.`Volume` AS `Volume`,`history`.`AdjustClose` AS `AdjustClose` from `history` where (`history`.`Date` = (select max(`history`.`Date`) from `history`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_history_ticker`
--

/*!50001 DROP VIEW IF EXISTS `v_history_ticker`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_history_ticker` AS select distinct `history`.`Ticker` AS `ticker` from `history` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_seven_calendar`
--

/*!50001 DROP VIEW IF EXISTS `v_seven_calendar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_seven_calendar` AS select distinct cast(`seven_history`.`createddate` as date) AS `date` from `seven_history` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_strong`
--

/*!50001 DROP VIEW IF EXISTS `v_strong`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_strong` AS select `O_unusualvolume`.`No` AS `No`,`O_unusualvolume`.`Ticker` AS `Ticker`,`O_unusualvolume`.`Company` AS `Company`,`O_unusualvolume`.`Sector` AS `Sector`,`O_unusualvolume`.`Industry` AS `Industry`,`O_unusualvolume`.`Country` AS `Country`,`O_unusualvolume`.`MarketCap` AS `MarketCap`,`O_unusualvolume`.`PE` AS `PE`,`O_unusualvolume`.`Price` AS `Price`,`O_unusualvolume`.`ChangeRate` AS `ChangeRate`,`O_unusualvolume`.`Volume` AS `Volume`,`O_unusualvolume`.`createddate` AS `createddate`,`O_unusualvolume`.`LastModifieddate` AS `LastModifieddate` from `O_unusualvolume` union select `O_mostvolitle`.`No` AS `No`,`O_mostvolitle`.`Ticker` AS `Ticker`,`O_mostvolitle`.`Company` AS `Company`,`O_mostvolitle`.`Sector` AS `Sector`,`O_mostvolitle`.`Industry` AS `Industry`,`O_mostvolitle`.`Country` AS `Country`,`O_mostvolitle`.`MarketCap` AS `MarketCap`,`O_mostvolitle`.`PE` AS `PE`,`O_mostvolitle`.`Price` AS `Price`,`O_mostvolitle`.`ChangeRate` AS `ChangeRate`,`O_mostvolitle`.`Volume` AS `Volume`,`O_mostvolitle`.`createddate` AS `createddate`,`O_mostvolitle`.`LastModifieddate` AS `LastModifieddate` from `O_mostvolitle` union select `O_mostactive`.`No` AS `No`,`O_mostactive`.`Ticker` AS `Ticker`,`O_mostactive`.`Company` AS `Company`,`O_mostactive`.`Sector` AS `Sector`,`O_mostactive`.`Industry` AS `Industry`,`O_mostactive`.`Country` AS `Country`,`O_mostactive`.`MarketCap` AS `MarketCap`,`O_mostactive`.`PE` AS `PE`,`O_mostactive`.`Price` AS `Price`,`O_mostactive`.`ChangeRate` AS `ChangeRate`,`O_mostactive`.`Volume` AS `Volume`,`O_mostactive`.`createddate` AS `createddate`,`O_mostactive`.`LastModifieddate` AS `LastModifieddate` from `O_mostactive` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_top`
--

/*!50001 DROP VIEW IF EXISTS `v_top`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_top` AS select `O_doublebtop`.`No` AS `No`,`O_doublebtop`.`Ticker` AS `Ticker`,`O_doublebtop`.`Company` AS `Company`,`O_doublebtop`.`Sector` AS `Sector`,`O_doublebtop`.`Industry` AS `Industry`,`O_doublebtop`.`Country` AS `Country`,`O_doublebtop`.`MarketCap` AS `MarketCap`,`O_doublebtop`.`PE` AS `PE`,`O_doublebtop`.`Price` AS `Price`,`O_doublebtop`.`ChangeRate` AS `ChangeRate`,`O_doublebtop`.`Volume` AS `Volume`,`O_doublebtop`.`createddate` AS `createddate`,`O_doublebtop`.`LastModifieddate` AS `LastModifieddate` from `O_doublebtop` union select `O_multipletop`.`No` AS `No`,`O_multipletop`.`Ticker` AS `Ticker`,`O_multipletop`.`Company` AS `Company`,`O_multipletop`.`Sector` AS `Sector`,`O_multipletop`.`Industry` AS `Industry`,`O_multipletop`.`Country` AS `Country`,`O_multipletop`.`MarketCap` AS `MarketCap`,`O_multipletop`.`PE` AS `PE`,`O_multipletop`.`Price` AS `Price`,`O_multipletop`.`ChangeRate` AS `ChangeRate`,`O_multipletop`.`Volume` AS `Volume`,`O_multipletop`.`createddate` AS `createddate`,`O_multipletop`.`LastModifieddate` AS `LastModifieddate` from `O_multipletop` union select `O_overbought`.`No` AS `No`,`O_overbought`.`Ticker` AS `Ticker`,`O_overbought`.`Company` AS `Company`,`O_overbought`.`Sector` AS `Sector`,`O_overbought`.`Industry` AS `Industry`,`O_overbought`.`Country` AS `Country`,`O_overbought`.`MarketCap` AS `MarketCap`,`O_overbought`.`PE` AS `PE`,`O_overbought`.`Price` AS `Price`,`O_overbought`.`ChangeRate` AS `ChangeRate`,`O_overbought`.`Volume` AS `Volume`,`O_overbought`.`createddate` AS `createddate`,`O_overbought`.`LastModifieddate` AS `LastModifieddate` from `O_overbought` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_up`
--

/*!50001 DROP VIEW IF EXISTS `v_up`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_up` AS select `O_channelup`.`No` AS `No`,`O_channelup`.`Ticker` AS `Ticker`,`O_channelup`.`Company` AS `Company`,`O_channelup`.`Sector` AS `Sector`,`O_channelup`.`Industry` AS `Industry`,`O_channelup`.`Country` AS `Country`,`O_channelup`.`MarketCap` AS `MarketCap`,`O_channelup`.`PE` AS `PE`,`O_channelup`.`Price` AS `Price`,`O_channelup`.`ChangeRate` AS `ChangeRate`,`O_channelup`.`Volume` AS `Volume`,`O_channelup`.`createddate` AS `createddate`,`O_channelup`.`LastModifieddate` AS `LastModifieddate` from `O_channelup` union select `O_upgrade`.`No` AS `No`,`O_upgrade`.`Ticker` AS `Ticker`,`O_upgrade`.`Company` AS `Company`,`O_upgrade`.`Sector` AS `Sector`,`O_upgrade`.`Industry` AS `Industry`,`O_upgrade`.`Country` AS `Country`,`O_upgrade`.`MarketCap` AS `MarketCap`,`O_upgrade`.`PE` AS `PE`,`O_upgrade`.`Price` AS `Price`,`O_upgrade`.`ChangeRate` AS `ChangeRate`,`O_upgrade`.`Volume` AS `Volume`,`O_upgrade`.`createddate` AS `createddate`,`O_upgrade`.`LastModifieddate` AS `LastModifieddate` from `O_upgrade` union select `O_wedgeup`.`No` AS `No`,`O_wedgeup`.`Ticker` AS `Ticker`,`O_wedgeup`.`Company` AS `Company`,`O_wedgeup`.`Sector` AS `Sector`,`O_wedgeup`.`Industry` AS `Industry`,`O_wedgeup`.`Country` AS `Country`,`O_wedgeup`.`MarketCap` AS `MarketCap`,`O_wedgeup`.`PE` AS `PE`,`O_wedgeup`.`Price` AS `Price`,`O_wedgeup`.`ChangeRate` AS `ChangeRate`,`O_wedgeup`.`Volume` AS `Volume`,`O_wedgeup`.`createddate` AS `createddate`,`O_wedgeup`.`LastModifieddate` AS `LastModifieddate` from `O_wedgeup` union select `O_newhigh`.`No` AS `No`,`O_newhigh`.`Ticker` AS `Ticker`,`O_newhigh`.`Company` AS `Company`,`O_newhigh`.`Sector` AS `Sector`,`O_newhigh`.`Industry` AS `Industry`,`O_newhigh`.`Country` AS `Country`,`O_newhigh`.`MarketCap` AS `MarketCap`,`O_newhigh`.`PE` AS `PE`,`O_newhigh`.`Price` AS `Price`,`O_newhigh`.`ChangeRate` AS `ChangeRate`,`O_newhigh`.`Volume` AS `Volume`,`O_newhigh`.`createddate` AS `createddate`,`O_newhigh`.`LastModifieddate` AS `LastModifieddate` from `O_newhigh` union select `O_triangleup`.`No` AS `No`,`O_triangleup`.`Ticker` AS `Ticker`,`O_triangleup`.`Company` AS `Company`,`O_triangleup`.`Sector` AS `Sector`,`O_triangleup`.`Industry` AS `Industry`,`O_triangleup`.`Country` AS `Country`,`O_triangleup`.`MarketCap` AS `MarketCap`,`O_triangleup`.`PE` AS `PE`,`O_triangleup`.`Price` AS `Price`,`O_triangleup`.`ChangeRate` AS `ChangeRate`,`O_triangleup`.`Volume` AS `Volume`,`O_triangleup`.`createddate` AS `createddate`,`O_triangleup`.`LastModifieddate` AS `LastModifieddate` from `O_triangleup` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-12  3:06:18
