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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;

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
(50,'p','超级管理员','/auth-system/dataPerm:add,/data/perm/add','*','root','',''),
(51,'p','超级管理员','/auth-system/dataPerm:edit,/data/perm/edit','*','root','',''),
(52,'p','超级管理员','/auth-system/dataPerm:del,/data/perm/del','*','root','',''),
(53,'p','超级管理员','/auth-system/dataPerm:show,/data/perm/show','*','root','',''),
(54,'p','超级管理员','/auth-system/dataPerm:add,/data/perm/add','*','root','',''),
(55,'p','超级管理员','/auth-system/dataPerm:edit,/data/perm/edit','*','root','',''),
(56,'p','超级管理员','/auth-system/dataPerm:del,/data/perm/del','*','root','',''),
(57,'p','超级管理员','/auth-system/dataPerm:show,/data/perm/show','*','root','',''),
(58,'p','超级管理员','/auth-system/dataPerm:add,/data/perm/add','*','root','',''),
(59,'p','超级管理员','/auth-system/dataPerm:edit,/data/perm/edit','*','root','',''),
(60,'p','超级管理员','/auth-system/dataPerm:del,/data/perm/del','*','root','',''),
(61,'p','超级管理员','/auth-system/dataPerm:show,/data/perm/show','*','root','',''),
(62,'p','超级管理员','/auth-system/dataPerm:add,/data/perm/add','*','root','',''),
(63,'p','超级管理员','/auth-system/dataPerm:edit,/data/perm/edit','*','root','',''),
(64,'p','超级管理员','/auth-system/dataPerm:del,/data/perm/del','*','root','',''),
(65,'p','超级管理员','/auth-system/dataPerm:show,/data/perm/show','*','root','',''),
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
(96,'p','超级管理员','/logs/log_operation:show','*','root','',''),
(97,'p','超级管理员','/logs/log_operation:add','*','root','',''),
(98,'p','超级管理员','/logs/log_operation:edit','*','root','',''),
(99,'p','超级管理员','/logs/log_operation:del','*','root','','');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='数据权限管理';

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
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='组织架构表';

/*Data for the table `department` */

