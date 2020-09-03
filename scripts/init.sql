/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 5.7.26 : Database - zeus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zeus` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `zeus`;

/*Table structure for table `casbin_rule` */

DROP TABLE IF EXISTS `casbin_rule`;

CREATE TABLE `casbin_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_type` varchar(255) NOT NULL DEFAULT '',
  `v0` varchar(255) NOT NULL DEFAULT '',
  `v1` varchar(255) NOT NULL DEFAULT '',
  `v2` varchar(255) NOT NULL DEFAULT '',
  `v3` varchar(255) NOT NULL DEFAULT '',
  `v4` varchar(255) NOT NULL DEFAULT '',
  `v5` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4;

/*Data for the table `casbin_rule` */

insert  into `casbin_rule`(`id`,`p_type`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`) values 
(13,'p','系统设置','/auth-system/menu:show','*','root','',''),
(14,'p','系统设置','/auth-system/menu:add','*','root','',''),
(15,'p','系统设置','/auth-system/menu:edit','*','root','',''),
(16,'p','系统设置','/auth-system/menu:del','*','root','',''),
(17,'p','系统设置','/auth-system/domain:show','*','root','',''),
(18,'p','系统设置','/auth-system/domain:add','*','root','',''),
(19,'p','系统设置','/auth-system/domain:edit','*','root','',''),
(20,'p','系统设置','/auth-system/domain:del','*','root','',''),
(21,'p','权限管理','/auth-system/menu:show','*','root','',''),
(22,'p','权限管理','/auth-system/menu:add','*','root','',''),
(23,'p','权限管理','/auth-system/menu:edit','*','root','',''),
(24,'p','权限管理','/auth-system/menu:del','*','root','',''),
(25,'p','权限管理','/auth-system/domain:show','*','root','',''),
(26,'p','权限管理','/auth-system/domain:add','*','root','',''),
(27,'p','权限管理','/auth-system/domain:edit','*','root','',''),
(28,'p','权限管理','/auth-system/domain:del','*','root','',''),
(29,'p','超级管理员','/permission/user:show','*','root','',''),
(30,'p','超级管理员','/permission/user:add','*','root','',''),
(31,'p','超级管理员','/permission/user:edit','*','root','',''),
(32,'p','超级管理员','/permission/user:del','*','root','',''),
(33,'p','超级管理员','/permission/dept:show','*','root','',''),
(34,'p','超级管理员','/permission/dept:add','*','root','',''),
(35,'p','超级管理员','/permission/dept:edit','*','root','',''),
(36,'p','超级管理员','/permission/dept:del','*','root','',''),
(37,'p','超级管理员','/permission/role:show','*','root','',''),
(38,'p','超级管理员','/permission/role:add','*','root','',''),
(39,'p','超级管理员','/permission/role:edit','*','root','',''),
(40,'p','超级管理员','/permission/role:del','*','root','',''),
(45,'p','超级管理员','/auth-system/domain:show','*','root','',''),
(46,'p','超级管理员','/auth-system/domain:add','*','root','',''),
(47,'p','超级管理员','/auth-system/domain:edit','*','root','',''),
(48,'p','超级管理员','/auth-system/domain:del','*','root','',''),
(66,'p','超级管理员','/auth-system/dataPerm:add','*','root','',''),
(67,'p','超级管理员','/auth-system/dataPerm:edit','*','root','',''),
(68,'p','超级管理员','/auth-system/dataPerm:del','*','root','',''),
(69,'p','超级管理员','/auth-system/dataPerm:show','*','root','',''),
(70,'g','2','超级管理员','','','',''),
(71,'g','1','超级管理员','','','',''),
(72,'p','超级管理员','/auth-system/menu:show','*','root','',''),
(73,'p','超级管理员','/auth-system/menu:add','*','root','',''),
(74,'p','超级管理员','/auth-system/menu:edit','*','root','',''),
(75,'p','超级管理员','/auth-system/menu:del','*','root','',''),
(76,'g','2','crawlnovel管理员','','','',''),
(83,'g','2','日志管理','','','',''),
(84,'p','日志管理','/logs/log_login:show','*','root','',''),
(85,'p','日志管理','/logs/log_login:add','*','root','',''),
(86,'p','日志管理','/logs/log_login:edit','*','root','',''),
(87,'p','日志管理','/logs/log_login:del','*','root','',''),
(88,'p','日志管理','/logs/log_operation:show','*','root','',''),
(89,'p','日志管理','/logs/log_operation:add','*','root','',''),
(90,'p','日志管理','/logs/log_operation:edit','*','root','',''),
(91,'p','日志管理','/logs/log_operation:del','*','root','',''),
(92,'p','超级管理员','/logs/log_login:show','*','root','',''),
(93,'p','超级管理员','/logs/log_login:add','*','root','',''),
(94,'p','超级管理员','/logs/log_login:edit','*','root','',''),
(95,'p','超级管理员','/logs/log_login:del','*','root','',''),
(97,'p','超级管理员','/logs/log_operation:add','*','root','',''),
(98,'p','超级管理员','/logs/log_operation:edit','*','root','',''),
(99,'p','超级管理员','/logs/log_operation:del','*','root','',''),
(100,'p','超级管理员','/v1/log/operations:get','*','root','',''),
(101,'p','超级管理员','/setting/auth:show','*','root','',''),
(102,'p','超级管理员','/setting/ldap:show','*','root','',''),
(103,'p','超级管理员','/setting/auth:sync','*','root','',''),
(104,'g','2','zeus配置中心','','','',''),
(105,'p','zeus配置中心','/configlist/list','*','zeus-config','','');

