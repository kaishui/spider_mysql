-- MySQL dump 10.13  Distrib 5.5.38, for osx10.6 (i386)
--
-- Host: localhost    Database: spider
-- ------------------------------------------------------
-- Server version	5.5.38-log

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
-- Table structure for table `DataModel`
--

DROP TABLE IF EXISTS `DataModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataModel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `tablename` varchar(32) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DataModel`
--

LOCK TABLES `DataModel` WRITE;
/*!40000 ALTER TABLE `DataModel` DISABLE KEYS */;
INSERT INTO `DataModel` VALUES (1,'城市','city','2014-07-06 12:57:27','城市'),(2,'全球网站排名','sitesort','2014-07-10 20:48:33','全球网站排名');
/*!40000 ALTER TABLE `DataModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Source`
--

DROP TABLE IF EXISTS `Source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `isused` bit(1) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Source`
--

LOCK TABLES `Source` WRITE;
/*!40000 ALTER TABLE `Source` DISABLE KEYS */;
INSERT INTO `Source` VALUES (1,'饿了么','http://v5.ele.me/','',''),(2,'网票网','http://www.wangpiao.com','',''),(3,'易淘食','http://www.etaoshi.com','','');
/*!40000 ALTER TABLE `Source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SourceSpider`
--

DROP TABLE IF EXISTS `SourceSpider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SourceSpider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceid` int(11) DEFAULT NULL,
  `templateid` int(11) DEFAULT NULL,
  `spiderentryrule` varchar(1024) DEFAULT NULL,
  `jobrule` varchar(128) DEFAULT NULL COMMENT 'quartz的cron语法',
  `creationdate` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `isused` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk COMMENT='多个源可以对应一个正则模版';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SourceSpider`
--

LOCK TABLES `SourceSpider` WRITE;
/*!40000 ALTER TABLE `SourceSpider` DISABLE KEYS */;
INSERT INTO `SourceSpider` VALUES (1,1,1,'[method]\r\nGET\r\n\r\n[url]\r\nhttp://www.alexa.cn/index.php?url=ele.me','0 0 5 ? * 2','2014-07-10 21:00:39','',''),(2,2,1,'[method]\r\nGET\r\n\r\n[url]\r\nhttp://www.alexa.cn/index.php?url=wangpiao.com','0 0 5 ? * 2','2014-07-17 22:44:00','',''),(3,3,1,'[method]\r\nGET\r\n\r\n[url]\r\nhttp://www.alexa.cn/index.php?url=etaoshi.com','0 0 5 ? * 2','2014-07-17 22:46:20','','');
/*!40000 ALTER TABLE `SourceSpider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpiderColumn`
--

DROP TABLE IF EXISTS `SpiderColumn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpiderColumn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datamodelid` int(11) DEFAULT NULL,
  `columnename` varchar(32) DEFAULT NULL,
  `columncname` varchar(32) DEFAULT NULL,
  `columntype` int(11) DEFAULT NULL COMMENT '1.int\n            2.decimal\n            3.nvarchar\n            4.datetime',
  `columnlen` int(11) DEFAULT NULL,
  `columnaccuracy` int(11) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `remark` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpiderColumn`
--

LOCK TABLES `SpiderColumn` WRITE;
/*!40000 ALTER TABLE `SpiderColumn` DISABLE KEYS */;
INSERT INTO `SpiderColumn` VALUES (1,1,'cityid','城市id',3,24,0,'2014-07-08 20:32:00',''),(2,1,'cityname','城市名称',3,64,0,'2014-07-08 20:32:51',''),(3,2,'dailysort','当日排名',3,48,0,'2014-07-10 20:49:07','当日排名'),(4,2,'sorttrend','天排名变化趋势',3,48,0,'2014-07-10 20:49:23',''),(5,2,'weeksort','一周平均排名',3,48,0,'2014-07-10 20:49:41','一周平均排名'),(6,2,'weeksorttrend','周排名变化趋势',3,48,0,'2014-07-10 20:49:58',''),(7,2,'monthsort','一月平均排名',3,48,0,'2014-07-10 20:50:16','一月平均排名'),(8,2,'monthsorttrend','月排名变化趋势',3,48,0,'2014-07-10 20:50:33','月排名变化趋势');
/*!40000 ALTER TABLE `SpiderColumn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpiderRegTemplate`
--

DROP TABLE IF EXISTS `SpiderRegTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpiderRegTemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templateid` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL COMMENT '0.过滤\n            -1.\n            \n            \n            >0.为抓取字段id',
  `spiderreg` varchar(512) DEFAULT NULL,
  `spiderorderby` int(11) DEFAULT NULL,
  `isspiderentry` int(11) DEFAULT NULL,
  `entryrule` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpiderRegTemplate`
--

LOCK TABLES `SpiderRegTemplate` WRITE;
/*!40000 ALTER TABLE `SpiderRegTemplate` DISABLE KEYS */;
INSERT INTO `SpiderRegTemplate` VALUES (1,1,0,3,'showHint\\(\'.+?\\,(?<match>.+?)\\,\\d+?\'\\);',1,0,''),(2,1,0,4,'showHint\\(\'.+?\\,.+?\\,(?<match>.+?)\'\\);',2,0,''),(3,1,0,5,'showHint\\(\'(?<match>.+?)\\,.+?\\,\\d+?\'\\);',3,0,''),(4,1,0,-1,'',4,1,'[method]\r\nPOST\r\n\r\n[postparams]\r\nurl={{array.weeksort}}&sig={{array.dailysort}}&keyt={{array.sorttrend}}\r\n\r\n[url]\r\nhttp://www.alexa.cn/api0523.php'),(5,1,4,3,'^(?<match>.+?)\\*',1,0,'[method]\r\nPOST\r\n\r\n[postparams]\r\nurl=dianping.com&sig=6b35767284f726fcac68f5095df5e2ef&keyt=1396234864'),(6,1,4,4,'^.+?\\*(?<match>.+?)\\*',2,0,'[method]\r\nPOST\r\n\r\n[postparams]\r\nurl=dianping.com&sig=6b35767284f726fcac68f5095df5e2ef&keyt=1396234864'),(7,1,4,5,'^.+?\\*.+?\\*(?<match>.+?)\\*',3,0,'[method]\r\nPOST\r\n\r\n[postparams]\r\nurl=daojia.com.cn&sig=6b35767284f726fcac68f5095df5e2ef&keyt=1396234864'),(8,1,4,6,'^.+?\\*.+?\\*.+?\\*(?<match>.+?)\\*',4,0,'[method]\r\nPOST\r\n\r\n[postparams]\r\nurl=daojia.com.cn&sig=6b35767284f726fcac68f5095df5e2ef&keyt=1396234864'),(9,1,4,7,'^.+?\\*.+?\\*.+?\\*.+?\\*(?<match>.+?)\\*',5,0,'[method]\r\nPOST\r\n\r\n[postparams]\r\nurl=daojia.com.cn&sig=6b35767284f726fcac68f5095df5e2ef&keyt=1396234864'),(10,1,4,8,'^.+?\\*.+?\\*.+?\\*.+?\\*.+?\\*(?<match>.+?)\\*',6,0,'[method]\r\nPOST\r\n\r\n[postparams]\r\nurl=dianping.com&sig=6b35767284f726fcac68f5095df5e2ef&keyt=1396234864'),(11,1,4,-1,'',7,0,'[insertdb]\r\nsitesort({{array.dailysort}}{{array.sorttrend}}{{array.weeksort}}{{array.weeksorttrend}}{{array.monthsort}}{{array.monthsorttrend}})\r\n\r\n[uniquekey]\r\narray.dailysort|array.sorttrend');
/*!40000 ALTER TABLE `SpiderRegTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpideredUrl`
--

DROP TABLE IF EXISTS `SpideredUrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpideredUrl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(128) DEFAULT NULL,
  `url` varchar(512) DEFAULT NULL,
  `spidereddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpideredUrl`
--

LOCK TABLES `SpideredUrl` WRITE;
/*!40000 ALTER TABLE `SpideredUrl` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpideredUrl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Template`
--

DROP TABLE IF EXISTS `Template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk COMMENT='一个数据模型可以对应多个抓取正则模版';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Template`
--

LOCK TABLES `Template` WRITE;
/*!40000 ALTER TABLE `Template` DISABLE KEYS */;
INSERT INTO `Template` VALUES (1,'alexa全球网站排名','2014-07-06 19:12:21','alexa全球网站排名');
/*!40000 ALTER TABLE `Template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TemplateDataModel`
--

DROP TABLE IF EXISTS `TemplateDataModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TemplateDataModel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templateid` int(11) DEFAULT NULL,
  `datamodelid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TemplateDataModel`
--

LOCK TABLES `TemplateDataModel` WRITE;
/*!40000 ALTER TABLE `TemplateDataModel` DISABLE KEYS */;
INSERT INTO `TemplateDataModel` VALUES (1,0,1),(3,1,2);
/*!40000 ALTER TABLE `TemplateDataModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestUrl`
--

DROP TABLE IF EXISTS `TestUrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TestUrl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templateid` int(11) DEFAULT NULL,
  `testurl` varchar(1024) DEFAULT NULL,
  `testcontent` text,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestUrl`
--

LOCK TABLES `TestUrl` WRITE;
/*!40000 ALTER TABLE `TestUrl` DISABLE KEYS */;
INSERT INTO `TestUrl` VALUES (1,1,'http://www.alexa.cn/index.php?url=dianping.com','',0),(2,1,'http://www.alexa.cn/api0523.php','',4);
/*!40000 ALTER TABLE `TestUrl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sourcespiderid` int(11) NOT NULL,
  `spidertime` datetime NOT NULL,
  `cityid` varchar(24) DEFAULT NULL,
  `cityname` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitesort`
--

DROP TABLE IF EXISTS `sitesort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitesort` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sourcespiderid` int(11) NOT NULL,
  `spidertime` datetime NOT NULL,
  `dailysort` varchar(48) DEFAULT NULL,
  `sorttrend` varchar(48) DEFAULT NULL,
  `weeksort` varchar(48) DEFAULT NULL,
  `weeksorttrend` varchar(48) DEFAULT NULL,
  `monthsort` varchar(48) DEFAULT NULL,
  `monthsorttrend` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitesort`
--

LOCK TABLES `sitesort` WRITE;
/*!40000 ALTER TABLE `sitesort` DISABLE KEYS */;
INSERT INTO `sitesort` VALUES (1,1,'2014-07-16 23:44:51','21456','+6329','12576','-2160','13794','-486'),(2,1,'2014-07-17 22:41:13','23013','+1560','13145','-2577','13950','-434'),(3,2,'2014-07-17 22:46:34','240979','+40554','266793','-47191','192556','+12517'),(4,3,'2014-07-17 22:47:31','34069','+8310','26472','+1248','20922','-1705');
/*!40000 ALTER TABLE `sitesort` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-17 22:54:37