insert  into `department`(`id`,`name`,`parent_id`,`order_num`,`create_time`,`update_time`) values 
(1,'技术部',0,1,'2018-12-28 00:08:55','2019-09-30 14:37:52'),
(2,'运营部',0,1,'2018-12-31 06:26:44','2019-03-27 14:58:19'),
(3,'产品部',0,1,'2019-01-10 09:23:15','2019-03-27 14:58:19'),
(5,'商务部',0,1,'2019-01-29 19:03:49','2019-03-27 14:58:19'),
(6,'未分配',0,1,'2019-03-13 17:39:16','2019-03-27 14:58:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目域表';

/*Data for the table `domain` */

insert  into `domain`(`id`,`name`,`callbackurl`,`remark`,`code`,`create_time`,`last_update_time`) values 
(1,' 权限中心','http://admin.bullteam.cn',' 管理所有后台项目的菜单，权限，鉴权等','root','2019-09-30 11:38:15','2019-09-30 14:22:51'),
(2,'crawlnovel小说','http://crawlnovel.bullteam.cn/admin','此项目用来测试','crawlnovel','2019-09-30 11:44:00','2019-10-17 00:01:30');

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `laste_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='日志表';

/*Data for the table `log` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='登录日志';

/*Data for the table `login_log` */

insert  into `login_log`(`id`,`user_id`,`client`,`platform`,`login_result`,`login_status`,`login_time`,`ip`,`ip_location`,`operation_time`,`operation_content`,`create_time`,`last_update_time`) values 
(1,2,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36','Standard Login','Standard Login Success',1,'2019-10-20 21:36:32','223.192.253.163','','2019-10-20 21:36:32','POST /v1/users/login','2019-10-20 21:36:32','2019-10-20 21:36:32');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `domain_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目域id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `url` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '路由url',
  `perms` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权标识',
  `menu_type` int(11) NOT NULL DEFAULT '0' COMMENT '类型 1=菜单 2=按钮',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_menu_domain_id` (`domain_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='菜单表';

/*Data for the table `menu` */

insert  into `menu`(`id`,`parent_id`,`domain_id`,`name`,`url`,`perms`,`menu_type`,`icon`,`order_num`,`create_time`,`last_update_time`) values 
(1,0,1,'权限管理','/permission','',1,'peoples',1,'2018-12-29 16:15:09','2019-03-20 13:01:46'),
(2,1,1,'用户管理','/permission/user','',1,'peoples',1,'2018-12-29 16:15:09','2018-12-29 16:15:09'),
(3,2,1,'浏览','','/permission/user:show',2,'',1,'2018-12-29 16:15:09','2018-12-29 16:15:09'),
(4,2,1,'添加','','/permission/user:add',2,'',2,'2018-12-29 16:15:09','2018-12-29 16:15:09'),
(5,2,1,'修改','','/permission/user:edit',2,'',3,'2018-12-29 16:15:09','2018-12-29 16:15:09'),
(6,2,1,'删除','','/permission/user:del',2,'',4,'2018-12-29 16:15:09','2018-12-29 16:15:09'),
(7,1,1,'部门管理','/permission/dept','',1,'peoples',2,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(8,7,1,'浏览','','/permission/dept:show',2,'',1,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(9,7,1,'添加','','/permission/dept:add',2,'',2,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(10,7,1,'修改','','/permission/dept:edit',2,'',3,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(11,7,1,'删除','','/permission/dept:del',2,'',4,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(12,1,1,'角色管理','/permission/role','',1,'peoples',3,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(13,12,1,'浏览','','/permission/role:show',2,'',1,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(14,12,1,'添加','','/permission/role:add',2,'',2,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(15,12,1,'修改','','/permission/role:edit',2,'',3,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(16,12,1,'删除','','/permission/role:del',2,'',4,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(17,0,1,'系统设置','/auth-system','',1,'nested',2,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(18,17,1,'菜单管理','/auth-system/menu','',1,'peoples',1,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(19,18,1,'浏览','','/auth-system/menu:show',2,'',1,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(20,18,1,'添加','','/auth-system/menu:add',2,'',2,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(21,18,1,'修改','','/auth-system/menu:edit',2,'',3,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(22,18,1,'删除','','/auth-system/menu:del',2,'',4,'2018-12-29 16:15:10','2018-12-29 16:15:10'),
(23,17,1,'项目管理','/auth-system/domain','',1,'peoples',2,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(24,23,1,'浏览','','/auth-system/domain:show',2,'',1,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(25,23,1,'添加','','/auth-system/domain:add',2,'',2,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(26,23,1,'修改','','/auth-system/domain:edit',2,'',3,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(27,23,1,'删除','','/auth-system/domain:del',2,'',4,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(29,28,1,'登录日志','/logs/log_login','',1,'peoples',1,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(30,29,1,'浏览','','/logs/log_login:show',2,'',1,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(31,29,1,'添加','','/logs/log_login:add',2,'',2,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(32,29,1,'修改','','/logs/log_login:edit',2,'',3,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(33,29,1,'删除','','/logs/log_login:del',2,'',4,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(34,28,1,'操作日志','/logs/log_operation','',1,'peoples',2,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(35,34,1,'浏览','','/logs/log_operation:show',2,'',1,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(36,34,1,'添加','','/logs/log_operation:add',2,'',2,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(37,34,1,'修改','','/logs/log_operation:edit',2,'',3,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(38,34,1,'删除','','/logs/log_operation:del',2,'',4,'2018-12-29 16:15:11','2018-12-29 16:15:11'),
(39,28,1,'异常日志','/logs/log_error','',1,'peoples',3,'2018-12-29 16:15:12','2018-12-29 16:15:12'),
(40,39,1,'浏览','','/logs/log_error:show',2,'',1,'2018-12-29 16:15:12','2018-12-29 16:15:12'),
(41,39,1,'添加','','/logs/log_error:add',2,'',2,'2018-12-29 16:15:12','2018-12-29 16:15:12'),
(42,39,1,'修改','','/logs/log_error:edit',2,'',3,'2018-12-29 16:15:12','2018-12-29 16:15:12'),
(43,39,1,'删除','','/logs/log_error:del',2,'',4,'2018-12-29 16:15:12','2018-12-29 16:15:12'),
(66,0,0,'首页','admin/default','',1,'size',1,'2019-01-25 16:34:33','2019-01-25 16:34:33'),
(70,69,1,'编辑角色','','/permission/role:edit',1,'bug',1,'2019-01-28 10:46:42','2019-10-15 23:20:09'),
(71,17,1,'数据权限','/auth-system/dataPerm','',1,'component',1,'2019-07-08 10:53:55','2019-07-08 10:53:55'),
(72,71,1,'添加','','/auth-system/dataPerm:add',2,'',1,'2019-07-08 02:54:28','2019-07-08 02:54:28'),
(73,71,1,'编辑','','/auth-system/dataPerm:edit',2,'',1,'2019-07-08 02:54:58','2019-07-08 02:54:58'),
(74,71,1,'删除','','/auth-system/dataPerm:del',2,'',1,'2019-07-08 02:55:15','2019-07-08 02:55:15'),
(75,71,1,'浏览','','/auth-system/dataPerm:show',2,'',1,'2019-07-08 02:55:33','2019-07-08 02:55:33'),
(76,18,1,'删除','','/auth-system/menu:del',2,'',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(77,0,2,'任务管理','','',0,'component',1,'2019-10-15 23:15:35','2019-10-15 23:15:35'),
(78,77,2,'任务管理','/taskmanage/list','/taskmanage/list',1,'clipboard',1,'2019-10-15 23:17:22','2019-10-15 23:17:30'),
(79,77,2,'任务详情','/taskmanage/details/:id','/taskmanage/details/:id',1,'documentation',1,'2019-10-15 23:18:08','2019-10-15 23:18:08'),
(80,77,2,'添加任务','/taskmanage/create','/taskmanage/create',1,'documentation',1,'2019-10-15 23:18:31','2019-10-15 23:18:31'),
(83,0,1,'日志管理','','',0,'table',1,'2019-10-20 21:22:56','2019-10-20 21:22:56'),
(84,83,1,'登录日志','/logs/log_login','/logs/log_login',1,'clipboard',1,'2019-10-20 21:25:06','2019-10-20 21:25:06'),
(85,83,1,'操作日志','/logs/log_operation','/logs/log_operation',1,'documentation',1,'2019-10-20 21:25:39','2019-10-20 21:25:39'),
(86,84,1,'浏览','','/logs/log_login:show',2,'',1,'2019-10-20 21:30:09','2019-10-20 21:30:09'),
(87,84,1,'添加','','/logs/log_login:add',2,'',1,'2019-10-20 21:30:53','2019-10-20 21:30:53'),
(88,84,1,'修改','','/logs/log_login:edit',2,'',1,'2019-10-20 21:31:17','2019-10-20 21:31:17'),
(89,84,1,'删除','','/logs/log_login:del',2,'',1,'2019-10-20 21:31:39','2019-10-20 21:31:39'),
(90,85,1,'浏览','','/logs/log_operation:show',2,'',1,'2019-10-20 21:32:36','2019-10-20 21:32:36'),
(91,85,1,'添加','','/logs/log_operation:add',2,'',1,'2019-10-20 21:32:56','2019-10-20 21:32:56'),
(92,85,1,'修改','','/logs/log_operation:edit',2,'',1,'2019-10-20 21:33:16','2019-10-20 21:33:16'),
(93,85,1,'删除','','/logs/log_operation:del',2,'',1,'2019-10-20 21:33:44','2019-10-20 21:33:44');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志';

/*Data for the table `operation_log` */

insert  into `operation_log`(`id`,`log_no`,`module`,`request_url`,`operation_method`,`params`,`exception_stack`,`operation_result`,`operation_success`,`user_id`,`ip`,`ip_location`,`operation_time`,`operation_content`,`create_time`,`last_update_time`) values 
(2,'','','/v1/menus','POST','{\"name\":\"日志管理\",\"parent_id\":0,\"domain_id\":1,\"url\":\"\",\"perms\":\"\",\"menu_type\":0,\"icon\":\"table\",\"order_num\":1}','','success',1,2,'223.192.253.163','','2019-10-20 21:22:56','Create Menu','2019-10-20 21:22:56','2019-10-20 21:22:56'),
(3,'','','/v1/menus','POST','{\"name\":\"登录日志\",\"parent_id\":83,\"domain_id\":1,\"url\":\"/logs/log_login\",\"perms\":\"/logs/log_login\",\"menu_type\":1,\"icon\":\"clipboard\",\"order_num\":1}','','success',1,2,'223.192.253.163','','2019-10-20 21:25:06','Create Menu','2019-10-20 21:25:06','2019-10-20 21:25:06'),
(4,'','','/v1/menus','POST','{\"name\":\"操作日志\",\"parent_id\":83,\"domain_id\":1,\"url\":\"/logs/log_operation\",\"perms\":\"/logs/log_operation\",\"menu_type\":1,\"icon\":\"documentation\",\"order_num\":1}','','success',1,2,'223.192.253.163','','2019-10-20 21:25:39','Create Menu','2019-10-20 21:25:39','2019-10-20 21:25:39'),
(5,'','','/v1/roles/1','PUT','{\"id\":1,\"name\":\"超级管理员\",\"domain_id\":1,\"remark\":\"超级管理员\",\"menu_ids\":\"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,83,84,85,17,18,19,20,21,76,22,71,72,73,74,75,23,24,25,26,27\",\"menu_ids_ele\":\"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,83,84,85,17,18,19,20,21,76,22,71,72,73,74,75,23,24,25,26,27\",\"data_perm_ids\":\"\"}','','success',1,2,'223.192.253.163','','2019-10-20 21:26:05','Edit Role','2019-10-20 21:26:05','2019-10-20 21:26:05'),
(6,'','','/v1/roles/3','PUT','{\"id\":3,\"name\":\"日志管理\",\"domain_id\":1,\"remark\":\"日志管理\",\"menu_ids\":\"83,84,85\",\"menu_ids_ele\":\"83,84,85\",\"data_perm_ids\":\"\"}','','success',1,2,'223.192.253.163','','2019-10-20 21:26:29','Edit Role','2019-10-20 21:26:29','2019-10-20 21:26:29'),
(7,'','','/v1/menus','POST','{\"name\":\"浏览\",\"parent_id\":84,\"domain_id\":1,\"url\":\"\",\"perms\":\"/logs/log_login:show\",\"menu_type\":2,\"icon\":\"\",\"order_num\":1}','','success',1,2,'223.192.253.163','','2019-10-20 21:30:09','Create Menu','2019-10-20 21:30:09','2019-10-20 21:30:09'),
(8,'','','/v1/menus','POST','{\"name\":\"添加\",\"parent_id\":84,\"domain_id\":1,\"url\":\"\",\"perms\":\"/logs/log_login:add\",\"menu_type\":2,\"icon\":\"\",\"order_num\":1}','','success',1,2,'223.192.253.163','','2019-10-20 21:30:53','Create Menu','2019-10-20 21:30:53','2019-10-20 21:30:53'),
(9,'','','/v1/menus','POST','{\"name\":\"修改\",\"parent_id\":84,\"domain_id\":1,\"url\":\"\",\"perms\":\"/logs/log_login:edit\",\"menu_type\":2,\"icon\":\"\",\"order_num\":1}','','success',1,2,'223.192.253.163','','2019-10-20 21:31:17','Create Menu','2019-10-20 21:31:17','2019-10-20 21:31:17'),
(10,'','','/v1/menus','POST','{\"name\":\"删除\",\"parent_id\":84,\"domain_id\":1,\"url\":\"\",\"perms\":\"/logs/log_login:del\",\"menu_type\":2,\"icon\":\"\",\"order_num\":1}','','success',1,2,'223.192.253.163','','2019-10-20 21:31:39','Create Menu','2019-10-20 21:31:39','2019-10-20 21:31:39'),
(11,'','','/v1/menus','POST','{\"name\":\"浏览\",\"parent_id\":85,\"domain_id\":1,\"url\":\"\",\"perms\":\"/logs/log_operation:show\",\"menu_type\":2,\"icon\":\"\",\"order_num\":1}','','success',1,2,'223.192.253.163','','2019-10-20 21:32:36','Create Menu','2019-10-20 21:32:36','2019-10-20 21:32:36'),
(12,'','','/v1/menus','POST','{\"name\":\"添加\",\"parent_id\":85,\"domain_id\":1,\"url\":\"\",\"perms\":\"/logs/log_operation:add\",\"menu_type\":2,\"icon\":\"\",\"order_num\":1}','','success',1,2,'223.192.253.163','','2019-10-20 21:32:56','Create Menu','2019-10-20 21:32:56','2019-10-20 21:32:56'),
(13,'','','/v1/menus','POST','{\"name\":\"修改\",\"parent_id\":85,\"domain_id\":1,\"url\":\"\",\"perms\":\"/logs/log_operation:edit\",\"menu_type\":2,\"icon\":\"\",\"order_num\":1}','','success',1,2,'223.192.253.163','','2019-10-20 21:33:16','Create Menu','2019-10-20 21:33:16','2019-10-20 21:33:16'),
(14,'','','/v1/menus','POST','{\"name\":\"删除\",\"parent_id\":85,\"domain_id\":1,\"url\":\"\",\"perms\":\"/logs/log_operation:del\",\"menu_type\":2,\"icon\":\"\",\"order_num\":1}','','success',1,2,'223.192.253.163','','2019-10-20 21:33:44','Create Menu','2019-10-20 21:33:44','2019-10-20 21:33:44'),
(15,'','','/v1/roles/3','PUT','{\"id\":3,\"name\":\"日志管理\",\"domain_id\":1,\"remark\":\"日志管理\",\"menu_ids\":\"83,84,86,87,88,89,85,90,91,92,93\",\"menu_ids_ele\":\"83,84,86,87,88,89,85,90,91,92,93\",\"data_perm_ids\":\"\"}','','success',1,2,'223.192.253.163','','2019-10-20 21:33:59','Edit Role','2019-10-20 21:33:59','2019-10-20 21:33:59'),
(16,'','','/v1/roles/1','PUT','{\"id\":1,\"name\":\"超级管理员\",\"domain_id\":1,\"remark\":\"超级管理员\",\"menu_ids\":\"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,83,84,86,87,88,89,85,90,91,92,93,17,18,19,20,21,76,22,71,72,73,74,75,23,24,25,26,27\",\"menu_ids_ele\":\"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,83,84,86,87,88,89,85,90,91,92,93,17,18,19,20,21,76,22,71,72,73,74,75,23,24,25,26,27\",\"data_perm_ids\":\"\"}','','success',1,2,'223.192.253.163','','2019-10-20 21:34:08','Edit Role','2019-10-20 21:34:08','2019-10-20 21:34:08');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`domain_id`,`role_name`,`remark`,`menu_ids`,`menu_ids_ele`) values 
(1,'超级管理员',1,'超级管理员','超级管理员','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,83,84,86,87,88,89,85,90,91,92,93,17,18,19,20,21,76,22,71,72,73,74,75,23,24,25,26,27','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,83,84,86,87,88,89,85,90,91,92,93,17,18,19,20,21,76,22,71,72,73,74,75,23,24,25,26,27'),
(2,'系统设置',1,'系统设置','系统设置','17,18,19,20,21,22,23,24,25,26,27','17,18,19,20,21,22,23,24,25,26,27'),
(3,'日志管理',1,'日志管理','日志管理','83,84,86,87,88,89,85,90,91,92,93','83,84,86,87,88,89,85,90,91,92,93'),
(4,'crawlnovel管理员',2,'crawlnovel管理员','','77,78,79,80','77,78,79,80');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户第三方登陆关联表';

/*Data for the table `user_oauth` */

insert  into `user_oauth`(`id`,`from`,`user_id`,`name`,`openid`,`unionid`,`avatar`,`extra`,`create_time`,`update_time`) values 
(3,1,2,'黄福祥','WnXRUXZZQCZQdx8t4yJSxQiEiE','ajq7lrBOMtB0u134Fkl4KgiEiE','','','2019-10-08 09:48:22','2019-10-08 09:48:22');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `role_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户角色关系表';

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`user_id`,`role_id`) values 
(5,2,1),
(6,2,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户安全设置-Google 2fa两步验证';

/*Data for the table `user_secret` */

insert  into `user_secret`(`id`,`user_id`,`account_name`,`secret`,`is_open`,`create_time`,`update_time`) values 
(2,2,'Zeus:2','2VMIIAS4TYELTF4Z',0,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
