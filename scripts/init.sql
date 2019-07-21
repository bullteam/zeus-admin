CREATE TABLE `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '登录用户',
  `client` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录终端型号',
  `platform` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录系统',
  `login_result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作信息',
  `login_status` tinyint(1) DEFAULT NULL COMMENT '1 成功 0失败',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip',
  `ip_location` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip地理位置',
  `operation_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `operation_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='登录日志';


CREATE TABLE `operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志编号',
  `module` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作模块',
  `request_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求地址',
  `operation_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作方法',
  `params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求参数',
  `exception_stack` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '异常堆栈信息',
  `operation_result` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作结果',
  `operation_success` tinyint(1) DEFAULT NULL COMMENT '操作结果 1 成功/2 失败',
  `user_id` int(11) DEFAULT NULL COMMENT '操作人员',
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip',
  `ip_location` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip地理位置',
  `operation_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `operation_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志';