/*
 Navicat Premium Data Transfer

 Source Server         : 本地MySql
 Source Server Type    : MySQL
 Source Server Version : 50738 (5.7.38-log)
 Source Host           : localhost:3306
 Source Schema         : rfidhyoa

 Target Server Type    : MySQL
 Target Server Version : 50738 (5.7.38-log)
 File Encoding         : 65001

 Date: 15/11/2025 23:35:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'mk_lead_source', '线索来源表（管理线索渠道信息）', NULL, NULL, 'MkLeadSource', 'crud', 'element-plus', 'com.rfidhy.base', 'base', 'source', '线索来源', 'rooney', '0', '/', '{\"parentMenuId\":1061}', 'rooney', '2025-10-30 13:59:25', '', '2025-11-09 17:03:43', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (3, 2, 'source_id', '来源ID（雪花ID）', 'bigint(20)', 'Long', 'sourceId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'rooney', '2025-10-30 13:59:25', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (4, 2, 'source_name', '来源名称（如“官网表单”“2024上海RFID展会”）', 'varchar(50)', 'String', 'sourceName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'rooney', '2025-10-30 13:59:25', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (5, 2, 'source_type', '来源类型（关联字典：mk_source_type；0-线上/1-线下/2-合作渠道）', 'varchar(30)', 'String', 'sourceType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'mk_source_type', 3, 'rooney', '2025-10-30 13:59:25', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (6, 2, 'source_owner_id', '来源负责人ID（关联sys_user.user_id）', 'bigint(20)', 'Long', 'sourceOwnerId', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'select', '', 4, 'rooney', '2025-10-30 13:59:25', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (7, 2, 'source_desc', '来源描述（如“官网表单嵌入产品详情页，用户填写后自动生成线索”）', 'varchar(1000)', 'String', 'sourceDesc', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'textarea', '', 5, 'rooney', '2025-10-30 13:59:25', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (8, 2, 'source_cost', '渠道成本（预留：后期统计ROI用）', 'decimal(16,2)', 'BigDecimal', 'sourceCost', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'input', '', 6, 'rooney', '2025-10-30 13:59:26', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (9, 2, 'sort', '排序号（前端显示顺序）', 'int(11)', 'Long', 'sort', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'input', '', 7, 'rooney', '2025-10-30 13:59:26', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (10, 2, 'status', '状态（关联字典：sys_normal_status；0-禁用/1-启用）', 'tinyint(4)', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_job_status', 8, 'rooney', '2025-10-30 13:59:26', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (11, 2, 'del_flag', '删除标记（0-正常/1-删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'radio', 'sys_yes_no', 9, 'rooney', '2025-10-30 13:59:26', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (12, 2, 'create_by', '创建人（关联sys_user.username）', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'select', '', 10, 'rooney', '2025-10-30 13:59:26', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (13, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'rooney', '2025-10-30 13:59:26', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (14, 2, 'update_by', '更新人（关联sys_user.username）', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'select', '', 12, 'rooney', '2025-10-30 13:59:26', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (15, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '0', NULL, NULL, 'EQ', 'datetime', '', 13, 'rooney', '2025-10-30 13:59:26', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (16, 2, 'reserved1', '预留字段1（后期扩展用，如“渠道URL”）', 'varchar(255)', 'String', 'reserved1', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', 14, 'rooney', '2025-10-30 13:59:26', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (17, 2, 'reserved2', '预留字段2（后期扩展用，如“渠道合作协议内容”）', 'text', 'String', 'reserved2', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'textarea', '', 15, 'rooney', '2025-10-30 13:59:26', '', '2025-11-09 17:03:43');
INSERT INTO `gen_table_column` VALUES (18, 2, 'reserved3', '预留字段3（后期扩展用，如“关联合作方ID”）', 'bigint(20)', 'Long', 'reserved3', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', 16, 'rooney', '2025-10-30 13:59:26', '', '2025-11-09 17:03:43');

-- ----------------------------
-- Table structure for mk_lead_source
-- ----------------------------
DROP TABLE IF EXISTS `mk_lead_source`;
CREATE TABLE `mk_lead_source`  (
  `source_id` bigint(20) NOT NULL COMMENT '来源ID（雪花ID）',
  `source_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '来源名称（如“官网表单”“2024上海RFID展会”）',
  `source_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '来源类型（关联字典：mk_source_type；0-线上/1-线下/2-合作渠道）',
  `source_owner_id` bigint(20) NULL DEFAULT NULL COMMENT '来源负责人ID（关联sys_user.user_id）',
  `source_desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源描述（如“官网表单嵌入产品详情页，用户填写后自动生成线索”）',
  `source_cost` decimal(16, 2) NULL DEFAULT 0.00 COMMENT '渠道成本（预留：后期统计ROI用）',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序号（前端显示顺序）',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态（关联字典：sys_normal_status；0-禁用/1-启用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0-正常/1-删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人（关联sys_user.username）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '更新人（关联sys_user.username）',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `reserved1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段1（后期扩展用，如“渠道URL”）',
  `reserved2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预留字段2（后期扩展用，如“渠道合作协议内容”）',
  `reserved3` bigint(20) NULL DEFAULT NULL COMMENT '预留字段3（后期扩展用，如“关联合作方ID”）',
  PRIMARY KEY (`source_id`) USING BTREE,
  UNIQUE INDEX `uk_source_name`(`source_name`) USING BTREE COMMENT '来源名称唯一，避免重复渠道',
  INDEX `idx_source_type_status`(`source_type`, `status`) USING BTREE COMMENT '按类型+状态筛选（常用场景：查询启用的线上渠道）',
  INDEX `idx_source_owner`(`source_owner_id`) USING BTREE COMMENT '按负责人筛选（常用场景：查询某员工负责的渠道）'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源表（管理线索渠道信息）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mk_lead_source
-- ----------------------------
INSERT INTO `mk_lead_source` VALUES (0, '抖音主号', '0', NULL, NULL, 0.00, 0, 0, '0', '', '2025-11-09 17:38:43', '', '2025-11-09 21:34:30', NULL, NULL, NULL);
INSERT INTO `mk_lead_source` VALUES (1, '抖音子账号', '0', NULL, NULL, 0.00, 1, 0, '0', '', '2025-11-09 17:39:42', '', '2025-11-09 21:34:27', NULL, NULL, NULL);
INSERT INTO `mk_lead_source` VALUES (2, '抖音广告', '0', NULL, NULL, 0.00, 2, 1, '0', '', '2025-11-09 20:34:05', '', '2025-11-15 23:31:54', NULL, NULL, NULL);
INSERT INTO `mk_lead_source` VALUES (1763220798424, '展会', '1', NULL, NULL, 0.00, 3, 0, '0', '', '2025-11-15 23:33:19', '', '2025-11-15 23:33:18', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-09-25 09:26:06', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-09-25 09:26:06', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-09-25 09:26:06', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-09-25 09:26:06', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-09-25 09:26:06', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-09-25 09:26:06', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-09-25 09:26:06', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-09-25 09:26:06', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'RFIDHY', 0, 'Rooney', '13818777363', 'rooney.gong@gmail.com', '0', '0', 'admin', '2025-09-25 09:26:06', 'rooney', '2025-10-26 10:50:44');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '华苑斯码特', 1, '', '', '', '0', '0', 'admin', '2025-09-25 09:26:06', 'rooney', '2025-10-26 10:58:19');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-25 09:26:06', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '总经办', 1, '', '', '', '0', '0', 'admin', '2025-09-25 09:26:06', 'rooney', '2025-10-26 11:06:20');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-25 09:26:06', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-25 09:26:06', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-25 09:26:06', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运营部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-25 09:26:06', 'rooney', '2025-10-26 11:13:08');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-25 09:26:06', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-25 09:26:06', '', NULL);
INSERT INTO `sys_dept` VALUES (110, 104, '0,100,101,104', '推广部', 1, NULL, NULL, NULL, '0', '0', 'rooney', '2025-10-26 11:09:03', '', NULL);
INSERT INTO `sys_dept` VALUES (111, 104, '0,100,101,104', '内销部', 2, NULL, NULL, NULL, '0', '0', 'rooney', '2025-10-26 11:09:22', '', NULL);
INSERT INTO `sys_dept` VALUES (112, 104, '0,100,101,104', '国际部', 3, NULL, NULL, NULL, '0', '0', 'rooney', '2025-10-26 11:09:32', '', NULL);
INSERT INTO `sys_dept` VALUES (113, 107, '0,100,101,107', '采购部', 1, NULL, NULL, NULL, '0', '0', 'rooney', '2025-10-26 11:11:21', '', NULL);
INSERT INTO `sys_dept` VALUES (114, 107, '0,100,101,107', '仓管部', 2, NULL, NULL, NULL, '0', '0', 'rooney', '2025-10-26 11:12:01', '', NULL);
INSERT INTO `sys_dept` VALUES (115, 107, '0,100,101,107', '后勤支持', 3, NULL, NULL, NULL, '0', '0', 'rooney', '2025-10-26 11:12:55', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 0, '线上', '0', 'mk_source_type', NULL, 'default', 'N', '0', 'rooney', '2025-10-30 14:10:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 1, '线下', '1', 'mk_source_type', NULL, 'default', 'N', '0', 'rooney', '2025-10-30 14:10:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 2, '合作渠道', '2', 'mk_source_type', NULL, 'default', 'N', '0', 'rooney', '2025-10-30 14:11:04', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '关联字典', 'mk_source_type', '0', 'rooney', '2025-10-30 14:09:25', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-09-25 09:26:06', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-25 15:38:42');
INSERT INTO `sys_logininfor` VALUES (101, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-25 15:39:31');
INSERT INTO `sys_logininfor` VALUES (102, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-25 15:39:37');
INSERT INTO `sys_logininfor` VALUES (103, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-25 15:39:59');
INSERT INTO `sys_logininfor` VALUES (104, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-25 16:37:29');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '192.168.20.87', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-09-25 17:02:52');
INSERT INTO `sys_logininfor` VALUES (106, 'rooney', '192.168.20.87', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-25 17:02:57');
INSERT INTO `sys_logininfor` VALUES (107, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-25 21:39:03');
INSERT INTO `sys_logininfor` VALUES (108, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-26 00:01:35');
INSERT INTO `sys_logininfor` VALUES (109, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-10-26 10:49:50');
INSERT INTO `sys_logininfor` VALUES (110, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-10-26 10:49:54');
INSERT INTO `sys_logininfor` VALUES (111, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-26 10:50:02');
INSERT INTO `sys_logininfor` VALUES (112, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-10-26 21:33:33');
INSERT INTO `sys_logininfor` VALUES (113, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-10-26 21:37:15');
INSERT INTO `sys_logininfor` VALUES (114, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-10-26 21:37:19');
INSERT INTO `sys_logininfor` VALUES (115, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码已失效', '2025-10-26 21:38:18');
INSERT INTO `sys_logininfor` VALUES (116, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-10-26 22:41:29');
INSERT INTO `sys_logininfor` VALUES (117, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-26 22:41:37');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-10-26 23:14:40');
INSERT INTO `sys_logininfor` VALUES (119, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-26 23:15:00');
INSERT INTO `sys_logininfor` VALUES (120, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-10-30 13:37:22');
INSERT INTO `sys_logininfor` VALUES (121, 'rooney', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-10-30 15:15:46');
INSERT INTO `sys_logininfor` VALUES (122, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-04 14:30:01');
INSERT INTO `sys_logininfor` VALUES (123, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-04 14:30:05');
INSERT INTO `sys_logininfor` VALUES (124, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-09 16:27:13');
INSERT INTO `sys_logininfor` VALUES (125, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-09 19:45:04');
INSERT INTO `sys_logininfor` VALUES (126, 'rooney', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-11-09 20:59:56');
INSERT INTO `sys_logininfor` VALUES (127, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-12 08:29:46');
INSERT INTO `sys_logininfor` VALUES (128, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-12 09:09:30');
INSERT INTO `sys_logininfor` VALUES (129, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-12 09:09:34');
INSERT INTO `sys_logininfor` VALUES (130, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-12 09:11:15');
INSERT INTO `sys_logininfor` VALUES (131, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-12 09:11:18');
INSERT INTO `sys_logininfor` VALUES (132, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-12 09:11:23');
INSERT INTO `sys_logininfor` VALUES (133, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-12 09:11:26');
INSERT INTO `sys_logininfor` VALUES (134, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-12 09:11:28');
INSERT INTO `sys_logininfor` VALUES (135, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '验证码错误', '2025-11-12 09:11:32');
INSERT INTO `sys_logininfor` VALUES (136, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-12 09:11:34');
INSERT INTO `sys_logininfor` VALUES (137, 'rooney', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-15 22:25:33');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1068 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 11, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-09-25 09:26:06', 'rooney', '2025-10-30 14:46:10', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 12, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-09-25 09:26:06', 'rooney', '2025-10-30 14:46:06', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 13, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-09-25 09:26:06', 'rooney', '2025-10-30 14:46:03', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'RFIDHY官网', 0, 14, 'https://www.rfidhy.cn', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-09-25 09:26:06', 'rooney', '2025-10-30 14:45:58', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-09-25 09:26:06', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-09-25 09:26:06', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-09-25 09:26:06', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-09-25 09:26:06', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-09-25 09:26:06', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-09-25 09:26:06', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-09-25 09:26:06', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-09-25 09:26:06', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-09-25 09:26:06', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-09-25 09:26:06', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-09-25 09:26:06', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-09-25 09:26:06', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-09-25 09:26:06', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-09-25 09:26:06', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-09-25 09:26:06', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-09-25 09:26:06', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-09-25 09:26:06', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-09-25 09:26:06', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-09-25 09:26:06', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-09-25 09:26:06', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '基础设置', 0, 10, 'base', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'swagger', 'rooney', '2025-10-30 14:45:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '线索来源', 1061, 1, 'source', 'base/source/index', NULL, '', 1, 0, 'C', '0', '0', 'base:source:list', 'component', 'admin', '2025-10-30 14:51:57', 'rooney', '2025-11-09 16:56:59', '线索来源（管理线索渠道信息）菜单');
INSERT INTO `sys_menu` VALUES (1063, '线索来源（管理线索渠道信息）查询', 1062, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'base:source:query', '#', 'admin', '2025-10-30 14:51:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '线索来源（管理线索渠道信息）新增', 1062, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'base:source:add', '#', 'admin', '2025-10-30 14:51:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '线索来源（管理线索渠道信息）修改', 1062, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'base:source:edit', '#', 'admin', '2025-10-30 14:51:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1066, '线索来源（管理线索渠道信息）删除', 1062, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'base:source:remove', '#', 'admin', '2025-10-30 14:51:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1067, '线索来源（管理线索渠道信息）导出', 1062, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'base:source:export', '#', 'admin', '2025-10-30 14:51:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-09-25 09:26:06', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-09-25 09:26:06', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 240 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '个人信息', 2, 'com.rfidhy.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'rooney', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"rooney@cardhy.com\",\"nickName\":\"Rooney\",\"params\":{},\"phonenumber\":\"13818777363\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:38:35', 31);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.rfidhy.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'rooney', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-25 09:26:06\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"RFIDHY官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"https://www.rfidhy.cn\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"rooney\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-25 16:39:27', 30);
INSERT INTO `sys_oper_log` VALUES (102, '部门管理', 2, 'com.rfidhy.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'rooney', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"RFIDHY\",\"email\":\"rooney.gong@gmail.com\",\"leader\":\"Rooney\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"13818777363\",\"status\":\"0\",\"updateBy\":\"rooney\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 10:50:44', 48);
INSERT INTO `sys_oper_log` VALUES (103, '部门管理', 2, 'com.rfidhy.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'rooney', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"华苑斯码特\",\"email\":\"\",\"leader\":\"\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"RFIDHY\",\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"rooney\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 10:58:19', 70);
INSERT INTO `sys_oper_log` VALUES (104, '部门管理', 3, 'com.rfidhy.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'rooney', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '103', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-10-26 11:04:10', 15);
INSERT INTO `sys_oper_log` VALUES (105, '用户管理', 2, 'com.rfidhy.web.controller.system.SysUserController.edit()', 'PUT', 1, 'rooney', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:26:06\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":101,\"email\":\"rooney@cardhy.com\",\"loginDate\":\"2025-10-26 10:50:02\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"Rooney\",\"params\":{},\"phonenumber\":\"13818777363\",\"postIds\":[1],\"pwdUpdateDate\":\"2025-09-25 09:26:06\",\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"rooney\"}', NULL, 1, '不允许操作超级管理员用户', '2025-10-26 11:05:14', 23);
INSERT INTO `sys_oper_log` VALUES (106, '部门管理', 2, 'com.rfidhy.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'rooney', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"总经办\",\"email\":\"\",\"leader\":\"\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"华苑斯码特\",\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"rooney\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 11:06:20', 39);
INSERT INTO `sys_oper_log` VALUES (107, '部门管理', 1, 'com.rfidhy.web.controller.system.SysDeptController.add()', 'POST', 1, 'rooney', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,104\",\"children\":[],\"createBy\":\"rooney\",\"deptName\":\"推广部\",\"orderNum\":1,\"params\":{},\"parentId\":104,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 11:09:04', 70);
INSERT INTO `sys_oper_log` VALUES (108, '部门管理', 1, 'com.rfidhy.web.controller.system.SysDeptController.add()', 'POST', 1, 'rooney', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,104\",\"children\":[],\"createBy\":\"rooney\",\"deptName\":\"内销部\",\"orderNum\":2,\"params\":{},\"parentId\":104,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 11:09:22', 36);
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 1, 'com.rfidhy.web.controller.system.SysDeptController.add()', 'POST', 1, 'rooney', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,104\",\"children\":[],\"createBy\":\"rooney\",\"deptName\":\"国际部\",\"orderNum\":3,\"params\":{},\"parentId\":104,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 11:09:32', 30);
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 3, 'com.rfidhy.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'rooney', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '105', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-10-26 11:09:49', 15);
INSERT INTO `sys_oper_log` VALUES (111, '用户管理', 2, 'com.rfidhy.web.controller.system.SysUserController.edit()', 'PUT', 1, 'rooney', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-09-25 09:26:06\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginDate\":\"2025-09-25 09:26:06\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"gxx3000\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[2],\"pwdUpdateDate\":\"2025-09-25 09:26:06\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"rooney\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 11:10:21', 94);
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 1, 'com.rfidhy.web.controller.system.SysDeptController.add()', 'POST', 1, 'rooney', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,107\",\"children\":[],\"createBy\":\"rooney\",\"deptName\":\"采购部\",\"orderNum\":1,\"params\":{},\"parentId\":107,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 11:11:21', 22);
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 1, 'com.rfidhy.web.controller.system.SysDeptController.add()', 'POST', 1, 'rooney', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,107\",\"children\":[],\"createBy\":\"rooney\",\"deptName\":\"仓管部\",\"orderNum\":2,\"params\":{},\"parentId\":107,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 11:12:01', 20);
INSERT INTO `sys_oper_log` VALUES (114, '部门管理', 1, 'com.rfidhy.web.controller.system.SysDeptController.add()', 'POST', 1, 'rooney', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101,107\",\"children\":[],\"createBy\":\"rooney\",\"deptName\":\"后勤支持\",\"orderNum\":3,\"params\":{},\"parentId\":107,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 11:12:55', 27);
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 2, 'com.rfidhy.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'rooney', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":107,\"deptName\":\"运营部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"parentName\":\"华苑斯码特\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"rooney\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 11:13:08', 72);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 6, 'com.rfidhy.generator.controller.GenController.importTableSave()', 'POST', 1, 'rooney', '总经办', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user_role\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 23:15:09', 123);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 3, 'com.rfidhy.generator.controller.GenController.remove()', 'DELETE', 1, 'rooney', '总经办', '/tool/gen/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-26 23:15:28', 26);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 6, 'com.rfidhy.generator.controller.GenController.importTableSave()', 'POST', 1, 'rooney', '总经办', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"mk_lead_source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 13:59:26', 85);
INSERT INTO `sys_oper_log` VALUES (119, '字典类型', 1, 'com.rfidhy.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'rooney', '总经办', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"rooney\",\"dictName\":\"关联字典\",\"dictType\":\"mk_source_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:09:25', 16);
INSERT INTO `sys_oper_log` VALUES (120, '字典数据', 1, 'com.rfidhy.web.controller.system.SysDictDataController.add()', 'POST', 1, 'rooney', '总经办', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"rooney\",\"default\":false,\"dictLabel\":\"线上\",\"dictSort\":0,\"dictType\":\"mk_source_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:10:27', 10);
INSERT INTO `sys_oper_log` VALUES (121, '字典数据', 1, 'com.rfidhy.web.controller.system.SysDictDataController.add()', 'POST', 1, 'rooney', '总经办', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"rooney\",\"default\":false,\"dictLabel\":\"线下\",\"dictSort\":1,\"dictType\":\"mk_source_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:10:50', 11);
INSERT INTO `sys_oper_log` VALUES (122, '字典数据', 1, 'com.rfidhy.web.controller.system.SysDictDataController.add()', 'POST', 1, 'rooney', '总经办', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"rooney\",\"default\":false,\"dictLabel\":\"合作渠道\",\"dictSort\":2,\"dictType\":\"mk_source_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:11:04', 10);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.rfidhy.generator.controller.GenController.editSave()', 'PUT', 1, 'rooney', '总经办', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"source\",\"className\":\"MkLeadSource\",\"columns\":[{\"capJavaField\":\"SourceId\",\"columnComment\":\"来源ID（雪花ID）\",\"columnId\":3,\"columnName\":\"source_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sourceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SourceName\",\"columnComment\":\"来源名称（如“官网表单”“2024上海RFID展会”）\",\"columnId\":4,\"columnName\":\"source_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SourceType\",\"columnComment\":\"来源类型（关联字典：mk_source_type；0-线上/1-线下/2-合作渠道）\",\"columnId\":5,\"columnName\":\"source_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SourceOwnerId\",\"columnComment\":\"来源负责人ID（关联sys_user.user_id）\",\"columnId\":6,\"columnName\":\"source_owner_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:11:27', 44);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.rfidhy.generator.controller.GenController.editSave()', 'PUT', 1, 'rooney', '总经办', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"source\",\"className\":\"MkLeadSource\",\"columns\":[{\"capJavaField\":\"SourceId\",\"columnComment\":\"来源ID（雪花ID）\",\"columnId\":3,\"columnName\":\"source_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sourceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:11:27\",\"usableColumn\":false},{\"capJavaField\":\"SourceName\",\"columnComment\":\"来源名称（如“官网表单”“2024上海RFID展会”）\",\"columnId\":4,\"columnName\":\"source_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:11:27\",\"usableColumn\":false},{\"capJavaField\":\"SourceType\",\"columnComment\":\"来源类型（关联字典：mk_source_type；0-线上/1-线下/2-合作渠道）\",\"columnId\":5,\"columnName\":\"source_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"mk_source_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:11:27\",\"usableColumn\":false},{\"capJavaField\":\"SourceOwnerId\",\"columnComment\":\"来源负责人ID（关联sys_user.user_id）\",\"columnId\":6,\"columnName\":\"source_owner_id\",\"column', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:36:39', 68);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.rfidhy.generator.controller.GenController.editSave()', 'PUT', 1, 'rooney', '总经办', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"source\",\"className\":\"MkLeadSource\",\"columns\":[{\"capJavaField\":\"SourceId\",\"columnComment\":\"来源ID（雪花ID）\",\"columnId\":3,\"columnName\":\"source_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sourceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:36:39\",\"usableColumn\":false},{\"capJavaField\":\"SourceName\",\"columnComment\":\"来源名称（如“官网表单”“2024上海RFID展会”）\",\"columnId\":4,\"columnName\":\"source_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:36:39\",\"usableColumn\":false},{\"capJavaField\":\"SourceType\",\"columnComment\":\"来源类型（关联字典：mk_source_type；0-线上/1-线下/2-合作渠道）\",\"columnId\":5,\"columnName\":\"source_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"mk_source_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:36:39\",\"usableColumn\":false},{\"capJavaField\":\"SourceOwnerId\",\"columnComment\":\"来源负责人ID（关联sys_user.user_id）\",\"columnId\":6,\"columnName\":\"source_owner_id\",\"column', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:44:06', 36);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 1, 'com.rfidhy.web.controller.system.SysMenuController.add()', 'POST', 1, 'rooney', '总经办', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"rooney\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基础设置\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"base\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:45:39', 15);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.rfidhy.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'rooney', '总经办', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-25 09:26:06\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"RFIDHY官网\",\"menuType\":\"M\",\"orderNum\":14,\"params\":{},\"parentId\":0,\"path\":\"https://www.rfidhy.cn\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"rooney\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:45:58', 7);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.rfidhy.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'rooney', '总经办', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-25 09:26:06\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":13,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"rooney\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:46:03', 10);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.rfidhy.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'rooney', '总经办', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-25 09:26:06\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":12,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"rooney\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:46:06', 7);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.rfidhy.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'rooney', '总经办', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-09-25 09:26:06\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"rooney\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:46:10', 6);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.rfidhy.generator.controller.GenController.editSave()', 'PUT', 1, 'rooney', '总经办', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"source\",\"className\":\"MkLeadSource\",\"columns\":[{\"capJavaField\":\"SourceId\",\"columnComment\":\"来源ID（雪花ID）\",\"columnId\":3,\"columnName\":\"source_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sourceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:44:06\",\"usableColumn\":false},{\"capJavaField\":\"SourceName\",\"columnComment\":\"来源名称（如“官网表单”“2024上海RFID展会”）\",\"columnId\":4,\"columnName\":\"source_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:44:06\",\"usableColumn\":false},{\"capJavaField\":\"SourceType\",\"columnComment\":\"来源类型（关联字典：mk_source_type；0-线上/1-线下/2-合作渠道）\",\"columnId\":5,\"columnName\":\"source_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"mk_source_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:44:06\",\"usableColumn\":false},{\"capJavaField\":\"SourceOwnerId\",\"columnComment\":\"来源负责人ID（关联sys_user.user_id）\",\"columnId\":6,\"columnName\":\"source_owner_id\",\"column', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:46:39', 27);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 2, 'com.rfidhy.generator.controller.GenController.editSave()', 'PUT', 1, 'rooney', '总经办', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"source\",\"className\":\"MkLeadSource\",\"columns\":[{\"capJavaField\":\"SourceId\",\"columnComment\":\"来源ID（雪花ID）\",\"columnId\":3,\"columnName\":\"source_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sourceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:46:39\",\"usableColumn\":false},{\"capJavaField\":\"SourceName\",\"columnComment\":\"来源名称（如“官网表单”“2024上海RFID展会”）\",\"columnId\":4,\"columnName\":\"source_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:46:39\",\"usableColumn\":false},{\"capJavaField\":\"SourceType\",\"columnComment\":\"来源类型（关联字典：mk_source_type；0-线上/1-线下/2-合作渠道）\",\"columnId\":5,\"columnName\":\"source_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"mk_source_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:46:39\",\"usableColumn\":false},{\"capJavaField\":\"SourceOwnerId\",\"columnComment\":\"来源负责人ID（关联sys_user.user_id）\",\"columnId\":6,\"columnName\":\"source_owner_id\",\"column', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 14:46:57', 32);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 8, 'com.rfidhy.generator.controller.GenController.batchGenCode()', 'GET', 1, 'rooney', '总经办', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"mk_lead_source\"}', NULL, 0, NULL, '2025-10-30 14:47:03', 39);
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.rfidhy.generator.controller.GenController.editSave()', 'PUT', 1, 'rooney', '总经办', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"source\",\"className\":\"MkLeadSource\",\"columns\":[{\"capJavaField\":\"SourceId\",\"columnComment\":\"来源ID（雪花ID）\",\"columnId\":3,\"columnName\":\"source_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sourceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:46:57\",\"usableColumn\":false},{\"capJavaField\":\"SourceName\",\"columnComment\":\"来源名称（如“官网表单”“2024上海RFID展会”）\",\"columnId\":4,\"columnName\":\"source_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:46:57\",\"usableColumn\":false},{\"capJavaField\":\"SourceType\",\"columnComment\":\"来源类型（关联字典：mk_source_type；0-线上/1-线下/2-合作渠道）\",\"columnId\":5,\"columnName\":\"source_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"mk_source_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 14:46:57\",\"usableColumn\":false},{\"capJavaField\":\"SourceOwnerId\",\"columnComment\":\"来源负责人ID（关联sys_user.user_id）\",\"columnId\":6,\"columnName\":\"source_owner_id\",\"column', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-10-30 15:15:34', 83);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.rfidhy.generator.controller.GenController.editSave()', 'PUT', 1, 'rooney', '总经办', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"source\",\"className\":\"MkLeadSource\",\"columns\":[{\"capJavaField\":\"SourceId\",\"columnComment\":\"来源ID（雪花ID）\",\"columnId\":3,\"columnName\":\"source_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sourceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 15:15:34\",\"usableColumn\":false},{\"capJavaField\":\"SourceName\",\"columnComment\":\"来源名称（如“官网表单”“2024上海RFID展会”）\",\"columnId\":4,\"columnName\":\"source_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 15:15:34\",\"usableColumn\":false},{\"capJavaField\":\"SourceType\",\"columnComment\":\"来源类型（关联字典：mk_source_type；0-线上/1-线下/2-合作渠道）\",\"columnId\":5,\"columnName\":\"source_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"mk_source_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-10-30 15:15:34\",\"usableColumn\":false},{\"capJavaField\":\"SourceOwnerId\",\"columnComment\":\"来源负责人ID（关联sys_user.user_id）\",\"columnId\":6,\"columnName\":\"source_owner_id\",\"column', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 16:33:35', 175);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 8, 'com.rfidhy.generator.controller.GenController.batchGenCode()', 'GET', 1, 'rooney', '总经办', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"mk_lead_source\"}', NULL, 0, NULL, '2025-11-09 16:33:53', 318);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.rfidhy.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'rooney', '总经办', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"base/source/index\",\"createTime\":\"2025-10-30 14:51:57\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"线索来源（管理线索渠道信息）\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"source\",\"perms\":\"base:source:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"rooney\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 16:56:46', 159);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 2, 'com.rfidhy.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'rooney', '总经办', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"base/source/index\",\"createTime\":\"2025-10-30 14:51:57\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"线索来源\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"source\",\"perms\":\"base:source:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"rooney\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 16:56:59', 28);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.rfidhy.generator.controller.GenController.editSave()', 'PUT', 1, 'rooney', '总经办', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"source\",\"className\":\"MkLeadSource\",\"columns\":[{\"capJavaField\":\"SourceId\",\"columnComment\":\"来源ID（雪花ID）\",\"columnId\":3,\"columnName\":\"source_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sourceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-11-09 16:33:35\",\"usableColumn\":false},{\"capJavaField\":\"SourceName\",\"columnComment\":\"来源名称（如“官网表单”“2024上海RFID展会”）\",\"columnId\":4,\"columnName\":\"source_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-11-09 16:33:35\",\"usableColumn\":false},{\"capJavaField\":\"SourceType\",\"columnComment\":\"来源类型（关联字典：mk_source_type；0-线上/1-线下/2-合作渠道）\",\"columnId\":5,\"columnName\":\"source_type\",\"columnType\":\"varchar(30)\",\"createBy\":\"rooney\",\"createTime\":\"2025-10-30 13:59:25\",\"dictType\":\"mk_source_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sourceType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-11-09 16:33:35\",\"usableColumn\":false},{\"capJavaField\":\"SourceOwnerId\",\"columnComment\":\"来源负责人ID（关联sys_user.user_id）\",\"columnId\":6,\"columnName\":\"source_owner_id\",\"column', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 17:03:43', 98);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.rfidhy.generator.controller.GenController.batchGenCode()', 'GET', 1, 'rooney', '总经办', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"mk_lead_source\"}', NULL, 0, NULL, '2025-11-09 17:03:46', 204);
INSERT INTO `sys_oper_log` VALUES (141, '线索来源（管理线索渠道信息）', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 17:16:36\",\"delFlag\":\"0\",\"params\":{},\"sort\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 09:16:36\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,             del_flag,                          create_time,                          update_time )           values ( ?,             ?,                                                    ?,             ?,             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 17:16:36', 350);
INSERT INTO `sys_oper_log` VALUES (142, '线索来源（管理线索渠道信息）', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 17:18:44\",\"delFlag\":\"0\",\"params\":{},\"sort\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 09:18:44\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,             del_flag,                          create_time,                          update_time )           values ( ?,             ?,                                                    ?,             ?,             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 17:18:44', 9);
INSERT INTO `sys_oper_log` VALUES (143, '线索来源（管理线索渠道信息）', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 17:19:26\",\"delFlag\":\"0\",\"params\":{},\"sort\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 09:19:26\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,             del_flag,                          create_time,                          update_time )           values ( ?,             ?,                                                    ?,             ?,             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 17:19:26', 5);
INSERT INTO `sys_oper_log` VALUES (144, '线索来源（管理线索渠道信息）', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 17:21:18\",\"delFlag\":\"0\",\"params\":{},\"sort\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 09:21:18\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,             del_flag,                          create_time,                          update_time )           values ( ?,             ?,                                                    ?,             ?,             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 17:21:18', 5);
INSERT INTO `sys_oper_log` VALUES (145, '线索来源（管理线索渠道信息）', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 17:21:36\",\"delFlag\":\"0\",\"params\":{},\"sort\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 09:21:36\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,             del_flag,                          create_time,                          update_time )           values ( ?,             ?,                                                    ?,             ?,             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 17:21:36', 5);
INSERT INTO `sys_oper_log` VALUES (146, '线索来源（管理线索渠道信息）', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 17:22:35\",\"delFlag\":\"0\",\"params\":{},\"sort\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 09:22:35\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,             del_flag,                          create_time,                          update_time )           values ( ?,             ?,                                                    ?,             ?,             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 17:22:35', 7);
INSERT INTO `sys_oper_log` VALUES (147, '线索来源（管理线索渠道信息）', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 17:23:51\",\"params\":{},\"sort\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,                                       create_time )           values ( ?,             ?,                                                    ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 17:23:51', 9);
INSERT INTO `sys_oper_log` VALUES (148, '线索来源（管理线索渠道信息）', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 17:26:21\",\"params\":{},\"sort\":0,\"sourceId\":1762680381196,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 17:26:21', 9);
INSERT INTO `sys_oper_log` VALUES (149, '线索来源（管理线索渠道信息）', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceId\":1762680381196,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 17:26:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 17:26:52', 21);
INSERT INTO `sys_oper_log` VALUES (150, '线索来源（管理线索渠道信息）', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 17:34:40\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-11-09 17:34:40', 10);
INSERT INTO `sys_oper_log` VALUES (151, '线索来源（管理线索渠道信息）', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 17:34:45\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-11-09 17:34:45', 8);
INSERT INTO `sys_oper_log` VALUES (152, '线索来源（管理线索渠道信息）', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 17:35:00\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-11-09 17:35:00', 6);
INSERT INTO `sys_oper_log` VALUES (153, '线索来源（管理线索渠道信息）', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 17:35:36\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-11-09 17:35:36', 6);
INSERT INTO `sys_oper_log` VALUES (154, '线索来源（管理线索渠道信息）', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 17:35:47\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-11-09 17:35:47', 6);
INSERT INTO `sys_oper_log` VALUES (155, '线索来源（管理线索渠道信息）', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 17:38:43\",\"params\":{},\"sort\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 17:38:43', 6);
INSERT INTO `sys_oper_log` VALUES (156, '线索来源（管理线索渠道信息）', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 17:39:42\",\"params\":{},\"sort\":1,\"sourceId\":1,\"sourceName\":\"抖音子账号\",\"sourceType\":\"0\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 17:39:42', 11);
INSERT INTO `sys_oper_log` VALUES (157, '线索来源（管理线索渠道信息）', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 17:47:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 17:47:04', 20);
INSERT INTO `sys_oper_log` VALUES (158, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":1,\"updateTime\":\"2025-11-09 18:01:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 18:01:54', 71);
INSERT INTO `sys_oper_log` VALUES (159, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 18:02:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 18:02:02', 11);
INSERT INTO `sys_oper_log` VALUES (160, '线索来源', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 18:02:19\",\"params\":{},\"sort\":2,\"sourceId\":1,\"sourceName\":\"抖音推广\",\"sourceType\":\"0\",\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_id,             source_name,             source_type,                                                    sort,             status,                                       create_time )           values ( ?,             ?,             ?,                                                    ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n; Duplicate entry \'1\' for key \'PRIMARY\'', '2025-11-09 18:02:19', 245);
INSERT INTO `sys_oper_log` VALUES (161, '线索来源', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 18:04:48\",\"params\":{},\"sort\":2,\"sourceName\":\"抖音推广\",\"sourceType\":\"0\",\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,                                       create_time )           values ( ?,             ?,                                                    ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 18:04:48', 10);
INSERT INTO `sys_oper_log` VALUES (162, '线索来源', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 18:07:03\",\"params\":{},\"sort\":2,\"sourceName\":\"抖音推广\",\"sourceType\":\"0\",\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,                                       create_time )           values ( ?,             ?,                                                    ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 18:07:03', 7);
INSERT INTO `sys_oper_log` VALUES (163, '线索来源', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 18:07:15\",\"params\":{},\"sort\":2,\"sourceName\":\"抖音推广\",\"sourceType\":\"0\",\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,                                       create_time )           values ( ?,             ?,                                                    ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 18:07:15', 7);
INSERT INTO `sys_oper_log` VALUES (164, '线索来源', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 18:09:32\",\"params\":{},\"sort\":2,\"sourceName\":\"抖音推广\",\"sourceType\":\"0\",\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,                                       create_time )           values ( ?,             ?,                                                    ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 18:09:32', 7);
INSERT INTO `sys_oper_log` VALUES (165, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":1,\"updateTime\":\"2025-11-09 18:11:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 18:11:09', 8);
INSERT INTO `sys_oper_log` VALUES (166, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 18:11:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 18:11:13', 13);
INSERT INTO `sys_oper_log` VALUES (167, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 18:11:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 18:11:17', 13);
INSERT INTO `sys_oper_log` VALUES (168, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 18:11:22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 18:11:22', 7);
INSERT INTO `sys_oper_log` VALUES (169, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"1\",\"status\":0,\"updateTime\":\"2025-11-09 18:11:28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 18:11:28', 7);
INSERT INTO `sys_oper_log` VALUES (170, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 18:11:31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 18:11:31', 12);
INSERT INTO `sys_oper_log` VALUES (171, '线索来源', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 18:11:57\",\"params\":{},\"sort\":1,\"sourceId\":1,\"sourceName\":\"抖音推广\",\"sourceType\":\"0\",\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_id,             source_name,             source_type,                                                    sort,             status,                                       create_time )           values ( ?,             ?,             ?,                                                    ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'PRIMARY\'\n; Duplicate entry \'1\' for key \'PRIMARY\'', '2025-11-09 18:11:57', 9);
INSERT INTO `sys_oper_log` VALUES (172, '线索来源', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 18:17:42\",\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                       source_cost,             sort,             status,                                       create_time )           values ( ?,             ?,                                       ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 18:17:42', 6);
INSERT INTO `sys_oper_log` VALUES (173, '线索来源', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 18:21:06\",\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                       source_cost,             sort,             status,                                       create_time )           values ( ?,             ?,                                       ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 18:21:06', 6);
INSERT INTO `sys_oper_log` VALUES (174, '线索来源', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 18:21:12\",\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\App\\rfidhypro\\rfidhy-base\\target\\classes\\mapper\\base\\MkLeadSourceMapper.xml]\r\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                       source_cost,             sort,             status,                                       create_time )           values ( ?,             ?,                                       ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\n; Field \'source_id\' doesn\'t have a default value', '2025-11-09 18:21:12', 10);
INSERT INTO `sys_oper_log` VALUES (175, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 18:21:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 18:21:49', 8);
INSERT INTO `sys_oper_log` VALUES (176, '线索来源', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 19:49:15\",\"params\":{},\"sort\":1,\"sourceId\":1762688955813,\"sourceName\":\"抖音推广\",\"sourceType\":\"0\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 19:49:15', 15);
INSERT INTO `sys_oper_log` VALUES (177, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 19:55:05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 19:55:05', 8);
INSERT INTO `sys_oper_log` VALUES (178, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":1762688955813,\"sourceName\":\"抖音推广\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 19:55:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 19:55:11', 8);
INSERT INTO `sys_oper_log` VALUES (179, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":2,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 19:55:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 19:55:17', 14);
INSERT INTO `sys_oper_log` VALUES (180, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":2,\"sourceCost\":0,\"sourceId\":1762688955813,\"sourceName\":\"抖音推广\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 19:57:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 19:57:34', 9);
INSERT INTO `sys_oper_log` VALUES (181, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":1762688955813,\"sourceName\":\"抖音推广\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 19:57:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 19:57:40', 18);
INSERT INTO `sys_oper_log` VALUES (182, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 19:57:47\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 19:57:47', 12);
INSERT INTO `sys_oper_log` VALUES (183, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceId\":1762688955813,\"sourceName\":\"抖音推广\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 19:57:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 19:57:54', 8);
INSERT INTO `sys_oper_log` VALUES (184, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 19:57:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 19:57:57', 10);
INSERT INTO `sys_oper_log` VALUES (185, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":1762688955813,\"sourceName\":\"抖音推广\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 19:58:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 19:58:01', 8);
INSERT INTO `sys_oper_log` VALUES (186, '线索来源', 3, 'com.rfidhy.base.controller.MkLeadSourceController.remove()', 'DELETE', 1, 'rooney', '总经办', '/base/source/1762688955813', '127.0.0.1', '内网IP', '[1762688955813]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 19:59:09', 20);
INSERT INTO `sys_oper_log` VALUES (187, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 20:00:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:00:21', 18);
INSERT INTO `sys_oper_log` VALUES (188, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":0,\"updateTime\":\"2025-11-09 20:00:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:00:38', 11);
INSERT INTO `sys_oper_log` VALUES (189, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 20:01:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:01:02', 9);
INSERT INTO `sys_oper_log` VALUES (190, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":2,\"sourceCost\":0,\"sourceId\":1,\"sourceName\":\"抖音子账号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 20:02:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:02:43', 11);
INSERT INTO `sys_oper_log` VALUES (191, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":3,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 20:02:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:02:48', 9);
INSERT INTO `sys_oper_log` VALUES (192, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 20:02:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:02:56', 9);
INSERT INTO `sys_oper_log` VALUES (193, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 20:02:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:02:59', 5);
INSERT INTO `sys_oper_log` VALUES (194, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 20:03:22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:03:22', 7);
INSERT INTO `sys_oper_log` VALUES (195, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 20:06:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:06:18', 6);
INSERT INTO `sys_oper_log` VALUES (196, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 20:11:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:11:35', 22);
INSERT INTO `sys_oper_log` VALUES (197, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 20:11:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:11:52', 22);
INSERT INTO `sys_oper_log` VALUES (198, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 20:14:31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:14:31', 14);
INSERT INTO `sys_oper_log` VALUES (199, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 20:16:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:16:02', 9);
INSERT INTO `sys_oper_log` VALUES (200, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 20:18:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:18:41', 11);
INSERT INTO `sys_oper_log` VALUES (201, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 20:25:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:25:48', 11);
INSERT INTO `sys_oper_log` VALUES (202, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 20:26:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:26:21', 8);
INSERT INTO `sys_oper_log` VALUES (203, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":0,\"updateTime\":\"2025-11-09 20:26:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:26:21', 9);
INSERT INTO `sys_oper_log` VALUES (204, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceId\":1,\"sourceName\":\"抖音子账号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 20:33:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:33:40', 12);
INSERT INTO `sys_oper_log` VALUES (205, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":0,\"sourceCost\":0,\"sourceId\":0,\"sourceName\":\"抖音主号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 20:33:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:33:45', 5);
INSERT INTO `sys_oper_log` VALUES (206, '线索来源', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-09 20:34:04\",\"params\":{},\"sort\":2,\"sourceId\":1762691644505,\"sourceName\":\"抖音广告\",\"sourceType\":\"0\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:34:04', 14);
INSERT INTO `sys_oper_log` VALUES (207, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1762691644505,\"updateTime\":\"2025-11-09 20:46:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:46:52', 30);
INSERT INTO `sys_oper_log` VALUES (208, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 20:46:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:46:57', 11);
INSERT INTO `sys_oper_log` VALUES (209, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":0,\"updateTime\":\"2025-11-09 20:46:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:46:57', 11);
INSERT INTO `sys_oper_log` VALUES (210, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1762691644505,\"updateTime\":\"2025-11-09 20:51:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:51:04', 9);
INSERT INTO `sys_oper_log` VALUES (211, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":3,\"sourceCost\":0,\"sourceId\":1762691644505,\"sourceName\":\"抖音广告\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 20:58:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:58:09', 7);
INSERT INTO `sys_oper_log` VALUES (212, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":2,\"sourceCost\":0,\"sourceId\":1,\"sourceName\":\"抖音子账号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 20:58:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:58:14', 9);
INSERT INTO `sys_oper_log` VALUES (213, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceId\":1,\"sourceName\":\"抖音子账号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 20:58:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:58:17', 6);
INSERT INTO `sys_oper_log` VALUES (214, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":2,\"sourceCost\":0,\"sourceId\":1762691644505,\"sourceName\":\"抖音广告\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 20:58:22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 20:58:22', 10);
INSERT INTO `sys_oper_log` VALUES (215, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":3,\"sourceCost\":0,\"sourceId\":1762691644505,\"sourceName\":\"抖音广告\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 21:15:15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:15:16', 63);
INSERT INTO `sys_oper_log` VALUES (216, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":2,\"sourceCost\":0,\"sourceId\":1762691644505,\"sourceName\":\"抖音广告\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 21:15:19\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:15:19', 6);
INSERT INTO `sys_oper_log` VALUES (217, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":4,\"sourceCost\":0,\"sourceId\":1762691644505,\"sourceName\":\"抖音广告\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 21:16:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:16:58', 13);
INSERT INTO `sys_oper_log` VALUES (218, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":2,\"sourceCost\":0,\"sourceId\":1762691644505,\"sourceName\":\"抖音广告\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 21:17:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:17:03', 9);
INSERT INTO `sys_oper_log` VALUES (219, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 21:17:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:17:09', 12);
INSERT INTO `sys_oper_log` VALUES (220, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1762691644505,\"updateTime\":\"2025-11-09 21:17:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:17:23', 11);
INSERT INTO `sys_oper_log` VALUES (221, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":2,\"sourceCost\":0,\"sourceId\":1762691644505,\"sourceName\":\"抖音广告\",\"sourceType\":\"0\",\"status\":1,\"updateTime\":\"2025-11-09 21:19:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:19:14', 7);
INSERT INTO `sys_oper_log` VALUES (222, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":2,\"sourceCost\":0,\"sourceId\":1762691644505,\"sourceName\":\"抖音广告\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 21:21:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:21:58', 12);
INSERT INTO `sys_oper_log` VALUES (223, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":2,\"sourceCost\":0,\"sourceId\":1,\"sourceName\":\"抖音子账号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 21:22:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:22:03', 10);
INSERT INTO `sys_oper_log` VALUES (224, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":1,\"sourceCost\":0,\"sourceId\":1,\"sourceName\":\"抖音子账号\",\"sourceType\":\"0\",\"status\":0,\"updateTime\":\"2025-11-09 21:22:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:22:06', 5);
INSERT INTO `sys_oper_log` VALUES (225, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1762691644505,\"updateTime\":\"2025-11-09 21:25:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:25:08', 11);
INSERT INTO `sys_oper_log` VALUES (226, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 21:33:47\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:33:48', 65);
INSERT INTO `sys_oper_log` VALUES (227, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1,\"updateTime\":\"2025-11-09 21:34:12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:34:12', 10);
INSERT INTO `sys_oper_log` VALUES (228, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":0,\"updateTime\":\"2025-11-09 21:34:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:34:17', 11);
INSERT INTO `sys_oper_log` VALUES (229, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1762691644505,\"updateTime\":\"2025-11-09 21:34:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-09 21:34:17', 12);
INSERT INTO `sys_oper_log` VALUES (230, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"delFlag\":\"1\",\"params\":{},\"sourceId\":1762691644505,\"updateTime\":\"2025-11-12 09:09:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-12 09:09:39', 70);
INSERT INTO `sys_oper_log` VALUES (231, '线索来源', 2, 'com.rfidhy.base.controller.MkLeadSourceController.edit()', 'PUT', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"params\":{},\"sort\":2,\"sourceCost\":0,\"sourceId\":1762691644505,\"sourceName\":\"抖音广告\",\"sourceType\":\"0\",\"status\":1,\"updateTime\":\"2025-11-12 09:10:15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-12 09:10:15', 12);
INSERT INTO `sys_oper_log` VALUES (232, '线索来源', 5, 'com.rfidhy.base.controller.MkLeadSourceController.export()', 'POST', 1, 'rooney', '总经办', '/base/source/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"isAsc\":\"asc\",\"delFlag\":\"0\",\"orderByColumn\":\"sort\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-11-15 22:45:01', 2010);
INSERT INTO `sys_oper_log` VALUES (233, '线索来源', 6, 'com.rfidhy.base.controller.MkLeadSourceController.importData()', 'POST', 1, 'rooney', '总经办', '/base/source/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', NULL, 1, '导入数据不能为空！', '2025-11-15 23:17:41', 772);
INSERT INTO `sys_oper_log` VALUES (234, '线索来源', 6, 'com.rfidhy.base.controller.MkLeadSourceController.importData()', 'POST', 1, 'rooney', '总经办', '/base/source/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', '{\"msg\":\"很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>第1行：来源名称不能为空<br/>第2行：来源名称不能为空\",\"code\":200}', 0, NULL, '2025-11-15 23:18:10', 237);
INSERT INTO `sys_oper_log` VALUES (235, '线索来源', 6, 'com.rfidhy.base.controller.MkLeadSourceController.importData()', 'POST', 1, 'rooney', '总经办', '/base/source/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', '{\"msg\":\"很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>第1行：来源名称不能为空<br/>第2行：来源名称不能为空\",\"code\":200}', 0, NULL, '2025-11-15 23:18:36', 63);
INSERT INTO `sys_oper_log` VALUES (236, '线索来源', 6, 'com.rfidhy.base.controller.MkLeadSourceController.importData()', 'POST', 1, 'rooney', '总经办', '/base/source/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', '{\"msg\":\"很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>第1行：导入失败\\r\\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\\r\\n### The error may exist in file [E:\\\\App\\\\rfidhypro\\\\rfidhy-base\\\\target\\\\classes\\\\mapper\\\\base\\\\MkLeadSourceMapper.xml]\\r\\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,             del_flag,             create_by,             create_time )           values ( ?,             ?,                                                    ?,             ?,             ?,             ?,             ? )\\r\\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\\n; Field \'source_id\' doesn\'t have a default value<br/>第2行：导入失败\\r\\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\\r\\n### The error may exist in file [E:\\\\App\\\\rfidhypro\\\\rfidhy-base\\\\target\\\\classes\\\\mapper\\\\base\\\\MkLeadSourceMapper.xml]\\r\\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,             del_flag,             create_by,             create_time )           values ( ?,             ?,                                                    ?,             ?,             ?,             ?,             ? )\\r\\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\\n; Field \'source_id\' doesn\'t have a default value\",\"code\":200}', 0, NULL, '2025-11-15 23:23:17', 1424);
INSERT INTO `sys_oper_log` VALUES (237, '线索来源', 6, 'com.rfidhy.base.controller.MkLeadSourceController.importData()', 'POST', 1, 'rooney', '总经办', '/base/source/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', '{\"msg\":\"很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>第1行：导入失败\\r\\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\\r\\n### The error may exist in file [E:\\\\App\\\\rfidhypro\\\\rfidhy-base\\\\target\\\\classes\\\\mapper\\\\base\\\\MkLeadSourceMapper.xml]\\r\\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,             del_flag,             create_by,             create_time )           values ( ?,             ?,                                                    ?,             ?,             ?,             ?,             ? )\\r\\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\\n; Field \'source_id\' doesn\'t have a default value<br/>第2行：导入失败\\r\\n### Error updating database.  Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\\r\\n### The error may exist in file [E:\\\\App\\\\rfidhypro\\\\rfidhy-base\\\\target\\\\classes\\\\mapper\\\\base\\\\MkLeadSourceMapper.xml]\\r\\n### The error may involve com.rfidhy.base.mapper.MkLeadSourceMapper.insertMkLeadSource-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: insert into mk_lead_source          ( source_name,             source_type,                                                    sort,             status,             del_flag,             create_by,             create_time )           values ( ?,             ?,                                                    ?,             ?,             ?,             ?,             ? )\\r\\n### Cause: java.sql.SQLException: Field \'source_id\' doesn\'t have a default value\\n; Field \'source_id\' doesn\'t have a default value\",\"code\":200}', 0, NULL, '2025-11-15 23:23:30', 80);
INSERT INTO `sys_oper_log` VALUES (238, '线索来源', 6, 'com.rfidhy.base.controller.MkLeadSourceController.importData()', 'POST', 1, 'rooney', '总经办', '/base/source/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', '{\"msg\":\"很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>第1行：导入失败For input string: \\\"c0c23a3db1284a718e\\\"<br/>第2行：导入失败For input string: \\\"fef788cbe08e4e5d8c\\\"\",\"code\":200}', 0, NULL, '2025-11-15 23:29:45', 844);
INSERT INTO `sys_oper_log` VALUES (239, '线索来源', 1, 'com.rfidhy.base.controller.MkLeadSourceController.add()', 'POST', 1, 'rooney', '总经办', '/base/source', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-11-15 23:33:18\",\"params\":{},\"sort\":3,\"sourceId\":1763220798424,\"sourceName\":\"展会\",\"sourceType\":\"1\",\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-11-15 23:33:18', 31);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-09-25 09:26:06', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-09-25 09:26:06', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-09-25 09:26:06', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'rooney', 'Rooney', '00', 'rooney@cardhy.com', '13818777363', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-11-15 22:25:33', '2025-09-25 09:26:06', 'admin', '2025-09-25 09:26:06', '', '2025-10-26 10:50:02', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', 'gxx3000', '00', '', '', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-09-25 09:26:06', '2025-09-25 09:26:06', 'admin', '2025-09-25 09:26:06', 'rooney', '2025-10-26 11:10:21', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
