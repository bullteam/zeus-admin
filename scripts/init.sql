/*
 Navicat Premium Data Transfer

 Source Server         : zeus-qq
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 148.70.178.85:3306
 Source Schema         : zeus

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 11/05/2020 21:20:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `v0` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `v1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `v2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `v3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `v4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `v5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
INSERT INTO `casbin_rule` VALUES (13, 'p', '系统设置', '/auth-system/menu:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (14, 'p', '系统设置', '/auth-system/menu:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (15, 'p', '系统设置', '/auth-system/menu:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (16, 'p', '系统设置', '/auth-system/menu:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (17, 'p', '系统设置', '/auth-system/domain:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (18, 'p', '系统设置', '/auth-system/domain:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (19, 'p', '系统设置', '/auth-system/domain:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (20, 'p', '系统设置', '/auth-system/domain:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (21, 'p', '权限管理', '/auth-system/menu:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (22, 'p', '权限管理', '/auth-system/menu:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (23, 'p', '权限管理', '/auth-system/menu:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (24, 'p', '权限管理', '/auth-system/menu:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (25, 'p', '权限管理', '/auth-system/domain:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (26, 'p', '权限管理', '/auth-system/domain:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (27, 'p', '权限管理', '/auth-system/domain:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (28, 'p', '权限管理', '/auth-system/domain:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (29, 'p', '超级管理员', '/permission/user:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (30, 'p', '超级管理员', '/permission/user:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (31, 'p', '超级管理员', '/permission/user:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (32, 'p', '超级管理员', '/permission/user:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (33, 'p', '超级管理员', '/permission/dept:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (35, 'p', '超级管理员', '/permission/dept:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (36, 'p', '超级管理员', '/permission/dept:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (37, 'p', '超级管理员', '/permission/role:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (38, 'p', '超级管理员', '/permission/role:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (39, 'p', '超级管理员', '/permission/role:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (40, 'p', '超级管理员', '/permission/role:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (45, 'p', '超级管理员', '/auth-system/domain:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (46, 'p', '超级管理员', '/auth-system/domain:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (47, 'p', '超级管理员', '/auth-system/domain:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (48, 'p', '超级管理员', '/auth-system/domain:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (66, 'p', '超级管理员', '/auth-system/dataPerm:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (67, 'p', '超级管理员', '/auth-system/dataPerm:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (68, 'p', '超级管理员', '/auth-system/dataPerm:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (69, 'p', '超级管理员', '/auth-system/dataPerm:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (70, 'g', '2', '超级管理员', '', '', '', '');
INSERT INTO `casbin_rule` VALUES (71, 'g', '1', '超级管理员', '', '', '', '');
INSERT INTO `casbin_rule` VALUES (72, 'p', '超级管理员', '/auth-system/menu:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (73, 'p', '超级管理员', '/auth-system/menu:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (74, 'p', '超级管理员', '/auth-system/menu:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (75, 'p', '超级管理员', '/auth-system/menu:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (76, 'g', '2', 'crawlnovel管理员', '', '', '', '');
INSERT INTO `casbin_rule` VALUES (83, 'g', '2', '日志管理', '', '', '', '');
INSERT INTO `casbin_rule` VALUES (84, 'p', '日志管理', '/logs/log_login:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (85, 'p', '日志管理', '/logs/log_login:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (86, 'p', '日志管理', '/logs/log_login:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (87, 'p', '日志管理', '/logs/log_login:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (88, 'p', '日志管理', '/logs/log_operation:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (89, 'p', '日志管理', '/logs/log_operation:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (90, 'p', '日志管理', '/logs/log_operation:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (91, 'p', '日志管理', '/logs/log_operation:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (92, 'p', '超级管理员', '/logs/log_login:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (93, 'p', '超级管理员', '/logs/log_login:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (94, 'p', '超级管理员', '/logs/log_login:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (95, 'p', '超级管理员', '/logs/log_login:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (97, 'p', '超级管理员', '/logs/log_operation:add', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (98, 'p', '超级管理员', '/logs/log_operation:edit', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (99, 'p', '超级管理员', '/logs/log_operation:del', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (100, 'p', '超级管理员', '/v1/log/operations:get', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (101, 'p', '超级管理员', '/setting/auth:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (102, 'p', '超级管理员', '/setting/ldap:show', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (103, 'p', '超级管理员', '/setting/auth:sync', '*', 'root', '', '');
INSERT INTO `casbin_rule` VALUES (104, 'g', '2', 'zeus配置中心', '', '', '', '');
INSERT INTO `casbin_rule` VALUES (105, 'p', 'zeus配置中心', '/configlist/list', '*', 'zeus-config', '', '');
INSERT INTO `casbin_rule` VALUES (106, 'g', '2', '青橙CMS管理员', '', '', '', '');
INSERT INTO `casbin_rule` VALUES (118, 'p', '青橙CMS管理员', '/novel/category', '*', 'lime', '', '');
INSERT INTO `casbin_rule` VALUES (119, 'p', '青橙CMS管理员', '/novel/categories:add', '*', 'lime', '', '');
INSERT INTO `casbin_rule` VALUES (120, 'p', '青橙CMS管理员', '/novel/categories:edit', '*', 'lime', '', '');
INSERT INTO `casbin_rule` VALUES (121, 'p', '青橙CMS管理员', '/novel/categories:del', '*', 'lime', '', '');
INSERT INTO `casbin_rule` VALUES (122, 'g', '1', '青橙CMS管理员', '', '', '', '');
INSERT INTO `casbin_rule` VALUES (123, 'g', '1', 'zeus配置中心', '', '', '', '');
INSERT INTO `casbin_rule` VALUES (124, 'p', '青橙CMS管理员', '/novel/books:add', '*', 'lime', '', '');
INSERT INTO `casbin_rule` VALUES (125, 'p', '青橙CMS管理员', '/novel/books:del', '*', 'lime', '', '');
INSERT INTO `casbin_rule` VALUES (126, 'p', '青橙CMS管理员', '/novel/comments', '*', 'lime', '', '');
INSERT INTO `casbin_rule` VALUES (127, 'p', '青橙CMS管理员', '/novel/comments:add', '*', 'lime', '', '');
INSERT INTO `casbin_rule` VALUES (128, 'p', '青橙CMS管理员', '/novel/comments:del', '*', 'lime', '', '');

-- ----------------------------
-- Table structure for data_perm
-- ----------------------------
DROP TABLE IF EXISTS `data_perm`;
CREATE TABLE `data_perm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '项目域id',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '菜单ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '数据权限标识',
  `perms_rule` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '数据规则',
  `perms_type` tinyint(3) NOT NULL DEFAULT 1 COMMENT '1=分类 2=数据权限',
  `order_num` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_data_perm_domain_id`(`domain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据权限管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_perm
-- ----------------------------
INSERT INTO `data_perm` VALUES (1, 1, 0, 'test', '-', '{\"hello\":\"world\",\"name\":\"value\"}', 2, 1, '2019-10-08 09:54:20', '2020-05-09 19:33:56', '');
INSERT INTO `data_perm` VALUES (2, 1, 0, 'test', '', '', 1, 1, '2019-10-08 09:54:23', '2019-10-08 09:54:23', '');
INSERT INTO `data_perm` VALUES (3, 1, 1, 'aa', '/user/dd', '\"dd\"', 2, 1, '2020-05-09 19:32:24', '2020-05-09 19:32:46', '');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级部门id',
  `order_num` int(11) NULL DEFAULT 1 COMMENT '排序',
  `extend_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '扩展字段',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '组织架构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '公牛开源联盟', 0, 0, '{\"Id\":1,\"Name\":\"公牛开源联盟\",\"ParentId\":0,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (2, '人事部', 1, 0, '{\"Id\":142415941,\"Name\":\"人事部\",\"ParentId\":1,\"Children\":null}', '2019-11-06 00:18:44', '2020-05-09 21:15:44');
INSERT INTO `department` VALUES (3, '商务部', 1, 0, '{\"Id\":142520460,\"Name\":\"商务部\",\"ParentId\":1,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (4, '运营部', 1, 0, '{\"Id\":142522511,\"Name\":\"运营部\",\"ParentId\":1,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (5, '市场部', 1, 0, '{\"Id\":142567183,\"Name\":\"市场部\",\"ParentId\":1,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (6, '法务部', 1, 0, '{\"Id\":142575192,\"Name\":\"法务部\",\"ParentId\":1,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (7, '财务部', 1, 0, '{\"Id\":142601103,\"Name\":\"财务部\",\"ParentId\":1,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (8, '总经办', 1, 0, '{\"Id\":142611064,\"Name\":\"总经办\",\"ParentId\":1,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (9, '技术部', 1, 0, '{\"Id\":142620036,\"Name\":\"技术部\",\"ParentId\":1,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (10, '前端', 9, 0, '{\"Id\":139519414,\"Name\":\"前端\",\"ParentId\":142620036,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (11, '后端', 9, 0, '{\"Id\":142341752,\"Name\":\"后端\",\"ParentId\":142620036,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (12, '运维', 9, 0, '{\"Id\":142496071,\"Name\":\"运维\",\"ParentId\":142620036,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (13, 'UI设计', 9, 0, '{\"Id\":142496629,\"Name\":\"UI设计\",\"ParentId\":142620036,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (14, '客户端', 9, 0, '{\"Id\":142515400,\"Name\":\"客户端\",\"ParentId\":142620036,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (15, '产品', 9, 0, '{\"Id\":142540419,\"Name\":\"产品\",\"ParentId\":142620036,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');
INSERT INTO `department` VALUES (16, '测试', 9, 0, '{\"Id\":142562183,\"Name\":\"测试\",\"ParentId\":142620036,\"Children\":null}', '2019-11-06 00:18:44', '2019-11-06 00:18:44');

-- ----------------------------
-- Table structure for domain
-- ----------------------------
DROP TABLE IF EXISTS `domain`;
CREATE TABLE `domain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `callbackurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '回调链接',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '说明',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标识',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '项目域表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of domain
-- ----------------------------
INSERT INTO `domain` VALUES (1, ' 权限中心', 'http://admin.bullteam.cn', ' 管理所有后台项目的菜单，权限，鉴权等', 'root', '2019-09-30 11:38:15', '2019-09-30 14:22:51');
INSERT INTO `domain` VALUES (2, 'crawlnovel小说', 'http://crawlnovel.bullteam.cn/admin', '此项目用来测试', 'crawlnovel', '2019-09-30 11:44:00', '2019-10-17 00:01:30');
INSERT INTO `domain` VALUES (3, '配置中心(demo)', 'http://zeus-admin-config.bullteam.cn', '配置中心(demo)', 'zeus-config', '2019-11-23 21:18:20', '2019-11-23 21:18:20');
INSERT INTO `domain` VALUES (4, '青橙CMS', 'http://lime.bullteam.cn', '青橙CMS', 'lime', '2020-05-09 16:41:57', '2020-05-09 16:41:57');

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '登录用户',
  `client` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录终端型号',
  `platform` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录系统',
  `login_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作信息',
  `login_status` tinyint(1) NULL DEFAULT NULL COMMENT '1 成功 0失败',
  `login_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登录时间',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip',
  `ip_location` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip地理位置',
  `operation_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `operation_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `last_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES (1, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2019-11-23 21:16:51', '124.15.122.53', '', '2019-11-23 21:16:51', 'POST /v1/users/login', '2019-11-23 21:16:51', '2019-11-23 21:16:51');
INSERT INTO `login_log` VALUES (2, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:70.0) Gecko/20100101 Firefox/70.0', 'Standard Login', 'Standard Login Success', 1, '2019-11-23 23:12:55', '27.209.123.0', '', '2019-11-23 23:12:55', 'POST /v1/users/login', '2019-11-23 23:12:55', '2019-11-23 23:12:55');
INSERT INTO `login_log` VALUES (3, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2019-11-23 23:36:45', '113.200.205.160', '', '2019-11-23 23:36:45', 'POST /v1/users/login', '2019-11-23 23:36:45', '2019-11-23 23:36:45');
INSERT INTO `login_log` VALUES (4, 2, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2019-11-24 09:06:40', '111.193.7.65', '', '2019-11-24 09:06:40', 'POST /v1/users/login', '2019-11-24 09:06:40', '2019-11-24 09:06:40');
INSERT INTO `login_log` VALUES (5, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2019-11-24 09:31:43', '183.238.79.10', '', '2019-11-24 09:31:43', 'POST /v1/users/login', '2019-11-24 09:31:43', '2019-11-24 09:31:43');
INSERT INTO `login_log` VALUES (6, 2, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2019-11-24 11:22:02', '113.65.33.144', '', '2019-11-24 11:22:02', 'POST /v1/users/login', '2019-11-24 11:22:02', '2019-11-24 11:22:02');
INSERT INTO `login_log` VALUES (7, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2019-11-24 15:35:24', '124.64.19.87', '', '2019-11-24 15:35:24', 'POST /v1/users/login', '2019-11-24 15:35:24', '2019-11-24 15:35:24');
INSERT INTO `login_log` VALUES (8, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2019-12-06 19:46:56', '218.19.46.219', '', '2019-12-06 19:46:56', 'POST /v1/users/login', '2019-12-06 19:46:56', '2019-12-06 19:46:56');
INSERT INTO `login_log` VALUES (9, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2019-12-06 20:13:05', '113.66.230.112', '', '2019-12-06 20:13:05', 'POST /v1/users/login', '2019-12-06 20:13:05', '2019-12-06 20:13:05');
INSERT INTO `login_log` VALUES (10, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2019-12-06 20:41:35', '203.187.160.86', '', '2019-12-06 20:41:35', 'POST /v1/users/login', '2019-12-06 20:41:35', '2019-12-06 20:41:35');
INSERT INTO `login_log` VALUES (11, 2, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2019-12-06 22:30:44', '180.174.182.126', '', '2019-12-06 22:30:44', 'POST /v1/users/login', '2019-12-06 22:30:44', '2019-12-06 22:30:44');
INSERT INTO `login_log` VALUES (12, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2019-12-06 23:01:04', '124.15.122.53', '', '2019-12-06 23:01:04', 'POST /v1/users/login', '2019-12-06 23:01:04', '2019-12-06 23:01:04');
INSERT INTO `login_log` VALUES (13, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-09 16:38:35', '121.68.156.236', '', '2020-05-09 16:38:35', 'POST /v1/users/login', '2020-05-09 16:38:35', '2020-05-09 16:38:35');
INSERT INTO `login_log` VALUES (14, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-09 16:45:58', '121.68.156.236', '', '2020-05-09 16:45:58', 'POST /v1/users/login', '2020-05-09 16:45:58', '2020-05-09 16:45:58');
INSERT INTO `login_log` VALUES (15, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-09 16:46:01', '121.68.156.236', '', '2020-05-09 16:46:01', 'POST /v1/users/login', '2020-05-09 16:46:01', '2020-05-09 16:46:01');
INSERT INTO `login_log` VALUES (16, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-09 16:46:31', '112.94.226.108', '', '2020-05-09 16:46:31', 'POST /v1/users/login', '2020-05-09 16:46:31', '2020-05-09 16:46:31');
INSERT INTO `login_log` VALUES (17, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-09 17:15:47', '121.68.156.236', '', '2020-05-09 17:15:47', 'POST /v1/users/login', '2020-05-09 17:15:47', '2020-05-09 17:15:47');
INSERT INTO `login_log` VALUES (18, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-09 17:15:52', '121.68.156.236', '', '2020-05-09 17:15:52', 'POST /v1/users/login', '2020-05-09 17:15:52', '2020-05-09 17:15:52');
INSERT INTO `login_log` VALUES (19, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-09 17:16:05', '121.68.156.236', '', '2020-05-09 17:16:05', 'POST /v1/users/login', '2020-05-09 17:16:05', '2020-05-09 17:16:05');
INSERT INTO `login_log` VALUES (20, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-09 17:17:35', '121.68.156.236', '', '2020-05-09 17:17:35', 'POST /v1/users/login', '2020-05-09 17:17:35', '2020-05-09 17:17:35');
INSERT INTO `login_log` VALUES (21, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-09 17:19:44', '121.68.156.236', '', '2020-05-09 17:19:44', 'POST /v1/users/login', '2020-05-09 17:19:44', '2020-05-09 17:19:44');
INSERT INTO `login_log` VALUES (22, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-09 19:29:31', '58.250.243.155', '', '2020-05-09 19:29:31', 'POST /v1/users/login', '2020-05-09 19:29:31', '2020-05-09 19:29:31');
INSERT INTO `login_log` VALUES (23, 2, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-10 09:21:42', '123.159.48.139', '', '2020-05-10 09:21:42', 'POST /v1/users/login', '2020-05-10 09:21:42', '2020-05-10 09:21:42');
INSERT INTO `login_log` VALUES (24, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-10 14:35:41', '113.89.5.50', '', '2020-05-10 14:35:41', 'POST /v1/users/login', '2020-05-10 14:35:41', '2020-05-10 14:35:41');
INSERT INTO `login_log` VALUES (25, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-10 18:55:52', '121.68.156.236', '', '2020-05-10 18:55:52', 'POST /v1/users/login', '2020-05-10 18:55:52', '2020-05-10 18:55:52');
INSERT INTO `login_log` VALUES (26, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-10 19:08:42', '121.68.156.236', '', '2020-05-10 19:08:42', 'POST /v1/users/login', '2020-05-10 19:08:42', '2020-05-10 19:08:42');
INSERT INTO `login_log` VALUES (27, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-10 20:03:03', '101.88.12.107', '', '2020-05-10 20:03:03', 'POST /v1/users/login', '2020-05-10 20:03:03', '2020-05-10 20:03:03');
INSERT INTO `login_log` VALUES (28, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-10 21:18:54', '110.184.199.19', '', '2020-05-10 21:18:54', 'POST /v1/users/login', '2020-05-10 21:18:54', '2020-05-10 21:18:54');
INSERT INTO `login_log` VALUES (29, 2, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-10 22:59:37', '183.129.232.226', '', '2020-05-10 22:59:37', 'POST /v1/users/login', '2020-05-10 22:59:37', '2020-05-10 22:59:37');
INSERT INTO `login_log` VALUES (30, 2, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-11 09:07:57', '113.200.54.58', '', '2020-05-11 09:07:57', 'POST /v1/users/login', '2020-05-11 09:07:57', '2020-05-11 09:07:57');
INSERT INTO `login_log` VALUES (31, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-11 14:25:38', '101.254.236.202', '', '2020-05-11 14:25:38', 'POST /v1/users/login', '2020-05-11 14:25:38', '2020-05-11 14:25:38');
INSERT INTO `login_log` VALUES (32, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-11 14:41:49', '117.62.172.178', '', '2020-05-11 14:41:49', 'POST /v1/users/login', '2020-05-11 14:41:49', '2020-05-11 14:41:49');
INSERT INTO `login_log` VALUES (33, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-11 14:42:38', '58.132.204.146', '', '2020-05-11 14:42:38', 'POST /v1/users/login', '2020-05-11 14:42:38', '2020-05-11 14:42:38');
INSERT INTO `login_log` VALUES (34, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-11 14:54:59', '171.221.240.73', '', '2020-05-11 14:54:59', 'POST /v1/users/login', '2020-05-11 14:54:59', '2020-05-11 14:54:59');
INSERT INTO `login_log` VALUES (35, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 Edg/81.0.416.72', 'Standard Login', 'Standard Login Success', 1, '2020-05-11 16:07:21', '47.57.174.235', '', '2020-05-11 16:07:21', 'POST /v1/users/login', '2020-05-11 16:07:21', '2020-05-11 16:07:21');
INSERT INTO `login_log` VALUES (36, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 Edg/81.0.416.72', 'Standard Login', 'Standard Login Success', 1, '2020-05-11 16:07:25', '47.57.174.235', '', '2020-05-11 16:07:25', 'POST /v1/users/login', '2020-05-11 16:07:25', '2020-05-11 16:07:25');
INSERT INTO `login_log` VALUES (37, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36 Edg/81.0.416.72', 'Standard Login', 'Standard Login Success', 1, '2020-05-11 16:07:28', '47.57.174.235', '', '2020-05-11 16:07:28', 'POST /v1/users/login', '2020-05-11 16:07:28', '2020-05-11 16:07:28');
INSERT INTO `login_log` VALUES (38, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-11 17:21:12', '112.94.22.13', '', '2020-05-11 17:21:12', 'POST /v1/users/login', '2020-05-11 17:21:12', '2020-05-11 17:21:12');
INSERT INTO `login_log` VALUES (39, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-11 17:29:16', '180.168.26.115', '', '2020-05-11 17:29:16', 'POST /v1/users/login', '2020-05-11 17:29:16', '2020-05-11 17:29:16');
INSERT INTO `login_log` VALUES (40, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-11 19:50:07', '121.68.156.236', '', '2020-05-11 19:50:07', 'POST /v1/users/login', '2020-05-11 19:50:07', '2020-05-11 19:50:07');
INSERT INTO `login_log` VALUES (41, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', 'Standard Login', 'Standard Login Success', 1, '2020-05-11 21:18:17', '121.68.156.236', '', '2020-05-11 21:18:17', 'POST /v1/users/login', '2020-05-11 21:18:17', '2020-05-11 21:18:17');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级菜单id',
  `domain_id` int(11) NOT NULL DEFAULT 0 COMMENT '项目域id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `url` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '路由url',
  `perms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权标识',
  `alias` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `menu_type` int(11) NOT NULL DEFAULT 0 COMMENT '类型 1=菜单 2=按钮',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `order_num` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_menu_domain_id`(`domain_id`) USING BTREE,
  INDEX `perms_index`(`perms`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, 1, '权限管理', '/permission', '', '', 1, 'peoples', 1, '2018-12-29 16:15:09', '2019-03-20 13:01:46');
INSERT INTO `menu` VALUES (2, 1, 1, '用户管理', '/permission/user', '', NULL, 1, 'peoples', 1, '2018-12-29 16:15:09', '2018-12-29 16:15:09');
INSERT INTO `menu` VALUES (3, 2, 1, '浏览', '', '/permission/user:show', 'get@/v1/users,get@/v1/usres/:id,get@/v1/users/:id/roles', 2, '', 1, '2018-12-29 16:15:09', '2018-12-29 16:15:09');
INSERT INTO `menu` VALUES (4, 2, 1, '添加', '', '/permission/user:add', 'post@/v1/users', 2, '', 2, '2018-12-29 16:15:09', '2018-12-29 16:15:09');
INSERT INTO `menu` VALUES (5, 2, 1, '修改', '', '/permission/user:edit', 'put@/v1/users/:id,put@/v1/users/:id/status', 2, '', 3, '2018-12-29 16:15:09', '2018-12-29 16:15:09');
INSERT INTO `menu` VALUES (6, 2, 1, '删除', '', '/permission/user:del', 'delete@/v1/users/:id', 2, '', 4, '2018-12-29 16:15:09', '2018-12-29 16:15:09');
INSERT INTO `menu` VALUES (7, 1, 1, '部门管理', '/permission/dept', '', NULL, 1, 'peoples', 2, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (8, 7, 1, '浏览', '', '/permission/dept:show', 'get@/v1/depts,get@/v1/depts/:id', 2, '', 1, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (9, 7, 1, '添加', '', '/permission/dept:add', 'post@/v1/depts', 2, '', 2, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (10, 7, 1, '修改', '', '/permission/dept:edit', 'put@/v1/depts/:id', 2, '', 3, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (11, 7, 1, '删除', '', '/permission/dept:del', 'delete@/v1/depts/:id', 2, '', 4, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (12, 1, 1, '角色管理', '/permission/role', '', NULL, 1, 'peoples', 3, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (13, 12, 1, '浏览', '', '/permission/role:show', 'get@/v1/roles,get@/v1/roles/:id', 2, '', 1, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (14, 12, 1, '添加', '', '/permission/role:add', 'post@/v1/roles', 2, '', 2, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (15, 12, 1, '修改', '', '/permission/role:edit', 'put@/v1/roles/:id', 2, '', 3, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (16, 12, 1, '删除', '', '/permission/role:del', 'delete@/v1/roles/:id', 2, '', 4, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (17, 0, 1, '系统设置', '/auth-system', '', NULL, 1, 'nested', 2, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (18, 17, 1, '菜单管理', '/auth-system/menu', '', NULL, 1, 'peoples', 1, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (19, 18, 1, '浏览', '', '/auth-system/menu:show', 'get@/v1/menus,get@/v1/menus/:id', 2, '', 1, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (20, 18, 1, '添加', '', '/auth-system/menu:add', 'post@/v1/menus', 2, '', 2, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (21, 18, 1, '修改', '', '/auth-system/menu:edit', 'put@/v1/menus/:id', 2, '', 3, '2018-12-29 16:15:10', '2018-12-29 16:15:10');
INSERT INTO `menu` VALUES (23, 17, 1, '项目管理', '/auth-system/domain', '', NULL, 1, 'peoples', 2, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (24, 23, 1, '浏览', '', '/auth-system/domain:show', 'get@/v1/domains,get@/v1/domains/:id', 2, '', 1, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (25, 23, 1, '添加', '', '/auth-system/domain:add', 'post@/v1/domains', 2, '', 2, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (26, 23, 1, '修改', '', '/auth-system/domain:edit', 'put@/v1/domains/:id', 2, '', 3, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (27, 23, 1, '删除', '', '/auth-system/domain:del', 'delete@/v1/domains/:id', 2, '', 4, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (29, 28, 1, '登录日志', '/logs/log_login', '', NULL, 1, 'peoples', 1, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (30, 29, 1, '浏览', '', '/logs/log_login:show', NULL, 2, '', 1, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (31, 29, 1, '添加', '', '/logs/log_login:add', NULL, 2, '', 2, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (32, 29, 1, '修改', '', '/logs/log_login:edit', NULL, 2, '', 3, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (33, 29, 1, '删除', '', '/logs/log_login:del', NULL, 2, '', 4, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (34, 28, 1, '操作日志', '/logs/log_operation', '', NULL, 1, 'peoples', 2, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (35, 34, 1, '浏览', '', '/logs/log_operation:show', NULL, 2, '', 1, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (36, 34, 1, '添加', '', '/logs/log_operation:add', NULL, 2, '', 2, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (37, 34, 1, '修改', '', '/logs/log_operation:edit', NULL, 2, '', 3, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (38, 34, 1, '删除', '', '/logs/log_operation:del', NULL, 2, '', 4, '2018-12-29 16:15:11', '2018-12-29 16:15:11');
INSERT INTO `menu` VALUES (39, 28, 1, '异常日志', '/logs/log_error', '', NULL, 1, 'peoples', 3, '2018-12-29 16:15:12', '2018-12-29 16:15:12');
INSERT INTO `menu` VALUES (40, 39, 1, '浏览', '', '/logs/log_error:show', NULL, 2, '', 1, '2018-12-29 16:15:12', '2018-12-29 16:15:12');
INSERT INTO `menu` VALUES (41, 39, 1, '添加', '', '/logs/log_error:add', NULL, 2, '', 2, '2018-12-29 16:15:12', '2018-12-29 16:15:12');
INSERT INTO `menu` VALUES (42, 39, 1, '修改', '', '/logs/log_error:edit', NULL, 2, '', 3, '2018-12-29 16:15:12', '2018-12-29 16:15:12');
INSERT INTO `menu` VALUES (43, 39, 1, '删除', '', '/logs/log_error:del', NULL, 2, '', 4, '2018-12-29 16:15:12', '2018-12-29 16:15:12');
INSERT INTO `menu` VALUES (66, 0, 0, '首页', 'admin/default', '', NULL, 1, 'size', 1, '2019-01-25 16:34:33', '2019-01-25 16:34:33');
INSERT INTO `menu` VALUES (70, 69, 1, '编辑角色', '', '/permission/role:edit', NULL, 1, 'bug', 1, '2019-01-28 10:46:42', '2019-10-15 23:20:09');
INSERT INTO `menu` VALUES (71, 17, 1, '数据权限', '/auth-system/dataPerm', '', NULL, 1, 'component', 1, '2019-07-08 10:53:55', '2019-07-08 10:53:55');
INSERT INTO `menu` VALUES (72, 71, 1, '添加', '', '/auth-system/dataPerm:add', 'post@/v1/datas', 2, '', 1, '2019-07-08 02:54:28', '2019-07-08 02:54:28');
INSERT INTO `menu` VALUES (73, 71, 1, '编辑', '', '/auth-system/dataPerm:edit', 'put@/v1/datas/:id', 2, '', 1, '2019-07-08 02:54:58', '2019-07-08 02:54:58');
INSERT INTO `menu` VALUES (74, 71, 1, '删除', '', '/auth-system/dataPerm:del', 'delete@/v1/datas/:id', 2, '', 1, '2019-07-08 02:55:15', '2019-07-08 02:55:15');
INSERT INTO `menu` VALUES (75, 71, 1, '浏览', '', '/auth-system/dataPerm:show', 'get@/v1/datas,get@/v1/datas/:id', 2, '', 1, '2019-07-08 02:55:33', '2019-07-08 02:55:33');
INSERT INTO `menu` VALUES (76, 18, 1, '删除', '', '/auth-system/menu:del', 'delete@/v1/menus/:id', 2, '', 3, '2019-07-08 02:55:33', '2019-07-08 02:55:33');
INSERT INTO `menu` VALUES (77, 0, 2, '任务管理', '', '', NULL, 0, 'component', 1, '2019-10-15 23:15:35', '2019-10-15 23:15:35');
INSERT INTO `menu` VALUES (78, 77, 2, '任务管理', '/taskmanage/list', '/taskmanage/list', NULL, 1, 'clipboard', 1, '2019-10-15 23:17:22', '2019-10-15 23:17:30');
INSERT INTO `menu` VALUES (79, 77, 2, '任务详情', '/taskmanage/details/:id', '/taskmanage/details/:id', NULL, 1, 'documentation', 1, '2019-10-15 23:18:08', '2019-10-15 23:18:08');
INSERT INTO `menu` VALUES (80, 77, 2, '添加任务', '/taskmanage/create', '/taskmanage/create', NULL, 1, 'documentation', 1, '2019-10-15 23:18:31', '2019-10-15 23:18:31');
INSERT INTO `menu` VALUES (83, 0, 1, '日志管理', '', '', NULL, 0, 'table', 1, '2019-10-20 21:22:56', '2019-10-20 21:22:56');
INSERT INTO `menu` VALUES (84, 83, 1, '登录日志', '/logs/log_login', '', NULL, 1, 'clipboard', 1, '2019-10-20 21:25:06', '2019-10-20 21:25:06');
INSERT INTO `menu` VALUES (85, 83, 1, '操作日志', '/logs/log_operation', '', NULL, 1, 'documentation', 1, '2019-10-20 21:25:39', '2019-10-20 21:25:39');
INSERT INTO `menu` VALUES (86, 84, 1, '浏览', '', '/logs/log_login:show', 'get@/v1/log/logins,get@/v1/log/login/:id', 2, '', 1, '2019-10-20 21:30:09', '2019-10-20 21:30:09');
INSERT INTO `menu` VALUES (87, 84, 1, '添加', '', '/logs/log_login:add', NULL, 2, '', 1, '2019-10-20 21:30:53', '2019-10-20 21:30:53');
INSERT INTO `menu` VALUES (88, 84, 1, '修改', '', '/logs/log_login:edit', NULL, 2, '', 1, '2019-10-20 21:31:17', '2019-10-20 21:31:17');
INSERT INTO `menu` VALUES (89, 84, 1, '删除', '', '/logs/log_login:del', NULL, 2, '', 1, '2019-10-20 21:31:39', '2019-10-20 21:31:39');
INSERT INTO `menu` VALUES (90, 85, 1, '浏览', '', '/v1/log/operations:get', 'get@/v1/log/operations,get@/v1/log/operations/:id', 2, '', 1, '2019-10-20 21:32:36', '2019-10-20 21:32:36');
INSERT INTO `menu` VALUES (91, 85, 1, '添加', '', '/logs/log_operation:add', NULL, 2, '', 1, '2019-10-20 21:32:56', '2019-10-20 21:32:56');
INSERT INTO `menu` VALUES (92, 85, 1, '修改', '', '/logs/log_operation:edit', NULL, 2, '', 1, '2019-10-20 21:33:16', '2019-10-20 21:33:16');
INSERT INTO `menu` VALUES (93, 85, 1, '删除', '', '/logs/log_operation:del', NULL, 2, '', 1, '2019-10-20 21:33:44', '2019-10-20 21:33:44');
INSERT INTO `menu` VALUES (94, 0, 1, '配置管理', '', '', NULL, 0, 'dashboard', 1, '2019-10-20 21:33:44', '2019-10-20 21:33:44');
INSERT INTO `menu` VALUES (95, 94, 1, 'Ldap设置', '/setting/auth', '/setting/auth', NULL, 1, 'lock', 1, '2019-10-20 21:33:44', '2019-10-20 21:33:44');
INSERT INTO `menu` VALUES (96, 94, 1, 'Email设置', '/setting/email', '/setting/email', NULL, 1, 'lock', 1, '2019-10-20 21:33:44', '2019-10-20 21:33:44');
INSERT INTO `menu` VALUES (97, 96, 1, '详情', '', '/setting/auth:show', 'get@/v1/setting/email,post@/v1/setting/email', 2, '', 1, '2019-11-03 11:17:54', '2019-11-03 11:19:42');
INSERT INTO `menu` VALUES (98, 95, 1, '详情', '', '/setting/ldap:show', 'get@/v1/setting/ldap,post@/v1/setting/ldap', 2, '', 1, '2019-11-03 11:23:15', '2019-11-03 11:28:06');
INSERT INTO `menu` VALUES (99, 94, 1, '钉钉设置', '/setting/dingtalk', '', '', 1, 'example', 1, '2019-11-06 00:16:36', '2019-11-06 00:16:36');
INSERT INTO `menu` VALUES (100, 99, 1, '同步', '', '/setting/auth:sync', 'get@/v1/setting/sync/dingtalk', 2, '', 1, '2019-11-06 00:17:58', '2019-11-06 00:17:58');
INSERT INTO `menu` VALUES (101, 0, 3, '配置管理', '', '', '', 0, 'component', 1, '2019-11-23 21:18:49', '2019-11-23 21:18:49');
INSERT INTO `menu` VALUES (103, 101, 3, '配置列表', '/configlist/list', '', '', 1, '', 1, '2019-12-06 20:15:01', '2019-12-06 20:15:01');
INSERT INTO `menu` VALUES (104, 103, 3, '查看', '', '/configlist/list', '', 2, '', 1, '2019-12-06 20:15:17', '2019-12-06 20:15:27');
INSERT INTO `menu` VALUES (105, 0, 4, '内容管理', '', '', '', 0, 'component', 1, '2020-05-09 17:08:25', '2020-05-09 17:08:25');
INSERT INTO `menu` VALUES (106, 105, 4, '分类列表', '/novel/categories', '', '', 1, 'chart', 1, '2020-05-09 17:09:31', '2020-05-10 21:45:10');
INSERT INTO `menu` VALUES (108, 106, 4, '浏览', '', '/novel/category', 'get@/novel/categories,get@/novel/category/:id', 2, '', 1, '2020-05-09 17:29:01', '2020-05-10 14:58:39');
INSERT INTO `menu` VALUES (109, 106, 4, '添加', '', '/novel/categories:add', 'post@/novel/categories', 2, '', 1, '2020-05-10 15:00:08', '2020-05-10 15:00:08');
INSERT INTO `menu` VALUES (110, 106, 4, '修改', '', '/novel/categories:edit', 'put@/novel/categories/:id', 2, '', 1, '2020-05-10 15:01:10', '2020-05-10 15:01:10');
INSERT INTO `menu` VALUES (111, 106, 4, '删除', '', '/novel/categories:del', 'delete@/novel/categories/:id', 2, '', 1, '2020-05-10 15:02:00', '2020-05-10 15:02:00');
INSERT INTO `menu` VALUES (112, 105, 4, '小说列表', '/novel/books', '', '', 1, 'chart', 1, '2020-05-10 21:40:27', '2020-05-10 21:44:55');
INSERT INTO `menu` VALUES (113, 112, 4, '浏览', '', '/novel/books', 'get@/novel/books,get@/novel/books/:id', 2, '', 1, '2020-05-10 21:41:45', '2020-05-10 21:42:03');
INSERT INTO `menu` VALUES (114, 112, 4, '添加', '', '/novel/books:add', 'post@/novel/books', 2, '', 1, '2020-05-10 21:42:51', '2020-05-10 21:42:51');
INSERT INTO `menu` VALUES (115, 112, 4, '修改', '', '/novel/books:edit', 'put@/novel/books/:id', 2, '', 1, '2020-05-10 21:43:30', '2020-05-10 21:43:30');
INSERT INTO `menu` VALUES (116, 112, 4, '删除', '', '/novel/books:del', 'delete@/novel/books/:id', 2, '', 1, '2020-05-10 21:44:16', '2020-05-10 21:44:16');
INSERT INTO `menu` VALUES (117, 105, 4, '评论列表', '/novel/comments', '', '', 1, 'documentation', 1, '2020-05-10 21:46:36', '2020-05-10 21:46:36');
INSERT INTO `menu` VALUES (118, 117, 4, '浏览', '', '/novel/comments', 'get@/novel/comments,get@/novel/comments/:id', 2, '', 1, '2020-05-10 21:47:38', '2020-05-10 21:47:38');
INSERT INTO `menu` VALUES (119, 117, 4, '添加', '', '/novel/comments:add', 'post@/novel/comments', 2, '', 1, '2020-05-10 21:48:34', '2020-05-10 21:48:34');
INSERT INTO `menu` VALUES (120, 117, 4, '删除', '', '/novel/comments:del', 'delete@/novel/comments/:id', 2, '', 1, '2020-05-10 21:49:36', '2020-05-10 21:49:36');
INSERT INTO `menu` VALUES (121, 3, 1, '测试', '', '1', '1', 2, '', 1, '2020-05-11 17:34:38', '2020-05-11 17:34:38');

-- ----------------------------
-- Table structure for menu_perm_alias
-- ----------------------------
DROP TABLE IF EXISTS `menu_perm_alias`;
CREATE TABLE `menu_perm_alias`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perms` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标识',
  `alias` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '别名',
  `domain_id` int(11) NULL DEFAULT 0 COMMENT '所属项目',
  `created_time` int(11) NULL DEFAULT NULL,
  `updated_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `perms_index`(`perms`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限alias表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_perm_alias
-- ----------------------------
INSERT INTO `menu_perm_alias` VALUES (1, '/permission/user:edit', 'put@/v1/users/:id', 1, 1572605085, 1572605085);
INSERT INTO `menu_perm_alias` VALUES (2, '/permission/user:edit', 'put@/v1/users/:id/status', 1, 1572605085, 1572605085);
INSERT INTO `menu_perm_alias` VALUES (3, '/permission/user:add', 'post@/v1/users', 1, 1572605095, 1572605095);
INSERT INTO `menu_perm_alias` VALUES (4, '/permission/user:del', 'delete@/v1/users/:id', 1, 1572605103, 1572605103);
INSERT INTO `menu_perm_alias` VALUES (5, '/permission/dept:add', 'post@/v1/depts', 1, 1572605351, 1572605351);
INSERT INTO `menu_perm_alias` VALUES (6, '/permission/dept:edit', 'put@/v1/depts/:id', 1, 1572605380, 1572605380);
INSERT INTO `menu_perm_alias` VALUES (7, '/permission/dept:show', 'get@/v1/depts', 1, 1572605399, 1572605399);
INSERT INTO `menu_perm_alias` VALUES (8, '/permission/dept:show', 'get@/v1/depts/:id', 1, 1572605399, 1572605399);
INSERT INTO `menu_perm_alias` VALUES (9, '/permission/dept:del', 'delete@/v1/depts/:id', 1, 1572605425, 1572605425);
INSERT INTO `menu_perm_alias` VALUES (10, '/permission/role:add', 'post@/v1/roles', 1, 1572605517, 1572605517);
INSERT INTO `menu_perm_alias` VALUES (11, '/permission/role:edit', 'put@/v1/roles/:id', 1, 1572605530, 1572605530);
INSERT INTO `menu_perm_alias` VALUES (12, '/permission/role:del', 'delete@/v1/roles/:id', 1, 1572605547, 1572605547);
INSERT INTO `menu_perm_alias` VALUES (13, '/auth-system/menu:show', 'get@/v1/menus', 1, 1572605627, 1572605627);
INSERT INTO `menu_perm_alias` VALUES (14, '/auth-system/menu:show', 'get@/v1/menus/:id', 1, 1572605627, 1572605627);
INSERT INTO `menu_perm_alias` VALUES (15, '/auth-system/menu:add', 'post@/v1/menus', 1, 1572605647, 1572605647);
INSERT INTO `menu_perm_alias` VALUES (16, '/auth-system/menu:edit', 'put@/v1/menus/:id', 1, 1572605660, 1572605660);
INSERT INTO `menu_perm_alias` VALUES (17, '/auth-system/menu:del', 'delete@/v1/menus/:id', 1, 1572605672, 1572605672);
INSERT INTO `menu_perm_alias` VALUES (18, '/auth-system/domain:show', 'get@/v1/domains', 1, 1572605721, 1572605721);
INSERT INTO `menu_perm_alias` VALUES (19, '/auth-system/domain:show', 'get@/v1/domains/:id', 1, 1572605721, 1572605721);
INSERT INTO `menu_perm_alias` VALUES (20, '/auth-system/domain:add', 'post@/v1/domains', 1, 1572605734, 1572605734);
INSERT INTO `menu_perm_alias` VALUES (21, '/auth-system/domain:edit', 'put@/v1/domains/:id', 1, 1572605760, 1572605760);
INSERT INTO `menu_perm_alias` VALUES (22, '/auth-system/domain:del', 'delete@/v1/domains/:id', 1, 1572605790, 1572605790);
INSERT INTO `menu_perm_alias` VALUES (23, '/auth-system/dataPerm:show', 'get@/v1/datas', 1, 1572693705, 1572693705);
INSERT INTO `menu_perm_alias` VALUES (24, '/auth-system/dataPerm:show', 'get@/v1/datas/:id', 1, 1572693705, 1572693705);
INSERT INTO `menu_perm_alias` VALUES (25, '/auth-system/dataPerm:add', 'post@/v1/datas', 1, 1572693777, 1572693777);
INSERT INTO `menu_perm_alias` VALUES (26, '/auth-system/dataPerm:edit', 'put@/v1/datas/:id', 1, 1572693793, 1572693793);
INSERT INTO `menu_perm_alias` VALUES (27, '/auth-system/dataPerm:del', 'delete@/v1/datas/:id', 1, 1572693808, 1572693808);
INSERT INTO `menu_perm_alias` VALUES (28, '/logs/log_login:show', 'get@/v1/log/logins', 1, 1572693965, 1572693965);
INSERT INTO `menu_perm_alias` VALUES (29, '/logs/log_login:show', 'get@/v1/log/login/:id', 1, 1572693965, 1572693965);
INSERT INTO `menu_perm_alias` VALUES (30, '/v1/log/operations:get', 'get@/v1/log/operations', 1, 1572694099, 1572694099);
INSERT INTO `menu_perm_alias` VALUES (31, '/v1/log/operations:get', 'get@/v1/log/operations/:id', 1, 1572694099, 1572694099);
INSERT INTO `menu_perm_alias` VALUES (32, '/permission/role:show', 'get@/v1/roles', 1, 1572694205, 1572694205);
INSERT INTO `menu_perm_alias` VALUES (33, '/permission/role:show', 'get@/v1/roles/:id', 1, 1572694205, 1572694205);
INSERT INTO `menu_perm_alias` VALUES (34, '/permission/user:show', 'get@/v1/users', 1, 1572694219, 1572694219);
INSERT INTO `menu_perm_alias` VALUES (35, '/permission/user:show', 'get@/v1/usres/:id', 1, 1572694219, 1572694219);
INSERT INTO `menu_perm_alias` VALUES (36, '/permission/user:show', 'get@/v1/users/:id/roles', 1, 1572694219, 1572694219);
INSERT INTO `menu_perm_alias` VALUES (48, '/setting/auth:show', 'get@/v1/setting/email', 1, 1572752275, 1572752275);
INSERT INTO `menu_perm_alias` VALUES (49, '/setting/auth:show', 'post@/v1/setting/email', 1, 1572752275, 1572752275);
INSERT INTO `menu_perm_alias` VALUES (50, '/setting/ldap:show', 'get@/v1/setting/ldap', 1, 1572752282, 1572752282);
INSERT INTO `menu_perm_alias` VALUES (51, '/setting/ldap:show', 'post@/v1/setting/ldap', 1, 1572752282, 1572752282);
INSERT INTO `menu_perm_alias` VALUES (52, '/permission/dept:del', 'post@/v1/depts/:id/check-no-member', 1, 1572605425, 1572605425);
INSERT INTO `menu_perm_alias` VALUES (53, '/setting/auth:sync', 'get@/v1/setting/sync/dingtalk', 1, 1572970678, 1572970678);
INSERT INTO `menu_perm_alias` VALUES (56, '', '', 3, 1575634501, 1575634501);
INSERT INTO `menu_perm_alias` VALUES (58, '/configlist/list', '', 3, 1575634527, 1575634527);
INSERT INTO `menu_perm_alias` VALUES (62, 'category/list', 'category/list', 4, 1589016541, 1589016541);
INSERT INTO `menu_perm_alias` VALUES (63, '/novel/category', 'get@/novel/categories', 4, 1589093919, 1589093919);
INSERT INTO `menu_perm_alias` VALUES (64, '/novel/category', 'get@/novel/category/:id', 4, 1589093919, 1589093919);
INSERT INTO `menu_perm_alias` VALUES (65, '/novel/categories:add', 'post@/novel/categories', 4, 1589094008, 1589094008);
INSERT INTO `menu_perm_alias` VALUES (66, '/novel/categories:edit', 'put@/novel/categories/:id', 4, 1589094070, 1589094070);
INSERT INTO `menu_perm_alias` VALUES (67, '/novel/categories:del', 'delete@/novel/categories/:id', 4, 1589094120, 1589094120);
INSERT INTO `menu_perm_alias` VALUES (68, '', '', 4, 1589118027, 1589118027);
INSERT INTO `menu_perm_alias` VALUES (71, '/novel/books', 'get@/novel/books', 4, 1589118123, 1589118123);
INSERT INTO `menu_perm_alias` VALUES (72, '/novel/books', 'get@/novel/books/:id', 4, 1589118123, 1589118123);
INSERT INTO `menu_perm_alias` VALUES (73, '/novel/books:add', 'post@/novel/books', 4, 1589118171, 1589118171);
INSERT INTO `menu_perm_alias` VALUES (74, '/novel/books:edit', 'put@/novel/books/:id', 4, 1589118210, 1589118210);
INSERT INTO `menu_perm_alias` VALUES (75, '/novel/books:del', 'delete@/novel/books/:id', 4, 1589118256, 1589118256);
INSERT INTO `menu_perm_alias` VALUES (76, '', '', 4, 1589118396, 1589118396);
INSERT INTO `menu_perm_alias` VALUES (77, '/novel/comments', 'get@/novel/comments', 4, 1589118458, 1589118458);
INSERT INTO `menu_perm_alias` VALUES (78, '/novel/comments', 'get@/novel/comments/:id', 4, 1589118458, 1589118458);
INSERT INTO `menu_perm_alias` VALUES (79, '/novel/comments:add', 'post@/novel/comments', 4, 1589118514, 1589118514);
INSERT INTO `menu_perm_alias` VALUES (80, '/novel/comments:del', 'delete@/novel/comments/:id', 4, 1589118576, 1589118576);
INSERT INTO `menu_perm_alias` VALUES (81, '1', '1', 1, 1589189678, 1589189678);

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日志编号',
  `module` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作模块',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求地址',
  `operation_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作方法',
  `params` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求参数',
  `exception_stack` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '异常堆栈信息',
  `operation_result` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作结果',
  `operation_success` tinyint(1) NULL DEFAULT NULL COMMENT '操作结果 1 成功/2 失败',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人员',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip',
  `ip_location` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip地理位置',
  `operation_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `operation_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `last_update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 956 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_log
-- ----------------------------
INSERT INTO `operation_log` VALUES (1, '', '', '/v1/domains', 'POST', '{\"id\":0,\"name\":\"配置中心(demo)\",\"callbackurl\":\"http://zeus-admin-config.bullteam.cn\",\"remark\":\"配置中心(demo)\",\"code\":\"zeus-config\",\"CreateTime\":\"0001-01-01T00:00:00Z\",\"LastLoginTime\":\"0001-01-01T00:00:00Z\"}', '', 'success', 1, 2, '124.15.122.53', '', '2019-11-23 21:18:20', 'Create Domain', '2019-11-23 21:18:20', '2019-11-23 21:18:20');
INSERT INTO `operation_log` VALUES (2, '', '', '/v1/menus', 'POST', '{\"name\":\"配置管理\",\"parent_id\":0,\"domain_id\":3,\"url\":\"\",\"perms\":\"\",\"alias\":\"\",\"menu_type\":0,\"icon\":\"component\",\"order_num\":1}', '', 'success', 1, 2, '124.15.122.53', '', '2019-11-23 21:18:49', 'Create Menu', '2019-11-23 21:18:49', '2019-11-23 21:18:49');
INSERT INTO `operation_log` VALUES (3, '', '', '/v1/menus', 'POST', '{\"name\":\"配置列表\",\"parent_id\":101,\"domain_id\":3,\"url\":\"/configlist/list\",\"perms\":\"\",\"alias\":\"\",\"menu_type\":1,\"icon\":\"chart\",\"order_num\":1}', '', 'success', 1, 2, '124.15.122.53', '', '2019-11-23 21:19:52', 'Create Menu', '2019-11-23 21:19:52', '2019-11-23 21:19:52');
INSERT INTO `operation_log` VALUES (4, '', '', '/v1/roles', 'POST', '{\"name\":\"zeus配置中心\",\"domain_id\":3,\"role_name\":\"zeus配置中心\",\"remark\":\"\",\"menu_ids\":\"101,102\",\"menu_ids_ele\":\"101,102\",\"data_perm_ids\":\"\"}', '', 'success', 1, 2, '124.15.122.53', '', '2019-11-23 21:28:26', 'Create Role', '2019-11-23 21:28:26', '2019-11-23 21:28:26');
INSERT INTO `operation_log` VALUES (5, '', '', '/v1/depts', 'POST', '{\"id\":0,\"name\":\"test\",\"parent_id\":0,\"order_num\":0,\"CreateTime\":\"0001-01-01T00:00:00Z\",\"UpdateTime\":\"0001-01-01T00:00:00Z\"}', '', 'success', 1, 2, '120.229.9.224', '', '2019-11-24 00:53:01', 'Create Department', '2019-11-24 00:53:01', '2019-11-24 00:53:01');
INSERT INTO `operation_log` VALUES (6, '', '', '/v1/menus/102', 'DELETE', '{\"id\":102}', '', 'success', 1, 2, '113.66.230.112', '', '2019-12-06 20:14:44', 'Delete Menu', '2019-12-06 20:14:44', '2019-12-06 20:14:44');
INSERT INTO `operation_log` VALUES (7, '', '', '/v1/menus', 'POST', '{\"name\":\"配置列表\",\"parent_id\":101,\"domain_id\":3,\"url\":\"/configlist/list\",\"perms\":\"\",\"alias\":\"\",\"menu_type\":1,\"icon\":\"\",\"order_num\":1}', '', 'success', 1, 2, '113.66.230.112', '', '2019-12-06 20:15:01', 'Create Menu', '2019-12-06 20:15:01', '2019-12-06 20:15:01');
INSERT INTO `operation_log` VALUES (8, '', '', '/v1/menus', 'POST', '{\"name\":\"查看\",\"parent_id\":0,\"domain_id\":3,\"url\":\"\",\"perms\":\"/configlist/list\",\"alias\":\"\",\"menu_type\":2,\"icon\":\"\",\"order_num\":1}', '', 'success', 1, 2, '113.66.230.112', '', '2019-12-06 20:15:17', 'Create Menu', '2019-12-06 20:15:17', '2019-12-06 20:15:17');
INSERT INTO `operation_log` VALUES (9, '', '', '/v1/menus/104', 'PUT', '{\"id\":104,\"name\":\"查看\",\"parent_id\":103,\"domain_id\":3,\"url\":\"\",\"perms\":\"/configlist/list\",\"alias\":\"\",\"menu_type\":2,\"icon\":\"\",\"order_num\":1}', '', 'success', 1, 2, '113.66.230.112', '', '2019-12-06 20:15:27', 'Edit Menu', '2019-12-06 20:15:27', '2019-12-06 20:15:27');
INSERT INTO `operation_log` VALUES (10, '', '', '/v1/depts/2', 'PUT', '{\"id\":2,\"name\":\"人事部1\",\"order_num\":0}', '', 'success', 1, 2, '203.187.160.86', '', '2019-12-06 20:44:07', 'Edit Department', '2019-12-06 20:44:07', '2019-12-06 20:44:07');
INSERT INTO `operation_log` VALUES (11, '', '', '/v1/domains', 'POST', '{\"id\":0,\"name\":\"的说法\",\"callbackurl\":\"mxd.com\",\"remark\":\"的说法\",\"code\":\"xccxxc\",\"CreateTime\":\"0001-01-01T00:00:00Z\",\"LastLoginTime\":\"0001-01-01T00:00:00Z\"}', '', 'success', 1, 2, '203.187.160.86', '', '2019-12-06 20:44:52', 'Create Domain', '2019-12-06 20:44:52', '2019-12-06 20:44:52');
INSERT INTO `operation_log` VALUES (12, '', '', '/v1/roles/5', 'PUT', '{\"id\":5,\"name\":\"zeus配置中心\",\"domain_id\":3,\"remark\":\"\",\"menu_ids\":\"101,103,104\",\"menu_ids_ele\":\"101,103,104\",\"data_perm_ids\":\"\"}', '', 'success', 1, 2, '124.15.122.53', '', '2019-12-06 23:01:37', 'Edit Role', '2019-12-06 23:01:37', '2019-12-06 23:01:37');
INSERT INTO `operation_log` VALUES (13, '', '', '/v1/domains/4', 'DELETE', '{\"id\":4}', '', 'success', 1, 2, '124.15.122.53', '', '2019-12-06 23:28:32', 'Delete Domain', '2019-12-06 23:28:32', '2019-12-06 23:28:32');
INSERT INTO `operation_log` VALUES (14, '', '', '/v1/depts/17', 'DELETE', '{\"id\":17}', '', 'success', 1, 2, '124.15.122.53', '', '2019-12-06 23:29:25', 'Delete Department', '2019-12-06 23:29:25', '2019-12-06 23:29:25');
INSERT INTO `operation_log` VALUES (15, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:35', '-', '2020-05-09 16:38:35', '2020-05-09 16:38:35');
INSERT INTO `operation_log` VALUES (16, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:36', '-', '2020-05-09 16:38:36', '2020-05-09 16:38:36');
INSERT INTO `operation_log` VALUES (17, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:36', '-', '2020-05-09 16:38:36', '2020-05-09 16:38:36');
INSERT INTO `operation_log` VALUES (18, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:43', '-', '2020-05-09 16:38:43', '2020-05-09 16:38:43');
INSERT INTO `operation_log` VALUES (19, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:43', '-', '2020-05-09 16:38:43', '2020-05-09 16:38:43');
INSERT INTO `operation_log` VALUES (20, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:43', '-', '2020-05-09 16:38:43', '2020-05-09 16:38:43');
INSERT INTO `operation_log` VALUES (21, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:43', '-', '2020-05-09 16:38:43', '2020-05-09 16:38:43');
INSERT INTO `operation_log` VALUES (22, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:45', '-', '2020-05-09 16:38:45', '2020-05-09 16:38:45');
INSERT INTO `operation_log` VALUES (23, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:46', '-', '2020-05-09 16:38:46', '2020-05-09 16:38:46');
INSERT INTO `operation_log` VALUES (24, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:46', '-', '2020-05-09 16:38:46', '2020-05-09 16:38:46');
INSERT INTO `operation_log` VALUES (25, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:51', '-', '2020-05-09 16:38:51', '2020-05-09 16:38:51');
INSERT INTO `operation_log` VALUES (26, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:52', '-', '2020-05-09 16:38:52', '2020-05-09 16:38:52');
INSERT INTO `operation_log` VALUES (27, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:38:55', '-', '2020-05-09 16:38:55', '2020-05-09 16:38:55');
INSERT INTO `operation_log` VALUES (28, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:39:03', '-', '2020-05-09 16:39:03', '2020-05-09 16:39:03');
INSERT INTO `operation_log` VALUES (29, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:39:03', '-', '2020-05-09 16:39:03', '2020-05-09 16:39:03');
INSERT INTO `operation_log` VALUES (30, '', '', '/v1/log/logins', 'GET', '[GET] -> {\"end_time\":[\"2020-05-09 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-09 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:39:10', '-', '2020-05-09 16:39:10', '2020-05-09 16:39:10');
INSERT INTO `operation_log` VALUES (31, '', '', '/v1/log/operations', 'GET', '[GET] -> {\"end_time\":[\"2020-05-09 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-09 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:39:15', '-', '2020-05-09 16:39:15', '2020-05-09 16:39:15');
INSERT INTO `operation_log` VALUES (32, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:39:18', '-', '2020-05-09 16:39:18', '2020-05-09 16:39:18');
INSERT INTO `operation_log` VALUES (33, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:39:48', '-', '2020-05-09 16:39:48', '2020-05-09 16:39:48');
INSERT INTO `operation_log` VALUES (34, '', '', '/v1/domains', 'POST', '[GET] -> {} | [POST] -> id=1096&name=%E9%9D%92%E6%A9%99CMS&code=lime&remark=%E9%9D%92%E6%A9%99CMS&callbackurl=http%3A%2F%2Flime.bullteam.cn&author=vue-element-admin', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:41:57', '-', '2020-05-09 16:41:57', '2020-05-09 16:41:57');
INSERT INTO `operation_log` VALUES (35, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:41:57', '-', '2020-05-09 16:41:57', '2020-05-09 16:41:57');
INSERT INTO `operation_log` VALUES (36, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"zeus-config\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:42:54', '-', '2020-05-09 16:42:54', '2020-05-09 16:42:54');
INSERT INTO `operation_log` VALUES (37, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:43:43', '-', '2020-05-09 16:43:43', '2020-05-09 16:43:43');
INSERT INTO `operation_log` VALUES (38, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:44:02', '-', '2020-05-09 16:44:02', '2020-05-09 16:44:02');
INSERT INTO `operation_log` VALUES (39, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:44:03', '-', '2020-05-09 16:44:03', '2020-05-09 16:44:03');
INSERT INTO `operation_log` VALUES (40, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:44:05', '-', '2020-05-09 16:44:05', '2020-05-09 16:44:05');
INSERT INTO `operation_log` VALUES (41, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=3\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:44:08', '-', '2020-05-09 16:44:08', '2020-05-09 16:44:08');
INSERT INTO `operation_log` VALUES (42, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:45:58', '-', '2020-05-09 16:45:58', '2020-05-09 16:45:58');
INSERT INTO `operation_log` VALUES (43, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:46:01', '-', '2020-05-09 16:46:01', '2020-05-09 16:46:01');
INSERT INTO `operation_log` VALUES (44, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:46:14', '-', '2020-05-09 16:46:14', '2020-05-09 16:46:14');
INSERT INTO `operation_log` VALUES (45, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:46:16', '-', '2020-05-09 16:46:16', '2020-05-09 16:46:16');
INSERT INTO `operation_log` VALUES (46, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 16:46:17', '-', '2020-05-09 16:46:17', '2020-05-09 16:46:17');
INSERT INTO `operation_log` VALUES (47, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.226.108', '', '2020-05-09 16:46:31', '-', '2020-05-09 16:46:31', '2020-05-09 16:46:31');
INSERT INTO `operation_log` VALUES (48, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.226.108', '', '2020-05-09 16:46:31', '-', '2020-05-09 16:46:31', '2020-05-09 16:46:31');
INSERT INTO `operation_log` VALUES (49, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.226.108', '', '2020-05-09 16:46:31', '-', '2020-05-09 16:46:31', '2020-05-09 16:46:31');
INSERT INTO `operation_log` VALUES (50, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.226.108', '', '2020-05-09 16:46:42', '-', '2020-05-09 16:46:42', '2020-05-09 16:46:42');
INSERT INTO `operation_log` VALUES (51, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.226.108', '', '2020-05-09 16:46:42', '-', '2020-05-09 16:46:42', '2020-05-09 16:46:42');
INSERT INTO `operation_log` VALUES (52, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:07:38', '-', '2020-05-09 17:07:38', '2020-05-09 17:07:38');
INSERT INTO `operation_log` VALUES (53, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:07:38', '-', '2020-05-09 17:07:38', '2020-05-09 17:07:38');
INSERT INTO `operation_log` VALUES (54, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:07:42', '-', '2020-05-09 17:07:42', '2020-05-09 17:07:42');
INSERT INTO `operation_log` VALUES (55, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1122&name=%E5%86%85%E5%AE%B9%E7%AE%A1%E7%90%86&menu_type=0&url=&order_num=1&perms=&icon=component&parents%5B0%5D=0&author=vue-element-admin&domain_id=4&parent_id=0', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:08:25', '-', '2020-05-09 17:08:25', '2020-05-09 17:08:25');
INSERT INTO `operation_log` VALUES (56, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:08:25', '-', '2020-05-09 17:08:25', '2020-05-09 17:08:25');
INSERT INTO `operation_log` VALUES (57, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1059&name=%E5%88%86%E7%B1%BB%E5%88%97%E8%A1%A8&menu_type=1&url=category%2Flist&order_num=1&perms=&icon=chart&parents%5B0%5D=0&parents%5B1%5D=105&author=vue-element-admin&domain_id=4&parent_id=105', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:09:31', '-', '2020-05-09 17:09:31', '2020-05-09 17:09:31');
INSERT INTO `operation_log` VALUES (58, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:09:31', '-', '2020-05-09 17:09:31', '2020-05-09 17:09:31');
INSERT INTO `operation_log` VALUES (59, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=3\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:09:44', '-', '2020-05-09 17:09:44', '2020-05-09 17:09:44');
INSERT INTO `operation_log` VALUES (60, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:09:52', '-', '2020-05-09 17:09:52', '2020-05-09 17:09:52');
INSERT INTO `operation_log` VALUES (61, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1068&name=%E5%88%97%E8%A1%A8%E6%9F%A5%E7%9C%8B&menu_type=1&url=category%2Flist&order_num=1&perms=&icon=clipboard&parents%5B0%5D=0&parents%5B1%5D=105&parents%5B2%5D=106&author=vue-element-admin&domain_id=4&parent_id=106', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:10:15', '-', '2020-05-09 17:10:15', '2020-05-09 17:10:15');
INSERT INTO `operation_log` VALUES (62, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:10:15', '-', '2020-05-09 17:10:15', '2020-05-09 17:10:15');
INSERT INTO `operation_log` VALUES (63, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:15:47', '-', '2020-05-09 17:15:47', '2020-05-09 17:15:47');
INSERT INTO `operation_log` VALUES (64, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:15:52', '-', '2020-05-09 17:15:52', '2020-05-09 17:15:52');
INSERT INTO `operation_log` VALUES (65, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:16:05', '-', '2020-05-09 17:16:05', '2020-05-09 17:16:05');
INSERT INTO `operation_log` VALUES (66, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:16:26', '-', '2020-05-09 17:16:26', '2020-05-09 17:16:26');
INSERT INTO `operation_log` VALUES (67, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:16:26', '-', '2020-05-09 17:16:26', '2020-05-09 17:16:26');
INSERT INTO `operation_log` VALUES (68, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:16:31', '-', '2020-05-09 17:16:31', '2020-05-09 17:16:31');
INSERT INTO `operation_log` VALUES (69, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:16:31', '-', '2020-05-09 17:16:31', '2020-05-09 17:16:31');
INSERT INTO `operation_log` VALUES (70, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=3\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:16:38', '-', '2020-05-09 17:16:38', '2020-05-09 17:16:38');
INSERT INTO `operation_log` VALUES (71, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=3\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:16:38', '-', '2020-05-09 17:16:38', '2020-05-09 17:16:38');
INSERT INTO `operation_log` VALUES (72, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:16:44', '-', '2020-05-09 17:16:44', '2020-05-09 17:16:44');
INSERT INTO `operation_log` VALUES (73, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:16:44', '-', '2020-05-09 17:16:44', '2020-05-09 17:16:44');
INSERT INTO `operation_log` VALUES (74, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:16:59', '-', '2020-05-09 17:16:59', '2020-05-09 17:16:59');
INSERT INTO `operation_log` VALUES (75, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=4\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:16:59', '-', '2020-05-09 17:16:59', '2020-05-09 17:16:59');
INSERT INTO `operation_log` VALUES (76, '', '', '/v1/roles', 'POST', '[GET] -> {} | [POST] -> name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&role_name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&remark=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&menu_ids=105%2C106%2C107&domain_id=4&author=vue-element-admin&menu_ids_ele=105%2C106%2C107&data_perm_ids=', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:17:04', '-', '2020-05-09 17:17:04', '2020-05-09 17:17:04');
INSERT INTO `operation_log` VALUES (77, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:17:04', '-', '2020-05-09 17:17:04', '2020-05-09 17:17:04');
INSERT INTO `operation_log` VALUES (78, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:17:10', '-', '2020-05-09 17:17:10', '2020-05-09 17:17:10');
INSERT INTO `operation_log` VALUES (79, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:17:11', '-', '2020-05-09 17:17:11', '2020-05-09 17:17:11');
INSERT INTO `operation_log` VALUES (80, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:17:11', '-', '2020-05-09 17:17:11', '2020-05-09 17:17:11');
INSERT INTO `operation_log` VALUES (81, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:17:11', '-', '2020-05-09 17:17:11', '2020-05-09 17:17:11');
INSERT INTO `operation_log` VALUES (82, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:17:12', '-', '2020-05-09 17:17:12', '2020-05-09 17:17:12');
INSERT INTO `operation_log` VALUES (83, '', '', '/v1/users/2/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:17:17', '-', '2020-05-09 17:17:17', '2020-05-09 17:17:17');
INSERT INTO `operation_log` VALUES (84, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:17:35', '-', '2020-05-09 17:17:35', '2020-05-09 17:17:35');
INSERT INTO `operation_log` VALUES (85, '', '', '/v1/users/2/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:17:49', '-', '2020-05-09 17:17:49', '2020-05-09 17:17:49');
INSERT INTO `operation_log` VALUES (86, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:18:22', '-', '2020-05-09 17:18:22', '2020-05-09 17:18:22');
INSERT INTO `operation_log` VALUES (87, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:18:22', '-', '2020-05-09 17:18:22', '2020-05-09 17:18:22');
INSERT INTO `operation_log` VALUES (88, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:18:22', '-', '2020-05-09 17:18:22', '2020-05-09 17:18:22');
INSERT INTO `operation_log` VALUES (89, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:18:22', '-', '2020-05-09 17:18:22', '2020-05-09 17:18:22');
INSERT INTO `operation_log` VALUES (90, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:18:22', '-', '2020-05-09 17:18:22', '2020-05-09 17:18:22');
INSERT INTO `operation_log` VALUES (91, '', '', '/v1/users/2/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:18:25', '-', '2020-05-09 17:18:25', '2020-05-09 17:18:25');
INSERT INTO `operation_log` VALUES (92, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:19:31', '-', '2020-05-09 17:19:31', '2020-05-09 17:19:31');
INSERT INTO `operation_log` VALUES (93, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:19:44', '-', '2020-05-09 17:19:44', '2020-05-09 17:19:44');
INSERT INTO `operation_log` VALUES (94, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:26:28', '-', '2020-05-09 17:26:28', '2020-05-09 17:26:28');
INSERT INTO `operation_log` VALUES (95, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:26:34', '-', '2020-05-09 17:26:34', '2020-05-09 17:26:34');
INSERT INTO `operation_log` VALUES (96, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:26:58', '-', '2020-05-09 17:26:58', '2020-05-09 17:26:58');
INSERT INTO `operation_log` VALUES (97, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:27:59', '-', '2020-05-09 17:27:59', '2020-05-09 17:27:59');
INSERT INTO `operation_log` VALUES (98, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:28:15', '-', '2020-05-09 17:28:15', '2020-05-09 17:28:15');
INSERT INTO `operation_log` VALUES (99, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:28:15', '-', '2020-05-09 17:28:15', '2020-05-09 17:28:15');
INSERT INTO `operation_log` VALUES (100, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:28:15', '-', '2020-05-09 17:28:15', '2020-05-09 17:28:15');
INSERT INTO `operation_log` VALUES (101, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:28:17', '-', '2020-05-09 17:28:17', '2020-05-09 17:28:17');
INSERT INTO `operation_log` VALUES (102, '', '', '/v1/menus/107', 'DELETE', '[GET] -> {} | [POST] -> id=107', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:28:40', '-', '2020-05-09 17:28:40', '2020-05-09 17:28:40');
INSERT INTO `operation_log` VALUES (103, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:28:40', '-', '2020-05-09 17:28:40', '2020-05-09 17:28:40');
INSERT INTO `operation_log` VALUES (104, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1025&name=%E5%88%97%E8%A1%A8%E6%9F%A5%E7%9C%8B&menu_type=2&url=&order_num=1&perms=category%2Flist&icon=&parents%5B0%5D=0&parents%5B1%5D=105&parents%5B2%5D=106&alias=category%2Flist&author=vue-element-admin&domain_id=4&parent_id=106', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:01', '-', '2020-05-09 17:29:01', '2020-05-09 17:29:01');
INSERT INTO `operation_log` VALUES (105, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:02', '-', '2020-05-09 17:29:02', '2020-05-09 17:29:02');
INSERT INTO `operation_log` VALUES (106, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:09', '-', '2020-05-09 17:29:09', '2020-05-09 17:29:09');
INSERT INTO `operation_log` VALUES (107, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:12', '-', '2020-05-09 17:29:12', '2020-05-09 17:29:12');
INSERT INTO `operation_log` VALUES (108, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:12', '-', '2020-05-09 17:29:12', '2020-05-09 17:29:12');
INSERT INTO `operation_log` VALUES (109, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:14', '-', '2020-05-09 17:29:14', '2020-05-09 17:29:14');
INSERT INTO `operation_log` VALUES (110, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=4\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:14', '-', '2020-05-09 17:29:14', '2020-05-09 17:29:14');
INSERT INTO `operation_log` VALUES (111, '', '', '/v1/roles/6', 'PUT', '[GET] -> {} | [POST] -> id=6&name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&domain_id=4&role_name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&remark=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&menu_ids=105%2C106%2C108&menu_ids_ele=105%2C106%2C108&data_perm_ids=&timestamp=NaN', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:19', '-', '2020-05-09 17:29:19', '2020-05-09 17:29:19');
INSERT INTO `operation_log` VALUES (112, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:19', '-', '2020-05-09 17:29:19', '2020-05-09 17:29:19');
INSERT INTO `operation_log` VALUES (113, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:21', '-', '2020-05-09 17:29:21', '2020-05-09 17:29:21');
INSERT INTO `operation_log` VALUES (114, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:21', '-', '2020-05-09 17:29:21', '2020-05-09 17:29:21');
INSERT INTO `operation_log` VALUES (115, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:21', '-', '2020-05-09 17:29:21', '2020-05-09 17:29:21');
INSERT INTO `operation_log` VALUES (116, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:21', '-', '2020-05-09 17:29:21', '2020-05-09 17:29:21');
INSERT INTO `operation_log` VALUES (117, '', '', '/v1/users/2/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:23', '-', '2020-05-09 17:29:23', '2020-05-09 17:29:23');
INSERT INTO `operation_log` VALUES (118, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:28', '-', '2020-05-09 17:29:28', '2020-05-09 17:29:28');
INSERT INTO `operation_log` VALUES (119, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:29:46', '-', '2020-05-09 17:29:46', '2020-05-09 17:29:46');
INSERT INTO `operation_log` VALUES (120, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:30:01', '-', '2020-05-09 17:30:01', '2020-05-09 17:30:01');
INSERT INTO `operation_log` VALUES (121, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 17:30:12', '-', '2020-05-09 17:30:12', '2020-05-09 17:30:12');
INSERT INTO `operation_log` VALUES (122, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:29:31', '-', '2020-05-09 19:29:31', '2020-05-09 19:29:31');
INSERT INTO `operation_log` VALUES (123, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:29:32', '-', '2020-05-09 19:29:32', '2020-05-09 19:29:32');
INSERT INTO `operation_log` VALUES (124, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:29:32', '-', '2020-05-09 19:29:32', '2020-05-09 19:29:32');
INSERT INTO `operation_log` VALUES (125, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:29:48', '-', '2020-05-09 19:29:48', '2020-05-09 19:29:48');
INSERT INTO `operation_log` VALUES (126, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:29:49', '-', '2020-05-09 19:29:49', '2020-05-09 19:29:49');
INSERT INTO `operation_log` VALUES (127, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:29:54', '-', '2020-05-09 19:29:54', '2020-05-09 19:29:54');
INSERT INTO `operation_log` VALUES (128, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:29:54', '-', '2020-05-09 19:29:54', '2020-05-09 19:29:54');
INSERT INTO `operation_log` VALUES (129, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:29:55', '-', '2020-05-09 19:29:55', '2020-05-09 19:29:55');
INSERT INTO `operation_log` VALUES (130, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:29:55', '-', '2020-05-09 19:29:55', '2020-05-09 19:29:55');
INSERT INTO `operation_log` VALUES (131, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:30:03', '-', '2020-05-09 19:30:03', '2020-05-09 19:30:03');
INSERT INTO `operation_log` VALUES (132, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:30:26', '-', '2020-05-09 19:30:26', '2020-05-09 19:30:26');
INSERT INTO `operation_log` VALUES (133, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:30:26', '-', '2020-05-09 19:30:26', '2020-05-09 19:30:26');
INSERT INTO `operation_log` VALUES (134, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:30:43', '-', '2020-05-09 19:30:43', '2020-05-09 19:30:43');
INSERT INTO `operation_log` VALUES (135, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:31:03', '-', '2020-05-09 19:31:03', '2020-05-09 19:31:03');
INSERT INTO `operation_log` VALUES (136, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:31:03', '-', '2020-05-09 19:31:03', '2020-05-09 19:31:03');
INSERT INTO `operation_log` VALUES (137, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:31:10', '-', '2020-05-09 19:31:10', '2020-05-09 19:31:10');
INSERT INTO `operation_log` VALUES (138, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:31:11', '-', '2020-05-09 19:31:11', '2020-05-09 19:31:11');
INSERT INTO `operation_log` VALUES (139, '', '', '/v1/datas', 'POST', '[GET] -> {} | [POST] -> domain_id=1&parent_id=1&name=aa&perms=%2Fuser%2Fdd&perms_rule=&perms_type=2&order_num=1&remarks=', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:32:24', '-', '2020-05-09 19:32:24', '2020-05-09 19:32:24');
INSERT INTO `operation_log` VALUES (140, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:32:24', '-', '2020-05-09 19:32:24', '2020-05-09 19:32:24');
INSERT INTO `operation_log` VALUES (141, '', '', '/v1/datas/3', 'PUT', '[GET] -> {} | [POST] -> id=3&domain_id=1&parent_id=1&name=aa&perms=%2Fuser%2Fdd&perms_rule=%22dd%22&perms_type=2&order_num=1&remarks=', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:32:46', '-', '2020-05-09 19:32:46', '2020-05-09 19:32:46');
INSERT INTO `operation_log` VALUES (142, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:32:46', '-', '2020-05-09 19:32:46', '2020-05-09 19:32:46');
INSERT INTO `operation_log` VALUES (143, '', '', '/v1/datas/1', 'PUT', '[GET] -> {} | [POST] -> id=1&domain_id=1&parent_id=0&name=test&perms=-&perms_rule=%7B%22hello%22%3A%22world%22%2C%22name%22%3A%22value%22%7D&perms_type=2&order_num=1&remarks=', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:33:56', '-', '2020-05-09 19:33:56', '2020-05-09 19:33:56');
INSERT INTO `operation_log` VALUES (144, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:33:56', '-', '2020-05-09 19:33:56', '2020-05-09 19:33:56');
INSERT INTO `operation_log` VALUES (145, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:34:17', '-', '2020-05-09 19:34:17', '2020-05-09 19:34:17');
INSERT INTO `operation_log` VALUES (146, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:34:18', '-', '2020-05-09 19:34:18', '2020-05-09 19:34:18');
INSERT INTO `operation_log` VALUES (147, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:34:18', '-', '2020-05-09 19:34:18', '2020-05-09 19:34:18');
INSERT INTO `operation_log` VALUES (148, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:34:33', '-', '2020-05-09 19:34:33', '2020-05-09 19:34:33');
INSERT INTO `operation_log` VALUES (149, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:34:33', '-', '2020-05-09 19:34:33', '2020-05-09 19:34:33');
INSERT INTO `operation_log` VALUES (150, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=2\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:34:36', '-', '2020-05-09 19:34:36', '2020-05-09 19:34:36');
INSERT INTO `operation_log` VALUES (151, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=2\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:34:36', '-', '2020-05-09 19:34:36', '2020-05-09 19:34:36');
INSERT INTO `operation_log` VALUES (152, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:34:46', '-', '2020-05-09 19:34:46', '2020-05-09 19:34:46');
INSERT INTO `operation_log` VALUES (153, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:34:49', '-', '2020-05-09 19:34:49', '2020-05-09 19:34:49');
INSERT INTO `operation_log` VALUES (154, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:34:49', '-', '2020-05-09 19:34:49', '2020-05-09 19:34:49');
INSERT INTO `operation_log` VALUES (155, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:34:51', '-', '2020-05-09 19:34:51', '2020-05-09 19:34:51');
INSERT INTO `operation_log` VALUES (156, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:34:51', '-', '2020-05-09 19:34:51', '2020-05-09 19:34:51');
INSERT INTO `operation_log` VALUES (157, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:37:55', '-', '2020-05-09 19:37:55', '2020-05-09 19:37:55');
INSERT INTO `operation_log` VALUES (158, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:37:57', '-', '2020-05-09 19:37:57', '2020-05-09 19:37:57');
INSERT INTO `operation_log` VALUES (159, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '58.250.243.155', '', '2020-05-09 19:37:57', '-', '2020-05-09 19:37:57', '2020-05-09 19:37:57');
INSERT INTO `operation_log` VALUES (160, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 20:29:22', '-', '2020-05-09 20:29:22', '2020-05-09 20:29:22');
INSERT INTO `operation_log` VALUES (161, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 20:29:22', '-', '2020-05-09 20:29:22', '2020-05-09 20:29:22');
INSERT INTO `operation_log` VALUES (162, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 20:29:25', '-', '2020-05-09 20:29:25', '2020-05-09 20:29:25');
INSERT INTO `operation_log` VALUES (163, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 20:41:37', '-', '2020-05-09 20:41:37', '2020-05-09 20:41:37');
INSERT INTO `operation_log` VALUES (164, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 20:42:26', '-', '2020-05-09 20:42:26', '2020-05-09 20:42:26');
INSERT INTO `operation_log` VALUES (165, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 20:43:25', '-', '2020-05-09 20:43:25', '2020-05-09 20:43:25');
INSERT INTO `operation_log` VALUES (166, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:13', '-', '2020-05-09 21:03:13', '2020-05-09 21:03:13');
INSERT INTO `operation_log` VALUES (167, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:13', '-', '2020-05-09 21:03:13', '2020-05-09 21:03:13');
INSERT INTO `operation_log` VALUES (168, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=4\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:16', '-', '2020-05-09 21:03:16', '2020-05-09 21:03:16');
INSERT INTO `operation_log` VALUES (169, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:18', '-', '2020-05-09 21:03:18', '2020-05-09 21:03:18');
INSERT INTO `operation_log` VALUES (170, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=4\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:18', '-', '2020-05-09 21:03:18', '2020-05-09 21:03:18');
INSERT INTO `operation_log` VALUES (171, '', '', '/v1/roles/6', 'PUT', '[GET] -> {} | [POST] -> id=6&name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&domain_id=4&role_name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&remark=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&menu_ids=105%2C106%2C108&menu_ids_ele=105%2C106%2C108&data_perm_ids=&timestamp=NaN', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:19', '-', '2020-05-09 21:03:19', '2020-05-09 21:03:19');
INSERT INTO `operation_log` VALUES (172, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=4\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:20', '-', '2020-05-09 21:03:20', '2020-05-09 21:03:20');
INSERT INTO `operation_log` VALUES (173, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:22', '-', '2020-05-09 21:03:22', '2020-05-09 21:03:22');
INSERT INTO `operation_log` VALUES (174, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:22', '-', '2020-05-09 21:03:22', '2020-05-09 21:03:22');
INSERT INTO `operation_log` VALUES (175, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:22', '-', '2020-05-09 21:03:22', '2020-05-09 21:03:22');
INSERT INTO `operation_log` VALUES (176, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:22', '-', '2020-05-09 21:03:22', '2020-05-09 21:03:22');
INSERT INTO `operation_log` VALUES (177, '', '', '/v1/users/2/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:24', '-', '2020-05-09 21:03:24', '2020-05-09 21:03:24');
INSERT INTO `operation_log` VALUES (178, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:27', '-', '2020-05-09 21:03:27', '2020-05-09 21:03:27');
INSERT INTO `operation_log` VALUES (179, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:03:37', '-', '2020-05-09 21:03:37', '2020-05-09 21:03:37');
INSERT INTO `operation_log` VALUES (180, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:05:31', '-', '2020-05-09 21:05:31', '2020-05-09 21:05:31');
INSERT INTO `operation_log` VALUES (181, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:05:39', '-', '2020-05-09 21:05:39', '2020-05-09 21:05:39');
INSERT INTO `operation_log` VALUES (182, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:08:16', '-', '2020-05-09 21:08:16', '2020-05-09 21:08:16');
INSERT INTO `operation_log` VALUES (183, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:09:49', '-', '2020-05-09 21:09:49', '2020-05-09 21:09:49');
INSERT INTO `operation_log` VALUES (184, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:11:15', '-', '2020-05-09 21:11:15', '2020-05-09 21:11:15');
INSERT INTO `operation_log` VALUES (185, '', '', '/v1/users/2/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:30', '-', '2020-05-09 21:12:30', '2020-05-09 21:12:30');
INSERT INTO `operation_log` VALUES (186, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:33', '-', '2020-05-09 21:12:33', '2020-05-09 21:12:33');
INSERT INTO `operation_log` VALUES (187, '', '', '/v1/users/2/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:37', '-', '2020-05-09 21:12:37', '2020-05-09 21:12:37');
INSERT INTO `operation_log` VALUES (188, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:40', '-', '2020-05-09 21:12:40', '2020-05-09 21:12:40');
INSERT INTO `operation_log` VALUES (189, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:40', '-', '2020-05-09 21:12:40', '2020-05-09 21:12:40');
INSERT INTO `operation_log` VALUES (190, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:44', '-', '2020-05-09 21:12:44', '2020-05-09 21:12:44');
INSERT INTO `operation_log` VALUES (191, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:45', '-', '2020-05-09 21:12:45', '2020-05-09 21:12:45');
INSERT INTO `operation_log` VALUES (192, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:45', '-', '2020-05-09 21:12:45', '2020-05-09 21:12:45');
INSERT INTO `operation_log` VALUES (193, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:45', '-', '2020-05-09 21:12:45', '2020-05-09 21:12:45');
INSERT INTO `operation_log` VALUES (194, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:45', '-', '2020-05-09 21:12:45', '2020-05-09 21:12:45');
INSERT INTO `operation_log` VALUES (195, '', '', '/v1/users/2/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:46', '-', '2020-05-09 21:12:46', '2020-05-09 21:12:46');
INSERT INTO `operation_log` VALUES (196, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:54', '-', '2020-05-09 21:12:54', '2020-05-09 21:12:54');
INSERT INTO `operation_log` VALUES (197, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:54', '-', '2020-05-09 21:12:54', '2020-05-09 21:12:54');
INSERT INTO `operation_log` VALUES (198, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=4\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:56', '-', '2020-05-09 21:12:56', '2020-05-09 21:12:56');
INSERT INTO `operation_log` VALUES (199, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:12:56', '-', '2020-05-09 21:12:56', '2020-05-09 21:12:56');
INSERT INTO `operation_log` VALUES (200, '', '', '/v1/roles/6', 'PUT', '[GET] -> {} | [POST] -> id=6&name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&domain_id=4&role_name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&remark=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&menu_ids=105%2C106%2C108&menu_ids_ele=105%2C106%2C108&data_perm_ids=&timestamp=NaN', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:13:04', '-', '2020-05-09 21:13:04', '2020-05-09 21:13:04');
INSERT INTO `operation_log` VALUES (201, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:13:05', '-', '2020-05-09 21:13:05', '2020-05-09 21:13:05');
INSERT INTO `operation_log` VALUES (202, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:13:11', '-', '2020-05-09 21:13:11', '2020-05-09 21:13:11');
INSERT INTO `operation_log` VALUES (203, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:13:11', '-', '2020-05-09 21:13:11', '2020-05-09 21:13:11');
INSERT INTO `operation_log` VALUES (204, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:13:11', '-', '2020-05-09 21:13:11', '2020-05-09 21:13:11');
INSERT INTO `operation_log` VALUES (205, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:13:11', '-', '2020-05-09 21:13:11', '2020-05-09 21:13:11');
INSERT INTO `operation_log` VALUES (206, '', '', '/v1/users/2/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:13:12', '-', '2020-05-09 21:13:12', '2020-05-09 21:13:12');
INSERT INTO `operation_log` VALUES (207, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:13:16', '-', '2020-05-09 21:13:16', '2020-05-09 21:13:16');
INSERT INTO `operation_log` VALUES (208, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:15:10', '-', '2020-05-09 21:15:10', '2020-05-09 21:15:10');
INSERT INTO `operation_log` VALUES (209, '', '', '/v1/depts/2', 'PUT', '[GET] -> {} | [POST] -> id=2&name=%E4%BA%BA%E4%BA%8B%E9%83%A8&order_num=0&parent_id=1&extend_field=%7B%22Id%22%3A142415941%2C%22Name%22%3A%22%E4%BA%BA%E4%BA%8B%E9%83%A8%22%2C%22ParentId%22%3A1%2C%22Children%22%3Anull%7D&_expanded=false&_level=2&_marginLeft=0&_width=NaN&_show=true&timestamp=NaN&parents%5B0%5D=0&parents%5B1%5D=1&parents%5B2%5D=0&parents%5B3%5D=1', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:15:44', '-', '2020-05-09 21:15:44', '2020-05-09 21:15:44');
INSERT INTO `operation_log` VALUES (210, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:15:44', '-', '2020-05-09 21:15:44', '2020-05-09 21:15:44');
INSERT INTO `operation_log` VALUES (211, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:17:01', '-', '2020-05-09 21:17:01', '2020-05-09 21:17:01');
INSERT INTO `operation_log` VALUES (212, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:17:01', '-', '2020-05-09 21:17:01', '2020-05-09 21:17:01');
INSERT INTO `operation_log` VALUES (213, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:20:28', '-', '2020-05-09 21:20:28', '2020-05-09 21:20:28');
INSERT INTO `operation_log` VALUES (214, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"zeus-config\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:22:14', '-', '2020-05-09 21:22:14', '2020-05-09 21:22:14');
INSERT INTO `operation_log` VALUES (215, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:22:45', '-', '2020-05-09 21:22:45', '2020-05-09 21:22:45');
INSERT INTO `operation_log` VALUES (216, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:22:55', '-', '2020-05-09 21:22:55', '2020-05-09 21:22:55');
INSERT INTO `operation_log` VALUES (217, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:27:51', '-', '2020-05-09 21:27:51', '2020-05-09 21:27:51');
INSERT INTO `operation_log` VALUES (218, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:27:56', '-', '2020-05-09 21:27:56', '2020-05-09 21:27:56');
INSERT INTO `operation_log` VALUES (219, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:29:31', '-', '2020-05-09 21:29:31', '2020-05-09 21:29:31');
INSERT INTO `operation_log` VALUES (220, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:29:43', '-', '2020-05-09 21:29:43', '2020-05-09 21:29:43');
INSERT INTO `operation_log` VALUES (221, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:29:58', '-', '2020-05-09 21:29:58', '2020-05-09 21:29:58');
INSERT INTO `operation_log` VALUES (222, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:30:07', '-', '2020-05-09 21:30:07', '2020-05-09 21:30:07');
INSERT INTO `operation_log` VALUES (223, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:36:42', '-', '2020-05-09 21:36:42', '2020-05-09 21:36:42');
INSERT INTO `operation_log` VALUES (224, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:38:08', '-', '2020-05-09 21:38:08', '2020-05-09 21:38:08');
INSERT INTO `operation_log` VALUES (225, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:38:18', '-', '2020-05-09 21:38:18', '2020-05-09 21:38:18');
INSERT INTO `operation_log` VALUES (226, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:39:31', '-', '2020-05-09 21:39:31', '2020-05-09 21:39:31');
INSERT INTO `operation_log` VALUES (227, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:39:45', '-', '2020-05-09 21:39:45', '2020-05-09 21:39:45');
INSERT INTO `operation_log` VALUES (228, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:39:51', '-', '2020-05-09 21:39:51', '2020-05-09 21:39:51');
INSERT INTO `operation_log` VALUES (229, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:41:08', '-', '2020-05-09 21:41:08', '2020-05-09 21:41:08');
INSERT INTO `operation_log` VALUES (230, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:41:13', '-', '2020-05-09 21:41:13', '2020-05-09 21:41:13');
INSERT INTO `operation_log` VALUES (231, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:41:29', '-', '2020-05-09 21:41:29', '2020-05-09 21:41:29');
INSERT INTO `operation_log` VALUES (232, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:41:47', '-', '2020-05-09 21:41:47', '2020-05-09 21:41:47');
INSERT INTO `operation_log` VALUES (233, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:42:03', '-', '2020-05-09 21:42:03', '2020-05-09 21:42:03');
INSERT INTO `operation_log` VALUES (234, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:42:11', '-', '2020-05-09 21:42:11', '2020-05-09 21:42:11');
INSERT INTO `operation_log` VALUES (235, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:43:28', '-', '2020-05-09 21:43:28', '2020-05-09 21:43:28');
INSERT INTO `operation_log` VALUES (236, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:44:50', '-', '2020-05-09 21:44:50', '2020-05-09 21:44:50');
INSERT INTO `operation_log` VALUES (237, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:44:50', '-', '2020-05-09 21:44:50', '2020-05-09 21:44:50');
INSERT INTO `operation_log` VALUES (238, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:44:52', '-', '2020-05-09 21:44:52', '2020-05-09 21:44:52');
INSERT INTO `operation_log` VALUES (239, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=3\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:45:17', '-', '2020-05-09 21:45:17', '2020-05-09 21:45:17');
INSERT INTO `operation_log` VALUES (240, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=2\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:45:25', '-', '2020-05-09 21:45:25', '2020-05-09 21:45:25');
INSERT INTO `operation_log` VALUES (241, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:46:38', '-', '2020-05-09 21:46:38', '2020-05-09 21:46:38');
INSERT INTO `operation_log` VALUES (242, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:47:10', '-', '2020-05-09 21:47:10', '2020-05-09 21:47:10');
INSERT INTO `operation_log` VALUES (243, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:48:41', '-', '2020-05-09 21:48:41', '2020-05-09 21:48:41');
INSERT INTO `operation_log` VALUES (244, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:49:00', '-', '2020-05-09 21:49:00', '2020-05-09 21:49:00');
INSERT INTO `operation_log` VALUES (245, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:54:44', '-', '2020-05-09 21:54:44', '2020-05-09 21:54:44');
INSERT INTO `operation_log` VALUES (246, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 21:55:02', '-', '2020-05-09 21:55:02', '2020-05-09 21:55:02');
INSERT INTO `operation_log` VALUES (247, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 22:39:02', '-', '2020-05-09 22:39:02', '2020-05-09 22:39:02');
INSERT INTO `operation_log` VALUES (248, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 22:42:55', '-', '2020-05-09 22:42:55', '2020-05-09 22:42:55');
INSERT INTO `operation_log` VALUES (249, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 22:46:10', '-', '2020-05-09 22:46:10', '2020-05-09 22:46:10');
INSERT INTO `operation_log` VALUES (250, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 22:46:25', '-', '2020-05-09 22:46:25', '2020-05-09 22:46:25');
INSERT INTO `operation_log` VALUES (251, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 23:08:51', '-', '2020-05-09 23:08:51', '2020-05-09 23:08:51');
INSERT INTO `operation_log` VALUES (252, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 23:11:26', '-', '2020-05-09 23:11:26', '2020-05-09 23:11:26');
INSERT INTO `operation_log` VALUES (253, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 23:16:16', '-', '2020-05-09 23:16:16', '2020-05-09 23:16:16');
INSERT INTO `operation_log` VALUES (254, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 23:18:32', '-', '2020-05-09 23:18:32', '2020-05-09 23:18:32');
INSERT INTO `operation_log` VALUES (255, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 23:22:44', '-', '2020-05-09 23:22:44', '2020-05-09 23:22:44');
INSERT INTO `operation_log` VALUES (256, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 23:29:02', '-', '2020-05-09 23:29:02', '2020-05-09 23:29:02');
INSERT INTO `operation_log` VALUES (257, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 23:33:05', '-', '2020-05-09 23:33:05', '2020-05-09 23:33:05');
INSERT INTO `operation_log` VALUES (258, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 23:35:47', '-', '2020-05-09 23:35:47', '2020-05-09 23:35:47');
INSERT INTO `operation_log` VALUES (259, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 23:39:20', '-', '2020-05-09 23:39:20', '2020-05-09 23:39:20');
INSERT INTO `operation_log` VALUES (260, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-09 23:40:02', '-', '2020-05-09 23:40:02', '2020-05-09 23:40:02');
INSERT INTO `operation_log` VALUES (261, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:21:42', '-', '2020-05-10 09:21:42', '2020-05-10 09:21:42');
INSERT INTO `operation_log` VALUES (262, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:21:42', '-', '2020-05-10 09:21:42', '2020-05-10 09:21:42');
INSERT INTO `operation_log` VALUES (263, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:21:42', '-', '2020-05-10 09:21:42', '2020-05-10 09:21:42');
INSERT INTO `operation_log` VALUES (264, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:21:51', '-', '2020-05-10 09:21:51', '2020-05-10 09:21:51');
INSERT INTO `operation_log` VALUES (265, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:21:51', '-', '2020-05-10 09:21:51', '2020-05-10 09:21:51');
INSERT INTO `operation_log` VALUES (266, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:21:51', '-', '2020-05-10 09:21:51', '2020-05-10 09:21:51');
INSERT INTO `operation_log` VALUES (267, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:21:51', '-', '2020-05-10 09:21:51', '2020-05-10 09:21:51');
INSERT INTO `operation_log` VALUES (268, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:21:56', '-', '2020-05-10 09:21:56', '2020-05-10 09:21:56');
INSERT INTO `operation_log` VALUES (269, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:21:56', '-', '2020-05-10 09:21:56', '2020-05-10 09:21:56');
INSERT INTO `operation_log` VALUES (270, '', '', '/v1/users/1/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:21:57', '-', '2020-05-10 09:21:57', '2020-05-10 09:21:57');
INSERT INTO `operation_log` VALUES (271, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:22:24', '-', '2020-05-10 09:22:24', '2020-05-10 09:22:24');
INSERT INTO `operation_log` VALUES (272, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:22:24', '-', '2020-05-10 09:22:24', '2020-05-10 09:22:24');
INSERT INTO `operation_log` VALUES (273, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:22:29', '-', '2020-05-10 09:22:29', '2020-05-10 09:22:29');
INSERT INTO `operation_log` VALUES (274, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:22:29', '-', '2020-05-10 09:22:29', '2020-05-10 09:22:29');
INSERT INTO `operation_log` VALUES (275, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:22:39', '-', '2020-05-10 09:22:39', '2020-05-10 09:22:39');
INSERT INTO `operation_log` VALUES (276, '', '', '/v1/log/logins', 'GET', '[GET] -> {\"end_time\":[\"2020-05-10 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-10 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:22:54', '-', '2020-05-10 09:22:54', '2020-05-10 09:22:54');
INSERT INTO `operation_log` VALUES (277, '', '', '/v1/log/operations', 'GET', '[GET] -> {\"end_time\":[\"2020-05-10 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-10 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:23:07', '-', '2020-05-10 09:23:07', '2020-05-10 09:23:07');
INSERT INTO `operation_log` VALUES (278, '', '', '/v1/setting/email', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:23:19', '-', '2020-05-10 09:23:19', '2020-05-10 09:23:19');
INSERT INTO `operation_log` VALUES (279, '', '', '/v1/setting/ldap', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:23:26', '-', '2020-05-10 09:23:26', '2020-05-10 09:23:26');
INSERT INTO `operation_log` VALUES (280, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:23:37', '-', '2020-05-10 09:23:37', '2020-05-10 09:23:37');
INSERT INTO `operation_log` VALUES (281, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:23:37', '-', '2020-05-10 09:23:37', '2020-05-10 09:23:37');
INSERT INTO `operation_log` VALUES (282, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:23:40', '-', '2020-05-10 09:23:40', '2020-05-10 09:23:40');
INSERT INTO `operation_log` VALUES (283, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:23:40', '-', '2020-05-10 09:23:40', '2020-05-10 09:23:40');
INSERT INTO `operation_log` VALUES (284, '', '', '/v1/roles', 'POST', '[GET] -> {} | [POST] -> name=sa&role_name=sa&remark=&menu_ids=2%2C3%2C4%2C5%2C6%2C86%2C90%2C91%2C92%2C19%2C1%2C83%2C84%2C85%2C17%2C18&domain_id=1&author=vue-element-admin&menu_ids_ele=2%2C3%2C4%2C5%2C6%2C86%2C90%2C91%2C92%2C19&data_perm_ids=1%2C3', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:24:57', '-', '2020-05-10 09:24:57', '2020-05-10 09:24:57');
INSERT INTO `operation_log` VALUES (285, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:24:58', '-', '2020-05-10 09:24:58', '2020-05-10 09:24:58');
INSERT INTO `operation_log` VALUES (286, '', '', '/v1/roles/7/copy', 'POST', '[GET] -> {} | [POST] -> id=7', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:25:05', '-', '2020-05-10 09:25:05', '2020-05-10 09:25:05');
INSERT INTO `operation_log` VALUES (287, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:25:08', '-', '2020-05-10 09:25:08', '2020-05-10 09:25:08');
INSERT INTO `operation_log` VALUES (288, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:25:09', '-', '2020-05-10 09:25:09', '2020-05-10 09:25:09');
INSERT INTO `operation_log` VALUES (289, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:25:26', '-', '2020-05-10 09:25:26', '2020-05-10 09:25:26');
INSERT INTO `operation_log` VALUES (290, '', '', '/v1/setting/email', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:25:31', '-', '2020-05-10 09:25:31', '2020-05-10 09:25:31');
INSERT INTO `operation_log` VALUES (291, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:25:38', '-', '2020-05-10 09:25:38', '2020-05-10 09:25:38');
INSERT INTO `operation_log` VALUES (292, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:09', '-', '2020-05-10 09:26:09', '2020-05-10 09:26:09');
INSERT INTO `operation_log` VALUES (293, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:10', '-', '2020-05-10 09:26:10', '2020-05-10 09:26:10');
INSERT INTO `operation_log` VALUES (294, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:36', '-', '2020-05-10 09:26:36', '2020-05-10 09:26:36');
INSERT INTO `operation_log` VALUES (295, '', '', '/v1/log/operations', 'GET', '[GET] -> {\"end_time\":[\"2020-05-10 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-10 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:39', '-', '2020-05-10 09:26:39', '2020-05-10 09:26:39');
INSERT INTO `operation_log` VALUES (296, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:44', '-', '2020-05-10 09:26:44', '2020-05-10 09:26:44');
INSERT INTO `operation_log` VALUES (297, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:44', '-', '2020-05-10 09:26:44', '2020-05-10 09:26:44');
INSERT INTO `operation_log` VALUES (298, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:44', '-', '2020-05-10 09:26:44', '2020-05-10 09:26:44');
INSERT INTO `operation_log` VALUES (299, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:44', '-', '2020-05-10 09:26:44', '2020-05-10 09:26:44');
INSERT INTO `operation_log` VALUES (300, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:45', '-', '2020-05-10 09:26:45', '2020-05-10 09:26:45');
INSERT INTO `operation_log` VALUES (301, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:53', '-', '2020-05-10 09:26:53', '2020-05-10 09:26:53');
INSERT INTO `operation_log` VALUES (302, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=2\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:53', '-', '2020-05-10 09:26:53', '2020-05-10 09:26:53');
INSERT INTO `operation_log` VALUES (303, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"skip\":[\"10\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:53', '-', '2020-05-10 09:26:53', '2020-05-10 09:26:53');
INSERT INTO `operation_log` VALUES (304, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:26:53', '-', '2020-05-10 09:26:53', '2020-05-10 09:26:53');
INSERT INTO `operation_log` VALUES (305, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:00', '-', '2020-05-10 09:27:00', '2020-05-10 09:27:00');
INSERT INTO `operation_log` VALUES (306, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"skip\":[\"10\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:06', '-', '2020-05-10 09:27:06', '2020-05-10 09:27:06');
INSERT INTO `operation_log` VALUES (307, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:06', '-', '2020-05-10 09:27:06', '2020-05-10 09:27:06');
INSERT INTO `operation_log` VALUES (308, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=9\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:06', '-', '2020-05-10 09:27:06', '2020-05-10 09:27:06');
INSERT INTO `operation_log` VALUES (309, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:06', '-', '2020-05-10 09:27:06', '2020-05-10 09:27:06');
INSERT INTO `operation_log` VALUES (310, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:12', '-', '2020-05-10 09:27:12', '2020-05-10 09:27:12');
INSERT INTO `operation_log` VALUES (311, '', '', '/v1/depts/5', 'PUT', '[GET] -> {} | [POST] -> id=5&name=%E5%B8%82%E5%9C%BA%E9%83%A8&order_num=0&parent_id=1&extend_field=%7B%22Id%22%3A142567183%2C%22Name%22%3A%22%E5%B8%82%E5%9C%BA%E9%83%A8%22%2C%22ParentId%22%3A1%2C%22Children%22%3Anull%7D&_expanded=false&_level=2&_marginLeft=0&_width=NaN&_show=true&timestamp=NaN&parents%5B0%5D=0&parents%5B1%5D=1&parents%5B2%5D=0&parents%5B3%5D=1', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:31', '-', '2020-05-10 09:27:31', '2020-05-10 09:27:31');
INSERT INTO `operation_log` VALUES (312, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:31', '-', '2020-05-10 09:27:31', '2020-05-10 09:27:31');
INSERT INTO `operation_log` VALUES (313, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:36', '-', '2020-05-10 09:27:36', '2020-05-10 09:27:36');
INSERT INTO `operation_log` VALUES (314, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:36', '-', '2020-05-10 09:27:36', '2020-05-10 09:27:36');
INSERT INTO `operation_log` VALUES (315, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:36', '-', '2020-05-10 09:27:36', '2020-05-10 09:27:36');
INSERT INTO `operation_log` VALUES (316, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:36', '-', '2020-05-10 09:27:36', '2020-05-10 09:27:36');
INSERT INTO `operation_log` VALUES (317, '', '', '/v1/users/1/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '123.159.48.139', '', '2020-05-10 09:27:43', '-', '2020-05-10 09:27:43', '2020-05-10 09:27:43');
INSERT INTO `operation_log` VALUES (318, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:10:45', '-', '2020-05-10 10:10:45', '2020-05-10 10:10:45');
INSERT INTO `operation_log` VALUES (319, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:10:45', '-', '2020-05-10 10:10:45', '2020-05-10 10:10:45');
INSERT INTO `operation_log` VALUES (320, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:17:09', '-', '2020-05-10 10:17:09', '2020-05-10 10:17:09');
INSERT INTO `operation_log` VALUES (321, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:17:30', '-', '2020-05-10 10:17:30', '2020-05-10 10:17:30');
INSERT INTO `operation_log` VALUES (322, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:18:18', '-', '2020-05-10 10:18:18', '2020-05-10 10:18:18');
INSERT INTO `operation_log` VALUES (323, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:18:57', '-', '2020-05-10 10:18:57', '2020-05-10 10:18:57');
INSERT INTO `operation_log` VALUES (324, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:19:16', '-', '2020-05-10 10:19:16', '2020-05-10 10:19:16');
INSERT INTO `operation_log` VALUES (325, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:27:14', '-', '2020-05-10 10:27:14', '2020-05-10 10:27:14');
INSERT INTO `operation_log` VALUES (326, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:28:34', '-', '2020-05-10 10:28:34', '2020-05-10 10:28:34');
INSERT INTO `operation_log` VALUES (327, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:29:40', '-', '2020-05-10 10:29:40', '2020-05-10 10:29:40');
INSERT INTO `operation_log` VALUES (328, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:32:45', '-', '2020-05-10 10:32:45', '2020-05-10 10:32:45');
INSERT INTO `operation_log` VALUES (329, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:35:57', '-', '2020-05-10 10:35:57', '2020-05-10 10:35:57');
INSERT INTO `operation_log` VALUES (330, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:36:48', '-', '2020-05-10 10:36:48', '2020-05-10 10:36:48');
INSERT INTO `operation_log` VALUES (331, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:40:01', '-', '2020-05-10 10:40:01', '2020-05-10 10:40:01');
INSERT INTO `operation_log` VALUES (332, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:42:17', '-', '2020-05-10 10:42:17', '2020-05-10 10:42:17');
INSERT INTO `operation_log` VALUES (333, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:44:54', '-', '2020-05-10 10:44:54', '2020-05-10 10:44:54');
INSERT INTO `operation_log` VALUES (334, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:47:13', '-', '2020-05-10 10:47:13', '2020-05-10 10:47:13');
INSERT INTO `operation_log` VALUES (335, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 10:49:35', '-', '2020-05-10 10:49:35', '2020-05-10 10:49:35');
INSERT INTO `operation_log` VALUES (336, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 11:02:47', '-', '2020-05-10 11:02:47', '2020-05-10 11:02:47');
INSERT INTO `operation_log` VALUES (337, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 11:04:12', '-', '2020-05-10 11:04:12', '2020-05-10 11:04:12');
INSERT INTO `operation_log` VALUES (338, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 11:05:12', '-', '2020-05-10 11:05:12', '2020-05-10 11:05:12');
INSERT INTO `operation_log` VALUES (339, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 11:25:30', '-', '2020-05-10 11:25:30', '2020-05-10 11:25:30');
INSERT INTO `operation_log` VALUES (340, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 11:42:57', '-', '2020-05-10 11:42:57', '2020-05-10 11:42:57');
INSERT INTO `operation_log` VALUES (341, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 11:43:22', '-', '2020-05-10 11:43:22', '2020-05-10 11:43:22');
INSERT INTO `operation_log` VALUES (342, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 11:48:43', '-', '2020-05-10 11:48:43', '2020-05-10 11:48:43');
INSERT INTO `operation_log` VALUES (343, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 11:55:37', '-', '2020-05-10 11:55:37', '2020-05-10 11:55:37');
INSERT INTO `operation_log` VALUES (344, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 11:56:15', '-', '2020-05-10 11:56:15', '2020-05-10 11:56:15');
INSERT INTO `operation_log` VALUES (345, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 11:58:29', '-', '2020-05-10 11:58:29', '2020-05-10 11:58:29');
INSERT INTO `operation_log` VALUES (346, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:02:38', '-', '2020-05-10 12:02:38', '2020-05-10 12:02:38');
INSERT INTO `operation_log` VALUES (347, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:05:18', '-', '2020-05-10 12:05:18', '2020-05-10 12:05:18');
INSERT INTO `operation_log` VALUES (348, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:06:35', '-', '2020-05-10 12:06:35', '2020-05-10 12:06:35');
INSERT INTO `operation_log` VALUES (349, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:06:54', '-', '2020-05-10 12:06:54', '2020-05-10 12:06:54');
INSERT INTO `operation_log` VALUES (350, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:08:46', '-', '2020-05-10 12:08:46', '2020-05-10 12:08:46');
INSERT INTO `operation_log` VALUES (351, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:10:10', '-', '2020-05-10 12:10:10', '2020-05-10 12:10:10');
INSERT INTO `operation_log` VALUES (352, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:11:01', '-', '2020-05-10 12:11:01', '2020-05-10 12:11:01');
INSERT INTO `operation_log` VALUES (353, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:11:19', '-', '2020-05-10 12:11:19', '2020-05-10 12:11:19');
INSERT INTO `operation_log` VALUES (354, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:12:00', '-', '2020-05-10 12:12:00', '2020-05-10 12:12:00');
INSERT INTO `operation_log` VALUES (355, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:12:39', '-', '2020-05-10 12:12:39', '2020-05-10 12:12:39');
INSERT INTO `operation_log` VALUES (356, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:14:23', '-', '2020-05-10 12:14:23', '2020-05-10 12:14:23');
INSERT INTO `operation_log` VALUES (357, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:21:45', '-', '2020-05-10 12:21:45', '2020-05-10 12:21:45');
INSERT INTO `operation_log` VALUES (358, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:23:44', '-', '2020-05-10 12:23:44', '2020-05-10 12:23:44');
INSERT INTO `operation_log` VALUES (359, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:24:03', '-', '2020-05-10 12:24:03', '2020-05-10 12:24:03');
INSERT INTO `operation_log` VALUES (360, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 12:37:17', '-', '2020-05-10 12:37:17', '2020-05-10 12:37:17');
INSERT INTO `operation_log` VALUES (361, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 13:53:14', '-', '2020-05-10 13:53:14', '2020-05-10 13:53:14');
INSERT INTO `operation_log` VALUES (362, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 13:57:35', '-', '2020-05-10 13:57:35', '2020-05-10 13:57:35');
INSERT INTO `operation_log` VALUES (363, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:35:41', '-', '2020-05-10 14:35:41', '2020-05-10 14:35:41');
INSERT INTO `operation_log` VALUES (364, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:35:41', '-', '2020-05-10 14:35:41', '2020-05-10 14:35:41');
INSERT INTO `operation_log` VALUES (365, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:35:41', '-', '2020-05-10 14:35:41', '2020-05-10 14:35:41');
INSERT INTO `operation_log` VALUES (366, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:35:46', '-', '2020-05-10 14:35:46', '2020-05-10 14:35:46');
INSERT INTO `operation_log` VALUES (367, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:35:46', '-', '2020-05-10 14:35:46', '2020-05-10 14:35:46');
INSERT INTO `operation_log` VALUES (368, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:35:46', '-', '2020-05-10 14:35:46', '2020-05-10 14:35:46');
INSERT INTO `operation_log` VALUES (369, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:35:46', '-', '2020-05-10 14:35:46', '2020-05-10 14:35:46');
INSERT INTO `operation_log` VALUES (370, '', '', '/v1/users/2/status', 'PUT', '[GET] -> {} | [POST] -> id=2&status=2', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:36:30', '-', '2020-05-10 14:36:30', '2020-05-10 14:36:30');
INSERT INTO `operation_log` VALUES (371, '', '', '/v1/users/2/status', 'PUT', '[GET] -> {} | [POST] -> id=2&status=1', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:36:31', '-', '2020-05-10 14:36:31', '2020-05-10 14:36:31');
INSERT INTO `operation_log` VALUES (372, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:36:42', '-', '2020-05-10 14:36:42', '2020-05-10 14:36:42');
INSERT INTO `operation_log` VALUES (373, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:36:46', '-', '2020-05-10 14:36:46', '2020-05-10 14:36:46');
INSERT INTO `operation_log` VALUES (374, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:36:46', '-', '2020-05-10 14:36:46', '2020-05-10 14:36:46');
INSERT INTO `operation_log` VALUES (375, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"skip\":[\"10\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:36:46', '-', '2020-05-10 14:36:46', '2020-05-10 14:36:46');
INSERT INTO `operation_log` VALUES (376, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:36:46', '-', '2020-05-10 14:36:46', '2020-05-10 14:36:46');
INSERT INTO `operation_log` VALUES (377, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:36:48', '-', '2020-05-10 14:36:48', '2020-05-10 14:36:48');
INSERT INTO `operation_log` VALUES (378, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:36:59', '-', '2020-05-10 14:36:59', '2020-05-10 14:36:59');
INSERT INTO `operation_log` VALUES (379, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:36:59', '-', '2020-05-10 14:36:59', '2020-05-10 14:36:59');
INSERT INTO `operation_log` VALUES (380, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:02', '-', '2020-05-10 14:37:02', '2020-05-10 14:37:02');
INSERT INTO `operation_log` VALUES (381, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:02', '-', '2020-05-10 14:37:02', '2020-05-10 14:37:02');
INSERT INTO `operation_log` VALUES (382, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=2\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:08', '-', '2020-05-10 14:37:08', '2020-05-10 14:37:08');
INSERT INTO `operation_log` VALUES (383, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=2\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:08', '-', '2020-05-10 14:37:08', '2020-05-10 14:37:08');
INSERT INTO `operation_log` VALUES (384, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=4\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:10', '-', '2020-05-10 14:37:10', '2020-05-10 14:37:10');
INSERT INTO `operation_log` VALUES (385, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:10', '-', '2020-05-10 14:37:10', '2020-05-10 14:37:10');
INSERT INTO `operation_log` VALUES (386, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=3\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:12', '-', '2020-05-10 14:37:12', '2020-05-10 14:37:12');
INSERT INTO `operation_log` VALUES (387, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=3\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:12', '-', '2020-05-10 14:37:12', '2020-05-10 14:37:12');
INSERT INTO `operation_log` VALUES (388, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:13', '-', '2020-05-10 14:37:13', '2020-05-10 14:37:13');
INSERT INTO `operation_log` VALUES (389, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:13', '-', '2020-05-10 14:37:13', '2020-05-10 14:37:13');
INSERT INTO `operation_log` VALUES (390, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=3\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:33', '-', '2020-05-10 14:37:33', '2020-05-10 14:37:33');
INSERT INTO `operation_log` VALUES (391, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=3\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:33', '-', '2020-05-10 14:37:33', '2020-05-10 14:37:33');
INSERT INTO `operation_log` VALUES (392, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:40', '-', '2020-05-10 14:37:40', '2020-05-10 14:37:40');
INSERT INTO `operation_log` VALUES (393, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:37:41', '-', '2020-05-10 14:37:41', '2020-05-10 14:37:41');
INSERT INTO `operation_log` VALUES (394, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:38:33', '-', '2020-05-10 14:38:33', '2020-05-10 14:38:33');
INSERT INTO `operation_log` VALUES (395, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:39:13', '-', '2020-05-10 14:39:13', '2020-05-10 14:39:13');
INSERT INTO `operation_log` VALUES (396, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:39:13', '-', '2020-05-10 14:39:13', '2020-05-10 14:39:13');
INSERT INTO `operation_log` VALUES (397, '', '', '/v1/log/logins', 'GET', '[GET] -> {\"end_time\":[\"2020-05-10 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-10 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:39:40', '-', '2020-05-10 14:39:40', '2020-05-10 14:39:40');
INSERT INTO `operation_log` VALUES (398, '', '', '/v1/log/operations', 'GET', '[GET] -> {\"end_time\":[\"2020-05-10 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-10 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:39:45', '-', '2020-05-10 14:39:45', '2020-05-10 14:39:45');
INSERT INTO `operation_log` VALUES (399, '', '', '/v1/log/operations', 'GET', '[GET] -> {\"end_time\":[\"2020-05-10 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-10 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:39:52', '-', '2020-05-10 14:39:52', '2020-05-10 14:39:52');
INSERT INTO `operation_log` VALUES (400, '', '', '/v1/setting/ldap', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:39:56', '-', '2020-05-10 14:39:56', '2020-05-10 14:39:56');
INSERT INTO `operation_log` VALUES (401, '', '', '/v1/setting/email', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.89.5.50', '', '2020-05-10 14:40:04', '-', '2020-05-10 14:40:04', '2020-05-10 14:40:04');
INSERT INTO `operation_log` VALUES (402, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 14:52:30', '-', '2020-05-10 14:52:30', '2020-05-10 14:52:30');
INSERT INTO `operation_log` VALUES (403, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 14:54:32', '-', '2020-05-10 14:54:32', '2020-05-10 14:54:32');
INSERT INTO `operation_log` VALUES (404, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 14:54:32', '-', '2020-05-10 14:54:32', '2020-05-10 14:54:32');
INSERT INTO `operation_log` VALUES (405, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 14:54:42', '-', '2020-05-10 14:54:42', '2020-05-10 14:54:42');
INSERT INTO `operation_log` VALUES (406, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 14:54:43', '-', '2020-05-10 14:54:43', '2020-05-10 14:54:43');
INSERT INTO `operation_log` VALUES (407, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 14:56:36', '-', '2020-05-10 14:56:36', '2020-05-10 14:56:36');
INSERT INTO `operation_log` VALUES (408, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 14:56:36', '-', '2020-05-10 14:56:36', '2020-05-10 14:56:36');
INSERT INTO `operation_log` VALUES (409, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 14:56:41', '-', '2020-05-10 14:56:41', '2020-05-10 14:56:41');
INSERT INTO `operation_log` VALUES (410, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 14:56:41', '-', '2020-05-10 14:56:41', '2020-05-10 14:56:41');
INSERT INTO `operation_log` VALUES (411, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 14:56:44', '-', '2020-05-10 14:56:44', '2020-05-10 14:56:44');
INSERT INTO `operation_log` VALUES (412, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 14:58:39', '-', '2020-05-10 14:58:39', '2020-05-10 14:58:39');
INSERT INTO `operation_log` VALUES (413, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1117&name=%E6%B7%BB%E5%8A%A0&menu_type=2&url=&order_num=1&perms=%2Fnovel%2Fcategories%3Aadd&icon=&parents%5B0%5D=0&parents%5B1%5D=105&parents%5B2%5D=106&alias=post%40%2Fnovel%2Fcategories&author=vue-element-admin&domain_id=4&parent_id=106', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:00:08', '-', '2020-05-10 15:00:08', '2020-05-10 15:00:08');
INSERT INTO `operation_log` VALUES (414, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:00:08', '-', '2020-05-10 15:00:08', '2020-05-10 15:00:08');
INSERT INTO `operation_log` VALUES (415, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1101&name=%E4%BF%AE%E6%94%B9&menu_type=2&url=&order_num=1&perms=%2Fnovel%2Fcategories%3Aedit&icon=&parents%5B0%5D=0&parents%5B1%5D=105&parents%5B2%5D=106&alias=put%40%2Fnovel%2Fcategories%2F%3Aid&author=vue-element-admin&domain_id=4&parent_id=106', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:01:10', '-', '2020-05-10 15:01:10', '2020-05-10 15:01:10');
INSERT INTO `operation_log` VALUES (416, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:01:10', '-', '2020-05-10 15:01:10', '2020-05-10 15:01:10');
INSERT INTO `operation_log` VALUES (417, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1054&name=%E5%88%A0%E9%99%A4&menu_type=2&url=&order_num=1&perms=%2Fnovel%2Fcategories%3Adel&icon=&parents%5B0%5D=0&parents%5B1%5D=105&parents%5B2%5D=106&alias=delete%40%2Fnovel%2Fcategories%2F%3Aid&author=vue-element-admin&domain_id=4&parent_id=106', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:02:00', '-', '2020-05-10 15:02:00', '2020-05-10 15:02:00');
INSERT INTO `operation_log` VALUES (418, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:02:00', '-', '2020-05-10 15:02:00', '2020-05-10 15:02:00');
INSERT INTO `operation_log` VALUES (419, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:02:32', '-', '2020-05-10 15:02:32', '2020-05-10 15:02:32');
INSERT INTO `operation_log` VALUES (420, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:02:33', '-', '2020-05-10 15:02:33', '2020-05-10 15:02:33');
INSERT INTO `operation_log` VALUES (421, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:02:33', '-', '2020-05-10 15:02:33', '2020-05-10 15:02:33');
INSERT INTO `operation_log` VALUES (422, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:02:42', '-', '2020-05-10 15:02:42', '2020-05-10 15:02:42');
INSERT INTO `operation_log` VALUES (423, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:02:42', '-', '2020-05-10 15:02:42', '2020-05-10 15:02:42');
INSERT INTO `operation_log` VALUES (424, '', '', '/v1/roles/7', 'DELETE', '[GET] -> {} | [POST] -> id=7', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:02:56', '-', '2020-05-10 15:02:56', '2020-05-10 15:02:56');
INSERT INTO `operation_log` VALUES (425, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:02:56', '-', '2020-05-10 15:02:56', '2020-05-10 15:02:56');
INSERT INTO `operation_log` VALUES (426, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=4\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:02:58', '-', '2020-05-10 15:02:58', '2020-05-10 15:02:58');
INSERT INTO `operation_log` VALUES (427, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:02:58', '-', '2020-05-10 15:02:58', '2020-05-10 15:02:58');
INSERT INTO `operation_log` VALUES (428, '', '', '/v1/roles/6', 'PUT', '[GET] -> {} | [POST] -> id=6&name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&domain_id=4&role_name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&remark=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&menu_ids=105%2C106%2C108%2C109%2C110%2C111&menu_ids_ele=105%2C106%2C108%2C109%2C110%2C111&data_perm_ids=&timestamp=NaN', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:03:02', '-', '2020-05-10 15:03:02', '2020-05-10 15:03:02');
INSERT INTO `operation_log` VALUES (429, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:03:02', '-', '2020-05-10 15:03:02', '2020-05-10 15:03:02');
INSERT INTO `operation_log` VALUES (430, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:20', '-', '2020-05-10 15:05:20', '2020-05-10 15:05:20');
INSERT INTO `operation_log` VALUES (431, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:26', '-', '2020-05-10 15:05:26', '2020-05-10 15:05:26');
INSERT INTO `operation_log` VALUES (432, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:26', '-', '2020-05-10 15:05:26', '2020-05-10 15:05:26');
INSERT INTO `operation_log` VALUES (433, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:26', '-', '2020-05-10 15:05:26', '2020-05-10 15:05:26');
INSERT INTO `operation_log` VALUES (434, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:26', '-', '2020-05-10 15:05:26', '2020-05-10 15:05:26');
INSERT INTO `operation_log` VALUES (435, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:30', '-', '2020-05-10 15:05:30', '2020-05-10 15:05:30');
INSERT INTO `operation_log` VALUES (436, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:30', '-', '2020-05-10 15:05:30', '2020-05-10 15:05:30');
INSERT INTO `operation_log` VALUES (437, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:40', '-', '2020-05-10 15:05:40', '2020-05-10 15:05:40');
INSERT INTO `operation_log` VALUES (438, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=4\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:40', '-', '2020-05-10 15:05:40', '2020-05-10 15:05:40');
INSERT INTO `operation_log` VALUES (439, '', '', '/v1/roles/6', 'PUT', '[GET] -> {} | [POST] -> id=6&name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&domain_id=4&role_name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&remark=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&menu_ids=105%2C106%2C108%2C109%2C110%2C111&menu_ids_ele=105%2C106%2C108%2C109%2C110%2C111&data_perm_ids=&timestamp=NaN', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:45', '-', '2020-05-10 15:05:45', '2020-05-10 15:05:45');
INSERT INTO `operation_log` VALUES (440, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:45', '-', '2020-05-10 15:05:45', '2020-05-10 15:05:45');
INSERT INTO `operation_log` VALUES (441, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:48', '-', '2020-05-10 15:05:48', '2020-05-10 15:05:48');
INSERT INTO `operation_log` VALUES (442, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:48', '-', '2020-05-10 15:05:48', '2020-05-10 15:05:48');
INSERT INTO `operation_log` VALUES (443, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:48', '-', '2020-05-10 15:05:48', '2020-05-10 15:05:48');
INSERT INTO `operation_log` VALUES (444, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:48', '-', '2020-05-10 15:05:48', '2020-05-10 15:05:48');
INSERT INTO `operation_log` VALUES (445, '', '', '/v1/users/2/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:50', '-', '2020-05-10 15:05:50', '2020-05-10 15:05:50');
INSERT INTO `operation_log` VALUES (446, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:05:54', '-', '2020-05-10 15:05:54', '2020-05-10 15:05:54');
INSERT INTO `operation_log` VALUES (447, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:06:00', '-', '2020-05-10 15:06:00', '2020-05-10 15:06:00');
INSERT INTO `operation_log` VALUES (448, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:06:14', '-', '2020-05-10 15:06:14', '2020-05-10 15:06:14');
INSERT INTO `operation_log` VALUES (449, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:10:03', '-', '2020-05-10 15:10:03', '2020-05-10 15:10:03');
INSERT INTO `operation_log` VALUES (450, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:10:08', '-', '2020-05-10 15:10:08', '2020-05-10 15:10:08');
INSERT INTO `operation_log` VALUES (451, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:15:25', '-', '2020-05-10 15:15:25', '2020-05-10 15:15:25');
INSERT INTO `operation_log` VALUES (452, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:17:51', '-', '2020-05-10 15:17:51', '2020-05-10 15:17:51');
INSERT INTO `operation_log` VALUES (453, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:20:15', '-', '2020-05-10 15:20:15', '2020-05-10 15:20:15');
INSERT INTO `operation_log` VALUES (454, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:22:19', '-', '2020-05-10 15:22:19', '2020-05-10 15:22:19');
INSERT INTO `operation_log` VALUES (455, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:35:44', '-', '2020-05-10 15:35:44', '2020-05-10 15:35:44');
INSERT INTO `operation_log` VALUES (456, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:35:54', '-', '2020-05-10 15:35:54', '2020-05-10 15:35:54');
INSERT INTO `operation_log` VALUES (457, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:36:20', '-', '2020-05-10 15:36:20', '2020-05-10 15:36:20');
INSERT INTO `operation_log` VALUES (458, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 15:53:26', '-', '2020-05-10 15:53:26', '2020-05-10 15:53:26');
INSERT INTO `operation_log` VALUES (459, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 16:22:27', '-', '2020-05-10 16:22:27', '2020-05-10 16:22:27');
INSERT INTO `operation_log` VALUES (460, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 16:22:30', '-', '2020-05-10 16:22:30', '2020-05-10 16:22:30');
INSERT INTO `operation_log` VALUES (461, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 16:28:28', '-', '2020-05-10 16:28:28', '2020-05-10 16:28:28');
INSERT INTO `operation_log` VALUES (462, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 16:30:06', '-', '2020-05-10 16:30:06', '2020-05-10 16:30:06');
INSERT INTO `operation_log` VALUES (463, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 16:32:58', '-', '2020-05-10 16:32:58', '2020-05-10 16:32:58');
INSERT INTO `operation_log` VALUES (464, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 18:55:53', '-', '2020-05-10 18:55:53', '2020-05-10 18:55:53');
INSERT INTO `operation_log` VALUES (465, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 18:55:53', '-', '2020-05-10 18:55:53', '2020-05-10 18:55:53');
INSERT INTO `operation_log` VALUES (466, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 18:55:53', '-', '2020-05-10 18:55:53', '2020-05-10 18:55:53');
INSERT INTO `operation_log` VALUES (467, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:08:42', '-', '2020-05-10 19:08:42', '2020-05-10 19:08:42');
INSERT INTO `operation_log` VALUES (468, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:09:11', '-', '2020-05-10 19:09:11', '2020-05-10 19:09:11');
INSERT INTO `operation_log` VALUES (469, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:09:52', '-', '2020-05-10 19:09:52', '2020-05-10 19:09:52');
INSERT INTO `operation_log` VALUES (470, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:10:48', '-', '2020-05-10 19:10:48', '2020-05-10 19:10:48');
INSERT INTO `operation_log` VALUES (471, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:11:09', '-', '2020-05-10 19:11:09', '2020-05-10 19:11:09');
INSERT INTO `operation_log` VALUES (472, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:14:32', '-', '2020-05-10 19:14:32', '2020-05-10 19:14:32');
INSERT INTO `operation_log` VALUES (473, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:21:36', '-', '2020-05-10 19:21:36', '2020-05-10 19:21:36');
INSERT INTO `operation_log` VALUES (474, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:21:41', '-', '2020-05-10 19:21:41', '2020-05-10 19:21:41');
INSERT INTO `operation_log` VALUES (475, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:21:52', '-', '2020-05-10 19:21:52', '2020-05-10 19:21:52');
INSERT INTO `operation_log` VALUES (476, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:22:01', '-', '2020-05-10 19:22:01', '2020-05-10 19:22:01');
INSERT INTO `operation_log` VALUES (477, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:25:10', '-', '2020-05-10 19:25:10', '2020-05-10 19:25:10');
INSERT INTO `operation_log` VALUES (478, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:25:32', '-', '2020-05-10 19:25:32', '2020-05-10 19:25:32');
INSERT INTO `operation_log` VALUES (479, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:28:42', '-', '2020-05-10 19:28:42', '2020-05-10 19:28:42');
INSERT INTO `operation_log` VALUES (480, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:43:58', '-', '2020-05-10 19:43:58', '2020-05-10 19:43:58');
INSERT INTO `operation_log` VALUES (481, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:43:58', '-', '2020-05-10 19:43:58', '2020-05-10 19:43:58');
INSERT INTO `operation_log` VALUES (482, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:44:08', '-', '2020-05-10 19:44:08', '2020-05-10 19:44:08');
INSERT INTO `operation_log` VALUES (483, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 19:44:08', '-', '2020-05-10 19:44:08', '2020-05-10 19:44:08');
INSERT INTO `operation_log` VALUES (484, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:03', '-', '2020-05-10 20:03:03', '2020-05-10 20:03:03');
INSERT INTO `operation_log` VALUES (485, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:03', '-', '2020-05-10 20:03:03', '2020-05-10 20:03:03');
INSERT INTO `operation_log` VALUES (486, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:04', '-', '2020-05-10 20:03:04', '2020-05-10 20:03:04');
INSERT INTO `operation_log` VALUES (487, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:09', '-', '2020-05-10 20:03:09', '2020-05-10 20:03:09');
INSERT INTO `operation_log` VALUES (488, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:09', '-', '2020-05-10 20:03:09', '2020-05-10 20:03:09');
INSERT INTO `operation_log` VALUES (489, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:09', '-', '2020-05-10 20:03:09', '2020-05-10 20:03:09');
INSERT INTO `operation_log` VALUES (490, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:10', '-', '2020-05-10 20:03:10', '2020-05-10 20:03:10');
INSERT INTO `operation_log` VALUES (491, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:12', '-', '2020-05-10 20:03:12', '2020-05-10 20:03:12');
INSERT INTO `operation_log` VALUES (492, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:34', '-', '2020-05-10 20:03:34', '2020-05-10 20:03:34');
INSERT INTO `operation_log` VALUES (493, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=10\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:34', '-', '2020-05-10 20:03:34', '2020-05-10 20:03:34');
INSERT INTO `operation_log` VALUES (494, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"skip\":[\"10\"]} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:34', '-', '2020-05-10 20:03:34', '2020-05-10 20:03:34');
INSERT INTO `operation_log` VALUES (495, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:34', '-', '2020-05-10 20:03:34', '2020-05-10 20:03:34');
INSERT INTO `operation_log` VALUES (496, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:38', '-', '2020-05-10 20:03:38', '2020-05-10 20:03:38');
INSERT INTO `operation_log` VALUES (497, '', '', '/v1/depts', 'POST', '[GET] -> {} | [POST] -> id=1069&name=555&remark=&callbackurl=&parents%5B0%5D=0&author=vue-element-admin&parent_id=0', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:50', '-', '2020-05-10 20:03:50', '2020-05-10 20:03:50');
INSERT INTO `operation_log` VALUES (498, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:03:50', '-', '2020-05-10 20:03:50', '2020-05-10 20:03:50');
INSERT INTO `operation_log` VALUES (499, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 20:03:54', '-', '2020-05-10 20:03:54', '2020-05-10 20:03:54');
INSERT INTO `operation_log` VALUES (500, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 20:04:00', '-', '2020-05-10 20:04:00', '2020-05-10 20:04:00');
INSERT INTO `operation_log` VALUES (501, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:04:03', '-', '2020-05-10 20:04:03', '2020-05-10 20:04:03');
INSERT INTO `operation_log` VALUES (502, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:04:03', '-', '2020-05-10 20:04:03', '2020-05-10 20:04:03');
INSERT INTO `operation_log` VALUES (503, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:04:12', '-', '2020-05-10 20:04:12', '2020-05-10 20:04:12');
INSERT INTO `operation_log` VALUES (504, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:04:20', '-', '2020-05-10 20:04:20', '2020-05-10 20:04:20');
INSERT INTO `operation_log` VALUES (505, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '101.88.12.107', '', '2020-05-10 20:04:20', '-', '2020-05-10 20:04:20', '2020-05-10 20:04:20');
INSERT INTO `operation_log` VALUES (506, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 20:04:35', '-', '2020-05-10 20:04:35', '2020-05-10 20:04:35');
INSERT INTO `operation_log` VALUES (507, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 20:30:20', '-', '2020-05-10 20:30:20', '2020-05-10 20:30:20');
INSERT INTO `operation_log` VALUES (508, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 20:31:25', '-', '2020-05-10 20:31:25', '2020-05-10 20:31:25');
INSERT INTO `operation_log` VALUES (509, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 20:31:38', '-', '2020-05-10 20:31:38', '2020-05-10 20:31:38');
INSERT INTO `operation_log` VALUES (510, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 20:42:39', '-', '2020-05-10 20:42:39', '2020-05-10 20:42:39');
INSERT INTO `operation_log` VALUES (511, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 20:46:50', '-', '2020-05-10 20:46:50', '2020-05-10 20:46:50');
INSERT INTO `operation_log` VALUES (512, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 20:54:50', '-', '2020-05-10 20:54:50', '2020-05-10 20:54:50');
INSERT INTO `operation_log` VALUES (513, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 20:54:58', '-', '2020-05-10 20:54:58', '2020-05-10 20:54:58');
INSERT INTO `operation_log` VALUES (514, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 20:55:21', '-', '2020-05-10 20:55:21', '2020-05-10 20:55:21');
INSERT INTO `operation_log` VALUES (515, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:07:20', '-', '2020-05-10 21:07:20', '2020-05-10 21:07:20');
INSERT INTO `operation_log` VALUES (516, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:08:05', '-', '2020-05-10 21:08:05', '2020-05-10 21:08:05');
INSERT INTO `operation_log` VALUES (517, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:09:01', '-', '2020-05-10 21:09:01', '2020-05-10 21:09:01');
INSERT INTO `operation_log` VALUES (518, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:09:21', '-', '2020-05-10 21:09:21', '2020-05-10 21:09:21');
INSERT INTO `operation_log` VALUES (519, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:18:55', '-', '2020-05-10 21:18:55', '2020-05-10 21:18:55');
INSERT INTO `operation_log` VALUES (520, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:18:55', '-', '2020-05-10 21:18:55', '2020-05-10 21:18:55');
INSERT INTO `operation_log` VALUES (521, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:18:55', '-', '2020-05-10 21:18:55', '2020-05-10 21:18:55');
INSERT INTO `operation_log` VALUES (522, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:19:02', '-', '2020-05-10 21:19:02', '2020-05-10 21:19:02');
INSERT INTO `operation_log` VALUES (523, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:19:02', '-', '2020-05-10 21:19:02', '2020-05-10 21:19:02');
INSERT INTO `operation_log` VALUES (524, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:19:23', '-', '2020-05-10 21:19:23', '2020-05-10 21:19:23');
INSERT INTO `operation_log` VALUES (525, '', '', '/v1/log/logins', 'GET', '[GET] -> {\"end_time\":[\"2020-05-10 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-10 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:19:48', '-', '2020-05-10 21:19:48', '2020-05-10 21:19:48');
INSERT INTO `operation_log` VALUES (526, '', '', '/v1/log/operations', 'GET', '[GET] -> {\"end_time\":[\"2020-05-10 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-10 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:19:58', '-', '2020-05-10 21:19:58', '2020-05-10 21:19:58');
INSERT INTO `operation_log` VALUES (527, '', '', '/v1/setting/ldap', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:11', '-', '2020-05-10 21:20:11', '2020-05-10 21:20:11');
INSERT INTO `operation_log` VALUES (528, '', '', '/v1/setting/email', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:16', '-', '2020-05-10 21:20:16', '2020-05-10 21:20:16');
INSERT INTO `operation_log` VALUES (529, '', '', '/v1/setting/ldap', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:18', '-', '2020-05-10 21:20:18', '2020-05-10 21:20:18');
INSERT INTO `operation_log` VALUES (530, '', '', '/v1/log/logins', 'GET', '[GET] -> {\"end_time\":[\"2020-05-10 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-10 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:20', '-', '2020-05-10 21:20:20', '2020-05-10 21:20:20');
INSERT INTO `operation_log` VALUES (531, '', '', '/v1/log/operations', 'GET', '[GET] -> {\"end_time\":[\"2020-05-10 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-10 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:25', '-', '2020-05-10 21:20:25', '2020-05-10 21:20:25');
INSERT INTO `operation_log` VALUES (532, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:29', '-', '2020-05-10 21:20:29', '2020-05-10 21:20:29');
INSERT INTO `operation_log` VALUES (533, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:29', '-', '2020-05-10 21:20:29', '2020-05-10 21:20:29');
INSERT INTO `operation_log` VALUES (534, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:30', '-', '2020-05-10 21:20:30', '2020-05-10 21:20:30');
INSERT INTO `operation_log` VALUES (535, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:36', '-', '2020-05-10 21:20:36', '2020-05-10 21:20:36');
INSERT INTO `operation_log` VALUES (536, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:36', '-', '2020-05-10 21:20:36', '2020-05-10 21:20:36');
INSERT INTO `operation_log` VALUES (537, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:47', '-', '2020-05-10 21:20:47', '2020-05-10 21:20:47');
INSERT INTO `operation_log` VALUES (538, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:47', '-', '2020-05-10 21:20:47', '2020-05-10 21:20:47');
INSERT INTO `operation_log` VALUES (539, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:47', '-', '2020-05-10 21:20:47', '2020-05-10 21:20:47');
INSERT INTO `operation_log` VALUES (540, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:47', '-', '2020-05-10 21:20:47', '2020-05-10 21:20:47');
INSERT INTO `operation_log` VALUES (541, '', '', '/v1/users/1/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:20:52', '-', '2020-05-10 21:20:52', '2020-05-10 21:20:52');
INSERT INTO `operation_log` VALUES (542, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:02', '-', '2020-05-10 21:21:02', '2020-05-10 21:21:02');
INSERT INTO `operation_log` VALUES (543, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:02', '-', '2020-05-10 21:21:02', '2020-05-10 21:21:02');
INSERT INTO `operation_log` VALUES (544, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=4\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:06', '-', '2020-05-10 21:21:06', '2020-05-10 21:21:06');
INSERT INTO `operation_log` VALUES (545, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:06', '-', '2020-05-10 21:21:06', '2020-05-10 21:21:06');
INSERT INTO `operation_log` VALUES (546, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:15', '-', '2020-05-10 21:21:15', '2020-05-10 21:21:15');
INSERT INTO `operation_log` VALUES (547, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:26', '-', '2020-05-10 21:21:26', '2020-05-10 21:21:26');
INSERT INTO `operation_log` VALUES (548, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:26', '-', '2020-05-10 21:21:26', '2020-05-10 21:21:26');
INSERT INTO `operation_log` VALUES (549, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:31', '-', '2020-05-10 21:21:31', '2020-05-10 21:21:31');
INSERT INTO `operation_log` VALUES (550, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:33', '-', '2020-05-10 21:21:33', '2020-05-10 21:21:33');
INSERT INTO `operation_log` VALUES (551, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:33', '-', '2020-05-10 21:21:33', '2020-05-10 21:21:33');
INSERT INTO `operation_log` VALUES (552, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:33', '-', '2020-05-10 21:21:33', '2020-05-10 21:21:33');
INSERT INTO `operation_log` VALUES (553, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:33', '-', '2020-05-10 21:21:33', '2020-05-10 21:21:33');
INSERT INTO `operation_log` VALUES (554, '', '', '/v1/users/1/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:42', '-', '2020-05-10 21:21:42', '2020-05-10 21:21:42');
INSERT INTO `operation_log` VALUES (555, '', '', '/v1/users/1/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:21:53', '-', '2020-05-10 21:21:53', '2020-05-10 21:21:53');
INSERT INTO `operation_log` VALUES (556, '', '', '/v1/account/security', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:23:24', '-', '2020-05-10 21:23:24', '2020-05-10 21:23:24');
INSERT INTO `operation_log` VALUES (557, '', '', '/v1/account/thirds', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '110.184.199.19', '', '2020-05-10 21:23:30', '-', '2020-05-10 21:23:30', '2020-05-10 21:23:30');
INSERT INTO `operation_log` VALUES (558, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:38:34', '-', '2020-05-10 21:38:34', '2020-05-10 21:38:34');
INSERT INTO `operation_log` VALUES (559, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:38:34', '-', '2020-05-10 21:38:34', '2020-05-10 21:38:34');
INSERT INTO `operation_log` VALUES (560, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:38:37', '-', '2020-05-10 21:38:37', '2020-05-10 21:38:37');
INSERT INTO `operation_log` VALUES (561, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=2\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:38:39', '-', '2020-05-10 21:38:39', '2020-05-10 21:38:39');
INSERT INTO `operation_log` VALUES (562, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=3\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:38:40', '-', '2020-05-10 21:38:40', '2020-05-10 21:38:40');
INSERT INTO `operation_log` VALUES (563, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:38:42', '-', '2020-05-10 21:38:42', '2020-05-10 21:38:42');
INSERT INTO `operation_log` VALUES (564, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1059&name=%E5%B0%8F%E8%AF%B4%E5%88%97%E8%A1%A8&menu_type=1&url=%2Fbooks&order_num=1&perms=&icon=chart&parents%5B0%5D=0&parents%5B1%5D=105&author=vue-element-admin&domain_id=4&parent_id=105', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:40:27', '-', '2020-05-10 21:40:27', '2020-05-10 21:40:27');
INSERT INTO `operation_log` VALUES (565, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:40:27', '-', '2020-05-10 21:40:27', '2020-05-10 21:40:27');
INSERT INTO `operation_log` VALUES (566, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:40:48', '-', '2020-05-10 21:40:48', '2020-05-10 21:40:48');
INSERT INTO `operation_log` VALUES (567, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:40:49', '-', '2020-05-10 21:40:49', '2020-05-10 21:40:49');
INSERT INTO `operation_log` VALUES (568, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:40:53', '-', '2020-05-10 21:40:53', '2020-05-10 21:40:53');
INSERT INTO `operation_log` VALUES (569, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:40:53', '-', '2020-05-10 21:40:53', '2020-05-10 21:40:53');
INSERT INTO `operation_log` VALUES (570, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:40:55', '-', '2020-05-10 21:40:55', '2020-05-10 21:40:55');
INSERT INTO `operation_log` VALUES (571, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1030&name=%E6%B5%8F%E8%A7%88&menu_type=2&url=&order_num=1&perms=%2Fnovel%2Fbooks&icon=&parents%5B0%5D=0&alias=get%40%2Fnovel%2Fbooks%2Cget%40%2Fnovel%2Fbooks%2F%3Aid&author=vue-element-admin&domain_id=4&parent_id=0', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:41:45', '-', '2020-05-10 21:41:45', '2020-05-10 21:41:45');
INSERT INTO `operation_log` VALUES (572, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:41:45', '-', '2020-05-10 21:41:45', '2020-05-10 21:41:45');
INSERT INTO `operation_log` VALUES (573, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:42:03', '-', '2020-05-10 21:42:03', '2020-05-10 21:42:03');
INSERT INTO `operation_log` VALUES (574, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1070&name=%E6%B7%BB%E5%8A%A0&menu_type=2&url=&order_num=1&perms=%2Fnovel%2Fbooks%3Aadd&icon=&parents%5B0%5D=0&parents%5B1%5D=105&parents%5B2%5D=112&alias=post%40%2Fnovel%2Fbooks&author=vue-element-admin&domain_id=4&parent_id=112', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:42:51', '-', '2020-05-10 21:42:51', '2020-05-10 21:42:51');
INSERT INTO `operation_log` VALUES (575, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:42:51', '-', '2020-05-10 21:42:51', '2020-05-10 21:42:51');
INSERT INTO `operation_log` VALUES (576, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1106&name=%E4%BF%AE%E6%94%B9&menu_type=2&url=&order_num=1&perms=%2Fnovel%2Fbooks%3Aedit&icon=&parents%5B0%5D=0&parents%5B1%5D=105&parents%5B2%5D=112&alias=put%40%2Fnovel%2Fbooks%2F%3Aid&author=vue-element-admin&domain_id=4&parent_id=112', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:43:30', '-', '2020-05-10 21:43:30', '2020-05-10 21:43:30');
INSERT INTO `operation_log` VALUES (577, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:43:30', '-', '2020-05-10 21:43:30', '2020-05-10 21:43:30');
INSERT INTO `operation_log` VALUES (578, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1105&name=%E5%88%A0%E9%99%A4&menu_type=2&url=&order_num=1&perms=%2Fnovel%2Fbooks%3Adel&icon=&parents%5B0%5D=0&parents%5B1%5D=105&parents%5B2%5D=112&alias=delete%40%2Fnovel%2Fbooks%2F%3Aid&author=vue-element-admin&domain_id=4&parent_id=112', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:44:16', '-', '2020-05-10 21:44:16', '2020-05-10 21:44:16');
INSERT INTO `operation_log` VALUES (579, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:44:16', '-', '2020-05-10 21:44:16', '2020-05-10 21:44:16');
INSERT INTO `operation_log` VALUES (580, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:45:23', '-', '2020-05-10 21:45:23', '2020-05-10 21:45:23');
INSERT INTO `operation_log` VALUES (581, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:45:24', '-', '2020-05-10 21:45:24', '2020-05-10 21:45:24');
INSERT INTO `operation_log` VALUES (582, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:45:24', '-', '2020-05-10 21:45:24', '2020-05-10 21:45:24');
INSERT INTO `operation_log` VALUES (583, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:46:01', '-', '2020-05-10 21:46:01', '2020-05-10 21:46:01');
INSERT INTO `operation_log` VALUES (584, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1099&name=%E8%AF%84%E8%AE%BA%E5%88%97%E8%A1%A8&menu_type=1&url=%2Fnovel%2Fcomments&order_num=1&perms=&icon=documentation&parents%5B0%5D=0&parents%5B1%5D=105&author=vue-element-admin&domain_id=4&parent_id=105', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:46:36', '-', '2020-05-10 21:46:36', '2020-05-10 21:46:36');
INSERT INTO `operation_log` VALUES (585, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:46:36', '-', '2020-05-10 21:46:36', '2020-05-10 21:46:36');
INSERT INTO `operation_log` VALUES (586, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:47:01', '-', '2020-05-10 21:47:01', '2020-05-10 21:47:01');
INSERT INTO `operation_log` VALUES (587, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:47:01', '-', '2020-05-10 21:47:01', '2020-05-10 21:47:01');
INSERT INTO `operation_log` VALUES (588, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:47:01', '-', '2020-05-10 21:47:01', '2020-05-10 21:47:01');
INSERT INTO `operation_log` VALUES (589, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:47:03', '-', '2020-05-10 21:47:03', '2020-05-10 21:47:03');
INSERT INTO `operation_log` VALUES (590, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1090&name=%E6%B5%8F%E8%A7%88&menu_type=2&url=&order_num=1&perms=%2Fnovel%2Fcomments&icon=&parents%5B0%5D=0&parents%5B1%5D=105&parents%5B2%5D=117&alias=get%40%2Fnovel%2Fcomments%2Cget%40%2Fnovel%2Fcomments%2F%3Aid&author=vue-element-admin&domain_id=4&parent_id=117', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:47:38', '-', '2020-05-10 21:47:38', '2020-05-10 21:47:38');
INSERT INTO `operation_log` VALUES (591, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:47:38', '-', '2020-05-10 21:47:38', '2020-05-10 21:47:38');
INSERT INTO `operation_log` VALUES (592, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1103&name=%E6%B7%BB%E5%8A%A0&menu_type=2&url=&order_num=1&perms=%2Fnovel%2Fcomments%3Aadd&icon=&parents%5B0%5D=0&parents%5B1%5D=105&parents%5B2%5D=117&alias=post%40%2Fnovel%2Fcomments&author=vue-element-admin&domain_id=4&parent_id=117', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:48:34', '-', '2020-05-10 21:48:34', '2020-05-10 21:48:34');
INSERT INTO `operation_log` VALUES (593, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:48:34', '-', '2020-05-10 21:48:34', '2020-05-10 21:48:34');
INSERT INTO `operation_log` VALUES (594, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1057&name=%E5%88%A0%E9%99%A4&menu_type=2&url=&order_num=1&perms=%2Fnovel%2Fcomments%3Adel&icon=&parents%5B0%5D=0&parents%5B1%5D=105&parents%5B2%5D=117&alias=delete%40%2Fnovel%2Fcomments%2F%3Aid&author=vue-element-admin&domain_id=4&parent_id=117', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:49:36', '-', '2020-05-10 21:49:36', '2020-05-10 21:49:36');
INSERT INTO `operation_log` VALUES (595, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-10 21:49:36', '-', '2020-05-10 21:49:36', '2020-05-10 21:49:36');
INSERT INTO `operation_log` VALUES (596, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 22:59:37', '-', '2020-05-10 22:59:37', '2020-05-10 22:59:37');
INSERT INTO `operation_log` VALUES (597, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 22:59:37', '-', '2020-05-10 22:59:37', '2020-05-10 22:59:37');
INSERT INTO `operation_log` VALUES (598, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 22:59:38', '-', '2020-05-10 22:59:38', '2020-05-10 22:59:38');
INSERT INTO `operation_log` VALUES (599, '', '', '/v1/log/logins', 'GET', '[GET] -> {\"end_time\":[\"2020-05-10 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-10 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 22:59:57', '-', '2020-05-10 22:59:57', '2020-05-10 22:59:57');
INSERT INTO `operation_log` VALUES (600, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 23:00:04', '-', '2020-05-10 23:00:04', '2020-05-10 23:00:04');
INSERT INTO `operation_log` VALUES (601, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 23:00:04', '-', '2020-05-10 23:00:04', '2020-05-10 23:00:04');
INSERT INTO `operation_log` VALUES (602, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 23:00:04', '-', '2020-05-10 23:00:04', '2020-05-10 23:00:04');
INSERT INTO `operation_log` VALUES (603, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 23:00:04', '-', '2020-05-10 23:00:04', '2020-05-10 23:00:04');
INSERT INTO `operation_log` VALUES (604, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 23:00:11', '-', '2020-05-10 23:00:11', '2020-05-10 23:00:11');
INSERT INTO `operation_log` VALUES (605, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 23:00:14', '-', '2020-05-10 23:00:14', '2020-05-10 23:00:14');
INSERT INTO `operation_log` VALUES (606, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 23:00:14', '-', '2020-05-10 23:00:14', '2020-05-10 23:00:14');
INSERT INTO `operation_log` VALUES (607, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 23:00:29', '-', '2020-05-10 23:00:29', '2020-05-10 23:00:29');
INSERT INTO `operation_log` VALUES (608, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 23:00:29', '-', '2020-05-10 23:00:29', '2020-05-10 23:00:29');
INSERT INTO `operation_log` VALUES (609, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 23:05:24', '-', '2020-05-10 23:05:24', '2020-05-10 23:05:24');
INSERT INTO `operation_log` VALUES (610, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 23:05:48', '-', '2020-05-10 23:05:48', '2020-05-10 23:05:48');
INSERT INTO `operation_log` VALUES (611, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '183.129.232.226', '', '2020-05-10 23:05:49', '-', '2020-05-10 23:05:49', '2020-05-10 23:05:49');
INSERT INTO `operation_log` VALUES (612, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 08:40:48', '-', '2020-05-11 08:40:48', '2020-05-11 08:40:48');
INSERT INTO `operation_log` VALUES (613, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 08:41:29', '-', '2020-05-11 08:41:29', '2020-05-11 08:41:29');
INSERT INTO `operation_log` VALUES (614, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 08:45:10', '-', '2020-05-11 08:45:10', '2020-05-11 08:45:10');
INSERT INTO `operation_log` VALUES (615, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 08:45:39', '-', '2020-05-11 08:45:39', '2020-05-11 08:45:39');
INSERT INTO `operation_log` VALUES (616, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 08:45:50', '-', '2020-05-11 08:45:50', '2020-05-11 08:45:50');
INSERT INTO `operation_log` VALUES (617, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.200.54.58', '', '2020-05-11 09:07:57', '-', '2020-05-11 09:07:57', '2020-05-11 09:07:57');
INSERT INTO `operation_log` VALUES (618, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.200.54.58', '', '2020-05-11 09:07:57', '-', '2020-05-11 09:07:57', '2020-05-11 09:07:57');
INSERT INTO `operation_log` VALUES (619, '', '', '/v1/account/thirds', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '113.200.54.58', '', '2020-05-11 09:07:57', '-', '2020-05-11 09:07:57', '2020-05-11 09:07:57');
INSERT INTO `operation_log` VALUES (620, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 10:25:22', '-', '2020-05-11 10:25:22', '2020-05-11 10:25:22');
INSERT INTO `operation_log` VALUES (621, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 10:57:34', '-', '2020-05-11 10:57:34', '2020-05-11 10:57:34');
INSERT INTO `operation_log` VALUES (622, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:07:52', '-', '2020-05-11 11:07:52', '2020-05-11 11:07:52');
INSERT INTO `operation_log` VALUES (623, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:08:55', '-', '2020-05-11 11:08:55', '2020-05-11 11:08:55');
INSERT INTO `operation_log` VALUES (624, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:20:13', '-', '2020-05-11 11:20:13', '2020-05-11 11:20:13');
INSERT INTO `operation_log` VALUES (625, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:24:35', '-', '2020-05-11 11:24:35', '2020-05-11 11:24:35');
INSERT INTO `operation_log` VALUES (626, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:34:01', '-', '2020-05-11 11:34:01', '2020-05-11 11:34:01');
INSERT INTO `operation_log` VALUES (627, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:37:12', '-', '2020-05-11 11:37:12', '2020-05-11 11:37:12');
INSERT INTO `operation_log` VALUES (628, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:44:17', '-', '2020-05-11 11:44:17', '2020-05-11 11:44:17');
INSERT INTO `operation_log` VALUES (629, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:45:45', '-', '2020-05-11 11:45:45', '2020-05-11 11:45:45');
INSERT INTO `operation_log` VALUES (630, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:53:19', '-', '2020-05-11 11:53:19', '2020-05-11 11:53:19');
INSERT INTO `operation_log` VALUES (631, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:53:49', '-', '2020-05-11 11:53:49', '2020-05-11 11:53:49');
INSERT INTO `operation_log` VALUES (632, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:54:21', '-', '2020-05-11 11:54:21', '2020-05-11 11:54:21');
INSERT INTO `operation_log` VALUES (633, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:54:27', '-', '2020-05-11 11:54:27', '2020-05-11 11:54:27');
INSERT INTO `operation_log` VALUES (634, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:56:01', '-', '2020-05-11 11:56:01', '2020-05-11 11:56:01');
INSERT INTO `operation_log` VALUES (635, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:56:04', '-', '2020-05-11 11:56:04', '2020-05-11 11:56:04');
INSERT INTO `operation_log` VALUES (636, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 11:58:02', '-', '2020-05-11 11:58:02', '2020-05-11 11:58:02');
INSERT INTO `operation_log` VALUES (637, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:02:09', '-', '2020-05-11 12:02:09', '2020-05-11 12:02:09');
INSERT INTO `operation_log` VALUES (638, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:02:55', '-', '2020-05-11 12:02:55', '2020-05-11 12:02:55');
INSERT INTO `operation_log` VALUES (639, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:02:57', '-', '2020-05-11 12:02:57', '2020-05-11 12:02:57');
INSERT INTO `operation_log` VALUES (640, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:03:13', '-', '2020-05-11 12:03:13', '2020-05-11 12:03:13');
INSERT INTO `operation_log` VALUES (641, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:04:10', '-', '2020-05-11 12:04:10', '2020-05-11 12:04:10');
INSERT INTO `operation_log` VALUES (642, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:04:18', '-', '2020-05-11 12:04:18', '2020-05-11 12:04:18');
INSERT INTO `operation_log` VALUES (643, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:11:28', '-', '2020-05-11 12:11:28', '2020-05-11 12:11:28');
INSERT INTO `operation_log` VALUES (644, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:11:50', '-', '2020-05-11 12:11:50', '2020-05-11 12:11:50');
INSERT INTO `operation_log` VALUES (645, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:12:35', '-', '2020-05-11 12:12:35', '2020-05-11 12:12:35');
INSERT INTO `operation_log` VALUES (646, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:16:39', '-', '2020-05-11 12:16:39', '2020-05-11 12:16:39');
INSERT INTO `operation_log` VALUES (647, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:16:44', '-', '2020-05-11 12:16:44', '2020-05-11 12:16:44');
INSERT INTO `operation_log` VALUES (648, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:17:59', '-', '2020-05-11 12:17:59', '2020-05-11 12:17:59');
INSERT INTO `operation_log` VALUES (649, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:19:13', '-', '2020-05-11 12:19:13', '2020-05-11 12:19:13');
INSERT INTO `operation_log` VALUES (650, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:19:51', '-', '2020-05-11 12:19:51', '2020-05-11 12:19:51');
INSERT INTO `operation_log` VALUES (651, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:20:01', '-', '2020-05-11 12:20:01', '2020-05-11 12:20:01');
INSERT INTO `operation_log` VALUES (652, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:23:31', '-', '2020-05-11 12:23:31', '2020-05-11 12:23:31');
INSERT INTO `operation_log` VALUES (653, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:23:51', '-', '2020-05-11 12:23:51', '2020-05-11 12:23:51');
INSERT INTO `operation_log` VALUES (654, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:25:14', '-', '2020-05-11 12:25:14', '2020-05-11 12:25:14');
INSERT INTO `operation_log` VALUES (655, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:25:47', '-', '2020-05-11 12:25:47', '2020-05-11 12:25:47');
INSERT INTO `operation_log` VALUES (656, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 12:26:15', '-', '2020-05-11 12:26:15', '2020-05-11 12:26:15');
INSERT INTO `operation_log` VALUES (657, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:25:38', '-', '2020-05-11 14:25:38', '2020-05-11 14:25:38');
INSERT INTO `operation_log` VALUES (658, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:25:38', '-', '2020-05-11 14:25:38', '2020-05-11 14:25:38');
INSERT INTO `operation_log` VALUES (659, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:25:39', '-', '2020-05-11 14:25:39', '2020-05-11 14:25:39');
INSERT INTO `operation_log` VALUES (660, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:25:58', '-', '2020-05-11 14:25:58', '2020-05-11 14:25:58');
INSERT INTO `operation_log` VALUES (661, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:25:58', '-', '2020-05-11 14:25:58', '2020-05-11 14:25:58');
INSERT INTO `operation_log` VALUES (662, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:26:02', '-', '2020-05-11 14:26:02', '2020-05-11 14:26:02');
INSERT INTO `operation_log` VALUES (663, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:26:03', '-', '2020-05-11 14:26:03', '2020-05-11 14:26:03');
INSERT INTO `operation_log` VALUES (664, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:26:04', '-', '2020-05-11 14:26:04', '2020-05-11 14:26:04');
INSERT INTO `operation_log` VALUES (665, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:26:04', '-', '2020-05-11 14:26:04', '2020-05-11 14:26:04');
INSERT INTO `operation_log` VALUES (666, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:26:23', '-', '2020-05-11 14:26:23', '2020-05-11 14:26:23');
INSERT INTO `operation_log` VALUES (667, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:26:27', '-', '2020-05-11 14:26:27', '2020-05-11 14:26:27');
INSERT INTO `operation_log` VALUES (668, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:26:27', '-', '2020-05-11 14:26:27', '2020-05-11 14:26:27');
INSERT INTO `operation_log` VALUES (669, '', '', '/v1/log/logins', 'GET', '[GET] -> {\"end_time\":[\"2020-05-11 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-11 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:26:31', '-', '2020-05-11 14:26:31', '2020-05-11 14:26:31');
INSERT INTO `operation_log` VALUES (670, '', '', '/v1/log/operations', 'GET', '[GET] -> {\"end_time\":[\"2020-05-11 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-11 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:26:37', '-', '2020-05-11 14:26:37', '2020-05-11 14:26:37');
INSERT INTO `operation_log` VALUES (671, '', '', '/v1/setting/ldap', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:26:46', '-', '2020-05-11 14:26:46', '2020-05-11 14:26:46');
INSERT INTO `operation_log` VALUES (672, '', '', '/v1/setting/email', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:26:58', '-', '2020-05-11 14:26:58', '2020-05-11 14:26:58');
INSERT INTO `operation_log` VALUES (673, '', '', '/v1/setting/ldap', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:27:10', '-', '2020-05-11 14:27:10', '2020-05-11 14:27:10');
INSERT INTO `operation_log` VALUES (674, '', '', '/v1/setting/email', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:27:11', '-', '2020-05-11 14:27:11', '2020-05-11 14:27:11');
INSERT INTO `operation_log` VALUES (675, '', '', '/v1/setting/ldap', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:27:34', '-', '2020-05-11 14:27:34', '2020-05-11 14:27:34');
INSERT INTO `operation_log` VALUES (676, '', '', '/v1/setting/email', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:27:35', '-', '2020-05-11 14:27:35', '2020-05-11 14:27:35');
INSERT INTO `operation_log` VALUES (677, '', '', '/v1/setting/ldap', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:27:36', '-', '2020-05-11 14:27:36', '2020-05-11 14:27:36');
INSERT INTO `operation_log` VALUES (678, '', '', '/v1/setting/email', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:27:41', '-', '2020-05-11 14:27:41', '2020-05-11 14:27:41');
INSERT INTO `operation_log` VALUES (679, '', '', '/v1/setting/ldap', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:27:43', '-', '2020-05-11 14:27:43', '2020-05-11 14:27:43');
INSERT INTO `operation_log` VALUES (680, '', '', '/v1/log/operations', 'GET', '[GET] -> {\"end_time\":[\"2020-05-11 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-11 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:27:44', '-', '2020-05-11 14:27:44', '2020-05-11 14:27:44');
INSERT INTO `operation_log` VALUES (681, '', '', '/v1/log/operations', 'GET', '[GET] -> {\"end_time\":[\"2020-05-11 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-11 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:27:50', '-', '2020-05-11 14:27:50', '2020-05-11 14:27:50');
INSERT INTO `operation_log` VALUES (682, '', '', '/v1/log/operations', 'GET', '[GET] -> {\"end_time\":[\"2020-05-11 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-11 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:27:54', '-', '2020-05-11 14:27:54', '2020-05-11 14:27:54');
INSERT INTO `operation_log` VALUES (683, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '101.254.236.202', '', '2020-05-11 14:28:01', '-', '2020-05-11 14:28:01', '2020-05-11 14:28:01');
INSERT INTO `operation_log` VALUES (684, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:41:49', '-', '2020-05-11 14:41:49', '2020-05-11 14:41:49');
INSERT INTO `operation_log` VALUES (685, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:41:49', '-', '2020-05-11 14:41:49', '2020-05-11 14:41:49');
INSERT INTO `operation_log` VALUES (686, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:41:50', '-', '2020-05-11 14:41:50', '2020-05-11 14:41:50');
INSERT INTO `operation_log` VALUES (687, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:41:56', '-', '2020-05-11 14:41:56', '2020-05-11 14:41:56');
INSERT INTO `operation_log` VALUES (688, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:41:56', '-', '2020-05-11 14:41:56', '2020-05-11 14:41:56');
INSERT INTO `operation_log` VALUES (689, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:41:58', '-', '2020-05-11 14:41:58', '2020-05-11 14:41:58');
INSERT INTO `operation_log` VALUES (690, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:02', '-', '2020-05-11 14:42:02', '2020-05-11 14:42:02');
INSERT INTO `operation_log` VALUES (691, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:03', '-', '2020-05-11 14:42:03', '2020-05-11 14:42:03');
INSERT INTO `operation_log` VALUES (692, '', '', '/v1/setting/ldap', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:10', '-', '2020-05-11 14:42:10', '2020-05-11 14:42:10');
INSERT INTO `operation_log` VALUES (693, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:13', '-', '2020-05-11 14:42:13', '2020-05-11 14:42:13');
INSERT INTO `operation_log` VALUES (694, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:13', '-', '2020-05-11 14:42:13', '2020-05-11 14:42:13');
INSERT INTO `operation_log` VALUES (695, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:13', '-', '2020-05-11 14:42:13', '2020-05-11 14:42:13');
INSERT INTO `operation_log` VALUES (696, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:14', '-', '2020-05-11 14:42:14', '2020-05-11 14:42:14');
INSERT INTO `operation_log` VALUES (697, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:14', '-', '2020-05-11 14:42:14', '2020-05-11 14:42:14');
INSERT INTO `operation_log` VALUES (698, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:17', '-', '2020-05-11 14:42:17', '2020-05-11 14:42:17');
INSERT INTO `operation_log` VALUES (699, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:17', '-', '2020-05-11 14:42:17', '2020-05-11 14:42:17');
INSERT INTO `operation_log` VALUES (700, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:17', '-', '2020-05-11 14:42:17', '2020-05-11 14:42:17');
INSERT INTO `operation_log` VALUES (701, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:18', '-', '2020-05-11 14:42:18', '2020-05-11 14:42:18');
INSERT INTO `operation_log` VALUES (702, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:20', '-', '2020-05-11 14:42:20', '2020-05-11 14:42:20');
INSERT INTO `operation_log` VALUES (703, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '117.62.172.178', '', '2020-05-11 14:42:21', '-', '2020-05-11 14:42:21', '2020-05-11 14:42:21');
INSERT INTO `operation_log` VALUES (704, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.132.204.146', '', '2020-05-11 14:42:38', '-', '2020-05-11 14:42:38', '2020-05-11 14:42:38');
INSERT INTO `operation_log` VALUES (705, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.132.204.146', '', '2020-05-11 14:42:38', '-', '2020-05-11 14:42:38', '2020-05-11 14:42:38');
INSERT INTO `operation_log` VALUES (706, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.132.204.146', '', '2020-05-11 14:42:39', '-', '2020-05-11 14:42:39', '2020-05-11 14:42:39');
INSERT INTO `operation_log` VALUES (707, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '58.132.204.146', '', '2020-05-11 14:42:48', '-', '2020-05-11 14:42:48', '2020-05-11 14:42:48');
INSERT INTO `operation_log` VALUES (708, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.132.204.146', '', '2020-05-11 14:42:56', '-', '2020-05-11 14:42:56', '2020-05-11 14:42:56');
INSERT INTO `operation_log` VALUES (709, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '58.132.204.146', '', '2020-05-11 14:42:56', '-', '2020-05-11 14:42:56', '2020-05-11 14:42:56');
INSERT INTO `operation_log` VALUES (710, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '58.132.204.146', '', '2020-05-11 14:42:59', '-', '2020-05-11 14:42:59', '2020-05-11 14:42:59');
INSERT INTO `operation_log` VALUES (711, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.132.204.146', '', '2020-05-11 14:43:07', '-', '2020-05-11 14:43:07', '2020-05-11 14:43:07');
INSERT INTO `operation_log` VALUES (712, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '58.132.204.146', '', '2020-05-11 14:43:07', '-', '2020-05-11 14:43:07', '2020-05-11 14:43:07');
INSERT INTO `operation_log` VALUES (713, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '58.132.204.146', '', '2020-05-11 14:43:10', '-', '2020-05-11 14:43:10', '2020-05-11 14:43:10');
INSERT INTO `operation_log` VALUES (714, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '58.132.204.146', '', '2020-05-11 14:43:15', '-', '2020-05-11 14:43:15', '2020-05-11 14:43:15');
INSERT INTO `operation_log` VALUES (715, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '58.132.204.146', '', '2020-05-11 14:43:24', '-', '2020-05-11 14:43:24', '2020-05-11 14:43:24');
INSERT INTO `operation_log` VALUES (716, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:54:59', '-', '2020-05-11 14:54:59', '2020-05-11 14:54:59');
INSERT INTO `operation_log` VALUES (717, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:54:59', '-', '2020-05-11 14:54:59', '2020-05-11 14:54:59');
INSERT INTO `operation_log` VALUES (718, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:55:00', '-', '2020-05-11 14:55:00', '2020-05-11 14:55:00');
INSERT INTO `operation_log` VALUES (719, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:55:06', '-', '2020-05-11 14:55:06', '2020-05-11 14:55:06');
INSERT INTO `operation_log` VALUES (720, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:55:06', '-', '2020-05-11 14:55:06', '2020-05-11 14:55:06');
INSERT INTO `operation_log` VALUES (721, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:55:06', '-', '2020-05-11 14:55:06', '2020-05-11 14:55:06');
INSERT INTO `operation_log` VALUES (722, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:55:06', '-', '2020-05-11 14:55:06', '2020-05-11 14:55:06');
INSERT INTO `operation_log` VALUES (723, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:55:12', '-', '2020-05-11 14:55:12', '2020-05-11 14:55:12');
INSERT INTO `operation_log` VALUES (724, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:55:16', '-', '2020-05-11 14:55:16', '2020-05-11 14:55:16');
INSERT INTO `operation_log` VALUES (725, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:55:16', '-', '2020-05-11 14:55:16', '2020-05-11 14:55:16');
INSERT INTO `operation_log` VALUES (726, '', '', '/v1/log/logins', 'GET', '[GET] -> {\"end_time\":[\"2020-05-11 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-11 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:55:44', '-', '2020-05-11 14:55:44', '2020-05-11 14:55:44');
INSERT INTO `operation_log` VALUES (727, '', '', '/v1/log/operations', 'GET', '[GET] -> {\"end_time\":[\"2020-05-11 00:00:00\"],\"ip\":[\"\"],\"limit\":[\"10\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"],\"start_time\":[\"2020-04-11 00:00:00\"],\"username\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:56:09', '-', '2020-05-11 14:56:09', '2020-05-11 14:56:09');
INSERT INTO `operation_log` VALUES (728, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:56:20', '-', '2020-05-11 14:56:20', '2020-05-11 14:56:20');
INSERT INTO `operation_log` VALUES (729, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:56:20', '-', '2020-05-11 14:56:20', '2020-05-11 14:56:20');
INSERT INTO `operation_log` VALUES (730, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:57:03', '-', '2020-05-11 14:57:03', '2020-05-11 14:57:03');
INSERT INTO `operation_log` VALUES (731, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:57:13', '-', '2020-05-11 14:57:13', '2020-05-11 14:57:13');
INSERT INTO `operation_log` VALUES (732, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:57:13', '-', '2020-05-11 14:57:13', '2020-05-11 14:57:13');
INSERT INTO `operation_log` VALUES (733, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:57:17', '-', '2020-05-11 14:57:17', '2020-05-11 14:57:17');
INSERT INTO `operation_log` VALUES (734, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:57:17', '-', '2020-05-11 14:57:17', '2020-05-11 14:57:17');
INSERT INTO `operation_log` VALUES (735, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:57:20', '-', '2020-05-11 14:57:20', '2020-05-11 14:57:20');
INSERT INTO `operation_log` VALUES (736, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:57:20', '-', '2020-05-11 14:57:20', '2020-05-11 14:57:20');
INSERT INTO `operation_log` VALUES (737, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:57:20', '-', '2020-05-11 14:57:20', '2020-05-11 14:57:20');
INSERT INTO `operation_log` VALUES (738, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:57:20', '-', '2020-05-11 14:57:20', '2020-05-11 14:57:20');
INSERT INTO `operation_log` VALUES (739, '', '', '/v1/users/1/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:57:22', '-', '2020-05-11 14:57:22', '2020-05-11 14:57:22');
INSERT INTO `operation_log` VALUES (740, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:57:53', '-', '2020-05-11 14:57:53', '2020-05-11 14:57:53');
INSERT INTO `operation_log` VALUES (741, '', '', '/v1/users/1/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:58:12', '-', '2020-05-11 14:58:12', '2020-05-11 14:58:12');
INSERT INTO `operation_log` VALUES (742, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:58:18', '-', '2020-05-11 14:58:18', '2020-05-11 14:58:18');
INSERT INTO `operation_log` VALUES (743, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:58:18', '-', '2020-05-11 14:58:18', '2020-05-11 14:58:18');
INSERT INTO `operation_log` VALUES (744, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:58:40', '-', '2020-05-11 14:58:40', '2020-05-11 14:58:40');
INSERT INTO `operation_log` VALUES (745, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:58:40', '-', '2020-05-11 14:58:40', '2020-05-11 14:58:40');
INSERT INTO `operation_log` VALUES (746, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:58:49', '-', '2020-05-11 14:58:49', '2020-05-11 14:58:49');
INSERT INTO `operation_log` VALUES (747, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=4\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:58:53', '-', '2020-05-11 14:58:53', '2020-05-11 14:58:53');
INSERT INTO `operation_log` VALUES (748, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:58:53', '-', '2020-05-11 14:58:53', '2020-05-11 14:58:53');
INSERT INTO `operation_log` VALUES (749, '', '', '/v1/roles/6', 'PUT', '[GET] -> {} | [POST] -> id=6&name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&domain_id=4&role_name=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&remark=%E9%9D%92%E6%A9%99CMS%E7%AE%A1%E7%90%86%E5%91%98&menu_ids=106%2C108%2C109%2C110%2C111%2C114%2C116%2C117%2C118%2C119%2C120%2C105%2C112&menu_ids_ele=106%2C108%2C109%2C110%2C111%2C114%2C116%2C117%2C118%2C119%2C120&data_perm_ids=&timestamp=NaN', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:59:01', '-', '2020-05-11 14:59:01', '2020-05-11 14:59:01');
INSERT INTO `operation_log` VALUES (750, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:59:01', '-', '2020-05-11 14:59:01', '2020-05-11 14:59:01');
INSERT INTO `operation_log` VALUES (751, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:59:03', '-', '2020-05-11 14:59:03', '2020-05-11 14:59:03');
INSERT INTO `operation_log` VALUES (752, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=4\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 14:59:03', '-', '2020-05-11 14:59:03', '2020-05-11 14:59:03');
INSERT INTO `operation_log` VALUES (753, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 15:00:28', '-', '2020-05-11 15:00:28', '2020-05-11 15:00:28');
INSERT INTO `operation_log` VALUES (754, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 15:00:28', '-', '2020-05-11 15:00:28', '2020-05-11 15:00:28');
INSERT INTO `operation_log` VALUES (755, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 15:00:51', '-', '2020-05-11 15:00:51', '2020-05-11 15:00:51');
INSERT INTO `operation_log` VALUES (756, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '171.221.240.73', '', '2020-05-11 15:00:51', '-', '2020-05-11 15:00:51', '2020-05-11 15:00:51');
INSERT INTO `operation_log` VALUES (757, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '47.57.174.235', '', '2020-05-11 16:07:22', '-', '2020-05-11 16:07:22', '2020-05-11 16:07:22');
INSERT INTO `operation_log` VALUES (758, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '47.57.174.235', '', '2020-05-11 16:07:23', '-', '2020-05-11 16:07:23', '2020-05-11 16:07:23');
INSERT INTO `operation_log` VALUES (759, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '47.57.174.235', '', '2020-05-11 16:07:25', '-', '2020-05-11 16:07:25', '2020-05-11 16:07:25');
INSERT INTO `operation_log` VALUES (760, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '47.57.174.235', '', '2020-05-11 16:07:28', '-', '2020-05-11 16:07:28', '2020-05-11 16:07:28');
INSERT INTO `operation_log` VALUES (761, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '47.57.174.235', '', '2020-05-11 16:07:31', '-', '2020-05-11 16:07:31', '2020-05-11 16:07:31');
INSERT INTO `operation_log` VALUES (762, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '47.57.174.235', '', '2020-05-11 16:09:34', '-', '2020-05-11 16:09:34', '2020-05-11 16:09:34');
INSERT INTO `operation_log` VALUES (763, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '47.57.174.235', '', '2020-05-11 16:09:35', '-', '2020-05-11 16:09:35', '2020-05-11 16:09:35');
INSERT INTO `operation_log` VALUES (764, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:09:55', '-', '2020-05-11 16:09:55', '2020-05-11 16:09:55');
INSERT INTO `operation_log` VALUES (765, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:09:55', '-', '2020-05-11 16:09:55', '2020-05-11 16:09:55');
INSERT INTO `operation_log` VALUES (766, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:10:04', '-', '2020-05-11 16:10:04', '2020-05-11 16:10:04');
INSERT INTO `operation_log` VALUES (767, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:10:04', '-', '2020-05-11 16:10:04', '2020-05-11 16:10:04');
INSERT INTO `operation_log` VALUES (768, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:10:42', '-', '2020-05-11 16:10:42', '2020-05-11 16:10:42');
INSERT INTO `operation_log` VALUES (769, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:10:50', '-', '2020-05-11 16:10:50', '2020-05-11 16:10:50');
INSERT INTO `operation_log` VALUES (770, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:10:50', '-', '2020-05-11 16:10:50', '2020-05-11 16:10:50');
INSERT INTO `operation_log` VALUES (771, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:10:55', '-', '2020-05-11 16:10:55', '2020-05-11 16:10:55');
INSERT INTO `operation_log` VALUES (772, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:10:55', '-', '2020-05-11 16:10:55', '2020-05-11 16:10:55');
INSERT INTO `operation_log` VALUES (773, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:11:01', '-', '2020-05-11 16:11:01', '2020-05-11 16:11:01');
INSERT INTO `operation_log` VALUES (774, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:11:03', '-', '2020-05-11 16:11:03', '2020-05-11 16:11:03');
INSERT INTO `operation_log` VALUES (775, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:11:03', '-', '2020-05-11 16:11:03', '2020-05-11 16:11:03');
INSERT INTO `operation_log` VALUES (776, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=4\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:11:05', '-', '2020-05-11 16:11:05', '2020-05-11 16:11:05');
INSERT INTO `operation_log` VALUES (777, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:11:07', '-', '2020-05-11 16:11:07', '2020-05-11 16:11:07');
INSERT INTO `operation_log` VALUES (778, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:11:32', '-', '2020-05-11 16:11:32', '2020-05-11 16:11:32');
INSERT INTO `operation_log` VALUES (779, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:11:44', '-', '2020-05-11 16:11:44', '2020-05-11 16:11:44');
INSERT INTO `operation_log` VALUES (780, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:11:44', '-', '2020-05-11 16:11:44', '2020-05-11 16:11:44');
INSERT INTO `operation_log` VALUES (781, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:11:47', '-', '2020-05-11 16:11:47', '2020-05-11 16:11:47');
INSERT INTO `operation_log` VALUES (782, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:11:47', '-', '2020-05-11 16:11:47', '2020-05-11 16:11:47');
INSERT INTO `operation_log` VALUES (783, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:12:08', '-', '2020-05-11 16:12:08', '2020-05-11 16:12:08');
INSERT INTO `operation_log` VALUES (784, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:12:10', '-', '2020-05-11 16:12:10', '2020-05-11 16:12:10');
INSERT INTO `operation_log` VALUES (785, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:12:10', '-', '2020-05-11 16:12:10', '2020-05-11 16:12:10');
INSERT INTO `operation_log` VALUES (786, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:12:10', '-', '2020-05-11 16:12:10', '2020-05-11 16:12:10');
INSERT INTO `operation_log` VALUES (787, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:12:10', '-', '2020-05-11 16:12:10', '2020-05-11 16:12:10');
INSERT INTO `operation_log` VALUES (788, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:12:31', '-', '2020-05-11 16:12:31', '2020-05-11 16:12:31');
INSERT INTO `operation_log` VALUES (789, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:12:31', '-', '2020-05-11 16:12:31', '2020-05-11 16:12:31');
INSERT INTO `operation_log` VALUES (790, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:12:37', '-', '2020-05-11 16:12:37', '2020-05-11 16:12:37');
INSERT INTO `operation_log` VALUES (791, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:12:39', '-', '2020-05-11 16:12:39', '2020-05-11 16:12:39');
INSERT INTO `operation_log` VALUES (792, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:12:39', '-', '2020-05-11 16:12:39', '2020-05-11 16:12:39');
INSERT INTO `operation_log` VALUES (793, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:17', '-', '2020-05-11 16:14:17', '2020-05-11 16:14:17');
INSERT INTO `operation_log` VALUES (794, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:17', '-', '2020-05-11 16:14:17', '2020-05-11 16:14:17');
INSERT INTO `operation_log` VALUES (795, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:20', '-', '2020-05-11 16:14:20', '2020-05-11 16:14:20');
INSERT INTO `operation_log` VALUES (796, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=2\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:21', '-', '2020-05-11 16:14:21', '2020-05-11 16:14:21');
INSERT INTO `operation_log` VALUES (797, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=3\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:22', '-', '2020-05-11 16:14:22', '2020-05-11 16:14:22');
INSERT INTO `operation_log` VALUES (798, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=4\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:24', '-', '2020-05-11 16:14:24', '2020-05-11 16:14:24');
INSERT INTO `operation_log` VALUES (799, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:26', '-', '2020-05-11 16:14:26', '2020-05-11 16:14:26');
INSERT INTO `operation_log` VALUES (800, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:26', '-', '2020-05-11 16:14:26', '2020-05-11 16:14:26');
INSERT INTO `operation_log` VALUES (801, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:26', '-', '2020-05-11 16:14:26', '2020-05-11 16:14:26');
INSERT INTO `operation_log` VALUES (802, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:26', '-', '2020-05-11 16:14:26', '2020-05-11 16:14:26');
INSERT INTO `operation_log` VALUES (803, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:27', '-', '2020-05-11 16:14:27', '2020-05-11 16:14:27');
INSERT INTO `operation_log` VALUES (804, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=2\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:28', '-', '2020-05-11 16:14:28', '2020-05-11 16:14:28');
INSERT INTO `operation_log` VALUES (805, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=3\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:30', '-', '2020-05-11 16:14:30', '2020-05-11 16:14:30');
INSERT INTO `operation_log` VALUES (806, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:32', '-', '2020-05-11 16:14:32', '2020-05-11 16:14:32');
INSERT INTO `operation_log` VALUES (807, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:34', '-', '2020-05-11 16:14:34', '2020-05-11 16:14:34');
INSERT INTO `operation_log` VALUES (808, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '218.75.97.138', '', '2020-05-11 16:14:34', '-', '2020-05-11 16:14:34', '2020-05-11 16:14:34');
INSERT INTO `operation_log` VALUES (809, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:31:17', '-', '2020-05-11 16:31:17', '2020-05-11 16:31:17');
INSERT INTO `operation_log` VALUES (810, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:33:00', '-', '2020-05-11 16:33:00', '2020-05-11 16:33:00');
INSERT INTO `operation_log` VALUES (811, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:39:36', '-', '2020-05-11 16:39:36', '2020-05-11 16:39:36');
INSERT INTO `operation_log` VALUES (812, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:43:21', '-', '2020-05-11 16:43:21', '2020-05-11 16:43:21');
INSERT INTO `operation_log` VALUES (813, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:43:49', '-', '2020-05-11 16:43:49', '2020-05-11 16:43:49');
INSERT INTO `operation_log` VALUES (814, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:46:01', '-', '2020-05-11 16:46:01', '2020-05-11 16:46:01');
INSERT INTO `operation_log` VALUES (815, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:46:08', '-', '2020-05-11 16:46:08', '2020-05-11 16:46:08');
INSERT INTO `operation_log` VALUES (816, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:47:03', '-', '2020-05-11 16:47:03', '2020-05-11 16:47:03');
INSERT INTO `operation_log` VALUES (817, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:49:47', '-', '2020-05-11 16:49:47', '2020-05-11 16:49:47');
INSERT INTO `operation_log` VALUES (818, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:50:06', '-', '2020-05-11 16:50:06', '2020-05-11 16:50:06');
INSERT INTO `operation_log` VALUES (819, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:51:10', '-', '2020-05-11 16:51:10', '2020-05-11 16:51:10');
INSERT INTO `operation_log` VALUES (820, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:57:44', '-', '2020-05-11 16:57:44', '2020-05-11 16:57:44');
INSERT INTO `operation_log` VALUES (821, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 16:58:31', '-', '2020-05-11 16:58:31', '2020-05-11 16:58:31');
INSERT INTO `operation_log` VALUES (822, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 17:04:41', '-', '2020-05-11 17:04:41', '2020-05-11 17:04:41');
INSERT INTO `operation_log` VALUES (823, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 17:11:17', '-', '2020-05-11 17:11:17', '2020-05-11 17:11:17');
INSERT INTO `operation_log` VALUES (824, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 17:11:37', '-', '2020-05-11 17:11:37', '2020-05-11 17:11:37');
INSERT INTO `operation_log` VALUES (825, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 17:11:43', '-', '2020-05-11 17:11:43', '2020-05-11 17:11:43');
INSERT INTO `operation_log` VALUES (826, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 17:16:57', '-', '2020-05-11 17:16:57', '2020-05-11 17:16:57');
INSERT INTO `operation_log` VALUES (827, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 17:16:58', '-', '2020-05-11 17:16:58', '2020-05-11 17:16:58');
INSERT INTO `operation_log` VALUES (828, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 17:16:58', '-', '2020-05-11 17:16:58', '2020-05-11 17:16:58');
INSERT INTO `operation_log` VALUES (829, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 17:17:03', '-', '2020-05-11 17:17:03', '2020-05-11 17:17:03');
INSERT INTO `operation_log` VALUES (830, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:21:12', '-', '2020-05-11 17:21:12', '2020-05-11 17:21:12');
INSERT INTO `operation_log` VALUES (831, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:21:12', '-', '2020-05-11 17:21:12', '2020-05-11 17:21:12');
INSERT INTO `operation_log` VALUES (832, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:21:12', '-', '2020-05-11 17:21:12', '2020-05-11 17:21:12');
INSERT INTO `operation_log` VALUES (833, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:21:17', '-', '2020-05-11 17:21:17', '2020-05-11 17:21:17');
INSERT INTO `operation_log` VALUES (834, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:21:17', '-', '2020-05-11 17:21:17', '2020-05-11 17:21:17');
INSERT INTO `operation_log` VALUES (835, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:22:08', '-', '2020-05-11 17:22:08', '2020-05-11 17:22:08');
INSERT INTO `operation_log` VALUES (836, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:22:25', '-', '2020-05-11 17:22:25', '2020-05-11 17:22:25');
INSERT INTO `operation_log` VALUES (837, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:22:25', '-', '2020-05-11 17:22:25', '2020-05-11 17:22:25');
INSERT INTO `operation_log` VALUES (838, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '180.168.26.115', '', '2020-05-11 17:29:16', '-', '2020-05-11 17:29:16', '2020-05-11 17:29:16');
INSERT INTO `operation_log` VALUES (839, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '180.168.26.115', '', '2020-05-11 17:29:16', '-', '2020-05-11 17:29:16', '2020-05-11 17:29:16');
INSERT INTO `operation_log` VALUES (840, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '180.168.26.115', '', '2020-05-11 17:29:17', '-', '2020-05-11 17:29:17', '2020-05-11 17:29:17');
INSERT INTO `operation_log` VALUES (841, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '180.168.26.115', '', '2020-05-11 17:30:00', '-', '2020-05-11 17:30:00', '2020-05-11 17:30:00');
INSERT INTO `operation_log` VALUES (842, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '180.168.26.115', '', '2020-05-11 17:30:00', '-', '2020-05-11 17:30:00', '2020-05-11 17:30:00');
INSERT INTO `operation_log` VALUES (843, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '180.168.26.115', '', '2020-05-11 17:30:01', '-', '2020-05-11 17:30:01', '2020-05-11 17:30:01');
INSERT INTO `operation_log` VALUES (844, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '180.168.26.115', '', '2020-05-11 17:30:01', '-', '2020-05-11 17:30:01', '2020-05-11 17:30:01');
INSERT INTO `operation_log` VALUES (845, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1029&name=%E6%B5%8B%E8%AF%95&menu_type=2&url=&order_num=1&perms=1&icon=&parents%5B0%5D=0&parents%5B1%5D=1&parents%5B2%5D=2&parents%5B3%5D=3&alias=1&author=vue-element-admin&domain_id=1&parent_id=3', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:34:38', '-', '2020-05-11 17:34:38', '2020-05-11 17:34:38');
INSERT INTO `operation_log` VALUES (846, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:34:39', '-', '2020-05-11 17:34:39', '2020-05-11 17:34:39');
INSERT INTO `operation_log` VALUES (847, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:35:53', '-', '2020-05-11 17:35:53', '2020-05-11 17:35:53');
INSERT INTO `operation_log` VALUES (848, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:36:06', '-', '2020-05-11 17:36:06', '2020-05-11 17:36:06');
INSERT INTO `operation_log` VALUES (849, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:36:06', '-', '2020-05-11 17:36:06', '2020-05-11 17:36:06');
INSERT INTO `operation_log` VALUES (850, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"skip\":[\"10\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:36:06', '-', '2020-05-11 17:36:06', '2020-05-11 17:36:06');
INSERT INTO `operation_log` VALUES (851, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:36:06', '-', '2020-05-11 17:36:06', '2020-05-11 17:36:06');
INSERT INTO `operation_log` VALUES (852, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:36:10', '-', '2020-05-11 17:36:10', '2020-05-11 17:36:10');
INSERT INTO `operation_log` VALUES (853, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:36:10', '-', '2020-05-11 17:36:10', '2020-05-11 17:36:10');
INSERT INTO `operation_log` VALUES (854, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:36:12', '-', '2020-05-11 17:36:12', '2020-05-11 17:36:12');
INSERT INTO `operation_log` VALUES (855, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:36:12', '-', '2020-05-11 17:36:12', '2020-05-11 17:36:12');
INSERT INTO `operation_log` VALUES (856, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:36:26', '-', '2020-05-11 17:36:26', '2020-05-11 17:36:26');
INSERT INTO `operation_log` VALUES (857, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:36:26', '-', '2020-05-11 17:36:26', '2020-05-11 17:36:26');
INSERT INTO `operation_log` VALUES (858, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=2\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:36:28', '-', '2020-05-11 17:36:28', '2020-05-11 17:36:28');
INSERT INTO `operation_log` VALUES (859, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=2\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:36:28', '-', '2020-05-11 17:36:28', '2020-05-11 17:36:28');
INSERT INTO `operation_log` VALUES (860, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:55:38', '-', '2020-05-11 17:55:38', '2020-05-11 17:55:38');
INSERT INTO `operation_log` VALUES (861, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:55:40', '-', '2020-05-11 17:55:40', '2020-05-11 17:55:40');
INSERT INTO `operation_log` VALUES (862, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:55:40', '-', '2020-05-11 17:55:40', '2020-05-11 17:55:40');
INSERT INTO `operation_log` VALUES (863, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:55:45', '-', '2020-05-11 17:55:45', '2020-05-11 17:55:45');
INSERT INTO `operation_log` VALUES (864, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 17:55:45', '-', '2020-05-11 17:55:45', '2020-05-11 17:55:45');
INSERT INTO `operation_log` VALUES (865, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:21:29', '-', '2020-05-11 19:21:29', '2020-05-11 19:21:29');
INSERT INTO `operation_log` VALUES (866, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:21:31', '-', '2020-05-11 19:21:31', '2020-05-11 19:21:31');
INSERT INTO `operation_log` VALUES (867, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:21:32', '-', '2020-05-11 19:21:32', '2020-05-11 19:21:32');
INSERT INTO `operation_log` VALUES (868, '', '', '/v1/menus', 'POST', '[GET] -> {} | [POST] -> id=1081&name=3213&menu_type=1&url=123&order_num=1&perms=&icon=&parents%5B0%5D=0&author=vue-element-admin&domain_id=1&parent_id=0', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:22:53', '-', '2020-05-11 19:22:53', '2020-05-11 19:22:53');
INSERT INTO `operation_log` VALUES (869, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:22:54', '-', '2020-05-11 19:22:54', '2020-05-11 19:22:54');
INSERT INTO `operation_log` VALUES (870, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:35:01', '-', '2020-05-11 19:35:01', '2020-05-11 19:35:01');
INSERT INTO `operation_log` VALUES (871, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:35:02', '-', '2020-05-11 19:35:02', '2020-05-11 19:35:02');
INSERT INTO `operation_log` VALUES (872, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:35:02', '-', '2020-05-11 19:35:02', '2020-05-11 19:35:02');
INSERT INTO `operation_log` VALUES (873, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:35:06', '-', '2020-05-11 19:35:06', '2020-05-11 19:35:06');
INSERT INTO `operation_log` VALUES (874, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:35:06', '-', '2020-05-11 19:35:06', '2020-05-11 19:35:06');
INSERT INTO `operation_log` VALUES (875, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=2\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:00', '-', '2020-05-11 19:39:00', '2020-05-11 19:39:00');
INSERT INTO `operation_log` VALUES (876, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:17', '-', '2020-05-11 19:39:17', '2020-05-11 19:39:17');
INSERT INTO `operation_log` VALUES (877, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:17', '-', '2020-05-11 19:39:17', '2020-05-11 19:39:17');
INSERT INTO `operation_log` VALUES (878, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:17', '-', '2020-05-11 19:39:17', '2020-05-11 19:39:17');
INSERT INTO `operation_log` VALUES (879, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:17', '-', '2020-05-11 19:39:17', '2020-05-11 19:39:17');
INSERT INTO `operation_log` VALUES (880, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:20', '-', '2020-05-11 19:39:20', '2020-05-11 19:39:20');
INSERT INTO `operation_log` VALUES (881, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:26', '-', '2020-05-11 19:39:26', '2020-05-11 19:39:26');
INSERT INTO `operation_log` VALUES (882, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"skip\":[\"10\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:26', '-', '2020-05-11 19:39:26', '2020-05-11 19:39:26');
INSERT INTO `operation_log` VALUES (883, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"d=1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:26', '-', '2020-05-11 19:39:26', '2020-05-11 19:39:26');
INSERT INTO `operation_log` VALUES (884, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:26', '-', '2020-05-11 19:39:26', '2020-05-11 19:39:26');
INSERT INTO `operation_log` VALUES (885, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:32', '-', '2020-05-11 19:39:32', '2020-05-11 19:39:32');
INSERT INTO `operation_log` VALUES (886, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:32', '-', '2020-05-11 19:39:32', '2020-05-11 19:39:32');
INSERT INTO `operation_log` VALUES (887, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:32', '-', '2020-05-11 19:39:32', '2020-05-11 19:39:32');
INSERT INTO `operation_log` VALUES (888, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:32', '-', '2020-05-11 19:39:32', '2020-05-11 19:39:32');
INSERT INTO `operation_log` VALUES (889, '', '', '/v1/users/1/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:36', '-', '2020-05-11 19:39:36', '2020-05-11 19:39:36');
INSERT INTO `operation_log` VALUES (890, '', '', '/v1/users/1/roles', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:42', '-', '2020-05-11 19:39:42', '2020-05-11 19:39:42');
INSERT INTO `operation_log` VALUES (891, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:59', '-', '2020-05-11 19:39:59', '2020-05-11 19:39:59');
INSERT INTO `operation_log` VALUES (892, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:39:59', '-', '2020-05-11 19:39:59', '2020-05-11 19:39:59');
INSERT INTO `operation_log` VALUES (893, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:40:01', '-', '2020-05-11 19:40:01', '2020-05-11 19:40:01');
INSERT INTO `operation_log` VALUES (894, '', '', '/v1/datas', 'GET', '[GET] -> {\"limit\":[\"20\"],\"q\":[\"d=1\"],\"start\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '112.94.22.13', '', '2020-05-11 19:40:01', '-', '2020-05-11 19:40:01', '2020-05-11 19:40:01');
INSERT INTO `operation_log` VALUES (895, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:50:07', '-', '2020-05-11 19:50:07', '2020-05-11 19:50:07');
INSERT INTO `operation_log` VALUES (896, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:50:18', '-', '2020-05-11 19:50:18', '2020-05-11 19:50:18');
INSERT INTO `operation_log` VALUES (897, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:50:22', '-', '2020-05-11 19:50:22', '2020-05-11 19:50:22');
INSERT INTO `operation_log` VALUES (898, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:53:38', '-', '2020-05-11 19:53:38', '2020-05-11 19:53:38');
INSERT INTO `operation_log` VALUES (899, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:53:43', '-', '2020-05-11 19:53:43', '2020-05-11 19:53:43');
INSERT INTO `operation_log` VALUES (900, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:53:53', '-', '2020-05-11 19:53:53', '2020-05-11 19:53:53');
INSERT INTO `operation_log` VALUES (901, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:54:03', '-', '2020-05-11 19:54:03', '2020-05-11 19:54:03');
INSERT INTO `operation_log` VALUES (902, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:54:33', '-', '2020-05-11 19:54:33', '2020-05-11 19:54:33');
INSERT INTO `operation_log` VALUES (903, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:54:43', '-', '2020-05-11 19:54:43', '2020-05-11 19:54:43');
INSERT INTO `operation_log` VALUES (904, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:55:34', '-', '2020-05-11 19:55:34', '2020-05-11 19:55:34');
INSERT INTO `operation_log` VALUES (905, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:56:19', '-', '2020-05-11 19:56:19', '2020-05-11 19:56:19');
INSERT INTO `operation_log` VALUES (906, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:56:22', '-', '2020-05-11 19:56:22', '2020-05-11 19:56:22');
INSERT INTO `operation_log` VALUES (907, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:56:33', '-', '2020-05-11 19:56:33', '2020-05-11 19:56:33');
INSERT INTO `operation_log` VALUES (908, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:56:43', '-', '2020-05-11 19:56:43', '2020-05-11 19:56:43');
INSERT INTO `operation_log` VALUES (909, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:57:11', '-', '2020-05-11 19:57:11', '2020-05-11 19:57:11');
INSERT INTO `operation_log` VALUES (910, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:57:42', '-', '2020-05-11 19:57:42', '2020-05-11 19:57:42');
INSERT INTO `operation_log` VALUES (911, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:58:47', '-', '2020-05-11 19:58:47', '2020-05-11 19:58:47');
INSERT INTO `operation_log` VALUES (912, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:59:43', '-', '2020-05-11 19:59:43', '2020-05-11 19:59:43');
INSERT INTO `operation_log` VALUES (913, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 19:59:50', '-', '2020-05-11 19:59:50', '2020-05-11 19:59:50');
INSERT INTO `operation_log` VALUES (914, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:01:30', '-', '2020-05-11 20:01:30', '2020-05-11 20:01:30');
INSERT INTO `operation_log` VALUES (915, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:02:10', '-', '2020-05-11 20:02:10', '2020-05-11 20:02:10');
INSERT INTO `operation_log` VALUES (916, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:02:37', '-', '2020-05-11 20:02:37', '2020-05-11 20:02:37');
INSERT INTO `operation_log` VALUES (917, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:02:44', '-', '2020-05-11 20:02:44', '2020-05-11 20:02:44');
INSERT INTO `operation_log` VALUES (918, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:02:49', '-', '2020-05-11 20:02:49', '2020-05-11 20:02:49');
INSERT INTO `operation_log` VALUES (919, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:03:03', '-', '2020-05-11 20:03:03', '2020-05-11 20:03:03');
INSERT INTO `operation_log` VALUES (920, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:03:44', '-', '2020-05-11 20:03:44', '2020-05-11 20:03:44');
INSERT INTO `operation_log` VALUES (921, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:10:18', '-', '2020-05-11 20:10:18', '2020-05-11 20:10:18');
INSERT INTO `operation_log` VALUES (922, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:10:20', '-', '2020-05-11 20:10:20', '2020-05-11 20:10:20');
INSERT INTO `operation_log` VALUES (923, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:13:06', '-', '2020-05-11 20:13:06', '2020-05-11 20:13:06');
INSERT INTO `operation_log` VALUES (924, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:13:56', '-', '2020-05-11 20:13:56', '2020-05-11 20:13:56');
INSERT INTO `operation_log` VALUES (925, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:14:13', '-', '2020-05-11 20:14:13', '2020-05-11 20:14:13');
INSERT INTO `operation_log` VALUES (926, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:15:36', '-', '2020-05-11 20:15:36', '2020-05-11 20:15:36');
INSERT INTO `operation_log` VALUES (927, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:16:01', '-', '2020-05-11 20:16:01', '2020-05-11 20:16:01');
INSERT INTO `operation_log` VALUES (928, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:16:09', '-', '2020-05-11 20:16:09', '2020-05-11 20:16:09');
INSERT INTO `operation_log` VALUES (929, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:31:00', '-', '2020-05-11 20:31:00', '2020-05-11 20:31:00');
INSERT INTO `operation_log` VALUES (930, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:34:34', '-', '2020-05-11 20:34:34', '2020-05-11 20:34:34');
INSERT INTO `operation_log` VALUES (931, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 20:35:00', '-', '2020-05-11 20:35:00', '2020-05-11 20:35:00');
INSERT INTO `operation_log` VALUES (932, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:11:11', '-', '2020-05-11 21:11:11', '2020-05-11 21:11:11');
INSERT INTO `operation_log` VALUES (933, '', '', '/v1/user/menu', 'GET', '[GET] -> {\"domain\":[\"lime\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:15:02', '-', '2020-05-11 21:15:02', '2020-05-11 21:15:02');
INSERT INTO `operation_log` VALUES (934, '', '', '/v1/account/find-code-open', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:17', '-', '2020-05-11 21:18:17', '2020-05-11 21:18:17');
INSERT INTO `operation_log` VALUES (935, '', '', '/v1/account/permissions', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:17', '-', '2020-05-11 21:18:17', '2020-05-11 21:18:17');
INSERT INTO `operation_log` VALUES (936, '', '', '/v1/account/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:18', '-', '2020-05-11 21:18:18', '2020-05-11 21:18:18');
INSERT INTO `operation_log` VALUES (937, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:33', '-', '2020-05-11 21:18:33', '2020-05-11 21:18:33');
INSERT INTO `operation_log` VALUES (938, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:33', '-', '2020-05-11 21:18:33', '2020-05-11 21:18:33');
INSERT INTO `operation_log` VALUES (939, '', '', '/v1/menus/122', 'DELETE', '[GET] -> {} | [POST] -> id=122', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:41', '-', '2020-05-11 21:18:41', '2020-05-11 21:18:41');
INSERT INTO `operation_log` VALUES (940, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=1\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:42', '-', '2020-05-11 21:18:42', '2020-05-11 21:18:42');
INSERT INTO `operation_log` VALUES (941, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=2\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:47', '-', '2020-05-11 21:18:47', '2020-05-11 21:18:47');
INSERT INTO `operation_log` VALUES (942, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=3\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:49', '-', '2020-05-11 21:18:49', '2020-05-11 21:18:49');
INSERT INTO `operation_log` VALUES (943, '', '', '/v1/menus', 'GET', '[GET] -> {\"q\":[\"d=4\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:51', '-', '2020-05-11 21:18:51', '2020-05-11 21:18:51');
INSERT INTO `operation_log` VALUES (944, '', '', '/v1/domains', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:54', '-', '2020-05-11 21:18:54', '2020-05-11 21:18:54');
INSERT INTO `operation_log` VALUES (945, '', '', '/v1/depts', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:58', '-', '2020-05-11 21:18:58', '2020-05-11 21:18:58');
INSERT INTO `operation_log` VALUES (946, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"10000\"],\"q\":[\"\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:58', '-', '2020-05-11 21:18:58', '2020-05-11 21:18:58');
INSERT INTO `operation_log` VALUES (947, '', '', '/v1/users', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:58', '-', '2020-05-11 21:18:58', '2020-05-11 21:18:58');
INSERT INTO `operation_log` VALUES (948, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:18:59', '-', '2020-05-11 21:18:59', '2020-05-11 21:18:59');
INSERT INTO `operation_log` VALUES (949, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:19:01', '-', '2020-05-11 21:19:01', '2020-05-11 21:19:01');
INSERT INTO `operation_log` VALUES (950, '', '', '/v1/domains', 'GET', '[GET] -> {} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:19:03', '-', '2020-05-11 21:19:03', '2020-05-11 21:19:03');
INSERT INTO `operation_log` VALUES (951, '', '', '/v1/roles', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"q\":[\"\"],\"skip\":[\"0\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:19:03', '-', '2020-05-11 21:19:03', '2020-05-11 21:19:03');
INSERT INTO `operation_log` VALUES (952, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:19:04', '-', '2020-05-11 21:19:04', '2020-05-11 21:19:04');
INSERT INTO `operation_log` VALUES (953, '', '', '/v1/depts/17/check-no-member', 'POST', '[GET] -> {} | [POST] -> id=17', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:19:06', '-', '2020-05-11 21:19:06', '2020-05-11 21:19:06');
INSERT INTO `operation_log` VALUES (954, '', '', '/v1/depts/17', 'DELETE', '[GET] -> {} | [POST] -> id=17', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:19:09', '-', '2020-05-11 21:19:09', '2020-05-11 21:19:09');
INSERT INTO `operation_log` VALUES (955, '', '', '/v1/depts', 'GET', '[GET] -> {\"limit\":[\"20\"],\"page\":[\"1\"],\"skip\":[\"0\"],\"sort\":[\"+id\"]} | [POST] -> ', '', 'success', 1, 2, '121.68.156.236', '', '2020-05-11 21:19:09', '-', '2020-05-11 21:19:09', '2020-05-11 21:19:09');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `domain_id` int(11) NOT NULL DEFAULT 1 COMMENT '项目域id',
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `menu_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `menu_ids_ele` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `domain_role`(`domain_id`, `role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 1, '超级管理员', '超级管理员', '2,3,4,5,6,8,10,11,12,13,14,15,16,83,84,86,87,88,89,85,90,91,92,93,94,95,98,96,97,99,100,17,18,19,20,21,76,71,72,73,74,75,23,24,25,26,27,1,7', '2,3,4,5,6,8,10,11,12,13,14,15,16,83,84,86,87,88,89,85,90,91,92,93,94,95,98,96,97,99,100,17,18,19,20,21,76,71,72,73,74,75,23,24,25,26,27');
INSERT INTO `role` VALUES (2, '系统设置', 1, '系统设置', '系统设置', '17,18,19,20,21,22,23,24,25,26,27', '17,18,19,20,21,22,23,24,25,26,27');
INSERT INTO `role` VALUES (3, '日志管理', 1, '日志管理', '日志管理', '83,84,86,87,88,89,85,90,91,92,93', '83,84,86,87,88,89,85,90,91,92,93');
INSERT INTO `role` VALUES (4, 'crawlnovel管理员', 2, 'crawlnovel管理员', '', '77,78,79,80', '77,78,79,80');
INSERT INTO `role` VALUES (5, 'zeus配置中心', 3, 'zeus配置中心', '', '101,103,104', '101,103,104');
INSERT INTO `role` VALUES (6, '青橙CMS管理员', 4, '青橙CMS管理员', '青橙CMS管理员', '106,108,109,110,111,114,116,117,118,119,120,105,112', '106,108,109,110,111,114,116,117,118,119,120');

-- ----------------------------
-- Table structure for role_data_perm
-- ----------------------------
DROP TABLE IF EXISTS `role_data_perm`;
CREATE TABLE `role_data_perm`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色id',
  `data_perm_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '数据权限id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_rdp_role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据权限与角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_data_perm
-- ----------------------------
INSERT INTO `role_data_perm` VALUES (13, 1, 1);
INSERT INTO `role_data_perm` VALUES (14, 1, 3);
INSERT INTO `role_data_perm` VALUES (15, 1, 2);
INSERT INTO `role_data_perm` VALUES (16, 6, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `sex` int(11) NOT NULL DEFAULT 0 COMMENT '性别',
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '加密盐',
  `department_id` int(11) NOT NULL DEFAULT 0 COMMENT '部门ID',
  `faceicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像地址',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 1=正常 2=禁用',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_login_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `title` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '职位，头衔',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'wutongci', '18620111141', 0, '西西', '19a5211e74936366f687c4dec5f2ee94a35e6c7122928bca1e8bac3b9ac526d70fdd48aeac23fd51313f68a9f1a07d95b5a131f8544c698caedb63c4c20d76fe', 'd795e0811e7836c87522165ea83891f53c8b5d533ea2b7841a3fe6c949b61a904b338e1f174864e1410ea4eb3ed4941d88711ddddecceafaf07d74c4d17397bb', 1, '', 'lily@hotmail.com', 1, '2019-09-30 11:40:36', '2019-09-20 11:40:40', 'developer');
INSERT INTO `user` VALUES (2, 'admin', '18665710230', 1, 'admin', '26ddcd90cc116bee0034543c0798bec8217944c0ee67ef6c5b71d24aade4c02759f34446051508714f18219ba734ce4abf7cc8d90f1f10dfd99e102115201f43', '6078b3372fb9628e2a02f1e0020b9a0af65aa0d03498e603a5dfc2e1ba119b742264858f7af07286140547ec5f1b02626792ddeac5ac30b836ac9dbde7f28c4b', 11, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '111@123.com', 1, '2019-02-18 01:30:11', '2020-05-11 21:18:18', '超管');

-- ----------------------------
-- Table structure for user_email
-- ----------------------------
DROP TABLE IF EXISTS `user_email`;
CREATE TABLE `user_email`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户ID',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Email',
  `checked` tinyint(2) NULL DEFAULT 0 COMMENT '是否验证 0 未验证 1 已经验证',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `laste_update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户邮件账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_oauth
-- ----------------------------
DROP TABLE IF EXISTS `user_oauth`;
CREATE TABLE `user_oauth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `from` tinyint(3) NOT NULL DEFAULT 1 COMMENT '来源 1.dingtalk 2.wechat 3.facebook',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '第三方openid',
  `unionid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '第三方unionid',
  `avatar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像',
  `extra` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '扩展信息',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户第三方登陆关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_oauth
-- ----------------------------
INSERT INTO `user_oauth` VALUES (1, 1, 2, '黄福祥', 'WnXRUXZZQCZQdx8t4yJSxQiEiE', 'ajq7lrBOMtB0u134Fkl4KgiEiE', '', '', '2019-10-08 09:48:22', '2019-10-08 09:48:22');

-- ----------------------------
-- Table structure for user_secret
-- ----------------------------
DROP TABLE IF EXISTS `user_secret`;
CREATE TABLE `user_secret`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT 0 COMMENT 'userid',
  `account_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '账户名称',
  `secret` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密钥',
  `is_open` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 关闭 1开启',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户安全设置-Google 2fa两步验证' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_secret
-- ----------------------------
INSERT INTO `user_secret` VALUES (1, 2, 'Zeus:2', '5KPRMCCZFDX4YKWE', 0, '2019-11-23 21:16:51', '2019-11-23 21:16:51');

SET FOREIGN_KEY_CHECKS = 1;
