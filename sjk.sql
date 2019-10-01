-- MySQL dump 10.13  Distrib 5.5.40, for Win32 (x86)
--
-- Host: localhost    Database: paofen
-- ------------------------------------------------------
-- Server version	5.5.40

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
-- Table structure for table `ysk_admin`
--

DROP TABLE IF EXISTS `ysk_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `auth_id` int(11) NOT NULL DEFAULT '1' COMMENT '角色ID',
  `nickname` varchar(63) DEFAULT NULL COMMENT '昵称',
  `username` varchar(31) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `reg_type` varchar(20) DEFAULT NULL COMMENT '注册人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台管理员表格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_admin`
--

LOCK TABLES `ysk_admin` WRITE;
/*!40000 ALTER TABLE `ysk_admin` DISABLE KEYS */;
INSERT INTO `ysk_admin` VALUES (1,1,'超级管理员','admin','70c45b1118a087a8f04d08cbe2c282f7','',0,1438651748,1553079162,1,'');
/*!40000 ALTER TABLE `ysk_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_bankcard`
--

DROP TABLE IF EXISTS `ysk_bankcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_bankcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `name` varchar(225) NOT NULL COMMENT '持卡人',
  `bankname` varchar(225) NOT NULL COMMENT '所属银行',
  `banknum` varchar(225) NOT NULL COMMENT '银行卡号',
  `addtime` varchar(225) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='银行卡管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_bankcard`
--

LOCK TABLES `ysk_bankcard` WRITE;
/*!40000 ALTER TABLE `ysk_bankcard` DISABLE KEYS */;
INSERT INTO `ysk_bankcard` VALUES (4,1,'张学友','建设银行','62284812345698745678','1552018926'),(2,1,'张学友','工商银行','6228481234567895566','1552017910'),(3,1,'张学友','长沙银行','62284845648945164659','1552018162'),(5,1,'张学友','农业银行','622848123456785555','1552018956'),(6,1,'刘德华','中国人民银行','6228481234567895544564','1552113144'),(8,6,'小三子','中国银行','622848123456789258369','1552577950'),(9,5,'老实人','天地银行','111111','1553022819'),(10,5,'老实人','地天银行','5151515','1553022840'),(11,7,'159','中国银行','159159','1553025654'),(12,3,'WE QWEQ WE','aWEQQ','QWE QWEQ','1553274062');
/*!40000 ALTER TABLE `ysk_bankcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_complaint`
--

DROP TABLE IF EXISTS `ysk_complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '投诉人id',
  `content` text CHARACTER SET utf8mb4 COMMENT '投诉内容',
  `imgs` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '图片路径',
  `status` tinyint(1) DEFAULT '0' COMMENT '0 未查看 1 已查看',
  `create_time` int(10) DEFAULT NULL COMMENT '投诉时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='投诉建议表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_complaint`
--

LOCK TABLES `ysk_complaint` WRITE;
/*!40000 ALTER TABLE `ysk_complaint` DISABLE KEYS */;
INSERT INTO `ysk_complaint` VALUES (1,1,'','',0,1552122574);
/*!40000 ALTER TABLE `ysk_complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_config`
--

DROP TABLE IF EXISTS `ysk_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(32) DEFAULT NULL COMMENT '配置名称',
  `value` text NOT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '配置类型',
  `options` varchar(255) NOT NULL DEFAULT '' COMMENT '配置额外值',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_config`
--

LOCK TABLES `ysk_config` WRITE;
/*!40000 ALTER TABLE `ysk_config` DISABLE KEYS */;
INSERT INTO `ysk_config` VALUES (1,'站点开关','TOGGLE_WEB_SITE','1',3,'0','0:关闭\r\n1:开启','商城建设中......',1378898976,1406992386,1,1),(2,'网站标题','WEB_SITE_TITLE','',1,'0','','网站标题前台显示标题',1378898976,1379235274,2,1),(3,'网站LOGO','WEB_SITE_LOGO','',1,'0','','网站LOGO',1407003397,1407004692,3,1),(4,'网站描述','WEB_SITE_DESCRIPTION','',1,'0','','网站搜索引擎描述',1378898976,1379235841,4,1),(5,'网站关键字','WEB_SITE_KEYWORD','',1,'0','','网站搜索引擎关键字',1378898976,1381390100,5,1),(6,'版权信息','WEB_SITE_COPYRIGHT','',1,'0','','设置在网站底部显示的版权信息，如“版权所有 (c) 2014-2015 科斯克网络科技”',1406991855,1406992583,6,1),(7,'网站备案号','WEB_SITE_ICP','',1,'0','','设置在网站底部显示的备案号，如“苏ICP备1502009号\"',1378900335,1415983236,9,1),(26,'微信二维码','WEB_SITE_WX','',1,'','','',0,0,0,1),(32,'注册开关','close_reg','1',3,'','0:关闭1:开启','关闭注册功能说明',0,0,12,1),(33,'交易开关','close_trading','1',3,'','0:关闭1:开启','交易暂时关闭，16:00后开启',0,0,13,0),(41,'实时价格每分钟增长','growem','',2,'','','',0,0,12,1),(44,'奖励开关','regjifen','0',1,'0','','',1407003397,1407004692,3,1);
/*!40000 ALTER TABLE `ysk_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_ewm`
--

DROP TABLE IF EXISTS `ysk_ewm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_ewm` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `ewm_class` int(11) NOT NULL COMMENT '二维码类型',
  `ewm_url` varchar(225) NOT NULL COMMENT '二维码地址',
  `ewm_price` float(10,2) NOT NULL COMMENT '二维码收款金额',
  `ewm_acc` varchar(225) NOT NULL COMMENT '二维码账号',
  `uaccount` varchar(225) NOT NULL COMMENT '用户账号',
  `uname` varchar(225) NOT NULL COMMENT '用户名',
  `addtime` varchar(225) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='二维码管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_ewm`
--

LOCK TABLES `ysk_ewm` WRITE;
/*!40000 ALTER TABLE `ysk_ewm` DISABLE KEYS */;
INSERT INTO `ysk_ewm` VALUES (12,1,1,'https://img.bukanba.com/ekcms/20190314/4bb33167808b07dd.png',300.00,'13666666666','13888888888','九星耀世','1552575525'),(11,1,1,'https://img.bukanba.com/ekcms/20190314/8f13a2f8a8407179.png',200.00,'13888888888','13888888888','九星耀世','1552575497'),(3,1,2,'https://img.bukanba.com/ekcms/20190309/4bb33167808b07dd.png',100000.00,'13888888888','13888888888','九星耀世','1552123575'),(4,1,1,'https://img.bukanba.com/ekcms/20190309/8f13a2f8a8407179.png',100.00,'13888888888','13888888888','九星耀世','1552123658'),(10,1,3,'https://img.bukanba.com/ekcms/20190309/6e605d96720537d7.jpg',898989.00,'13333333333','13888888888','九星耀世','1552129995'),(6,1,2,'https://img.bukanba.com/ekcms/20190309/52ad2222f9ef7f43.png',5000.00,'13888888888','13888888888','九星耀世','1552123819'),(13,6,1,'https://img.bukanba.com/ekcms/20190314/4bb33167808b07dd.png',100.00,'13222222222','13222222222','小三','1552578045'),(14,6,1,'https://img.bukanba.com/ekcms/20190314/52ad2222f9ef7f43.png',200.00,'13222222222','13222222222','小三','1552578063'),(15,6,1,'https://img.bukanba.com/ekcms/20190314/8f13a2f8a8407179.png',300.00,'13222222222','13222222222','小三','1552578082'),(16,6,1,'https://img.bukanba.com/ekcms/20190314/8f13a2f8a8407179.png',500.00,'13222222222','13222222222','小三','1552578096'),(17,6,1,'https://img.bukanba.com/ekcms/20190314/52ad2222f9ef7f43.png',1000.00,'13222222222','13222222222','小三','1552578112'),(18,6,2,'https://img.bukanba.com/ekcms/20190314/8f13a2f8a8407179.png',100.00,'13222222222','13222222222','小三','1552578128'),(19,6,2,'https://img.bukanba.com/ekcms/20190314/4bb33167808b07dd.png',200.00,'13222222222','13222222222','小三','1552578150'),(20,6,3,'https://img.bukanba.com/ekcms/20190314/4bb33167808b07dd.png',100.00,'13222222222','13222222222','小三','1552578169'),(21,5,1,'https://img.bukanba.com/ekcms/20190320/63a825c894bcfee8.png',100.00,'1','13333333333','小四','1553021888'),(23,5,1,'https://img.bukanba.com/ekcms/20190320/0fb233d0f8414665.png',200.00,'123456','13333333333','小四','1553023345'),(24,7,1,'https://img.bukanba.com/ekcms/20190320/63a825c894bcfee8.png',100.00,'111','15936999999','laoshiren','1553025599'),(33,8,1,'https://img.bukanba.com/ekcms/20190323/fe2e9c4ba4f3f343.png',1000.00,'1','14725836999','laoshiren1','1553277306'),(32,8,1,'https://img.bukanba.com/ekcms/20190323/fe2e9c4ba4f3f343.png',6600.00,'123','14725836999','laoshiren1','1553277245'),(28,3,1,'https://img.bukanba.com/ekcms/20190323/f08e688a2f9fb771.gif',20.00,'123456','13777777777','小七','1553275727');
/*!40000 ALTER TABLE `ysk_ewm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_group`
--

DROP TABLE IF EXISTS `ysk_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级部门ID',
  `title` varchar(31) NOT NULL DEFAULT '' COMMENT '部门名称',
  `icon` varchar(31) NOT NULL DEFAULT '' COMMENT '图标',
  `menu_auth` text NOT NULL COMMENT '权限列表',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `auth_id` int(11) DEFAULT NULL,
  `hylb` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_group`
--

LOCK TABLES `ysk_group` WRITE;
/*!40000 ALTER TABLE `ysk_group` DISABLE KEYS */;
INSERT INTO `ysk_group` VALUES (1,0,'超级管理员','','',1426881003,1427552428,0,1,1,'0'),(2,0,'财务查看','','1,7,8,9,337,10,11,316,341,340,344,324,342,322,338,3,323,347',1498324367,1551095515,0,0,2,'5'),(7,0,'超级管理','','1,3,4,6,327,7,8,9,316,318,322,323',1526152893,1528963727,0,-1,0,''),(8,0,'数据管理','','1,3,4,327,7,8,10,11,315,324,325,334,329,328',1527085184,1527140823,0,-1,0,'0');
/*!40000 ALTER TABLE `ysk_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_menu`
--

DROP TABLE IF EXISTS `ysk_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `pid` int(11) NOT NULL COMMENT '父级id',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '爷爷ID、',
  `col` varchar(30) NOT NULL COMMENT '控制器',
  `act` varchar(30) NOT NULL COMMENT '方法',
  `patch` varchar(50) DEFAULT NULL COMMENT '全路径',
  `level` int(11) NOT NULL COMMENT '级别',
  `icon` varchar(50) DEFAULT NULL,
  `sort` char(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=360 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_menu`
--

LOCK TABLES `ysk_menu` WRITE;
/*!40000 ALTER TABLE `ysk_menu` DISABLE KEYS */;
INSERT INTO `ysk_menu` VALUES (327,'数据库管理',3,1,'Database','index','',2,'fa fa-lock','14',1),(323,'系统公告',3,1,'News','index','',2,'fa-twitter-square','51',1),(356,'交易成功列表',352,1,'Roborder','ordersucc','',2,'fa-file-text','41',1),(355,'匹配成功列表',352,1,'Roborder','robsucc','',2,'fa-file-text','40',1),(354,'会员抢单列表',352,1,'Roborder','userrob','',2,'fa-file-text','39',1),(1,'系统',0,0,'','','',0,'fa-cog','0',1),(9,'推荐结构',7,1,'Tree','index','',2,'fa-th-large','22',1),(8,'会员列表',7,1,'User','index','',2,'fa-user','21',1),(7,'会员管理',1,1,'','','',1,'fa-folder-open-o','1',1),(5,'角色管理',3,1,'Group','index','',2,'fa-sitemap','12',1),(3,'统用功能',1,1,'','','',1,'fa-folder-open-o','3',1),(352,'抢单管理',1,1,'','','',1,'fa-folder-open-o','2',1),(353,'发布订单列表',352,1,'Roborder','index','',2,'fa-user','38',1),(357,'游戏参数设置',352,1,'Roborder','asystem','',2,'fa-file-text','43',1),(351,'银行卡管理',7,1,'User','bankcard','',2,'fa-file-text','37',1),(350,'二维码管理',7,1,'User','ewm','',2,'fa-file-text','36',1),(349,'提现管理',7,1,'User','withdraw','',2,'fa-file-text','35',1),(348,'充值管理',7,1,'User','recharge','',2,'fa-file-text','34',1),(358,'收款二维码管理',3,1,'Roborder','skewm','',2,'fa-twitter-square','42',0),(359,'资金流水',7,1,'User','bill','',2,'fa-file-text','43',1);
/*!40000 ALTER TABLE `ysk_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_news`
--

DROP TABLE IF EXISTS `ysk_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '文章图片',
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_out` tinyint(4) NOT NULL DEFAULT '0',
  `content` text NOT NULL COMMENT '内容',
  `from` varchar(255) NOT NULL DEFAULT '' COMMENT '文章来源',
  `visit` smallint(6) NOT NULL DEFAULT '0',
  `lang` tinyint(4) NOT NULL DEFAULT '0',
  `tuijian` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_news`
--

LOCK TABLES `ysk_news` WRITE;
/*!40000 ALTER TABLE `ysk_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_notice`
--

DROP TABLE IF EXISTS `ysk_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_tittle` varchar(80) NOT NULL COMMENT '公告标题',
  `notice_content` varchar(600) NOT NULL COMMENT '公告详情',
  `notice_addtime` varchar(20) NOT NULL COMMENT '公告添加时间',
  `notice_read` text NOT NULL COMMENT '看过公告会员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_notice`
--

LOCK TABLES `ysk_notice` WRITE;
/*!40000 ALTER TABLE `ysk_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_qrcode`
--

DROP TABLE IF EXISTS `ysk_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_qrcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `uname` varchar(225) NOT NULL COMMENT '会员名称',
  `code_class` int(2) NOT NULL COMMENT '二维码类型1支付宝2微信3银行卡',
  `code_url` varchar(225) NOT NULL COMMENT '二维码图片地址',
  `uaccount` varchar(225) NOT NULL COMMENT '会员账号',
  `code_acc` varchar(225) NOT NULL COMMENT '二维码账号，如支付宝账号',
  `addtime` varchar(225) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='二维码管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_qrcode`
--

LOCK TABLES `ysk_qrcode` WRITE;
/*!40000 ALTER TABLE `ysk_qrcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_recharge`
--

DROP TABLE IF EXISTS `ysk_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `account` varchar(225) NOT NULL COMMENT '会员账号',
  `name` varchar(225) NOT NULL COMMENT '姓名',
  `price` float(10,2) NOT NULL COMMENT '充值金额',
  `way` int(11) NOT NULL COMMENT '充值方式：1支付宝2微信3银行卡',
  `addtime` varchar(225) NOT NULL COMMENT '充值日期',
  `status` int(11) NOT NULL COMMENT '充值状态1提交，2退回，3成功',
  `marker` varchar(225) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='会员充值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_recharge`
--

LOCK TABLES `ysk_recharge` WRITE;
/*!40000 ALTER TABLE `ysk_recharge` DISABLE KEYS */;
INSERT INTO `ysk_recharge` VALUES (2,1,'13888888888','张学友',2000.00,2,'1552036575',3,'123456'),(3,1,'13888888888','张学友',3000.00,3,'1552036603',3,'123456'),(4,1,'13888888888','孙悟空',5000.00,1,'1552116267',3,'2323'),(9,6,'13222222222','小三子',100.00,2,'1552578253',3,''),(8,6,'13222222222','小三子',10000.00,1,'1552578224',3,''),(6,1,'13888888888','小猪',6000.00,2,'1552116626',3,'2313223'),(7,1,'13888888888','小沙',9000.00,3,'1552117027',3,'123456'),(10,5,'13333333333','13333333333',10000.00,3,'1553022448',3,'10000'),(11,7,'15936999999','123',10000.00,3,'1553025546',3,'111'),(12,7,'13888888888','123456',10000.00,3,'1553078844',3,'111'),(13,8,'14725836999','111',10000.00,3,'1553079229',3,'10'),(14,3,'13777777777','阿萨德',100000.00,3,'1553274235',3,'撒旦');
/*!40000 ALTER TABLE `ysk_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_roborder`
--

DROP TABLE IF EXISTS `ysk_roborder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_roborder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `class` int(2) NOT NULL COMMENT '收款类型',
  `price` float(10,2) NOT NULL COMMENT '收款金额',
  `addtime` varchar(225) NOT NULL COMMENT '添加时间',
  `status` int(2) NOT NULL COMMENT '订单状态',
  `uid` int(11) NOT NULL COMMENT '匹配用户ID',
  `uname` varchar(225) NOT NULL COMMENT '匹配用户名称',
  `umoney` float(10,2) NOT NULL COMMENT '匹配用户余额',
  `pipeitime` varchar(225) NOT NULL COMMENT '匹配时间',
  `finishtime` varchar(225) NOT NULL COMMENT '完成时间',
  `ordernum` varchar(225) NOT NULL COMMENT '订单号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='抢单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_roborder`
--

LOCK TABLES `ysk_roborder` WRITE;
/*!40000 ALTER TABLE `ysk_roborder` DISABLE KEYS */;
INSERT INTO `ysk_roborder` VALUES (17,1,1000.00,'1552568470',3,6,'小三子',20200.00,'1552578995','1552579076','N684134772211'),(16,1,400.00,'1552568463',1,0,'',0.00,'','','N315763152251'),(15,1,300.00,'1552568455',3,1,'ecolee',8723.00,'1552576434','1552577228','N559784444438'),(23,1,100.00,'1552568947',3,1,'ecolee',8862.00,'1552569219','1552571384','N788867003859'),(13,1,200.00,'1552568428',3,6,'小三子',19510.00,'1552579204','1552579224','N687737383241'),(18,2,1000.00,'1552568482',1,0,'',0.00,'','','N753542087095'),(19,2,100.00,'1552568494',1,0,'',0.00,'','','N801289227537'),(20,2,300.00,'1552568517',1,0,'',0.00,'','','N954565390474'),(21,2,500.00,'1552568527',1,0,'',0.00,'','','N782004170512'),(24,2,100.00,'1552568955',3,6,'小三子',19162.00,'1552580505','1552580527','N337086662806'),(22,1,100.00,'1552568940',3,1,'ecolee',8931.00,'1552568979','1552569150','N590250994747'),(27,1,100.00,'1552576307',3,1,'ecolee',8793.00,'1552576307','1552576415','N798089240081'),(28,1,100.00,'1552579510',3,6,'小三子',19372.00,'1552579510','1552579527','N512031793192'),(29,1,100.00,'1552580130',3,6,'小三子',19302.00,'1552580130','1552580141','N732729092750'),(30,1,100.00,'1552580275',3,6,'小三子',19232.00,'1552580275','1552580286','N615284252013'),(31,1,100.00,'1552580621',3,6,'小三子',19083.00,'1552583787','1552584254','N057622398659'),(32,1,100.00,'1552588114',2,1,'ecolee',22516.00,'1552588114','','N430326561877'),(33,1,100.00,'1552588117',2,6,'小三子',19014.00,'1552588117','','N415249724932'),(34,1,100.00,'1553023006',3,5,'老实人',10051.40,'1553023006','1553023048','N501069079510'),(35,1,100.00,'1553023174',3,5,'老实人',9981.40,'1553023174','1553023183','N940326607216'),(36,1,100.00,'1553023258',3,5,'老实人',9911.40,'1553023258','1553023267','N541774684817'),(37,1,100.00,'1553023372',3,5,'老实人',9813.40,'1553023372','1553023574','N714303226046'),(38,1,1000.00,'1553023542',2,8,'laoshiren',9408.20,'1553277315','','N734267606382'),(39,1,2000.00,'1553023542',1,0,'',0.00,'','','N734267606382'),(40,1,2000.00,'1553023542',1,0,'',0.00,'','','N734267606382'),(41,1,2000.00,'1553023542',1,0,'',0.00,'','','N734267606382'),(42,1,2000.00,'1553023542',3,3,'QWE',100048.32,'1553274343','1553274457','N734267606382'),(43,1,200.00,'1553023639',3,5,'老实人',9521.40,'1553024230','1553024260','N157589915983'),(44,1,200.00,'1553023639',3,5,'老实人',9715.40,'1553023744','1553023765','N157589915983'),(46,1,600.00,'1553023664',1,0,'',0.00,'','','N059831690294'),(47,1,100.00,'1553024414',3,5,'老实人',9763.40,'1553024414','1553024432','N575047187672'),(48,1,100.00,'1553024722',3,5,'老实人',9693.40,'1553024722','1553024730','N265725369633'),(49,1,100.00,'1553025086',3,5,'老实人',9696.40,'1553025086','1553025100','N334756953356'),(50,1,100.00,'1553025701',3,7,'159',10000.00,'1553025701','1553025710','N230369309681'),(51,1,100.00,'1553025858',3,7,'159',9913.00,'1553025858','1553025866','N752551819731'),(52,1,100.00,'1553079076',3,7,'159',19826.00,'1553079076','1553079104','N981863965027'),(53,1,100.00,'1553079347',3,8,'laoshiren',10000.00,'1553079347','1553079355','N840806303538'),(54,1,100.00,'1553079716',3,8,'laoshiren',9802.00,'1553273563','1553274725','N956577536930'),(55,1,100.00,'1553079733',3,8,'laoshiren',9901.00,'1553079733','1553079740','N332459254645'),(57,1,200.00,'1553275788',2,3,'QWE',98094.32,'1553275788','','N176563257949'),(58,1,100.00,'1553277046',3,8,'laoshiren',9704.30,'1553277046','1553277060','N424416080420'),(59,1,100.00,'1553277075',3,8,'laoshiren',9605.60,'1553277075','1553277085','N633069468348'),(60,1,100.00,'1553277103',3,8,'laoshiren',9506.90,'1553277103','1553277117','N478648876560'),(61,1,6500.00,'1553277196',2,8,'laoshiren',9408.20,'1553277196','','N972048899070'),(62,1,20.00,'1553277663',2,3,'QWE',98094.32,'1553277663','','N976702068181');
/*!40000 ALTER TABLE `ysk_roborder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_skm`
--

DROP TABLE IF EXISTS `ysk_skm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_skm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wxewm` varchar(225) NOT NULL,
  `zfbewm` varchar(225) NOT NULL,
  `bankewm` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='收款码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_skm`
--

LOCK TABLES `ysk_skm` WRITE;
/*!40000 ALTER TABLE `ysk_skm` DISABLE KEYS */;
INSERT INTO `ysk_skm` VALUES (1,'2019pay/2019-03-20/5c911c22156dc.png','2019pay/2019-03-20/5c911c22188b8.png','2019pay/2019-03-20/5c911c221b2c7.png');
/*!40000 ALTER TABLE `ysk_skm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_somebill`
--

DROP TABLE IF EXISTS `ysk_somebill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_somebill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `jl_class` int(11) NOT NULL COMMENT '流水类别：1佣金2团队奖励3充值4提现5订单匹配',
  `info` varchar(225) NOT NULL COMMENT '说明',
  `addtime` varchar(225) NOT NULL COMMENT '事件时间',
  `jc_class` varchar(225) NOT NULL COMMENT '分+ 或-',
  `num` float(10,2) NOT NULL COMMENT '币量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='会员流水账单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_somebill`
--

LOCK TABLES `ysk_somebill` WRITE;
/*!40000 ALTER TABLE `ysk_somebill` DISABLE KEYS */;
INSERT INTO `ysk_somebill` VALUES (31,6,5,'微信抢单本金','1552580286','-',100.00),(32,6,1,'微信抢单佣金','1552580286','+',30.00),(33,5,1,'直推抢单成功佣金','1552580286','+',3.00),(34,4,1,'二代抢单成功佣金','1552580286','+',1.50),(35,3,1,'三代抢单成功佣金','1552580286','+',0.90),(36,6,5,'支付宝抢单本金','1552580527','-',100.00),(37,6,1,'支付宝抢单佣金','1552580527','+',21.00),(38,5,1,'直推抢单成功佣金','1552580527','+',2.10),(41,6,5,'微信抢单本金','1552584254','-',100.00),(42,6,1,'微信抢单佣金','1552584254','+',31.00),(43,5,1,'直推抢单成功佣金','1552584254','+',3.10),(44,4,1,'二代抢单成功佣金','1552584254','+',1.55),(46,5,5,'微信抢单本金','1553023048','-',100.00),(47,5,1,'微信抢单佣金','1553023048','+',30.00),(48,4,1,'直推抢单成功佣金','1553023048','+',3.00),(49,3,1,'二代抢单成功佣金','1553023048','+',1.50),(50,1,1,'三代抢单成功佣金','1553023048','+',0.90),(51,5,5,'微信抢单本金','1553023183','-',100.00),(52,5,1,'微信抢单佣金','1553023183','+',30.00),(53,4,1,'直推抢单成功佣金','1553023183','+',3.00),(54,3,1,'二代抢单成功佣金','1553023183','+',1.50),(55,1,1,'三代抢单成功佣金','1553023183','+',0.90),(56,5,5,'微信抢单本金','1553023267','-',100.00),(57,5,1,'微信抢单佣金','1553023267','+',2.00),(58,4,1,'直推抢单成功佣金','1553023267','+',0.20),(59,3,1,'二代抢单成功佣金','1553023267','+',0.10),(60,1,1,'三代抢单成功佣金','1553023267','+',0.06),(61,5,5,'微信抢单本金','1553023574','-',100.00),(62,5,1,'微信抢单佣金','1553023574','+',2.00),(63,4,1,'直推抢单成功佣金','1553023574','+',0.20),(64,3,1,'二代抢单成功佣金','1553023574','+',0.10),(65,1,1,'三代抢单成功佣金','1553023574','+',0.06),(66,5,5,'微信抢单本金','1553023765','-',200.00),(67,5,1,'微信抢单佣金','1553023765','+',6.00),(68,4,1,'直推抢单成功佣金','1553023765','+',0.60),(69,3,1,'二代抢单成功佣金','1553023765','+',0.30),(70,1,1,'三代抢单成功佣金','1553023765','+',0.18),(71,5,5,'微信抢单本金','1553024260','-',200.00),(72,5,1,'微信抢单佣金','1553024260','+',442.00),(73,4,1,'直推抢单成功佣金','1553024260','+',44.20),(74,3,1,'二代抢单成功佣金','1553024260','+',22.10),(75,1,1,'三代抢单成功佣金','1553024260','+',13.26),(76,5,5,'微信抢单本金','1553024432','-',100.00),(77,5,1,'微信抢单佣金','1553024432','+',30.00),(78,4,1,'直推抢单成功佣金','1553024432','+',3.00),(79,3,1,'二代抢单成功佣金','1553024432','+',1.50),(80,1,1,'三代抢单成功佣金','1553024432','+',0.90),(81,5,5,'微信抢单本金','1553024730','-',100.00),(82,5,1,'微信抢单佣金','1553024730','+',103.00),(83,4,1,'直推抢单成功佣金','1553024730','+',10.30),(84,3,1,'二代抢单成功佣金','1553024730','+',5.15),(85,1,1,'三代抢单成功佣金','1553024730','+',3.09),(86,5,5,'微信抢单本金','1553025100','-',100.00),(87,5,1,'微信抢单佣金','1553025100','+',13.00),(88,4,1,'直推抢单成功佣金','1553025100','+',1.30),(89,3,1,'二代抢单成功佣金','1553025100','+',0.65),(90,1,1,'三代抢单成功佣金','1553025100','+',0.39),(91,7,5,'微信抢单本金','1553025710','-',100.00),(92,7,1,'微信抢单佣金','1553025710','+',13.00),(93,1,1,'直推抢单成功佣金','1553025710','+',1.30),(94,7,5,'微信抢单本金','1553025866','-',100.00),(95,7,1,'微信抢单佣金','1553025866','+',13.00),(96,1,1,'直推抢单成功佣金','1553025866','+',1.30),(97,7,5,'微信抢单本金','1553079104','-',100.00),(98,7,1,'微信抢单佣金','1553079104','+',13.00),(99,1,1,'直推抢单成功佣金','1553079104','+',1.30),(100,8,5,'微信抢单本金','1553079355','-',100.00),(101,8,1,'微信抢单佣金','1553079355','+',1.00),(102,7,1,'直推抢单成功佣金','1553079355','+',0.10),(103,1,1,'二代抢单成功佣金','1553079355','+',0.05),(104,8,5,'微信抢单本金','1553079740','-',100.00),(105,8,1,'微信抢单佣金','1553079740','+',1.00),(106,7,1,'直推抢单成功佣金','1553079740','+',0.10),(107,1,1,'二代抢单成功佣金','1553079740','+',0.05),(108,3,5,'微信抢单本金','1553274457','-',2000.00),(109,3,1,'微信抢单佣金','1553274457','+',46.00),(110,1,1,'直推抢单成功佣金','1553274457','+',4.60),(111,8,5,'微信抢单本金','1553274725','-',100.00),(112,8,1,'微信抢单佣金','1553274725','+',2.30),(113,7,1,'直推抢单成功佣金','1553274725','+',0.23),(114,1,1,'二代抢单成功佣金','1553274725','+',0.12),(115,8,5,'微信抢单本金','1553277060','-',100.00),(116,8,1,'微信抢单佣金','1553277060','+',1.30),(117,7,1,'直推抢单成功佣金','1553277060','+',0.13),(118,1,1,'二代抢单成功佣金','1553277061','+',0.06),(119,8,5,'微信抢单本金','1553277085','-',100.00),(120,8,1,'微信抢单佣金','1553277085','+',1.30),(121,7,1,'直推抢单成功佣金','1553277085','+',0.13),(122,1,1,'二代抢单成功佣金','1553277085','+',0.06),(123,8,5,'微信抢单本金','1553277117','-',100.00),(124,8,1,'微信抢单佣金','1553277117','+',1.30),(125,7,1,'直推抢单成功佣金','1553277117','+',0.13),(126,1,1,'二代抢单成功佣金','1553277117','+',0.06);
/*!40000 ALTER TABLE `ysk_somebill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_store`
--

DROP TABLE IF EXISTS `ysk_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_store` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `cangku_num` decimal(13,5) NOT NULL DEFAULT '0.00000' COMMENT '钱包余额',
  `fengmi_num` decimal(13,5) NOT NULL DEFAULT '0.00000' COMMENT '积分',
  `plant_num` decimal(13,4) NOT NULL DEFAULT '0.0000' COMMENT '播种总数',
  `huafei_total` decimal(13,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '施肥累计',
  `vip_grade` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_store`
--

LOCK TABLES `ysk_store` WRITE;
/*!40000 ALTER TABLE `ysk_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_system`
--

DROP TABLE IF EXISTS `ysk_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_system` (
  `id` int(2) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `qd_cf` int(11) NOT NULL COMMENT '抢单余额比列',
  `qd_nd` varchar(225) NOT NULL COMMENT '抢单难度，数组(0.1,0.2,0.3)',
  `qd_wxyj` float(10,3) NOT NULL COMMENT '微信抢单佣金30%填0.3',
  `qd_zfbyj` float(10,3) NOT NULL COMMENT '支付宝抢单佣金30%填0.3',
  `qd_bkyj` float(10,3) NOT NULL COMMENT '银行卡抢单佣金30%填0.3',
  `qd_ndtime` varchar(225) NOT NULL COMMENT '增加难度时间点',
  `qd_yjjc` varchar(12) NOT NULL COMMENT '佣金加成',
  `qd_minmoney` float NOT NULL COMMENT '抢单最低额度',
  `min_recharge` float(10,3) NOT NULL COMMENT '最低充值额度',
  `mix_withdraw` float(10,3) NOT NULL COMMENT '最小提现额度',
  `max_withdraw` float(10,3) NOT NULL COMMENT '最大提现额度',
  `tx_yeb` float NOT NULL COMMENT '提现要求：收款与余额比例 ',
  `team_oneyj` float(10,3) NOT NULL COMMENT '1代佣金比例30%写0.3',
  `team_twoyj` float(10,3) NOT NULL COMMENT '2代佣金比例30%写0.3',
  `team_threeyj` float(10,2) NOT NULL COMMENT '3代佣金比例30%写0.3',
  `cz_yh` varchar(255) NOT NULL,
  `cz_xm` varchar(255) NOT NULL,
  `cz_kh` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='游戏参数设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_system`
--

LOCK TABLES `ysk_system` WRITE;
/*!40000 ALTER TABLE `ysk_system` DISABLE KEYS */;
INSERT INTO `ysk_system` VALUES (1,70,'0.2',0.013,0.013,0.013,'','',100,100.000,100.000,100.000,70,0.100,0.050,0.05,'666','666','666');
/*!40000 ALTER TABLE `ysk_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_upload`
--

DROP TABLE IF EXISTS `ysk_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `url` varchar(255) DEFAULT NULL COMMENT '文件链接',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) DEFAULT NULL COMMENT '文件md5',
  `sha1` char(40) DEFAULT NULL COMMENT '文件sha1编码',
  `location` varchar(15) NOT NULL DEFAULT '' COMMENT '文件存储位置',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_upload`
--

LOCK TABLES `ysk_upload` WRITE;
/*!40000 ALTER TABLE `ysk_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `ysk_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_user`
--

DROP TABLE IF EXISTS `ysk_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_user` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL COMMENT '上级ID',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '上上级ID',
  `ggid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上上上级ID',
  `account` char(20) NOT NULL DEFAULT '0' COMMENT '用户账号',
  `mobile` char(20) NOT NULL COMMENT '用户手机号',
  `u_yqm` varchar(225) NOT NULL COMMENT '邀请码',
  `username` varchar(255) NOT NULL DEFAULT '',
  `login_pwd` varchar(225) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `login_salt` char(5) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `money` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户余额',
  `reg_date` int(11) NOT NULL COMMENT '注册时间',
  `reg_ip` varchar(20) NOT NULL COMMENT '注册IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户锁定  1 不锁  0拉黑  -1 删除',
  `activate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1-已激活 0-未激活',
  `session_id` varchar(225) DEFAULT NULL,
  `wx_no` varchar(225) DEFAULT NULL COMMENT '微信账号',
  `alipay` varchar(225) DEFAULT NULL COMMENT '支付宝',
  `truename` varchar(225) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(225) NOT NULL COMMENT '电子邮件',
  `userqq` varchar(32) NOT NULL COMMENT 'QQ',
  `usercard` varchar(32) NOT NULL COMMENT '身份证号码',
  `path` text,
  `use_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `u_ztnum` int(11) NOT NULL COMMENT '直推人数',
  `rz_st` int(1) NOT NULL COMMENT '资料完善状态，1OK2no',
  `tx_status` int(11) NOT NULL COMMENT '提现状态',
  `zsy` float(10,2) NOT NULL COMMENT '总收益',
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_user`
--

LOCK TABLES `ysk_user` WRITE;
/*!40000 ALTER TABLE `ysk_user` DISABLE KEYS */;
INSERT INTO `ysk_user` VALUES (1,0,0,0,'13888888888','13888888888','OKjl86re9E','2019-01-22 23:54:16','8afc14645ed885190bfbb0ce23334b6b','f0f',24544.64,1548172456,'1.192.80.97',1,1,'a7stv400qosol9fa8dtke5f714','ecolee','ecolee','ecolee','35256619@qq.com','35256619','123456789123456789','-8570-',1,2,1,1,0.00),(2,1,0,0,'13666666666','13666666666','UCraTwg835r5','小明','a79241f5b4e230240813e81a888a8a39','Bkdx',0.00,1551980908,'127.0.0.1',0,0,'k4i2u4c63mj7v3ij42dda8a0u6',NULL,NULL,NULL,'','','','-8570-1-',1,0,0,1,0.00),(3,1,0,0,'13777777777','13777777777','Jkuym2uHPyej','小七','0c08d9f98165cb5157eb644c67275218','CTTH',98094.32,1552577703,'127.0.0.1',1,0,'d09ospca81r7mcap682q9hp952','WEQ','QWE','QWE','QWE@QQ.COM','QWEQ','QWE','-8570-1-',1,1,1,1,2046.00),(4,3,1,0,'13555555555','13555555555','1BqHpBR6lc4l','2019-03-14 23:36:07','79aae23a0b232d5a48f3f9140b070d17','Yw1u',91.50,1552577767,'127.0.0.1',1,0,'cb1tfehntdlo0mvqaolp5b3gn4','','','','','','','-8570-1-3-',1,1,0,0,0.00),(5,4,3,1,'13333333333','13333333333','1FtxTV65S31s','小四','c4c07dfd3e30999f17839959cd083134','adtl',9609.40,1552577806,'127.0.0.1',1,0,'73c5ivm4k0ilbtovn37gnlsn67','123456','123456','老实人','lao@qq.com','123456','123456','-8570-1-3-4-',1,1,1,1,1758.00),(6,5,4,3,'13222222222','13222222222','I7ctYNAZxk7f','2019-03-14 23:38:01','e2485c9c189a892ed3fd64b1ab2952e5','rBQC',19014.00,1552577881,'127.0.0.1',1,0,'k4i2u4c63mj7v3ij42dda8a0u6','13222222222','13222222222','小三子','22222222@qq.com','22222222','987654321123456878','-8570-1-3-4-5-',1,0,1,1,131.00),(7,1,0,0,'15936999999','15936999999','JmPa399DZS7H','laoshiren','f44220582d4ea61f073acd133f3cfa48','Cx7b',19739.82,1553025464,'222.132.237.55',1,0,'k2pqf2jijva4cludg6fejkgno7','159159','159159','159','159@qq.com','159159','159159','-8570-1-',1,1,1,1,339.00),(8,7,1,0,'14725836999','14725836999','RDUgk4Z7VpGe','2019-03-20 18:52:42','1cdb56dcfdb16b591693be71843fa6db','xqib',9408.21,1553079162,'222.132.237.55',1,0,'ubme69odg0efhuh23bam27nct5','147258','147258','laoshiren','laoshiren1@qq.com','147258','147258','-8570-1-7-',1,0,1,1,608.20);
/*!40000 ALTER TABLE `ysk_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_userrob`
--

DROP TABLE IF EXISTS `ysk_userrob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_userrob` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `class` int(2) NOT NULL COMMENT '支付类别',
  `price` float(10,2) NOT NULL COMMENT '金额',
  `yjjc` float(10,2) NOT NULL COMMENT '佣金加成',
  `umoney` float(10,2) NOT NULL COMMENT '会员余额',
  `uaccount` varchar(225) NOT NULL COMMENT '会员账号',
  `uname` varchar(225) NOT NULL COMMENT '会员姓名',
  `ppid` int(11) NOT NULL COMMENT '匹配的ID号',
  `status` int(2) NOT NULL COMMENT '状态1等2匹配中3成功',
  `addtime` varchar(225) NOT NULL COMMENT '添加时间',
  `pipeitime` varchar(225) NOT NULL COMMENT '匹配成功时间',
  `finishtime` varchar(225) NOT NULL COMMENT '交易完成时间',
  `ordernum` varchar(225) NOT NULL COMMENT '订单号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='会员抢单表前台发起的';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_userrob`
--

LOCK TABLES `ysk_userrob` WRITE;
/*!40000 ALTER TABLE `ysk_userrob` DISABLE KEYS */;
INSERT INTO `ysk_userrob` VALUES (10,1,1,100.00,0.01,8862.00,'13888888888','ecolee',23,3,'1552569219','1552569219','1552571384','N672930618375'),(8,1,1,100.00,0.01,8931.00,'13888888888','ecolee',22,3,'1552568979','1552568979','1552569150','N767562952634'),(11,1,1,100.00,0.00,8793.00,'13888888888','ecolee',27,3,'1552571453','1552576307','1552576415','N798089240081'),(12,1,1,300.00,0.01,8723.00,'13888888888','ecolee',15,3,'1552576434','1552576434','1552577228','N320893204964'),(13,6,1,1000.00,0.01,20200.00,'13222222222','小三子',17,3,'1552578995','1552578995','1552579076','N009512186460'),(14,6,1,200.00,0.01,19510.00,'13222222222','小三子',13,3,'1552579204','1552579204','1552579224','N540875533013'),(15,6,1,100.00,0.00,19372.00,'13222222222','小三子',28,3,'1552579479','1552579510','1552579527','N512031793192'),(16,6,1,100.00,0.00,19302.00,'13222222222','小三子',29,3,'1552580122','1552580130','1552580141','N732729092750'),(17,6,1,100.00,0.00,19232.00,'13222222222','小三子',30,3,'1552580254','1552580275','1552580286','N615284252013'),(19,6,1,100.00,0.01,19083.00,'13222222222','小三子',31,3,'1552583787','1552583787','1552584254','N313619393409'),(20,6,1,100.00,0.00,19014.00,'13222222222','小三子',33,4,'1552587078','1552588117','','N415249724932'),(21,1,1,100.00,0.00,22516.00,'13888888888','ecolee',32,2,'1552587127','1552588114','','N430326561877'),(22,5,1,100.00,0.00,10051.40,'13333333333','老实人',34,3,'1553022970','1553023006','1553023048','N501069079510'),(23,5,1,100.00,0.00,9981.40,'13333333333','老实人',35,3,'1553023148','1553023174','1553023183','N940326607216'),(24,5,1,100.00,0.00,9911.40,'13333333333','老实人',36,3,'1553023251','1553023258','1553023267','N541774684817'),(25,5,1,100.00,0.00,9813.40,'13333333333','老实人',37,3,'1553023362','1553023372','1553023574','N714303226046'),(26,5,1,200.00,0.01,9715.40,'13333333333','老实人',44,3,'1553023744','1553023744','1553023765','N230006053547'),(27,5,1,200.00,0.01,9521.40,'13333333333','老实人',43,3,'1553024230','1553024230','1553024260','N975987200801'),(28,5,1,100.00,0.00,9763.40,'13333333333','老实人',47,3,'1553024409','1553024414','1553024432','N575047187672'),(29,5,1,100.00,0.00,9693.40,'13333333333','老实人',48,3,'1553024718','1553024722','1553024730','N265725369633'),(31,7,1,100.00,0.00,10000.00,'15936999999','159',50,3,'1553025694','1553025701','1553025710','N230369309681'),(32,7,1,100.00,0.00,9913.00,'15936999999','159',51,3,'1553025851','1553025858','1553025866','N752551819731'),(33,7,1,100.00,0.00,19826.00,'15936999999','159',52,3,'1553079070','1553079076','1553079104','N981863965027'),(34,8,1,100.00,0.00,10000.00,'14725836999','laoshiren',53,3,'1553079329','1553079347','1553079355','N840806303538'),(35,8,1,100.00,0.00,9901.00,'14725836999','laoshiren',55,3,'1553079709','1553079733','1553079740','N332459254645'),(36,8,1,100.00,0.01,9802.00,'14725836999','laoshiren',54,3,'1553273563','1553273563','1553274725','N930582893397'),(37,3,1,2000.00,0.01,100048.32,'13777777777','QWE',42,3,'1553274343','1553274343','1553274457','N670471036364'),(41,8,1,100.00,0.00,9605.60,'14725836999','laoshiren',59,3,'1553277068','1553277075','1553277085','N633069468348'),(42,8,1,100.00,0.00,9506.90,'14725836999','laoshiren',60,3,'1553277092','1553277103','1553277117','N478648876560'),(44,8,1,1000.00,0.00,9408.20,'14725836999','laoshiren',38,4,'1553277315','1553277315','','N793173919507'),(46,3,1,20.00,0.00,98094.32,'13777777777','QWE',62,4,'1553277647','1553277663','','N976702068181'),(47,3,1,0.00,0.00,98094.32,'13777777777','QWE',0,1,'1553277794','','','N926386449052');
/*!40000 ALTER TABLE `ysk_userrob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ysk_withdraw`
--

DROP TABLE IF EXISTS `ysk_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ysk_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `account` varchar(225) NOT NULL COMMENT '提现账号',
  `name` varchar(225) NOT NULL COMMENT '提现人姓名',
  `way` varchar(225) NOT NULL COMMENT '提现方式',
  `price` float(10,2) NOT NULL COMMENT '提现金额',
  `addtime` varchar(225) NOT NULL COMMENT '提现时间',
  `endtime` varchar(225) NOT NULL COMMENT '完成时间',
  `status` int(11) NOT NULL COMMENT '状态1提交，2退回3成功',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='提现申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ysk_withdraw`
--

LOCK TABLES `ysk_withdraw` WRITE;
/*!40000 ALTER TABLE `ysk_withdraw` DISABLE KEYS */;
INSERT INTO `ysk_withdraw` VALUES (1,1,'13888888888','张学友','支付宝',1000.00,'1552053596','',1),(2,1,'13888888888','张学友','微信',2000.00,'1552053688','',3),(3,1,'123456','孙悟空','支付宝',8888.00,'1552117731','',3),(4,1,'13689888888','小猪','微信',99999.00,'1552117861','',1);
/*!40000 ALTER TABLE `ysk_withdraw` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-27 16:04:53