/*Table structure for table `data_perm` */

DROP TABLE IF EXISTS `data_perm`;

CREATE TABLE `data_perm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '项目域id',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '菜单ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `perms` varchar(100) NOT NULL DEFAULT '' COMMENT '数据权限标识',
  `perms_rule` varchar(500) NOT NULL DEFAULT '' COMMENT '数据规则',
  `perms_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1=分类 2=数据权限',
  `order_num` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remarks` varchar(500) NOT NULL DEFAULT '' COMMENT '说明',
  PRIMARY KEY (`id`),
  KEY `idx_data_perm_domain_id` (`domain_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='数据权限管理';

/*Data for the table `data_perm` */

insert  into `data_perm`(`id`,`domain_id`,`parent_id`,`name`,`perms`,`perms_rule`,`perms_type`,`order_num`,`create_time`,`update_time`,`remarks`) values 
(1,1,0,'test','','',1,1,'2019-10-08 09:54:20','2019-10-08 09:54:20',''),
(2,1,0,'test','','',1,1,'2019-10-08 09:54:23','2019-10-08 09:54:23','');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级部门id',
  `order_num` int(11) DEFAULT '1' COMMENT '排序',
  `extend_field` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展字段',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='组织架构表';

/*Data for the table `department` */

insert  into `department`(`id`,`name`,`parent_id`,`order_num`,`extend_field`,`create_time`,`update_time`) values 
(1,'公牛开源联盟',0,0,'{\"Id\":1,\"Name\":\"公牛开源联盟\",\"ParentId\":0,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(2,'人事部1',1,0,'{\"Id\":142415941,\"Name\":\"人事部\",\"ParentId\":1,\"Children\":null}','2019-11-06 00:18:44','2019-12-06 20:44:07'),
(3,'商务部',1,0,'{\"Id\":142520460,\"Name\":\"商务部\",\"ParentId\":1,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(4,'运营部',1,0,'{\"Id\":142522511,\"Name\":\"运营部\",\"ParentId\":1,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(5,'市场部',1,0,'{\"Id\":142567183,\"Name\":\"市场部\",\"ParentId\":1,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(6,'法务部',1,0,'{\"Id\":142575192,\"Name\":\"法务部\",\"ParentId\":1,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(7,'财务部',1,0,'{\"Id\":142601103,\"Name\":\"财务部\",\"ParentId\":1,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(8,'总经办',1,0,'{\"Id\":142611064,\"Name\":\"总经办\",\"ParentId\":1,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(9,'技术部',1,0,'{\"Id\":142620036,\"Name\":\"技术部\",\"ParentId\":1,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(10,'前端',9,0,'{\"Id\":139519414,\"Name\":\"前端\",\"ParentId\":142620036,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(11,'后端',9,0,'{\"Id\":142341752,\"Name\":\"后端\",\"ParentId\":142620036,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(12,'运维',9,0,'{\"Id\":142496071,\"Name\":\"运维\",\"ParentId\":142620036,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(13,'UI设计',9,0,'{\"Id\":142496629,\"Name\":\"UI设计\",\"ParentId\":142620036,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(14,'客户端',9,0,'{\"Id\":142515400,\"Name\":\"客户端\",\"ParentId\":142620036,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(15,'产品',9,0,'{\"Id\":142540419,\"Name\":\"产品\",\"ParentId\":142620036,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44'),
(16,'测试',9,0,'{\"Id\":142562183,\"Name\":\"测试\",\"ParentId\":142620036,\"Children\":null}','2019-11-06 00:18:44','2019-11-06 00:18:44');

/*Table structure for table `domain` */

DROP TABLE IF EXISTS `domain`;

CREATE TABLE `domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `callbackurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '回调链接',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '说明',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标识',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目域表';

/*Data for the table `domain` */

insert  into `domain`(`id`,`name`,`callbackurl`,`remark`,`code`,`create_time`,`last_update_time`) values 
(1,' 权限中心','http://admin.bullteam.cn',' 管理所有后台项目的菜单，权限，鉴权等','root','2019-09-30 11:38:15','2019-09-30 14:22:51'),
(2,'crawlnovel小说','http://crawlnovel.bullteam.cn/admin','此项目用来测试','crawlnovel','2019-09-30 11:44:00','2019-10-17 00:01:30'),
(3,'配置中心(demo)','http://zeus-admin-config.bullteam.cn','配置中心(demo)','zeus-config','2019-11-23 21:18:20','2019-11-23 21:18:20');

/*Table structure for table `login_log` */

DROP TABLE IF EXISTS `login_log`;

CREATE TABLE `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '登录用户',
  `client` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录终端型号',
  `platform` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录系统',
  `login_result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作信息',
  `login_status` tinyint(1) DEFAULT NULL COMMENT '1 成功 0失败',
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip',
  `ip_location` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip地理位置',
  `operation_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `operation_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='登录日志';

/*Data for the table `login_log` */

insert  into `login_log`(`id`,`user_id`,`client`,`platform`,`login_result`,`login_status`,`login_time`,`ip`,`ip_location`,`operation_time`,`operation_content`,`create_time`,`last_update_time`) values 
(1,2,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36','Standard Login','Standard Login Success',1,'2019-11-23 21:16:51','124.15.122.53','','2019-11-23 21:16:51','POST /v1/users/login','2019-11-23 21:16:51','2019-11-23 21:16:51'),
(2,2,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:70.0) Gecko/20100101 Firefox/70.0','Standard Login','Standard Login Success',1,'2019-11-23 23:12:55','27.209.123.0','','2019-11-23 23:12:55','POST /v1/users/login','2019-11-23 23:12:55','2019-11-23 23:12:55'),
(3,2,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','Standard Login','Standard Login Success',1,'2019-11-23 23:36:45','113.200.205.160','','2019-11-23 23:36:45','POST /v1/users/login','2019-11-23 23:36:45','2019-11-23 23:36:45'),
(4,2,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','Standard Login','Standard Login Success',1,'2019-11-24 09:06:40','111.193.7.65','','2019-11-24 09:06:40','POST /v1/users/login','2019-11-24 09:06:40','2019-11-24 09:06:40'),
(5,2,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','Standard Login','Standard Login Success',1,'2019-11-24 09:31:43','183.238.79.10','','2019-11-24 09:31:43','POST /v1/users/login','2019-11-24 09:31:43','2019-11-24 09:31:43'),
(6,2,'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','Standard Login','Standard Login Success',1,'2019-11-24 11:22:02','113.65.33.144','','2019-11-24 11:22:02','POST /v1/users/login','2019-11-24 11:22:02','2019-11-24 11:22:02'),
(7,2,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36','Standard Login','Standard Login Success',1,'2019-11-24 15:35:24','124.64.19.87','','2019-11-24 15:35:24','POST /v1/users/login','2019-11-24 15:35:24','2019-11-24 15:35:24'),
(8,2,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','Standard Login','Standard Login Success',1,'2019-12-06 19:46:56','218.19.46.219','','2019-12-06 19:46:56','POST /v1/users/login','2019-12-06 19:46:56','2019-12-06 19:46:56'),
(9,2,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','Standard Login','Standard Login Success',1,'2019-12-06 20:13:05','113.66.230.112','','2019-12-06 20:13:05','POST /v1/users/login','2019-12-06 20:13:05','2019-12-06 20:13:05'),
(10,2,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36','Standard Login','Standard Login Success',1,'2019-12-06 20:41:35','203.187.160.86','','2019-12-06 20:41:35','POST /v1/users/login','2019-12-06 20:41:35','2019-12-06 20:41:35'),
(11,2,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','Standard Login','Standard Login Success',1,'2019-12-06 22:30:44','180.174.182.126','','2019-12-06 22:30:44','POST /v1/users/login','2019-12-06 22:30:44','2019-12-06 22:30:44'),
(12,2,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','Standard Login','Standard Login Success',1,'2019-12-06 23:01:04','124.15.122.53','','2019-12-06 23:01:04','POST /v1/users/login','2019-12-06 23:01:04','2019-12-06 23:01:04');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `domain_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目域id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `url` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '路由url',
  `perms` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权标识',
  `alias` text COLLATE utf8mb4_unicode_ci,
  `menu_type` int(11) NOT NULL DEFAULT '0' COMMENT '类型 1=菜单 2=按钮',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_menu_domain_id` (`domain_id`) USING BTREE,
  KEY `perms_index` (`perms`(191))
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='菜单表';

/*Data for the table `menu` */

insert  into `menu`(`id`,`parent_id`,`domain_id`,`name`,`url`,`perms`,`alias`,`menu_type`,`icon`,`order_num`,`create_time`,`last_update_time`) values 
(1,0,1,'权限管理','/permission','','',1,'peoples',1,'2018-12-29 16:15:09','2019-03-20 13:01:46'),
(2,1,1,'用户管理','/permission/user','',NULL,1,'peoples',1,'2018-12-29 16:15:09','2018-12-29 16:15:09'),
(3,2,1,'浏览','','/permission/user:show','get@/v1/users,get@/v1/usres/:id,get@/v1/users/:id/roles',2,'',1,'2018-12-29 16:15:09','2018-12-29 16:15:09'),
(4,2,1,'添加','','/permission/user:add','post@/v1/users',2,'',2,'2018-12-29 16:15:09','2018-12-29 16:15:09'),
(5,2,1,'修改','','/permission/user:edit','put@/v1/users/:id,put@/v1/users/:id/status',2,'',3,'2018-12-29 16:15:09','2018-12-29 16:15:09'),
(6,2,1,'删除','','/permission/user:del','delete@/v1/users/:id',2,'',4,'2018-12-29 16:15:09','2018-12-29 16:15:09'),
(7,1,1,'部门管理','/permission/dept','',NULL,1,'peoples',2,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(8,7,1,'浏览','','/permission/dept:show','get@/v1/depts,get@/v1/depts/:id',2,'',1,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(9,7,1,'添加','','/permission/dept:add','post@/v1/depts',2,'',2,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(10,7,1,'修改','','/permission/dept:edit','put@/v1/depts/:id',2,'',3,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(11,7,1,'删除','','/permission/dept:del','delete@/v1/depts/:id',2,'',4,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(12,1,1,'角色管理','/permission/role','',NULL,1,'peoples',3,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(13,12,1,'浏览','','/permission/role:show','get@/v1/roles,get@/v1/roles/:id',2,'',1,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(14,12,1,'添加','','/permission/role:add','post@/v1/roles',2,'',2,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(15,12,1,'修改','','/permission/role:edit','put@/v1/roles/:id',2,'',3,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(16,12,1,'删除','','/permission/role:del','delete@/v1/roles/:id',2,'',4,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(17,0,1,'系统设置','/auth-system','',NULL,1,'nested',2,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(18,17,1,'菜单管理','/auth-system/menu','',NULL,1,'peoples',1,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(19,18,1,'浏览','','/auth-system/menu:show','get@/v1/menus,get@/v1/menus/:id',2,'',1,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(20,18,1,'添加','','/auth-system/menu:add','post@/v1/menus',2,'',2,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(21,18,1,'修改','','/auth-system/menu:edit','put@/v1/menus/:id',2,'',3,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(23,17,1,'项目管理','/auth-system/domain','',NULL,1,'peoples',2,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(24,23,1,'浏览','','/auth-system/domain:show','get@/v1/domains,get@/v1/domains/:id',2,'',1,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(25,23,1,'添加','','/auth-system/domain:add','post@/v1/domains',2,'',2,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(26,23,1,'修改','','/auth-system/domain:edit','put@/v1/domains/:id',2,'',3,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(27,23,1,'删除','','/auth-system/domain:del','delete@/v1/domains/:id',2,'',4,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(29,28,1,'登录日志','/logs/log_login','',NULL,1,'peoples',1,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(30,29,1,'浏览','','/logs/log_login:show',NULL,2,'',1,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(31,29,1,'添加','','/logs/log_login:add',NULL,2,'',2,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(32,29,1,'修改','','/logs/log_login:edit',NULL,2,'',3,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(33,29,1,'删除','','/logs/log_login:del',NULL,2,'',4,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(34,28,1,'操作日志','/logs/log_operation','',NULL,1,'peoples',2,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(35,34,1,'浏览','','/logs/log_operation:show',NULL,2,'',1,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(36,34,1,'添加','','/logs/log_operation:add',NULL,2,'',2,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(37,34,1,'修改','','/logs/log_operation:edit',NULL,2,'',3,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(38,34,1,'删除','','/logs/log_operation:del',NULL,2,'',4,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(39,28,1,'异常日志','/logs/log_error','',NULL,1,'peoples',3,'2018-12-29 16:15:12','2018-12-29 16:15:12'),
(40,39,1,'浏览','','/logs/log_error:show',NULL,2,'',1,'2018-12-29 16:15:12','2018-12-29 16:15:12'),
(41,39,1,'添加','','/logs/log_error:add',NULL,2,'',2,'2018-12-29 16:15:12','2018-12-29 16:15:12'),
(42,39,1,'修改','','/logs/log_error:edit',NULL,2,'',3,'2018-12-29 16:15:12','2018-12-29 16:15:12'),
(43,39,1,'删除','','/logs/log_error:del',NULL,2,'',4,'2018-12-29 16:15:12','2018-12-29 16:15:12'),
(66,0,0,'首页','admin/default','',NULL,1,'size',1,'2019-01-25 16:34:33','2019-01-25 16:34:33'),
(70,69,1,'编辑角色','','/permission/role:edit',NULL,1,'bug',1,'2019-01-28 10:46:42','2019-10-15 23:20:09'),
(71,17,1,'数据权限','/auth-system/dataPerm','',NULL,1,'component',1,'2019-07-08 10:53:55','2019-07-08 10:53:55'),
(72,71,1,'添加','','/auth-system/dataPerm:add','post@/v1/datas',2,'',1,'2019-07-08 02:54:28','2019-07-08 02:54:28'),
(73,71,1,'编辑','','/auth-system/dataPerm:edit','put@/v1/datas/:id',2,'',1,'2019-07-08 02:54:58','2019-07-08 02:54:58'),
(74,71,1,'删除','','/auth-system/dataPerm:del','delete@/v1/datas/:id',2,'',1,'2019-07-08 02:55:15','2019-07-08 02:55:15'),
(75,71,1,'浏览','','/auth-system/dataPerm:show','get@/v1/datas,get@/v1/datas/:id',2,'',1,'2019-07-08 02:55:33','2019-07-08 02:55:33'),
(76,18,1,'删除','','/auth-system/menu:del','delete@/v1/menus/:id',2,'',3,'2019-07-08 02:55:33','2019-07-08 02:55:33'),
(77,0,2,'任务管理','','',NULL,0,'component',1,'2019-10-15 23:15:35','2019-10-15 23:15:35'),
(78,77,2,'任务管理','/taskmanage/list','/taskmanage/list',NULL,1,'clipboard',1,'2019-10-15 23:17:22','2019-10-15 23:17:30'),
(79,77,2,'任务详情','/taskmanage/details/:id','/taskmanage/details/:id',NULL,1,'documentation',1,'2019-10-15 23:18:08','2019-10-15 23:18:08'),
(80,77,2,'添加任务','/taskmanage/create','/taskmanage/create',NULL,1,'documentation',1,'2019-10-15 23:18:31','2019-10-15 23:18:31'),
(83,0,1,'日志管理','','',NULL,0,'table',1,'2019-10-20 21:22:56','2019-10-20 21:22:56'),
(84,83,1,'登录日志','/logs/log_login','',NULL,1,'clipboard',1,'2019-10-20 21:25:06','2019-10-20 21:25:06'),
(85,83,1,'操作日志','/logs/log_operation','',NULL,1,'documentation',1,'2019-10-20 21:25:39','2019-10-20 21:25:39'),
(86,84,1,'浏览','','/logs/log_login:show','get@/v1/log/logins,get@/v1/log/login/:id',2,'',1,'2019-10-20 21:30:09','2019-10-20 21:30:09'),
(87,84,1,'添加','','/logs/log_login:add',NULL,2,'',1,'2019-10-20 21:30:53','2019-10-20 21:30:53'),
(88,84,1,'修改','','/logs/log_login:edit',NULL,2,'',1,'2019-10-20 21:31:17','2019-10-20 21:31:17'),
(89,84,1,'删除','','/logs/log_login:del',NULL,2,'',1,'2019-10-20 21:31:39','2019-10-20 21:31:39'),
(90,85,1,'浏览','','/v1/log/operations:get','get@/v1/log/operations,get@/v1/log/operations/:id',2,'',1,'2019-10-20 21:32:36','2019-10-20 21:32:36'),
(91,85,1,'添加','','/logs/log_operation:add',NULL,2,'',1,'2019-10-20 21:32:56','2019-10-20 21:32:56'),
(92,85,1,'修改','','/logs/log_operation:edit',NULL,2,'',1,'2019-10-20 21:33:16','2019-10-20 21:33:16'),
(93,85,1,'删除','','/logs/log_operation:del',NULL,2,'',1,'2019-10-20 21:33:44','2019-10-20 21:33:44'),
(94,0,1,'配置管理','','',NULL,0,'dashboard',1,'2019-10-20 21:33:44','2019-10-20 21:33:44'),
(95,94,1,'Ldap设置','/setting/auth','/setting/auth',NULL,1,'lock',1,'2019-10-20 21:33:44','2019-10-20 21:33:44'),
(96,94,1,'Email设置','/setting/email','/setting/email',NULL,1,'lock',1,'2019-10-20 21:33:44','2019-10-20 21:33:44'),
(97,96,1,'详情','','/setting/auth:show','get@/v1/setting/email,post@/v1/setting/email',2,'',1,'2019-11-03 11:17:54','2019-11-03 11:19:42'),
(98,95,1,'详情','','/setting/ldap:show','get@/v1/setting/ldap,post@/v1/setting/ldap',2,'',1,'2019-11-03 11:23:15','2019-11-03 11:28:06'),
(99,94,1,'钉钉设置','/setting/dingtalk','','',1,'example',1,'2019-11-06 00:16:36','2019-11-06 00:16:36'),
(100,99,1,'同步','','/setting/auth:sync','get@/v1/setting/sync/dingtalk',2,'',1,'2019-11-06 00:17:58','2019-11-06 00:17:58'),
(101,0,3,'配置管理','','','',0,'component',1,'2019-11-23 21:18:49','2019-11-23 21:18:49'),
(103,101,3,'配置列表','/configlist/list','','',1,'',1,'2019-12-06 20:15:01','2019-12-06 20:15:01'),
(104,103,3,'查看','','/configlist/list','',2,'',1,'2019-12-06 20:15:17','2019-12-06 20:15:27');

/*Table structure for table `menu_perm_alias` */

DROP TABLE IF EXISTS `menu_perm_alias`;

CREATE TABLE `menu_perm_alias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perms` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标识',
  `alias` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '别名',
  `domain_id` int(11) DEFAULT '0' COMMENT '所属项目',
  `created_time` int(11) DEFAULT NULL,
  `updated_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `perms_index` (`perms`(191))
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限alias表';

/*Data for the table `menu_perm_alias` */

insert  into `menu_perm_alias`(`id`,`perms`,`alias`,`domain_id`,`created_time`,`updated_time`) values 
(1,'/permission/user:edit','put@/v1/users/:id',1,1572605085,1572605085),
(2,'/permission/user:edit','put@/v1/users/:id/status',1,1572605085,1572605085),
(3,'/permission/user:add','post@/v1/users',1,1572605095,1572605095),
(4,'/permission/user:del','delete@/v1/users/:id',1,1572605103,1572605103),
(5,'/permission/dept:add','post@/v1/depts',1,1572605351,1572605351),
(6,'/permission/dept:edit','put@/v1/depts/:id',1,1572605380,1572605380),
(7,'/permission/dept:show','get@/v1/depts',1,1572605399,1572605399),
(8,'/permission/dept:show','get@/v1/depts/:id',1,1572605399,1572605399),
(9,'/permission/dept:del','delete@/v1/depts/:id',1,1572605425,1572605425),
(10,'/permission/role:add','post@/v1/roles',1,1572605517,1572605517),
(11,'/permission/role:edit','put@/v1/roles/:id',1,1572605530,1572605530),
(12,'/permission/role:del','delete@/v1/roles/:id',1,1572605547,1572605547),
(13,'/auth-system/menu:show','get@/v1/menus',1,1572605627,1572605627),
(14,'/auth-system/menu:show','get@/v1/menus/:id',1,1572605627,1572605627),
(15,'/auth-system/menu:add','post@/v1/menus',1,1572605647,1572605647),
(16,'/auth-system/menu:edit','put@/v1/menus/:id',1,1572605660,1572605660),
(17,'/auth-system/menu:del','delete@/v1/menus/:id',1,1572605672,1572605672),
(18,'/auth-system/domain:show','get@/v1/domains',1,1572605721,1572605721),
(19,'/auth-system/domain:show','get@/v1/domains/:id',1,1572605721,1572605721),
(20,'/auth-system/domain:add','post@/v1/domains',1,1572605734,1572605734),
(21,'/auth-system/domain:edit','put@/v1/domains/:id',1,1572605760,1572605760),
(22,'/auth-system/domain:del','delete@/v1/domains/:id',1,1572605790,1572605790),
(23,'/auth-system/dataPerm:show','get@/v1/datas',1,1572693705,1572693705),
(24,'/auth-system/dataPerm:show','get@/v1/datas/:id',1,1572693705,1572693705),
(25,'/auth-system/dataPerm:add','post@/v1/datas',1,1572693777,1572693777),
(26,'/auth-system/dataPerm:edit','put@/v1/datas/:id',1,1572693793,1572693793),
(27,'/auth-system/dataPerm:del','delete@/v1/datas/:id',1,1572693808,1572693808),
(28,'/logs/log_login:show','get@/v1/log/logins',1,1572693965,1572693965),
(29,'/logs/log_login:show','get@/v1/log/login/:id',1,1572693965,1572693965),
(30,'/v1/log/operations:get','get@/v1/log/operations',1,1572694099,1572694099),
(31,'/v1/log/operations:get','get@/v1/log/operations/:id',1,1572694099,1572694099),
(32,'/permission/role:show','get@/v1/roles',1,1572694205,1572694205),
(33,'/permission/role:show','get@/v1/roles/:id',1,1572694205,1572694205),
(34,'/permission/user:show','get@/v1/users',1,1572694219,1572694219),
(35,'/permission/user:show','get@/v1/usres/:id',1,1572694219,1572694219),
(36,'/permission/user:show','get@/v1/users/:id/roles',1,1572694219,1572694219),
(48,'/setting/auth:show','get@/v1/setting/email',1,1572752275,1572752275),
(49,'/setting/auth:show','post@/v1/setting/email',1,1572752275,1572752275),
(50,'/setting/ldap:show','get@/v1/setting/ldap',1,1572752282,1572752282),
(51,'/setting/ldap:show','post@/v1/setting/ldap',1,1572752282,1572752282),
(52,'/permission/dept:del','post@/v1/depts/:id/check-no-member',1,1572605425,1572605425),
(53,'/setting/auth:sync','get@/v1/setting/sync/dingtalk',1,1572970678,1572970678),
(56,'','',3,1575634501,1575634501),
(58,'/configlist/list','',3,1575634527,1575634527);

/*Table structure for table `operation_log` */

DROP TABLE IF EXISTS `operation_log`;

CREATE TABLE `operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志编号',
  `module` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作模块',
  `request_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求地址',
  `operation_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作方法',
  `params` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求参数',
  `exception_stack` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '异常堆栈信息',
  `operation_result` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作结果',
  `operation_success` tinyint(1) DEFAULT NULL COMMENT '操作结果 1 成功/2 失败',
  `user_id` int(11) DEFAULT NULL COMMENT '操作人员',
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip',
  `ip_location` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip地理位置',
  `operation_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `operation_content` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志';

/*Data for the table `operation_log` */

insert  into `operation_log`(`id`,`log_no`,`module`,`request_url`,`operation_method`,`params`,`exception_stack`,`operation_result`,`operation_success`,`user_id`,`ip`,`ip_location`,`operation_time`,`operation_content`,`create_time`,`last_update_time`) values 
(1,'','','/v1/domains','POST','{\"id\":0,\"name\":\"配置中心(demo)\",\"callbackurl\":\"http://zeus-admin-config.bullteam.cn\",\"remark\":\"配置中心(demo)\",\"code\":\"zeus-config\",\"CreateTime\":\"0001-01-01T00:00:00Z\",\"LastLoginTime\":\"0001-01-01T00:00:00Z\"}','','success',1,2,'124.15.122.53','','2019-11-23 21:18:20','Create Domain','2019-11-23 21:18:20','2019-11-23 21:18:20'),
(2,'','','/v1/menus','POST','{\"name\":\"配置管理\",\"parent_id\":0,\"domain_id\":3,\"url\":\"\",\"perms\":\"\",\"alias\":\"\",\"menu_type\":0,\"icon\":\"component\",\"order_num\":1}','','success',1,2,'124.15.122.53','','2019-11-23 21:18:49','Create Menu','2019-11-23 21:18:49','2019-11-23 21:18:49'),
(3,'','','/v1/menus','POST','{\"name\":\"配置列表\",\"parent_id\":101,\"domain_id\":3,\"url\":\"/configlist/list\",\"perms\":\"\",\"alias\":\"\",\"menu_type\":1,\"icon\":\"chart\",\"order_num\":1}','','success',1,2,'124.15.122.53','','2019-11-23 21:19:52','Create Menu','2019-11-23 21:19:52','2019-11-23 21:19:52'),
(4,'','','/v1/roles','POST','{\"name\":\"zeus配置中心\",\"domain_id\":3,\"role_name\":\"zeus配置中心\",\"remark\":\"\",\"menu_ids\":\"101,102\",\"menu_ids_ele\":\"101,102\",\"data_perm_ids\":\"\"}','','success',1,2,'124.15.122.53','','2019-11-23 21:28:26','Create Role','2019-11-23 21:28:26','2019-11-23 21:28:26'),
(5,'','','/v1/depts','POST','{\"id\":0,\"name\":\"test\",\"parent_id\":0,\"order_num\":0,\"CreateTime\":\"0001-01-01T00:00:00Z\",\"UpdateTime\":\"0001-01-01T00:00:00Z\"}','','success',1,2,'120.229.9.224','','2019-11-24 00:53:01','Create Department','2019-11-24 00:53:01','2019-11-24 00:53:01'),
(6,'','','/v1/menus/102','DELETE','{\"id\":102}','','success',1,2,'113.66.230.112','','2019-12-06 20:14:44','Delete Menu','2019-12-06 20:14:44','2019-12-06 20:14:44'),
(7,'','','/v1/menus','POST','{\"name\":\"配置列表\",\"parent_id\":101,\"domain_id\":3,\"url\":\"/configlist/list\",\"perms\":\"\",\"alias\":\"\",\"menu_type\":1,\"icon\":\"\",\"order_num\":1}','','success',1,2,'113.66.230.112','','2019-12-06 20:15:01','Create Menu','2019-12-06 20:15:01','2019-12-06 20:15:01'),
(8,'','','/v1/menus','POST','{\"name\":\"查看\",\"parent_id\":0,\"domain_id\":3,\"url\":\"\",\"perms\":\"/configlist/list\",\"alias\":\"\",\"menu_type\":2,\"icon\":\"\",\"order_num\":1}','','success',1,2,'113.66.230.112','','2019-12-06 20:15:17','Create Menu','2019-12-06 20:15:17','2019-12-06 20:15:17'),
(9,'','','/v1/menus/104','PUT','{\"id\":104,\"name\":\"查看\",\"parent_id\":103,\"domain_id\":3,\"url\":\"\",\"perms\":\"/configlist/list\",\"alias\":\"\",\"menu_type\":2,\"icon\":\"\",\"order_num\":1}','','success',1,2,'113.66.230.112','','2019-12-06 20:15:27','Edit Menu','2019-12-06 20:15:27','2019-12-06 20:15:27'),
(10,'','','/v1/depts/2','PUT','{\"id\":2,\"name\":\"人事部1\",\"order_num\":0}','','success',1,2,'203.187.160.86','','2019-12-06 20:44:07','Edit Department','2019-12-06 20:44:07','2019-12-06 20:44:07'),
(11,'','','/v1/domains','POST','{\"id\":0,\"name\":\"的说法\",\"callbackurl\":\"mxd.com\",\"remark\":\"的说法\",\"code\":\"xccxxc\",\"CreateTime\":\"0001-01-01T00:00:00Z\",\"LastLoginTime\":\"0001-01-01T00:00:00Z\"}','','success',1,2,'203.187.160.86','','2019-12-06 20:44:52','Create Domain','2019-12-06 20:44:52','2019-12-06 20:44:52'),
(12,'','','/v1/roles/5','PUT','{\"id\":5,\"name\":\"zeus配置中心\",\"domain_id\":3,\"remark\":\"\",\"menu_ids\":\"101,103,104\",\"menu_ids_ele\":\"101,103,104\",\"data_perm_ids\":\"\"}','','success',1,2,'124.15.122.53','','2019-12-06 23:01:37','Edit Role','2019-12-06 23:01:37','2019-12-06 23:01:37'),
(13,'','','/v1/domains/4','DELETE','{\"id\":4}','','success',1,2,'124.15.122.53','','2019-12-06 23:28:32','Delete Domain','2019-12-06 23:28:32','2019-12-06 23:28:32'),
(14,'','','/v1/depts/17','DELETE','{\"id\":17}','','success',1,2,'124.15.122.53','','2019-12-06 23:29:25','Delete Department','2019-12-06 23:29:25','2019-12-06 23:29:25');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `domain_id` int(11) NOT NULL DEFAULT '1' COMMENT '项目域id',
  `role_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `menu_ids` text COLLATE utf8mb4_unicode_ci,
  `menu_ids_ele` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_role` (`domain_id`,`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`domain_id`,`role_name`,`remark`,`menu_ids`,`menu_ids_ele`) values 
(1,'超级管理员',1,'超级管理员','超级管理员','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,83,84,86,87,88,89,85,90,91,92,93,94,95,98,96,97,99,100,17,18,19,20,21,76,71,72,73,74,75,23,24,25,26,27','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,83,84,86,87,88,89,85,90,91,92,93,94,95,98,96,97,99,100,17,18,19,20,21,76,71,72,73,74,75,23,24,25,26,27'),
(2,'系统设置',1,'系统设置','系统设置','17,18,19,20,21,22,23,24,25,26,27','17,18,19,20,21,22,23,24,25,26,27'),
(3,'日志管理',1,'日志管理','日志管理','83,84,86,87,88,89,85,90,91,92,93','83,84,86,87,88,89,85,90,91,92,93'),
(4,'crawlnovel管理员',2,'crawlnovel管理员','','77,78,79,80','77,78,79,80'),
(5,'zeus配置中心',3,'zeus配置中心','','101,103,104','101,103,104');

/*Table structure for table `role_data_perm` */

DROP TABLE IF EXISTS `role_data_perm`;

CREATE TABLE `role_data_perm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `data_perm_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '数据权限id',
  PRIMARY KEY (`id`),
  KEY `idx_rdp_role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据权限与角色关系表';

/*Data for the table `role_data_perm` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '性别',
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '加密盐',
  `department_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门ID',
  `faceicon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像地址',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态 1=正常 2=禁用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` tinytext COLLATE utf8mb4_unicode_ci COMMENT '职位，头衔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`mobile`,`sex`,`realname`,`password`,`salt`,`department_id`,`faceicon`,`email`,`status`,`create_time`,`last_login_time`,`title`) values 
(1,'wutongci','1862011114',0,'西西','19a5211e74936366f687c4dec5f2ee94a35e6c7122928bca1e8bac3b9ac526d70fdd48aeac23fd51313f68a9f1a07d95b5a131f8544c698caedb63c4c20d76fe','d795e0811e7836c87522165ea83891f53c8b5d533ea2b7841a3fe6c949b61a904b338e1f174864e1410ea4eb3ed4941d88711ddddecceafaf07d74c4d17397bb',1,'','lily@hotmail.com',1,'2019-09-30 11:40:36','2019-09-20 11:40:40','developer'),
(2,'admin','123123123',1,'admin','26ddcd90cc116bee0034543c0798bec8217944c0ee67ef6c5b71d24aade4c02759f34446051508714f18219ba734ce4abf7cc8d90f1f10dfd99e102115201f43','6078b3372fb9628e2a02f1e0020b9a0af65aa0d03498e603a5dfc2e1ba119b742264858f7af07286140547ec5f1b02626792ddeac5ac30b836ac9dbde7f28c4b',1,'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif','111@123.com',1,'2019-02-18 01:30:11','2019-02-18 01:30:11','超管');

/*Table structure for table `user_email` */

DROP TABLE IF EXISTS `user_email`;

CREATE TABLE `user_email` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Email',
  `checked` tinyint(2) DEFAULT '0' COMMENT '是否验证 0 未验证 1 已经验证',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `laste_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户邮件账户表';

/*Data for the table `user_email` */

/*Table structure for table `user_oauth` */

DROP TABLE IF EXISTS `user_oauth`;

CREATE TABLE `user_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `from` tinyint(3) NOT NULL DEFAULT '1' COMMENT '来源 1.dingtalk 2.wechat 3.facebook',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `openid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '第三方openid',
  `unionid` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '第三方unionid',
  `avatar` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `extra` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展信息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户第三方登陆关联表';

/*Data for the table `user_oauth` */

insert  into `user_oauth`(`id`,`from`,`user_id`,`name`,`openid`,`unionid`,`avatar`,`extra`,`create_time`,`update_time`) values 
(1,1,2,'黄福祥','WnXRUXZZQCZQdx8t4yJSxQiEiE','ajq7lrBOMtB0u134Fkl4KgiEiE','','','2019-10-08 09:48:22','2019-10-08 09:48:22');

/*Table structure for table `user_secret` */

DROP TABLE IF EXISTS `user_secret`;

CREATE TABLE `user_secret` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT 'userid',
  `account_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '账户名称',
  `secret` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密钥',
  `is_open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 关闭 1开启',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户安全设置-Google 2fa两步验证';

/*Data for the table `user_secret` */

insert  into `user_secret`(`id`,`user_id`,`account_name`,`secret`,`is_open`,`create_time`,`update_time`) values 
(1,2,'Zeus:2','5KPRMCCZFDX4YKWE',0,'2019-11-23 21:16:51','2019-11-23 21:16:51');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
