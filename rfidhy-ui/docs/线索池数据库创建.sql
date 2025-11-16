-- 线索池数据库创建SQL语句

-- 创建线索表（mk_lead）
CREATE TABLE `mk_lead` (
  `lead_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '线索ID',
  `lead_name` varchar(50) NOT NULL COMMENT '线索名称',
  `phone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `source_id` bigint(20) NOT NULL COMMENT '线索来源ID',
  `lead_status` char(1) NOT NULL DEFAULT '0' COMMENT '线索状态：0-新线索 1-已分配 2-已失效',
  `follow_count` int(11) DEFAULT '0' COMMENT '跟进次数',
  `last_follow_time` datetime DEFAULT NULL COMMENT '最后跟进时间',
  `assign_to` bigint(20) DEFAULT NULL COMMENT '负责人ID',
  `level` char(1) DEFAULT '1' COMMENT '线索等级：1-高 2-中 3-低',
  `tags` varchar(200) DEFAULT NULL COMMENT '标签',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `description` text COMMENT '线索描述',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志：0-正常 1-删除',
  PRIMARY KEY (`lead_id`),
  UNIQUE KEY `uk_phone` (`phone`,`del_flag`),
  UNIQUE KEY `uk_email` (`email`,`del_flag`),
  KEY `idx_lead_create_by` (`create_by`),
  KEY `idx_lead_assign_to` (`assign_to`),
  KEY `idx_lead_source_id` (`source_id`),
  KEY `idx_lead_status` (`lead_status`),
  KEY `idx_lead_create_time` (`create_time`),
  KEY `idx_lead_last_follow_time` (`last_follow_time`),
  KEY `idx_lead_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='线索表';

-- 创建线索分配表（mk_lead_assign）
CREATE TABLE `mk_lead_assign` (
  `assign_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分配记录ID',
  `lead_id` bigint(20) NOT NULL COMMENT '线索ID',
  `old_user_id` bigint(20) DEFAULT NULL COMMENT '原负责人ID',
  `new_user_id` bigint(20) NOT NULL COMMENT '新负责人ID',
  `assign_type` char(1) NOT NULL COMMENT '分配类型：0-自动分配 1-手动分配 2-转交 3-收回',
  `assign_reason` varchar(200) DEFAULT NULL COMMENT '分配原因',
  `assign_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '分配时间',
  `create_by` bigint(20) NOT NULL COMMENT '操作者ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`assign_id`),
  KEY `idx_assign_lead_id` (`lead_id`),
  KEY `idx_assign_new_user_id` (`new_user_id`),
  KEY `idx_assign_old_user_id` (`old_user_id`),
  KEY `idx_assign_time` (`assign_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='线索分配表';