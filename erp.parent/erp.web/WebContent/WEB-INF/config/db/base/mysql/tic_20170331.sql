/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.164_mysql
Source Server Version : 50625
Source Host           : 192.168.1.164:3309
Source Database       : atms

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2017-03-31 17:35:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_access_server
-- ----------------------------
DROP TABLE IF EXISTS `t_access_server`;
CREATE TABLE `t_access_server` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '设备编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构',
  `F_IpAddress` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口号',
  `F_Server_Type` varchar(256) DEFAULT NULL COMMENT '服务类型 ',
  `F_Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接入服务器';

-- ----------------------------
-- Table structure for t_alarm_event
-- ----------------------------
DROP TABLE IF EXISTS `t_alarm_event`;
CREATE TABLE `t_alarm_event` (
  `F_ID` varchar(32) NOT NULL COMMENT '序号',
  `F_Object_Type` varchar(64) DEFAULT '' COMMENT '对象类型',
  `F_Event_Type` varchar(128) DEFAULT NULL COMMENT '事件类型',
  `F_Event_Name` varchar(128) DEFAULT NULL COMMENT '事件名称',
  `F_Alarm_Level` int(11) DEFAULT NULL COMMENT '报警级别',
  `F_Group` varchar(64) DEFAULT NULL,
  `F_Is_Enable` tinyint(1) DEFAULT NULL COMMENT '是否开启',
  `F_Is_Sound` tinyint(1) DEFAULT NULL COMMENT '是否声音',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`F_ID`),
  KEY `I_EventType_AlarmEvent` (`F_Event_Type`) USING BTREE,
  KEY `I_ObjectType_AlarmEvent` (`F_Object_Type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='报警事件表';

-- ----------------------------
-- Table structure for t_alarm_log
-- ----------------------------
DROP TABLE IF EXISTS `t_alarm_log`;
CREATE TABLE `t_alarm_log` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Object_Type` varchar(64) DEFAULT NULL COMMENT '对象类型',
  `F_Object_ID` varchar(32) DEFAULT NULL COMMENT '对象编号',
  `F_Event_Type` varchar(32) DEFAULT NULL COMMENT '事件类型',
  `F_Alarm_Time` datetime DEFAULT NULL COMMENT '报警时间',
  `F_Notes` varchar(256) DEFAULT NULL COMMENT '记录详情',
  `F_Level` int(11) DEFAULT NULL COMMENT '报警等级',
  `F_Response_Time` datetime DEFAULT NULL COMMENT '处理时间',
  `F_Response_Person` varchar(32) DEFAULT NULL COMMENT '处理人',
  `F_Response_State` varchar(32) DEFAULT '0' COMMENT '处理状态： Pending、未处理  Valid、已处理（有效）  Invalid、已处理（无效）',
  `F_Response_Notes` varchar(512) DEFAULT NULL COMMENT '处理备注',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构ID',
  `F_Is_Upload` tinyint(1) DEFAULT NULL COMMENT '是否为下级上报的事件',
  `F_Sub_Sys_Alarm_Log_ID` varchar(32) DEFAULT NULL COMMENT '下级系统的报警ID',
  `F_Receive_Sub_Alarm_DateTime` datetime DEFAULT NULL COMMENT '接收时间',
  `F_Upload_State` varchar(32) DEFAULT NULL COMMENT '上传状态',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报警日志';

-- ----------------------------
-- Table structure for t_alarm_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_alarm_plan`;
CREATE TABLE `t_alarm_plan` (
  `F_ID` varchar(32) NOT NULL COMMENT '序号',
  `F_Name` varchar(256) DEFAULT NULL COMMENT '报警方案名称',
  `F_Is_Enable` tinyint(1) DEFAULT NULL COMMENT '是否开启(1：开启   0：关闭)',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`F_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='报警预案表';

-- ----------------------------
-- Table structure for t_alarm_plan_data
-- ----------------------------
DROP TABLE IF EXISTS `t_alarm_plan_data`;
CREATE TABLE `t_alarm_plan_data` (
  `F_ID` varchar(32) NOT NULL COMMENT '序号',
  `F_Alarm_Plan_ID` varchar(32) DEFAULT NULL COMMENT '编号',
  `F_Object_ID` varchar(32) DEFAULT NULL COMMENT '对象编号',
  `F_Object_Type` varchar(64) DEFAULT NULL COMMENT '对象类型',
  `F_Event_Type` varchar(4096) DEFAULT NULL COMMENT '事件类型',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`F_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='报警预案数据表';

-- ----------------------------
-- Table structure for t_black_alarm_log
-- ----------------------------
DROP TABLE IF EXISTS `t_black_alarm_log`;
CREATE TABLE `t_black_alarm_log` (
  `F_ID` varchar(32) NOT NULL,
  `F_Plate_No` varchar(11) DEFAULT NULL,
  `F_Vehicle_Type` varchar(255) DEFAULT NULL,
  `F_Vehicle_Color` varchar(255) DEFAULT NULL,
  `F_Plate_Color` varchar(255) DEFAULT NULL,
  `F_Plate_Type` varchar(255) DEFAULT NULL,
  `F_Vehicle_Logo` varchar(255) DEFAULT NULL,
  `F_Vehicle_Length` double DEFAULT NULL,
  `F_Vehicle_Speed` double DEFAULT NULL,
  `F_Pass_Time` datetime DEFAULT NULL,
  `F_Gate_ID` varchar(255) DEFAULT NULL,
  `F_Gate_Name` varchar(255) DEFAULT NULL,
  `F_Gate_Channel_Name` varchar(255) DEFAULT NULL,
  `F_Image_Path_List` varchar(1024) DEFAULT NULL,
  `F_Internal_AlarmId` varchar(255) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '��չJSON����',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_business_server
-- ----------------------------
DROP TABLE IF EXISTS `t_business_server`;
CREATE TABLE `t_business_server` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '设备编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构',
  `F_IpAddress` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口号',
  `F_Server_Type` varchar(256) DEFAULT NULL COMMENT '服务类型 ',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务服务器';

-- ----------------------------
-- Table structure for t_camera
-- ----------------------------
DROP TABLE IF EXISTS `t_camera`;
CREATE TABLE `t_camera` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(256) DEFAULT NULL COMMENT '名称',
  `F_Dvs_ID` varchar(32) DEFAULT NULL COMMENT '视频编码编号',
  `F_Channel` int(11) DEFAULT NULL COMMENT '通道序号',
  `F_Channel_Type` varchar(64) DEFAULT NULL COMMENT '通道类型',
  `F_Order_No` int(11) DEFAULT NULL COMMENT '排序序号',
  `F_Play_Name` varchar(256) DEFAULT NULL COMMENT '视频播放名称',
  `F_Gate_ID` varchar(32) DEFAULT NULL COMMENT '摄像机关联的卡口',
  `F_Camera_Type` varchar(64) DEFAULT NULL COMMENT '相机类型',
  `F_Pvg_Channel_Group_ID` varchar(32) DEFAULT NULL COMMENT '视频网关分组编号',
  `F_Resource_Type` varchar(256) DEFAULT NULL COMMENT '资源类型',
  `F_Pvg_Server_ID` varchar(32) DEFAULT NULL COMMENT '视频网关编号',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_PY_Code` varchar(32) DEFAULT NULL COMMENT '拼音编码',
  `F_Brand_Model` varchar(64) DEFAULT NULL,
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Resolution` varchar(64) DEFAULT NULL COMMENT '分辨率',
  `F_Direction` varchar(64) DEFAULT NULL COMMENT '方向',
  `F_Class_Type` varchar(64) DEFAULT NULL COMMENT '建设类型',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='摄像机';

-- ----------------------------
-- Table structure for t_camera_preset
-- ----------------------------
DROP TABLE IF EXISTS `t_camera_preset`;
CREATE TABLE `t_camera_preset` (
  `F_ID` varchar(32) NOT NULL COMMENT '序号',
  `F_Camera_ID` varchar(32) NOT NULL COMMENT '摄像机序号',
  `F_Name` varchar(256) DEFAULT NULL COMMENT '名称',
  `F_Preset` int(11) DEFAULT NULL COMMENT '预置位',
  `F_Is_Defuault` tinyint(1) DEFAULT NULL COMMENT '是否守望位',
  `F_Is_Valid` tinyint(1) DEFAULT '0' COMMENT '是否有效',
  `F_Ext` text COMMENT '备注',
  `F_Interval_Time` int(11) DEFAULT NULL COMMENT ' 内部时间',
  `F_Order_Num` int(11) DEFAULT NULL COMMENT '排序序号',
  `F_Direction_Pic_Path` varchar(1024) DEFAULT NULL COMMENT '预置位图片路径',
  `F_Call_Time` datetime DEFAULT NULL COMMENT '调用时间',
  PRIMARY KEY (`F_ID`),
  KEY `I_CameraID_CameraPreset` (`F_Camera_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ccu
-- ----------------------------
DROP TABLE IF EXISTS `t_ccu`;
CREATE TABLE `t_ccu` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(32) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_IpAddress` varchar(32) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '所属组织机构',
  `F_Access_Server_ID` varchar(32) DEFAULT NULL COMMENT '所属接入服务器',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  `F_Uid` varchar(32) DEFAULT NULL,
  `F_Pwd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信号机管理服务器';

-- ----------------------------
-- Table structure for t_center_server
-- ----------------------------
DROP TABLE IF EXISTS `t_center_server`;
CREATE TABLE `t_center_server` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(128) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(256) DEFAULT NULL COMMENT '名称',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_IpAddress` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口',
  `F_Global_Key` varchar(128) DEFAULT NULL COMMENT '全局Key',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中心服务器';

-- ----------------------------
-- Table structure for t_command_text
-- ----------------------------
DROP TABLE IF EXISTS `t_command_text`;
CREATE TABLE `t_command_text` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_Code` varchar(32) DEFAULT NULL COMMENT '预案编号',
  `F_Name` varchar(256) DEFAULT NULL COMMENT '预案名称',
  `F_Type` varchar(2) DEFAULT NULL COMMENT '预案类型',
  `F_Level` varchar(2) DEFAULT NULL COMMENT '预案等级',
  `F_Describe` varchar(256) DEFAULT NULL COMMENT '描述',
  `F_Creator_ID` varchar(32) DEFAULT NULL COMMENT '创建人',
  `F_Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展(JSON格式)',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指挥调度文本预案表';

-- ----------------------------
-- Table structure for t_command_text_file
-- ----------------------------
DROP TABLE IF EXISTS `t_command_text_file`;
CREATE TABLE `t_command_text_file` (
  `F_ID` varchar(32) DEFAULT NULL COMMENT 'ID',
  `F_Text_ID` varchar(32) DEFAULT NULL COMMENT '文本预案ID',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '附件名称',
  `F_File_Data` longblob COMMENT '附件',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展字段(JSON数据)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指挥调度文本预案附件表';

-- ----------------------------
-- Table structure for t_decoder
-- ----------------------------
DROP TABLE IF EXISTS `t_decoder`;
CREATE TABLE `t_decoder` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '编码',
  `F_Access_Server_ID` varchar(32) DEFAULT NULL COMMENT '接入服务编号',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_IpAddress` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口',
  `F_Uid` varchar(64) DEFAULT NULL COMMENT '用户',
  `F_Pwd` varchar(64) DEFAULT NULL COMMENT '密码',
  `F_Decoder_Type` varchar(64) DEFAULT NULL COMMENT '解码器类型',
  `F_Order_No` int(11) DEFAULT NULL COMMENT '排序序号',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='解码器';

-- ----------------------------
-- Table structure for t_decoder_channel
-- ----------------------------
DROP TABLE IF EXISTS `t_decoder_channel`;
CREATE TABLE `t_decoder_channel` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_Channel` int(11) DEFAULT NULL COMMENT '通道索引号',
  `F_Decoder_ID` varchar(32) DEFAULT NULL COMMENT '解码编号',
  `F_Description` varchar(256) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='解码通道';

-- ----------------------------
-- Table structure for t_dvs
-- ----------------------------
DROP TABLE IF EXISTS `t_dvs`;
CREATE TABLE `t_dvs` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_Code` varchar(128) DEFAULT NULL COMMENT '编码',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_Pvg_Server_ID` varchar(32) DEFAULT NULL COMMENT 'Pvg服务编号',
  `F_IpAddress` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口',
  `F_Uid` varchar(64) DEFAULT NULL COMMENT '用户',
  `F_Pwd` varchar(64) DEFAULT NULL COMMENT '密码',
  `F_Dvs_Type` varchar(64) DEFAULT NULL COMMENT '编码器类型',
  `F_Order_No` int(11) DEFAULT NULL COMMENT '排序序号',
  `F_PY_Code` varchar(32) DEFAULT NULL COMMENT '拼音编码',
  `F_IS_Pvg_Group` tinyint(4) DEFAULT NULL COMMENT '是否Pvg分组',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频编码器';

-- ----------------------------
-- Table structure for t_dvs_input
-- ----------------------------
DROP TABLE IF EXISTS `t_dvs_input`;
CREATE TABLE `t_dvs_input` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_Dvs_ID` varchar(32) DEFAULT NULL COMMENT '视频网关编号',
  `F_Channel` int(11) DEFAULT NULL COMMENT '通道索引号',
  `F_Channel_Type` varchar(64) DEFAULT NULL COMMENT '通道类型',
  `F_PvgServer_ID` varchar(32) DEFAULT NULL COMMENT 'Pvg服务编号',
  `F_AiName` varchar(256) DEFAULT NULL COMMENT '报警输入名称',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频编码器输入通道';

-- ----------------------------
-- Table structure for t_dvs_output
-- ----------------------------
DROP TABLE IF EXISTS `t_dvs_output`;
CREATE TABLE `t_dvs_output` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_Dvs_ID` varchar(32) DEFAULT NULL COMMENT '视频编码器编号',
  `F_PvgServer_ID` varchar(32) DEFAULT NULL COMMENT 'Pvg服务器编号',
  `F_Channel` int(11) DEFAULT NULL COMMENT '通道号',
  `F_Channel_Type` varchar(64) DEFAULT NULL COMMENT '通道类型',
  `F_AiName` varchar(128) DEFAULT NULL COMMENT '报警输入名称',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频编码器输出通道';

-- ----------------------------
-- Table structure for t_engineering
-- ----------------------------
DROP TABLE IF EXISTS `t_engineering`;
CREATE TABLE `t_engineering` (
  `F_ID` varchar(32) NOT NULL COMMENT '序号',
  `F_Contact_Person` varchar(64) DEFAULT NULL COMMENT '联系人',
  `F_Contact_Telephone` varchar(64) DEFAULT NULL COMMENT '联系人电话',
  `F_Unit_Name` varchar(256) DEFAULT NULL COMMENT '组织名称',
  `F_Contact_Emergency` varchar(64) DEFAULT NULL COMMENT '紧急联系人',
  `F_Address` varchar(256) DEFAULT NULL COMMENT '联系地址',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构序号',
  `F_Unit_Type` varchar(1024) DEFAULT NULL COMMENT '组织类型',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`F_ID`),
  KEY `I_OrgUnitID_Engineering` (`F_OrgUnit_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工程表';

-- ----------------------------
-- Table structure for t_engineering_object_data
-- ----------------------------
DROP TABLE IF EXISTS `t_engineering_object_data`;
CREATE TABLE `t_engineering_object_data` (
  `F_ID` varchar(32) NOT NULL COMMENT '备注',
  `F_Object_ID` varchar(32) DEFAULT '0' COMMENT '对象序号',
  `F_Object_Type` varchar(64) DEFAULT '' COMMENT '对象类型',
  `F_Construction_ID` varchar(32) DEFAULT '0' COMMENT '建设单位ID',
  `F_Use_ID` varchar(32) DEFAULT '0' COMMENT '使用序号',
  `F_Ops_ID` varchar(32) DEFAULT '0' COMMENT '管道序号ID',
  `F_Supervision_ID` varchar(32) DEFAULT '0' COMMENT '监理单位ID',
  `F_Manager_ID` varchar(32) DEFAULT '0' COMMENT '运维单位ID',
  `F_Integrated_ID` varchar(32) DEFAULT '0' COMMENT '集成单位ID',
  `F_Device_Factry_ID` varchar(32) DEFAULT '0' COMMENT '设备厂家ID',
  `F_Install_Time` datetime DEFAULT NULL COMMENT '安装时间',
  `F_Install_Address` varchar(4096) DEFAULT NULL,
  `F_Install_Image_Path` varchar(1024) DEFAULT NULL COMMENT '安装图片路径',
  `F_Construction_Class` varchar(64) DEFAULT NULL COMMENT '建筑类型',
  `F_Person_ID` varchar(32) DEFAULT NULL COMMENT '负责人ID',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`F_ID`),
  KEY `I_Object_EngineeringObjectData` (`F_Object_Type`,`F_Object_ID`) USING BTREE,
  KEY `I_ConstructionID_EngineeringObjectData` (`F_Construction_ID`) USING BTREE,
  KEY `I_UseID_EngineeringObjectData` (`F_Use_ID`) USING BTREE,
  KEY `I_OpsID_EngineeringObjectData` (`F_Ops_ID`) USING BTREE,
  KEY `I_SupervisionID_EngineeringObjectData` (`F_Supervision_ID`) USING BTREE,
  KEY `I_ManagerID_EngineeringObjectData` (`F_Manager_ID`) USING BTREE,
  KEY `I_DeviceFactryID_EngineeringObjectData` (`F_Device_Factry_ID`) USING BTREE,
  KEY `I_IntegratedID_EngineeringObjectData` (`F_Integrated_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工程对象数据表';

-- ----------------------------
-- Table structure for t_event_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_event_rule`;
CREATE TABLE `t_event_rule` (
  `F_ID` varchar(32) NOT NULL,
  `F_Name` varchar(256) DEFAULT NULL,
  `F_Description` varchar(512) DEFAULT NULL,
  `F_Disabled` tinyint(1) DEFAULT NULL COMMENT ' 1：启用  0：禁用  ',
  `F_Time_Template_ID` varchar(32) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  `F_Create_User_ID` varchar(32) DEFAULT NULL COMMENT '创建者用户ID',
  PRIMARY KEY (`F_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_event_rule_action
-- ----------------------------
DROP TABLE IF EXISTS `t_event_rule_action`;
CREATE TABLE `t_event_rule_action` (
  `F_ID` varchar(32) NOT NULL,
  `F_Event_Rule_ID` varchar(32) NOT NULL,
  `F_Action_Type` varchar(64) DEFAULT NULL,
  `F_Order_No` int(11) DEFAULT NULL,
  `F_Object_Type` varchar(64) DEFAULT '',
  `F_Object_ID` varchar(32) DEFAULT '0',
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`),
  KEY `I_EventRuleID_EventRuleAction` (`F_Event_Rule_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_event_rule_action_log
-- ----------------------------
DROP TABLE IF EXISTS `t_event_rule_action_log`;
CREATE TABLE `t_event_rule_action_log` (
  `F_ID` varchar(32) NOT NULL,
  `F_Event_RuleId` varchar(32) NOT NULL,
  `F_Action_Type` varchar(64) DEFAULT NULL,
  `F_Alarm_Log_ID` varchar(32) NOT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`),
  KEY `I_EventRuleId_EventRuleActionLog` (`F_Event_RuleId`) USING BTREE,
  KEY `I_AlarmLogID_EventRuleActionLog` (`F_Alarm_Log_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_event_rule_trigger
-- ----------------------------
DROP TABLE IF EXISTS `t_event_rule_trigger`;
CREATE TABLE `t_event_rule_trigger` (
  `F_ID` varchar(32) NOT NULL,
  `F_Event_Rule_ID` varchar(32) NOT NULL,
  `F_Event_Type` varchar(64) DEFAULT NULL,
  `F_Object_Type` varchar(64) DEFAULT '',
  `F_Object_ID` varchar(32) DEFAULT '0',
  `F_Logic` varchar(64) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`),
  KEY `I_EventRuleID_EventRuleTrigger` (`F_Event_Rule_ID`) USING BTREE,
  KEY `I_Object_EventRuleTrigger` (`F_Object_Type`,`F_Object_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_files
-- ----------------------------
DROP TABLE IF EXISTS `t_files`;
CREATE TABLE `t_files` (
  `F_ID` varchar(32) NOT NULL,
  `F_Object_ID` varchar(32) DEFAULT NULL,
  `F_Object_Type` varchar(65) DEFAULT NULL,
  `F_File_Type` varchar(11) DEFAULT NULL COMMENT '文件类型',
  `F_Name` varchar(256) DEFAULT NULL COMMENT '文件名称',
  `F_Size` decimal(11,2) DEFAULT '0.00',
  `F_Url` varchar(1024) DEFAULT NULL COMMENT '文件路径',
  `F_Order` int(2) DEFAULT NULL COMMENT '排序号',
  `F_Upload_Time` datetime DEFAULT NULL COMMENT '上传时间',
  `F_Ext` text,
  PRIMARY KEY (`F_ID`),
  KEY `I_Object_ID` (`F_Object_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Table structure for t_function
-- ----------------------------
DROP TABLE IF EXISTS `t_function`;
CREATE TABLE `t_function` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Key` varchar(256) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '功能名称',
  `F_Module_Key` varchar(32) DEFAULT NULL COMMENT '所属模块编号',
  `F_Is_Disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `F_Seq` int(4) DEFAULT NULL COMMENT '顺序号',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块功能表';

-- ----------------------------
-- Table structure for t_function_role
-- ----------------------------
DROP TABLE IF EXISTS `t_function_role`;
CREATE TABLE `t_function_role` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Role_ID` varchar(32) DEFAULT NULL COMMENT '角色编号',
  `F_Funtion_Key` varchar(32) DEFAULT NULL COMMENT '功能编码',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '操作类型JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资源权限表';

-- ----------------------------
-- Table structure for t_gate
-- ----------------------------
DROP TABLE IF EXISTS `t_gate`;
CREATE TABLE `t_gate` (
  `F_ID` varchar(3) NOT NULL COMMENT '编号',
  `F_Code` varchar(128) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(256) DEFAULT NULL COMMENT '名称',
  `F_PY_Code` varchar(256) DEFAULT NULL COMMENT '拼音码',
  `F_Internal_Object_ID` varchar(64) DEFAULT NULL COMMENT '卡口映射ID',
  `F_Gate_Server_ID` varchar(32) DEFAULT NULL COMMENT '卡口服务器编号',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_Gate_Type` varchar(64) DEFAULT NULL COMMENT '路口类型',
  `F_Road_No` varchar(64) DEFAULT NULL COMMENT '道路编号',
  `F_Build_Location` varchar(256) DEFAULT NULL COMMENT '安装位置',
  `F_Connect_Province` varchar(32) DEFAULT NULL COMMENT '连接省份',
  `F_Road_Sections_No` varchar(64) DEFAULT NULL COMMENT '路段号码',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卡口表';

-- ----------------------------
-- Table structure for t_gate_channel
-- ----------------------------
DROP TABLE IF EXISTS `t_gate_channel`;
CREATE TABLE `t_gate_channel` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_Internal_Object_ID` varchar(64) DEFAULT NULL COMMENT '内部对象编号',
  `F_Gate_ID` varchar(3) DEFAULT NULL COMMENT '卡口编号',
  `F_Gate_Server_ID` varchar(32) DEFAULT NULL COMMENT '卡口服务器编号',
  `F_Lane_No` int(11) DEFAULT NULL COMMENT '排序序号',
  `F_Order_No` int(11) DEFAULT NULL COMMENT '排序序号',
  `F_Device_Type` varchar(128) DEFAULT NULL COMMENT '设备类型',
  `F_Min_Speed` double DEFAULT NULL COMMENT '最小速度',
  `F_Max_Speed` double DEFAULT NULL COMMENT '最大速度',
  `F_Gate_Channel_Type` varchar(32) DEFAULT NULL COMMENT '卡口通道类型',
  `F_Direction` varchar(128) DEFAULT NULL COMMENT '方向',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卡口车道表';

-- ----------------------------
-- Table structure for t_gate_server
-- ----------------------------
DROP TABLE IF EXISTS `t_gate_server`;
CREATE TABLE `t_gate_server` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(32) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_IpAddress` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口',
  `F_Uid` varchar(64) DEFAULT NULL COMMENT '用户',
  `F_Pwd` varchar(64) DEFAULT NULL COMMENT '密码',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卡口服务器';

-- ----------------------------
-- Table structure for t_gis_layer
-- ----------------------------
DROP TABLE IF EXISTS `t_gis_layer`;
CREATE TABLE `t_gis_layer` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_Name` varchar(32) DEFAULT NULL COMMENT '名称',
  `F_Type` varchar(32) DEFAULT NULL COMMENT '分组类型',
  `F_Resource_Type` varchar(32) DEFAULT NULL COMMENT '资源类型',
  `F_Min_Level` varchar(32) DEFAULT NULL COMMENT '最小级别',
  `F_Is_Add` varchar(1) DEFAULT NULL COMMENT '是否添加到地图',
  `F_Is_Show` varchar(1) DEFAULT '0' COMMENT '是否显示',
  `F_Image` varchar(256) DEFAULT NULL COMMENT '图片',
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地图图层';

-- ----------------------------
-- Table structure for t_gis_mark
-- ----------------------------
DROP TABLE IF EXISTS `t_gis_mark`;
CREATE TABLE `t_gis_mark` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Object_ID` varchar(32) DEFAULT NULL COMMENT '对象ID',
  `F_Object_Type` varchar(16) DEFAULT NULL COMMENT '对象类型:信号机、视频、GPS、电子警察…',
  `F_Name` varchar(128) DEFAULT NULL,
  `F_Layer_Type` varchar(32) DEFAULT NULL COMMENT '标注类型:点、线、面',
  `F_Lat` double(32,12) DEFAULT NULL COMMENT '纬度X',
  `F_Lon` double(32,12) DEFAULT NULL COMMENT '经度Y',
  `F_Is_Disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `F_Describe` varchar(256) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地图标注表';

-- ----------------------------
-- Table structure for t_gis_mark_file
-- ----------------------------
DROP TABLE IF EXISTS `t_gis_mark_file`;
CREATE TABLE `t_gis_mark_file` (
  `F_ID` varchar(32) DEFAULT NULL COMMENT 'ID',
  `F_Mark_ID` varchar(32) DEFAULT NULL COMMENT '地图Mark编号',
  `F_Image_Url` varchar(256) DEFAULT NULL COMMENT '图片路径',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展数据(JSON数据)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地图图片表';

-- ----------------------------
-- Table structure for t_gps_bind_object
-- ----------------------------
DROP TABLE IF EXISTS `t_gps_bind_object`;
CREATE TABLE `t_gps_bind_object` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_Device_ID` varchar(32) DEFAULT NULL COMMENT 'GPS设备ID',
  `F_Object_ID` varchar(32) DEFAULT NULL COMMENT '对象ID',
  `F_Object_Type` varchar(16) DEFAULT NULL COMMENT '对象类型(人员、车辆)',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gps人员车辆绑定表';

-- ----------------------------
-- Table structure for t_gps_camera
-- ----------------------------
DROP TABLE IF EXISTS `t_gps_camera`;
CREATE TABLE `t_gps_camera` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_Camera_ID` varchar(32) DEFAULT NULL COMMENT '相机ID',
  `F_Device_ID` varchar(32) DEFAULT NULL COMMENT 'GPS设备ID',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gps相机对应表';

-- ----------------------------
-- Table structure for t_gps_car
-- ----------------------------
DROP TABLE IF EXISTS `t_gps_car`;
CREATE TABLE `t_gps_car` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(32) DEFAULT NULL,
  `F_Plate` varchar(16) DEFAULT NULL COMMENT '号牌号码',
  `F_Type` varchar(2) DEFAULT NULL COMMENT '类型',
  `F_OrgUnit_ID` varchar(64) DEFAULT NULL COMMENT '组织机构ID',
  `F_Is_Disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `F_Create_User` varchar(32) DEFAULT NULL COMMENT '创建用户',
  `F_Create_Date` datetime DEFAULT NULL COMMENT '创建日期',
  `F_Remark` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GPS车辆信息表';

-- ----------------------------
-- Table structure for t_gps_car_police
-- ----------------------------
DROP TABLE IF EXISTS `t_gps_car_police`;
CREATE TABLE `t_gps_car_police` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Persion_ID` varchar(32) DEFAULT NULL COMMENT '人员ID',
  `F_Car_ID` varchar(32) DEFAULT NULL COMMENT '车辆ID',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆人员关系表';

-- ----------------------------
-- Table structure for t_gps_device
-- ----------------------------
DROP TABLE IF EXISTS `t_gps_device`;
CREATE TABLE `t_gps_device` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_Code` varchar(128) DEFAULT NULL COMMENT '编码',
  `F_PY_Code` varchar(128) DEFAULT NULL COMMENT '拼音编码',
  `F_Device_Code` varchar(128) DEFAULT NULL COMMENT '设备编码',
  `F_Name` varchar(256) DEFAULT NULL COMMENT '名称',
  `F_Access_Server_ID` varchar(32) DEFAULT NULL COMMENT '接入服务编号',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GPS设备';

-- ----------------------------
-- Table structure for t_gps_patrol_area
-- ----------------------------
DROP TABLE IF EXISTS `t_gps_patrol_area`;
CREATE TABLE `t_gps_patrol_area` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(32) DEFAULT NULL COMMENT '巡区编号(地图标注编号)',
  `F_Name` varchar(32) DEFAULT NULL COMMENT '巡区名称',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '所属组织机构',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='巡区表';

-- ----------------------------
-- Table structure for t_gps_patrol_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_gps_patrol_relation`;
CREATE TABLE `t_gps_patrol_relation` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Patrol_ID` varchar(32) DEFAULT NULL COMMENT '巡区编号',
  `F_Object_ID` varchar(32) DEFAULT NULL COMMENT '警员/警车编号',
  `F_Object_Type` varchar(1) DEFAULT NULL COMMENT '警员、警车',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='巡区警员关系表';

-- ----------------------------
-- Table structure for t_gps_server
-- ----------------------------
DROP TABLE IF EXISTS `t_gps_server`;
CREATE TABLE `t_gps_server` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(32) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_IpAddress` varchar(32) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '所属组织机构',
  `F_Access_Server_ID` varchar(32) DEFAULT NULL COMMENT '所属接入服务器',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='时序服务器';

-- ----------------------------
-- Table structure for t_gps_task
-- ----------------------------
DROP TABLE IF EXISTS `t_gps_task`;
CREATE TABLE `t_gps_task` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Task_Date` datetime DEFAULT NULL COMMENT '任务日期',
  `F_Start_Date` datetime DEFAULT NULL COMMENT '开始时间',
  `F_End_Date` datetime DEFAULT NULL COMMENT '结束时间',
  `F_Description` varchar(256) DEFAULT NULL COMMENT '任务描述',
  `F_Leader` varchar(32) DEFAULT NULL COMMENT '带班领导',
  `F_Type` varchar(1) DEFAULT NULL COMMENT '班次(早班，中班，晚班)',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='排班表';

-- ----------------------------
-- Table structure for t_gps_task_police
-- ----------------------------
DROP TABLE IF EXISTS `t_gps_task_police`;
CREATE TABLE `t_gps_task_police` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Task_ID` varchar(32) DEFAULT NULL COMMENT '任务编号',
  `F_Police_ID` varchar(32) DEFAULT NULL COMMENT '警员',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='警员排班关系表';

-- ----------------------------
-- Table structure for t_guide_device
-- ----------------------------
DROP TABLE IF EXISTS `t_guide_device`;
CREATE TABLE `t_guide_device` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_IpAddress` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口',
  `F_Type` varchar(64) DEFAULT NULL COMMENT '诱导屏类型(0：文字屏，1：复合屏)',
  `F_Access_Server_ID` varchar(32) DEFAULT NULL COMMENT '接入服务器编号',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_Road_Sections_No` varchar(64) DEFAULT NULL COMMENT '路段编号',
  `F_Direction` varchar(64) DEFAULT NULL COMMENT '方向',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='诱导屏设备表';

-- ----------------------------
-- Table structure for t_guide_info
-- ----------------------------
DROP TABLE IF EXISTS `t_guide_info`;
CREATE TABLE `t_guide_info` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Guide_ID` varchar(32) DEFAULT NULL COMMENT '诱导屏编号',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '周期计划名称',
  `F_Start_Time` datetime DEFAULT NULL COMMENT '开始时间',
  `F_End_Time` datetime DEFAULT NULL COMMENT '结束时间',
  `F_Context` varchar(2048) DEFAULT NULL COMMENT '发布信息',
  `F_Image_Url` varchar(256) DEFAULT NULL COMMENT '发布图片地址',
  `F_Creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `F_Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `F_Status` varchar(16) DEFAULT NULL COMMENT '审核状态:未提交:UnCommitted, 待审核:CheckPending, 未通过:NotPassed, 已发布:Diffused, 已过期:Overdue, 已撤销:Cancelled',
  `P_Approver` varchar(32) DEFAULT NULL COMMENT '审批人',
  `P_Approve_Time` datetime DEFAULT NULL COMMENT '审批时间',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='诱导屏信息发布表';

-- ----------------------------
-- Table structure for t_guide_info_history
-- ----------------------------
DROP TABLE IF EXISTS `t_guide_info_history`;
CREATE TABLE `t_guide_info_history` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Guide_ID` varchar(32) DEFAULT NULL COMMENT '诱导屏编号',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '周期计划名称',
  `F_Start_Time` datetime DEFAULT NULL COMMENT '开始时间',
  `F_End_Time` datetime DEFAULT NULL COMMENT '结束时间',
  `F_Context` varchar(2048) DEFAULT NULL COMMENT '发布信息',
  `F_Image_Url` varchar(256) DEFAULT NULL COMMENT '发布图片地址',
  `F_Creater` varchar(32) DEFAULT NULL COMMENT '创建人',
  `F_Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `F_Status` varchar(2) DEFAULT NULL COMMENT '状态(未审批、已审批待发布、发布中、已发布)',
  `P_Approver` varchar(32) DEFAULT NULL COMMENT '审批人',
  `P_Approve_Time` datetime DEFAULT NULL COMMENT '审批时间',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='诱导屏信息发布历史表';

-- ----------------------------
-- Table structure for t_ivs_server
-- ----------------------------
DROP TABLE IF EXISTS `t_ivs_server`;
CREATE TABLE `t_ivs_server` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_Access_Server_ID` varchar(32) DEFAULT NULL COMMENT '接入服务器编号',
  `F_IpAddress` varchar(32) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口号',
  `F_Uid` varchar(64) DEFAULT NULL COMMENT '用户',
  `F_Pwd` varchar(64) DEFAULT NULL COMMENT '密码',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='智能分析服务器';

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `F_ID` varchar(32) NOT NULL COMMENT '序号',
  `F_Source` varchar(256) DEFAULT NULL COMMENT '来源',
  `F_User_ID` varchar(32) DEFAULT '-1' COMMENT '用户序号',
  `F_User_Name` varchar(256) DEFAULT NULL COMMENT '用户名称',
  `F_Operation_Type` varchar(256) DEFAULT NULL COMMENT '操作类型',
  `F_Computer_Info` varchar(256) DEFAULT NULL COMMENT 'PC信息',
  `F_Object_ID` varchar(32) DEFAULT '-1' COMMENT '对象序号',
  `F_Object_Name` varchar(256) DEFAULT NULL COMMENT '对象类型',
  `F_Object_Type` varchar(256) DEFAULT NULL COMMENT '对象类型',
  `F_Log_Time` datetime DEFAULT NULL COMMENT '日记时间',
  `F_Desc` varchar(4096) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_log_server
-- ----------------------------
DROP TABLE IF EXISTS `t_log_server`;
CREATE TABLE `t_log_server` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(32) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_IpAddress` varchar(32) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '所属组织机构',
  `F_Access_Server_ID` varchar(32) DEFAULT NULL COMMENT '所属接入服务器',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志服务器';

-- ----------------------------
-- Table structure for t_message_server
-- ----------------------------
DROP TABLE IF EXISTS `t_message_server`;
CREATE TABLE `t_message_server` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构',
  `F_IpAddress` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口号',
  `F_Uid` varchar(64) DEFAULT NULL COMMENT '用户',
  `F_Pwd` varchar(64) DEFAULT NULL COMMENT '密码',
  `F_Server_Type` varchar(256) DEFAULT NULL COMMENT '消息服务器类型',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_module
-- ----------------------------
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Key` varchar(64) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '模块名称',
  `F_Url` varchar(128) DEFAULT NULL COMMENT '模块加载地址',
  `F_Seq` int(4) DEFAULT NULL COMMENT '顺序号',
  `F_Parent_Key` varchar(64) CHARACTER SET utf32 DEFAULT NULL COMMENT '父节点ID',
  `F_Icon_Url` varchar(128) DEFAULT NULL COMMENT '图标Url',
  `F_Is_Disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `F_Is_Entrance` tinyint(1) DEFAULT NULL COMMENT '是否入口',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统模块表';

-- ----------------------------
-- Table structure for t_module_frequent_used
-- ----------------------------
DROP TABLE IF EXISTS `t_module_frequent_used`;
CREATE TABLE `t_module_frequent_used` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_User_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Module_Key` varchar(64) NOT NULL COMMENT '模块Key',
  `F_Seq` int(4) DEFAULT '0' COMMENT '顺序号',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`),
  KEY `I_User_ID` (`F_User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='常用系统模块表';

-- ----------------------------
-- Table structure for t_monitor_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `t_monitor_vehicle`;
CREATE TABLE `t_monitor_vehicle` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Vehicle_Plate` varchar(32) DEFAULT NULL COMMENT '号牌号码',
  `F_Monitor_Type` varchar(64) DEFAULT NULL COMMENT '布控类型（1：黑名单，2：红名单，3：白名单）',
  `F_AlarmType` varchar(1024) DEFAULT '' COMMENT '报警类型, 当F_Monitor_Type为BlackVehicle时有效',
  `F_Start_Time` datetime DEFAULT NULL COMMENT '布控开始时间',
  `F_End_Time` datetime DEFAULT NULL COMMENT '布控结束时间',
  `F_Enable` tinyint(1) DEFAULT '0' COMMENT '是否启用(1：启用  0：未启用)',
  `F_Monitor_Level` varchar(11) DEFAULT '' COMMENT '布控级别',
  `F_Monitor_Scope` varchar(4096) DEFAULT '' COMMENT '布控范围',
  `F_Vehicle_Type` varchar(11) DEFAULT NULL COMMENT '车辆类型',
  `F_Vehicle_Brand` varchar(5) DEFAULT NULL COMMENT '车辆品牌',
  `F_Plate_Color` varchar(11) DEFAULT '' COMMENT '号牌颜色',
  `F_Vehicle_Color` varchar(255) DEFAULT NULL COMMENT '车辆颜色',
  `F_Vehicle_Plate_Type` varchar(64) DEFAULT NULL COMMENT '号牌类型',
  `F_Other_Conditions` varchar(512) DEFAULT NULL COMMENT '其它条件',
  `F_Monitoring_Unit` varchar(128) DEFAULT NULL COMMENT '布控单位',
  `F_Status` varchar(32) DEFAULT NULL COMMENT '审核状态',
  `F_Reason_Rejection` varchar(128) DEFAULT NULL COMMENT '拒绝原因',
  `F_Cancel_Time` datetime DEFAULT NULL COMMENT '取消时间',
  `F_Cancel_Reason` varchar(512) DEFAULT NULL COMMENT '取消原因',
  `F_Create_User_ID` varchar(32) DEFAULT '0' COMMENT '创建人员ID',
  `F_Approve_User_ID` varchar(32) DEFAULT '0' COMMENT '审核通过人员ID',
  `F_Approve_Time` datetime DEFAULT NULL COMMENT '审核通过时间',
  `F_Description` varchar(1024) DEFAULT NULL COMMENT '描述',
  `F_Internal_Object_ID` varchar(256) DEFAULT NULL COMMENT '内部对象ID',
  `F_Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `F_Ext` varchar(4096) DEFAULT '' COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='监控车辆表';

-- ----------------------------
-- Table structure for t_multi_lang_data
-- ----------------------------
DROP TABLE IF EXISTS `t_multi_lang_data`;
CREATE TABLE `t_multi_lang_data` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_Key` varchar(64) DEFAULT NULL COMMENT '对应主表的Code或ID',
  `F_Language_Type` varchar(16) DEFAULT NULL COMMENT '语言名称(CN,EN,JP,SP,UK,...)',
  `F_Data_Type` varchar(32) DEFAULT NULL COMMENT '数据类型(Menu、Dic、Message、...)',
  `F_Value` varchar(256) DEFAULT NULL COMMENT '语言值',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='语言编码表';

-- ----------------------------
-- Table structure for t_object_group
-- ----------------------------
DROP TABLE IF EXISTS `t_object_group`;
CREATE TABLE `t_object_group` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Parent_ID` varchar(32) DEFAULT NULL COMMENT '上级编号',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_PY_Code` varchar(32) DEFAULT NULL COMMENT '拼音码',
  `F_Object_Type` varchar(32) DEFAULT NULL COMMENT '数据据类型Camera,DvsInput,DvsOutput,Gate,GateChannel,Person,Vehicle',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组表';

-- ----------------------------
-- Table structure for t_object_group_data
-- ----------------------------
DROP TABLE IF EXISTS `t_object_group_data`;
CREATE TABLE `t_object_group_data` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Object_Group_ID` varchar(32) DEFAULT NULL COMMENT '对象分组编号',
  `F_Object_ID` varchar(32) DEFAULT NULL COMMENT '对象编号',
  `F_Object_Type` varchar(32) DEFAULT NULL COMMENT '数据据类型Camera,DvsINUPU,DvsOUTPUT,Gate,GateChannel,Person,Vehicle',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='对象分组数据表';

-- ----------------------------
-- Table structure for t_org_unit
-- ----------------------------
DROP TABLE IF EXISTS `t_org_unit`;
CREATE TABLE `t_org_unit` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_Parent_ID` varchar(32) DEFAULT NULL COMMENT '父编号',
  `F_Is_Sub_Center_Root_OrgUnit` tinyint(4) DEFAULT NULL COMMENT '子级中心根节点',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  `F_Order_Num` int(11) DEFAULT NULL COMMENT '排序序号',
  `F_ByName` varchar(512) DEFAULT NULL COMMENT '机构别名设置/获取机构别名',
  `F_PY_Code` varchar(32) DEFAULT NULL COMMENT '拼音编码',
  `F_Due_Date` datetime DEFAULT NULL COMMENT '有效期',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构表';

-- ----------------------------
-- Table structure for t_parameter
-- ----------------------------
DROP TABLE IF EXISTS `t_parameter`;
CREATE TABLE `t_parameter` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Key` varchar(128) DEFAULT NULL COMMENT '编码，由[ParamClass_ParamValue]组成',
  `F_Parent_Key` varchar(128) DEFAULT NULL COMMENT '父级Key',
  `F_Param_Class` varchar(128) DEFAULT NULL COMMENT '类别',
  `F_Param_Name` varchar(128) DEFAULT NULL COMMENT '名称',
  `F_Param_Value` varchar(256) DEFAULT NULL COMMENT '参数值',
  `F_PY_Code` varchar(256) DEFAULT NULL COMMENT '首拼音',
  `F_Order_No` int(11) DEFAULT NULL COMMENT '顺序号',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数表';

-- ----------------------------
-- Table structure for t_person
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(32) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(32) DEFAULT NULL COMMENT '名称',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_Position` varchar(512) DEFAULT NULL COMMENT '联系地址',
  `F_MobTel` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `F_TelePhone` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `F_Email` varchar(128) DEFAULT NULL COMMENT '电子邮件',
  `F_Photo_Path` longblob COMMENT '人员照片路径',
  `F_PY_Code` varchar(64) DEFAULT NULL COMMENT ' 拼音码',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Post` varchar(16) DEFAULT NULL COMMENT '职务',
  `F_Card_No` varchar(32) DEFAULT NULL COMMENT '身份证号',
  `F_Police_No` varchar(16) DEFAULT NULL COMMENT '警号',
  `F_Call_No` varchar(32) DEFAULT NULL COMMENT '呼收号码',
  `F_Status` varchar(1) DEFAULT '1' COMMENT '状态  1：启用  0：禁用  ',
  `F_Sex` varchar(1) DEFAULT '1' COMMENT '性别  F:女   M:男  ',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员表';

-- ----------------------------
-- Table structure for t_pfs_server
-- ----------------------------
DROP TABLE IF EXISTS `t_pfs_server`;
CREATE TABLE `t_pfs_server` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(32) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_IpAddress` varchar(32) DEFAULT NULL COMMENT 'IP地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '所属组织机构',
  `F_Access_Server_ID` varchar(32) DEFAULT NULL COMMENT '所属接入服务器',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Uid` varchar(32) DEFAULT NULL,
  `F_Pwd` varchar(32) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频图像存储服务器';

-- ----------------------------
-- Table structure for t_pvg_channel_group
-- ----------------------------
DROP TABLE IF EXISTS `t_pvg_channel_group`;
CREATE TABLE `t_pvg_channel_group` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Parent_ID` varchar(32) DEFAULT NULL COMMENT '父节点编号',
  `F_PvgServer_ID` varchar(32) DEFAULT NULL COMMENT '视频网关编号',
  `F_Name` varchar(256) DEFAULT NULL COMMENT '名称',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频网关通道分组';

-- ----------------------------
-- Table structure for t_pvg_server
-- ----------------------------
DROP TABLE IF EXISTS `t_pvg_server`;
CREATE TABLE `t_pvg_server` (
  `F_ID` varchar(32) NOT NULL COMMENT '序号',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_Code` varchar(64) DEFAULT NULL COMMENT '编码',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_OrgUnit_ID` varchar(32) NOT NULL COMMENT '组织机构序号',
  `F_IpAddress` varchar(64) DEFAULT NULL COMMENT 'Ip地址',
  `F_Port` int(11) DEFAULT NULL COMMENT '端口',
  `F_Uid` varchar(32) DEFAULT NULL COMMENT '用户',
  `F_Pwd` varchar(32) DEFAULT NULL COMMENT '密码',
  `F_Access_Server_ID` varchar(32) DEFAULT '0' COMMENT '接入服务器ID',
  `F_Route_Data` varchar(4096) DEFAULT NULL COMMENT '干线配置存储数据',
  `F_Ivs_Server_ID` varchar(32) DEFAULT '0' COMMENT '智能分析服务器编号',
  `F_Is_Cross_NetWork_Dev` tinyint(4) DEFAULT NULL COMMENT '是否过网闸',
  `F_Net_IpAddress` varchar(64) DEFAULT NULL COMMENT '外网IP',
  `F_Net_Port` int(11) DEFAULT NULL COMMENT '外网端口',
  `F_PvgServer_Type` varchar(64) DEFAULT NULL COMMENT '视频网关类型',
  `F_Dns_Address` varchar(64) DEFAULT NULL COMMENT 'DNS地址',
  `F_Device_State` varchar(64) DEFAULT NULL COMMENT '设备状态',
  `F_Detail_State` varchar(512) DEFAULT NULL COMMENT '详情状态',
  `F_Brand_Model` varchar(64) DEFAULT NULL COMMENT '商标品牌',
  `F_Factory` varchar(128) DEFAULT NULL COMMENT '生产厂家',
  `F_Subnet_Mask` varchar(64) DEFAULT NULL COMMENT '子网掩码',
  `F_Gateway` varchar(64) DEFAULT NULL COMMENT '网关',
  `F_Assets_State` varchar(64) DEFAULT 'Normal' COMMENT '资产状态',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频网关服务器';

-- ----------------------------
-- Table structure for t_resource_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_operation`;
CREATE TABLE `t_resource_operation` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_Key` varchar(256) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(256) DEFAULT NULL COMMENT '名称',
  `F_Type` varchar(32) DEFAULT NULL COMMENT '类型',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备资源操作表';

-- ----------------------------
-- Table structure for t_resource_operation_role
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_operation_role`;
CREATE TABLE `t_resource_operation_role` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_Resource_Key` varchar(32) DEFAULT NULL COMMENT '资源ID',
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Role_ID` varchar(32) DEFAULT NULL COMMENT '权限ID',
  `F_Type` varchar(32) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备操作权限关系表';

-- ----------------------------
-- Table structure for t_resource_table_define
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_table_define`;
CREATE TABLE `t_resource_table_define` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_Object_Type` varchar(2) DEFAULT NULL COMMENT '资源类型',
  `F_Table_Name` varchar(32) DEFAULT NULL COMMENT '资源表名称',
  `F_PkColumn` varchar(32) DEFAULT NULL COMMENT '主键列',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '操作类型JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资源定义表';

-- ----------------------------
-- Table structure for t_road_section
-- ----------------------------
DROP TABLE IF EXISTS `t_road_section`;
CREATE TABLE `t_road_section` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(16) DEFAULT NULL COMMENT '路段编号',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '路段名称',
  `F_Start_Road_ID` varchar(32) DEFAULT NULL COMMENT '起始路口',
  `F_End_Road_ID` varchar(32) DEFAULT NULL COMMENT '结束路口',
  `F_Start_Direction` varchar(2) DEFAULT NULL COMMENT '起始路口方向',
  `F_Distance` decimal(6,0) DEFAULT '0' COMMENT '路段距离(M)',
  `F_Road_Type` varchar(2) DEFAULT NULL COMMENT '路段类型(1:快速路、2:主干道、3:次干道、 4:支路)',
  `F_End_Direction` varchar(2) DEFAULT NULL COMMENT '结束路口方向',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='路段配置表';

-- ----------------------------
-- Table structure for t_road_traffic_status
-- ----------------------------
DROP TABLE IF EXISTS `t_road_traffic_status`;
CREATE TABLE `t_road_traffic_status` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_City_ID` varchar(16) DEFAULT NULL COMMENT '城市ID',
  `F_Road_Type` varchar(2) DEFAULT NULL COMMENT '路段类型(1:快速路、2:主干道、3:次干道、 4:支路)',
  `F_LEVEL_ONE` varchar(16) DEFAULT NULL COMMENT '级别1  ，非常顺畅',
  `F_LEVEL_TWO` varchar(16) DEFAULT NULL COMMENT '级别2  ，顺畅',
  `F_LEVEL_THREE` varchar(16) DEFAULT NULL COMMENT '级别3  ，缓行',
  `F_LEVEL_FOUR` varchar(16) DEFAULT NULL COMMENT '级别4  ，拥堵',
  `F_LEVEL_FIVE` varchar(16) DEFAULT NULL COMMENT '级别5  ，严重拥堵',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='路段交通状态配置表';

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `F_Seq` int(4) DEFAULT NULL COMMENT '顺序号',
  `F_Creater_ID` varchar(32) DEFAULT NULL COMMENT '创建人',
  `F_Create_Date` varchar(128) DEFAULT NULL COMMENT '创建时间',
  `F_Is_Disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for t_role_module
-- ----------------------------
DROP TABLE IF EXISTS `t_role_module`;
CREATE TABLE `t_role_module` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Role_ID` varchar(32) DEFAULT NULL COMMENT '权限编号',
  `F_Module_Key` varchar(32) DEFAULT NULL COMMENT '模块编号',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块权限对应关系表';

-- ----------------------------
-- Table structure for t_table_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_table_relation`;
CREATE TABLE `t_table_relation` (
  `F_ID` varchar(32) NOT NULL DEFAULT '' COMMENT '编号',
  `F_Main_Table_Name` varchar(64) DEFAULT NULL COMMENT '主表名称',
  `F_Main_Field_Name` varchar(64) DEFAULT NULL COMMENT '主表字段名称',
  `F_Related_Table_Name` varchar(64) DEFAULT NULL COMMENT '关系表名称',
  `F_Related_Field_Name` varchar(64) DEFAULT NULL COMMENT '关系表字段名称',
  `F_Other_Where` varchar(1024) DEFAULT NULL COMMENT '其它条件',
  `F_Related_Layer_Index` int(4) DEFAULT NULL COMMENT '索引关系层',
  `F_Action_Type` varchar(32) DEFAULT NULL COMMENT '动作类型',
  `F_Update_Value` varchar(1024) DEFAULT NULL COMMENT '更新值',
  `F_Is_Return_Data` tinyint(1) DEFAULT NULL COMMENT '是否返回数据',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表关系';

-- ----------------------------
-- Table structure for t_time_template
-- ----------------------------
DROP TABLE IF EXISTS `t_time_template`;
CREATE TABLE `t_time_template` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '名称',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Is_Full_Day` tinyint(1) DEFAULT NULL COMMENT '是否全天',
  `F_Week_Content` varchar(4096) DEFAULT NULL COMMENT '周内容',
  `F_Day_Content` varchar(4096) DEFAULT NULL COMMENT '天内容',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  `F_Is_Default` tinyint(1) DEFAULT '0' COMMENT '是否默认的时间模版',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='时间模板';

-- ----------------------------
-- Table structure for t_tv_wall_layout
-- ----------------------------
DROP TABLE IF EXISTS `t_tv_wall_layout`;
CREATE TABLE `t_tv_wall_layout` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Name` varchar(256) DEFAULT NULL COMMENT '布局名称',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '机构ID',
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`),
  KEY `I_OrgUnitID_TvWallLoayout` (`F_OrgUnit_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='电视墙布局';

-- ----------------------------
-- Table structure for t_tv_wall_layout_data
-- ----------------------------
DROP TABLE IF EXISTS `t_tv_wall_layout_data`;
CREATE TABLE `t_tv_wall_layout_data` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Name` varchar(256) DEFAULT NULL COMMENT '名称',
  `F_TvWall_Layout_ID` varchar(32) DEFAULT NULL COMMENT '电视墙布局ID',
  `F_Decoder_Channel_ID` varchar(32) DEFAULT NULL COMMENT '解码器通道ID',
  `F_Decoder_Channel_Cell` int(11) DEFAULT NULL COMMENT '解码器通道数',
  `F_Camera_ID` varchar(32) DEFAULT NULL COMMENT '摄像机ID',
  `F_Camera_Group_ID` varchar(32) DEFAULT NULL COMMENT '摄像机分组ID',
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`),
  KEY `I_UserID_TvWallLoayoutData` (`F_TvWall_Layout_ID`) USING BTREE,
  KEY `I_DecoderMonitorID_TvWallLoayoutData` (`F_Decoder_Channel_ID`) USING BTREE,
  KEY `I_CameraGroupID_TvWallLoayoutData` (`F_Camera_Group_ID`) USING BTREE,
  KEY `I_CameraID_TvWallLoayoutData` (`F_Camera_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='电视墙布局数据';

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Uid` varchar(32) DEFAULT NULL COMMENT '用户',
  `F_Pwd` varchar(32) DEFAULT NULL COMMENT '密码',
  `F_Person_ID` varchar(32) DEFAULT NULL COMMENT '人员ID',
  `F_Is_Disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `F_User_Level` int(11) DEFAULT NULL COMMENT '用户级别',
  `F_EndTime_Valid` datetime DEFAULT NULL COMMENT '有效截止时间',
  `F_StartTime_Valid` datetime DEFAULT NULL COMMENT '有效开始时间',
  `F_Is_Forever_Valid` tinyint(1) DEFAULT NULL COMMENT '是否永久有效',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Table structure for t_user_define_monitor_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `t_user_define_monitor_vehicle`;
CREATE TABLE `t_user_define_monitor_vehicle` (
  `F_ID` varchar(32) DEFAULT NULL COMMENT 'ID',
  `F_User_ID` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `F_Monitor_ID` varchar(32) DEFAULT NULL COMMENT '监控ID',
  `F_Create_Time` datetime DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注车辆表';

-- ----------------------------
-- Table structure for t_user_define_video_group
-- ----------------------------
DROP TABLE IF EXISTS `t_user_define_video_group`;
CREATE TABLE `t_user_define_video_group` (
  `F_ID` varchar(32) NOT NULL COMMENT '序号',
  `F_Name` varchar(1024) DEFAULT NULL COMMENT '名称',
  `F_User_ID` varchar(32) NOT NULL COMMENT '用户序号',
  `F_Parent_ID` varchar(32) NOT NULL COMMENT '父序号',
  `F_Description` varchar(1024) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`F_ID`),
  KEY `I_UserID_UserDefineVideoGroup` (`F_User_ID`) USING BTREE,
  KEY `I_ParentID_UserDefineVideoGroup` (`F_Parent_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户自定义视频分组表';

-- ----------------------------
-- Table structure for t_user_define_video_group_data
-- ----------------------------
DROP TABLE IF EXISTS `t_user_define_video_group_data`;
CREATE TABLE `t_user_define_video_group_data` (
  `F_ID` varchar(32) NOT NULL COMMENT '序号',
  `F_User_Define_Video_Group_ID` varchar(32) NOT NULL COMMENT '用户自定义分组序号',
  `F_Camera_ID` varchar(32) NOT NULL COMMENT '摄像机序号',
  `F_Order_No` int(11) DEFAULT NULL COMMENT '排序序号',
  `F_ByName` varchar(256) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`F_ID`),
  KEY `I_UserDefineVideoGroupID_UserDefineVideoGroupData` (`F_User_Define_Video_Group_ID`) USING BTREE,
  KEY `I_CameraID_UserDefineVideoGroupData` (`F_Camera_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户自定义视频分组数据表';

-- ----------------------------
-- Table structure for t_user_inspect_video_group
-- ----------------------------
DROP TABLE IF EXISTS `t_user_inspect_video_group`;
CREATE TABLE `t_user_inspect_video_group` (
  `F_ID` varchar(32) NOT NULL,
  `F_Name` varchar(1024) DEFAULT NULL COMMENT '监巡名称',
  `F_User_ID` varchar(32) NOT NULL COMMENT '用户',
  `F_Stay_Time` int(11) DEFAULT NULL COMMENT '停留时间',
  `F_Layout` int(4) DEFAULT NULL COMMENT '布局',
  `F_Create_Time` datetime DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频监巡分组';

-- ----------------------------
-- Table structure for t_user_inspect_video_time
-- ----------------------------
DROP TABLE IF EXISTS `t_user_inspect_video_time`;
CREATE TABLE `t_user_inspect_video_time` (
  `F_ID` varchar(32) NOT NULL,
  `F_User_Inspect_Video_Group_ID` varchar(32) NOT NULL COMMENT '监巡ID',
  `F_Start_Time` varchar(32) DEFAULT NULL COMMENT '监巡开始时间',
  `F_End_Time` varchar(32) DEFAULT NULL COMMENT '监巡结束时间',
  `F_Inspect_Level` varchar(10) DEFAULT NULL COMMENT '监巡等级',
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户视频监巡时间';

-- ----------------------------
-- Table structure for t_user_patrol_video_group
-- ----------------------------
DROP TABLE IF EXISTS `t_user_patrol_video_group`;
CREATE TABLE `t_user_patrol_video_group` (
  `F_ID` varchar(32) NOT NULL,
  `F_User_ID` varchar(32) NOT NULL COMMENT '用户ID',
  `F_Name` varchar(100) NOT NULL COMMENT '巡逻预案名称',
  `F_Patrol_Time` int(11) DEFAULT NULL COMMENT '巡逻时间',
  `F_Description` varchar(4096) DEFAULT NULL COMMENT '巡逻预案描述',
  `F_Layout` int(11) NOT NULL COMMENT '预案布局',
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户视频巡逻分组';

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_User_ID` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `F_Role_ID` varchar(320) DEFAULT NULL COMMENT '角色编号',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应关系表';

-- ----------------------------
-- Table structure for t_user_video_group_data
-- ----------------------------
DROP TABLE IF EXISTS `t_user_video_group_data`;
CREATE TABLE `t_user_video_group_data` (
  `F_ID` varchar(32) NOT NULL,
  `F_Camera_ID` varchar(32) NOT NULL COMMENT '视频ID',
  `F_Object_Type` varchar(10) NOT NULL COMMENT '视频分组类型，巡逻:patrol,监巡inspect',
  `F_Object_ID` varchar(32) NOT NULL COMMENT '用户定义视频分组ID',
  `F_Order_Num` int(11) DEFAULT NULL COMMENT '排序值',
  `F_Preset` int(11) DEFAULT NULL COMMENT '预置位',
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户视频分组';

-- ----------------------------
-- Table structure for t_user_video_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_user_video_tag`;
CREATE TABLE `t_user_video_tag` (
  `F_ID` varchar(32) NOT NULL,
  `F_Name` varchar(100) DEFAULT NULL COMMENT '描述名称',
  `F_Tag_Time` datetime DEFAULT NULL COMMENT '标记时间',
  `F_Camera_ID` varchar(32) NOT NULL COMMENT '视频ID',
  `F_User_ID` varchar(32) NOT NULL COMMENT '用户ID',
  `F_Create_Time` datetime DEFAULT NULL COMMENT '标记创建时间',
  `F_Description` varchar(4096) DEFAULT NULL COMMENT '标记描述',
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户视频标记';

-- ----------------------------
-- Table structure for t_utc_control_area
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_control_area`;
CREATE TABLE `t_utc_control_area` (
  `F_ID` varchar(32) NOT NULL DEFAULT '' COMMENT 'ID号',
  `F_Code` varchar(16) DEFAULT NULL COMMENT '控制子区编码',
  `F_Name` varchar(128) DEFAULT NULL COMMENT '控制子区名称',
  `F_Parent_ID` varchar(32) DEFAULT NULL COMMENT '上级控制子区ID号',
  `F_Parent_Code` varchar(16) DEFAULT NULL COMMENT '上级控制子区编码',
  `F_Parent_Name` varchar(128) DEFAULT NULL COMMENT '上级控制子区名称',
  `F_Control_ID` varchar(32) DEFAULT NULL COMMENT '分控中心ID号',
  `F_Control_Code` varchar(16) DEFAULT NULL COMMENT '分控中心编码',
  `F_Control_Name` varchar(128) DEFAULT NULL COMMENT '分控中心名称',
  `F_Seq` decimal(8,0) DEFAULT NULL COMMENT '序号',
  `F_Is_Single_Node` varchar(1) DEFAULT NULL COMMENT '是否单点协调优化',
  `F_Remark` varchar(254) DEFAULT NULL COMMENT '备注',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='控制子区';

-- ----------------------------
-- Table structure for t_utc_control_center
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_control_center`;
CREATE TABLE `t_utc_control_center` (
  `F_ID` varchar(32) NOT NULL COMMENT '控制中心ID号',
  `F_Code` varchar(16) DEFAULT NULL COMMENT '控制中心编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '控制中心名称',
  `F_Parent_ID` varchar(32) DEFAULT NULL COMMENT '上级控制中心ID',
  `F_Parent_Code` varchar(16) DEFAULT NULL COMMENT '上级控制中心编码',
  `F_Parent_Name` varchar(64) DEFAULT NULL COMMENT '上级控制中心名称',
  `F_Is_Top` varchar(1) DEFAULT NULL COMMENT '是否最高级控制中心（交警支队）',
  `F_Opt_Ip_Address` varchar(16) DEFAULT NULL COMMENT 'OPT区域优化IP地址',
  `F_Opt_Ip_Port` decimal(8,0) DEFAULT NULL COMMENT 'OPT区域优化端口',
  `F_Ccu_Ip_Address` varchar(16) DEFAULT NULL COMMENT 'CCU通讯服务IP地址',
  `F_Ccu_Ip_Port` decimal(8,0) DEFAULT NULL COMMENT 'CCU通讯服务IP端口',
  `F_Seq` decimal(8,0) DEFAULT NULL COMMENT '次序',
  `F_Remark` varchar(254) DEFAULT NULL COMMENT '备注',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='控制中心';

-- ----------------------------
-- Table structure for t_utc_control_center_user
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_control_center_user`;
CREATE TABLE `t_utc_control_center_user` (
  `F_ID` varchar(32) NOT NULL DEFAULT '' COMMENT 'ID号',
  `F_Control_ID` varchar(32) DEFAULT NULL COMMENT '控制中心ID号',
  `F_Control_Code` varchar(16) DEFAULT NULL COMMENT '控制中心编码',
  `F_User_ID` varchar(32) DEFAULT NULL COMMENT '用户ID号',
  `F_User_Code` varchar(32) DEFAULT NULL COMMENT '用户编码',
  `F_User_Name` varchar(128) DEFAULT NULL COMMENT '用户名称',
  `F_Remark` varchar(254) DEFAULT NULL COMMENT '备注',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='控制中心的用户';

-- ----------------------------
-- Table structure for t_utc_day_formal
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_day_formal`;
CREATE TABLE `t_utc_day_formal` (
  `F_ID` varchar(32) NOT NULL COMMENT '时间表方案ID号',
  `F_Code` varchar(16) DEFAULT NULL COMMENT '时间表方案编码',
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Device_Code` varchar(16) DEFAULT NULL COMMENT '设备编码',
  `F_Road_Name` varchar(128) DEFAULT NULL COMMENT '路口名称',
  `F_Day_Type` varchar(1) DEFAULT NULL COMMENT '时间表方案类型',
  `F_Day_Start_Time` varchar(8) DEFAULT NULL COMMENT '开始时间',
  `F_Program_Code` varchar(16) DEFAULT NULL COMMENT '配时方案编码',
  `F_Induce_Code` varchar(16) DEFAULT NULL COMMENT '感应方案编码',
  `F_Pedestrian_Code` varchar(16) DEFAULT NULL COMMENT '行人感应方案编码',
  `F_Offsetval` decimal(8,0) DEFAULT NULL COMMENT '相位差',
  `F_Cycle` decimal(8,0) DEFAULT NULL COMMENT '周期时间',
  `F_Remark` varchar(254) DEFAULT NULL COMMENT '备注',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='时间表方案';

-- ----------------------------
-- Table structure for t_utc_device
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_device`;
CREATE TABLE `t_utc_device` (
  `F_ID` varchar(32) NOT NULL DEFAULT '' COMMENT '设备ID号',
  `F_Code` varchar(16) DEFAULT NULL COMMENT '设备编码',
  `F_Road_ID` varchar(32) DEFAULT NULL COMMENT '路口ID号',
  `F_Road_Name` varchar(128) DEFAULT NULL COMMENT '路口名称',
  `F_Device_Type` varchar(64) DEFAULT NULL COMMENT '设备类型或设备厂家',
  `F_Device_Dll` varchar(64) DEFAULT NULL,
  `F_Road_Type` varchar(2) DEFAULT NULL COMMENT '路口类型',
  `F_Device_Ip` varchar(32) DEFAULT NULL COMMENT '设备IP地址',
  `F_Device_Port` decimal(8,0) DEFAULT NULL COMMENT '设备IP端口',
  `F_Device_State` varchar(1) DEFAULT NULL COMMENT '设备状态',
  `F_Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `F_Seq` decimal(8,0) DEFAULT NULL COMMENT '序号',
  `F_Remark` varchar(254) DEFAULT NULL COMMENT '备注',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配时方案';

-- ----------------------------
-- Table structure for t_utc_device_lg
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_device_lg`;
CREATE TABLE `t_utc_device_lg` (
  `F_ID` varchar(32) NOT NULL DEFAULT '' COMMENT '信号机灯组ID号',
  `F_Device_ID` varchar(32) DEFAULT NULL COMMENT '设备ID号',
  `F_Device_Code` varchar(16) DEFAULT NULL COMMENT '设备编码',
  `F_Road_Name` varchar(128) DEFAULT NULL COMMENT '路口名称',
  `F_Lg_Dir` varchar(1) DEFAULT NULL COMMENT '灯组方向',
  `F_Nesw_Left_x` decimal(8,0) DEFAULT NULL COMMENT '左转X坐标',
  `F_Nesw_Left_y` decimal(8,0) DEFAULT NULL COMMENT '左转Y坐标',
  `F_Nesw_Straight_x` decimal(8,0) DEFAULT NULL COMMENT '直行X坐标',
  `F_Nesw_Straight_y` decimal(8,0) DEFAULT NULL COMMENT '直行Y坐标',
  `F_Nesw_Right_x` decimal(8,0) DEFAULT NULL COMMENT '右转X坐标',
  `F_Nesw_Right_y` decimal(8,0) DEFAULT NULL COMMENT '右转Y坐标',
  `F_Nesw_Return_x` decimal(8,0) DEFAULT NULL COMMENT '调头X坐标',
  `F_Nesw_Return_y` decimal(8,0) DEFAULT NULL COMMENT '调头Y坐标',
  `F_Nesw_Ped_x` decimal(8,0) DEFAULT NULL COMMENT '行人X坐标',
  `F_Nesw_Ped_y` decimal(8,0) DEFAULT NULL COMMENT '行人Y坐标',
  `F_Nesw_Ped2_x` decimal(8,0) DEFAULT NULL COMMENT '二次行人X坐标',
  `F_Nesw_Ped2_y` decimal(8,0) DEFAULT NULL COMMENT '二次行人Y坐标',
  `F_Remark` varchar(254) DEFAULT NULL COMMENT '备注',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信号机灯组';

-- ----------------------------
-- Table structure for t_utc_device_lg_plate
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_device_lg_plate`;
CREATE TABLE `t_utc_device_lg_plate` (
  `F_ID` varchar(32) NOT NULL DEFAULT '' COMMENT '信号灯组模板ID号',
  `F_Code` varchar(16) DEFAULT NULL COMMENT '信号灯组模板编码',
  `F_Name` varchar(128) DEFAULT NULL COMMENT '信号灯组模板名称',
  `F_Plate_Type` varchar(1) DEFAULT NULL COMMENT '信号灯组模板类型',
  `F_Seq` decimal(8,0) DEFAULT NULL COMMENT '序号',
  `F_Remark` varchar(254) DEFAULT NULL COMMENT '备注',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信号机灯组模板';

-- ----------------------------
-- Table structure for t_utc_device_lg_plate_dl
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_device_lg_plate_dl`;
CREATE TABLE `t_utc_device_lg_plate_dl` (
  `F_ID` varchar(32) NOT NULL COMMENT '信号灯组模板明细ID号',
  `F_Plate_ID` varchar(32) DEFAULT NULL COMMENT '信号灯组模板ID号',
  `F_Plate_Code` varchar(16) DEFAULT NULL COMMENT '信号灯组模板编码',
  `F_Plate_Name` varchar(128) DEFAULT NULL COMMENT '信号灯组模板名称',
  `F_Lg_Dir` varchar(1) DEFAULT NULL COMMENT '灯组方向',
  `F_Nesw_Left_x` decimal(8,0) DEFAULT NULL COMMENT '左转X坐标',
  `F_Nesw_Left_y` decimal(8,0) DEFAULT NULL COMMENT '左转Y坐',
  `F_Nesw_Straight_x` decimal(8,0) DEFAULT NULL COMMENT '直行X坐标',
  `F_Nesw_Straight_y` decimal(8,0) DEFAULT NULL COMMENT '直行Y坐标',
  `F_Nesw_Right_x` decimal(8,0) DEFAULT NULL COMMENT '右转X坐标',
  `F_Nesw_Right_y` decimal(8,0) DEFAULT NULL COMMENT '右转Y坐标',
  `F_Nesw_Return_x` decimal(8,0) DEFAULT NULL COMMENT '调头X坐标',
  `F_Nesw_Return_y` decimal(8,0) DEFAULT NULL COMMENT '调头Y坐标',
  `F_Nesw_Ped_x` decimal(8,0) DEFAULT NULL COMMENT '行人X坐标',
  `F_Nesw_Ped_y` decimal(8,0) DEFAULT NULL COMMENT '行人Y坐标',
  `F_Nesw_Ped2_x` decimal(8,0) DEFAULT NULL COMMENT '二次行人X坐标',
  `F_Nesw_Ped2_y` decimal(8,0) DEFAULT NULL COMMENT '二次行人Y坐标',
  `F_Remark` varchar(254) DEFAULT NULL COMMENT '备注',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信号灯组模板明细';

-- ----------------------------
-- Table structure for t_utc_fault_log
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_fault_log`;
CREATE TABLE `t_utc_fault_log` (
  `F_ID` varchar(32) NOT NULL COMMENT '故障日志ID号',
  `F_Fault_Type` varchar(1) DEFAULT NULL COMMENT '故障类型',
  `F_Fault_Txt` varchar(512) DEFAULT NULL COMMENT '故障内容',
  `F_Fault_Time` datetime DEFAULT NULL COMMENT '故障时间',
  `F_Fault_State` varchar(1) DEFAULT NULL COMMENT '故障状态',
  `F_Fault_Reason` varchar(512) DEFAULT NULL COMMENT '处理故障理由',
  `F_Fault_Handle` varchar(32) DEFAULT NULL COMMENT '处理人',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='故障日志';

-- ----------------------------
-- Table structure for t_utc_five_min_flow
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_five_min_flow`;
CREATE TABLE `t_utc_five_min_flow` (
  `F_ID` varchar(32) NOT NULL COMMENT '5分钟流量ID号',
  `F_Road_ID` varchar(32) DEFAULT NULL COMMENT '路口ID号',
  `F_Road_Code` varchar(16) DEFAULT NULL COMMENT '路口编码',
  `F_Road_Name` varchar(128) DEFAULT NULL COMMENT '路口名称',
  `F_Flow_Time` datetime DEFAULT NULL COMMENT '采集流量时间',
  `F_Lan_No` decimal(8,0) DEFAULT NULL COMMENT '车道号',
  `F_Lan_Type` varchar(1) DEFAULT NULL COMMENT '车道类型',
  `F_Lan_Dir` varchar(1) DEFAULT NULL COMMENT '车道方向',
  `F_Lan_Flow` decimal(16,0) DEFAULT NULL COMMENT '车道流量',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='5分钟流量';

-- ----------------------------
-- Table structure for t_utc_holiday_formal
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_holiday_formal`;
CREATE TABLE `t_utc_holiday_formal` (
  `F_ID` varchar(32) NOT NULL COMMENT '假日方案ID号',
  `F_Code` varchar(16) DEFAULT NULL COMMENT '假日方案编码',
  `F_Name` varchar(64) DEFAULT NULL COMMENT '假日方案名称',
  `F_Device_ID` varchar(32) DEFAULT NULL COMMENT '设备ID号',
  `F_Device_Code` varchar(16) DEFAULT NULL COMMENT '设备编码',
  `F_Road_Name` varchar(128) DEFAULT NULL COMMENT '路口名称',
  `F_Start_Date` varchar(10) DEFAULT NULL COMMENT '开始日期',
  `F_End_Date` varchar(10) DEFAULT NULL COMMENT '结束日期',
  `F_Day_Code` varchar(16) DEFAULT NULL COMMENT '时间表方案编码',
  `F_Remark` varchar(254) DEFAULT NULL COMMENT '备注',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='假日方案';

-- ----------------------------
-- Table structure for t_utc_lan
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_lan`;
CREATE TABLE `t_utc_lan` (
  `F_ID` varchar(32) NOT NULL DEFAULT '' COMMENT '车道ID号',
  `F_Code` varchar(16) DEFAULT NULL COMMENT '车道号',
  `F_Name` varchar(128) DEFAULT NULL COMMENT '车道名称',
  `F_Road_ID` varchar(32) DEFAULT NULL COMMENT '路口ID号',
  `F_Road_Code` varchar(16) DEFAULT NULL COMMENT '路口编码',
  `F_Road_Name` varchar(128) DEFAULT NULL COMMENT '路口名称',
  `F_Road_Type` varchar(1) DEFAULT NULL COMMENT '路口类型',
  `F_Lan_Type` varchar(1) DEFAULT NULL COMMENT '车道类型',
  `F_Lan_Dir` varchar(1) DEFAULT NULL COMMENT '车道方向',
  `F_Lan_Pic` blob COMMENT '车道底图',
  `F_Seq` decimal(8,0) DEFAULT NULL COMMENT '序号',
  `F_Remark` varchar(254) DEFAULT NULL COMMENT '备注',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车道信息';

-- ----------------------------
-- Table structure for t_utc_message_log
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_message_log`;
CREATE TABLE `t_utc_message_log` (
  `F_ID` varchar(32) NOT NULL COMMENT '通讯日志ID号',
  `F_Modute_Code` varchar(32) DEFAULT NULL COMMENT '功能模块编码',
  `F_Function_Code` varchar(32) DEFAULT NULL COMMENT '子功能模板编码',
  `F_User_ID` varchar(32) DEFAULT NULL COMMENT '用户ID号',
  `F_User_Code` varchar(32) DEFAULT NULL COMMENT '用户编码',
  `F_User_Name` varchar(128) DEFAULT NULL COMMENT '用户名称',
  `F_Message_Class` varchar(2) DEFAULT NULL COMMENT '通讯日志类别',
  `F_Message_Type` varchar(1) DEFAULT NULL COMMENT '通讯日志类型',
  `F_Message_Txt` varchar(512) DEFAULT NULL COMMENT '通讯日志内容',
  `F_Message_Time` datetime DEFAULT NULL COMMENT '通讯日志时间',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通讯日志';

-- ----------------------------
-- Table structure for t_utc_one_hour_flow
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_one_hour_flow`;
CREATE TABLE `t_utc_one_hour_flow` (
  `F_ID` varchar(32) NOT NULL COMMENT '1小时流量ID号',
  `F_Road_ID` varchar(32) DEFAULT NULL COMMENT '路口ID号',
  `F_Road_Code` varchar(16) DEFAULT NULL COMMENT '路口编码',
  `F_Road_Name` varchar(128) DEFAULT NULL COMMENT '路口名称',
  `F_Flow_Time` datetime DEFAULT NULL COMMENT '采集流量时间',
  `F_Lan_No` decimal(8,0) DEFAULT NULL,
  `F_Lan_Type` varchar(1) DEFAULT NULL COMMENT '车道类型',
  `F_Lan_Dir` varchar(1) DEFAULT NULL COMMENT '车道方向',
  `F_Lan_Flow` decimal(16,0) DEFAULT NULL COMMENT '车道流量',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1小时流量';

-- ----------------------------
-- Table structure for t_utc_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_operate_log`;
CREATE TABLE `t_utc_operate_log` (
  `F_ID` varchar(32) NOT NULL COMMENT '操作ID号',
  `F_Modute_Code` varchar(32) DEFAULT NULL COMMENT '功能模板编码',
  `F_Function_Code` varchar(32) DEFAULT NULL COMMENT '子功能模板编码',
  `F_User_ID` varchar(32) DEFAULT NULL COMMENT '用户ID号',
  `F_User_Code` varchar(32) DEFAULT NULL COMMENT '用户编码',
  `F_User_Name` varchar(128) DEFAULT NULL COMMENT '用户名称',
  `F_Operate_Type` varchar(1) DEFAULT NULL COMMENT '操作类型',
  `F_Operate_Txt` varchar(512) DEFAULT NULL COMMENT '操作日志内容',
  `F_Operate_Time` datetime DEFAULT NULL COMMENT '操作日志时间',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Table structure for t_utc_opt_param
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_param`;
CREATE TABLE `t_utc_opt_param` (
  `F_ID` varchar(32) NOT NULL COMMENT '区域协调优化参数ID号',
  `F_Opt_Times` decimal(8,0) DEFAULT NULL COMMENT '协调优化次数',
  `F_Change_Time` decimal(8,0) DEFAULT NULL COMMENT '微调周期限值',
  `F_Area_And_Value` decimal(8,0) DEFAULT NULL COMMENT '控制子区合并阀值',
  `F_Car_Occupy_Green` decimal(8,2) DEFAULT NULL COMMENT '相位每辆车实际占用绿灯时间',
  `F_Green_Space_Time` decimal(8,2) DEFAULT NULL COMMENT '相位正常间隔时间(绿灯间隔时间),则：平均车头时距',
  `F_Start_Loss_Time` decimal(8,2) DEFAULT NULL COMMENT '相位车辆起步损失时间',
  `F_Saturation_Rate` decimal(8,2) DEFAULT NULL COMMENT '相位直行道饱和流率',
  `F_Equivalent_Coefficient` decimal(8,2) DEFAULT NULL COMMENT '直行当量系数',
  `F_Service_Level_A` decimal(8,2) DEFAULT NULL COMMENT '服务水平A级',
  `F_Service_Level_B` decimal(8,2) DEFAULT NULL COMMENT '服务水平B级',
  `F_Service_Level_C` decimal(8,2) DEFAULT NULL COMMENT '服务水平C级',
  `F_Service_Level_D` decimal(8,2) DEFAULT NULL COMMENT '服务水平D级',
  `F_Service_Level_E` decimal(8,2) DEFAULT NULL COMMENT '服务水平E级',
  `F_Service_Level_F` decimal(8,2) DEFAULT NULL COMMENT '服务水平F级',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域协调优化参数';

-- ----------------------------
-- Table structure for t_utc_opt_preference_cycle
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_preference_cycle`;
CREATE TABLE `t_utc_opt_preference_cycle` (
  `F_ID` varchar(32) NOT NULL COMMENT '协调优化控制子区的优先周期方案ID号',
  `F_Control_Area_ID` varchar(32) DEFAULT NULL COMMENT '控制子区ID',
  `F_Control_Area_Code` varchar(16) DEFAULT NULL COMMENT '控制子区编码',
  `F_Control_Area_Name` varchar(128) DEFAULT NULL COMMENT '控制子区名称',
  `F_Min_Cycle` decimal(8,0) DEFAULT NULL COMMENT '最小周期',
  `F_Middle_Cycle` decimal(8,0) DEFAULT NULL COMMENT '中间周期',
  `F_Middle2_Cycle` decimal(8,0) DEFAULT NULL COMMENT '中间2周期',
  `F_Max_Cycle` decimal(8,0) DEFAULT NULL COMMENT '最大周期',
  `F_Cur_Min_Cycle_Times` decimal(8,0) DEFAULT NULL COMMENT '当前最小周期投票次数',
  `F_Cur_Middle_Cycle_Times` decimal(8,0) DEFAULT NULL COMMENT '当前中间周期投票次数',
  `F_Cur_Middle2_Cycle_Times` decimal(8,0) DEFAULT NULL COMMENT '当前中间2周期投票次数',
  `F_Cur_Max_Cycle_Times` decimal(8,0) DEFAULT NULL COMMENT '当前最大周期投票次数',
  `F_Newly_Vote_Time` datetime DEFAULT NULL COMMENT '最近投票时间',
  `F_Up_Times_Cycle` decimal(8,0) DEFAULT NULL COMMENT '上次协调优化的周期',
  `F_Remark` varchar(254) DEFAULT NULL COMMENT '备注',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='协调优化控制子区的优先周期方案';

-- ----------------------------
-- Table structure for t_utc_opt_preference_gn_bi
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_preference_gn_bi`;
CREATE TABLE `t_utc_opt_preference_gn_bi` (
  `F_ID` varchar(32) NOT NULL,
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Device_Code` varchar(16) DEFAULT NULL,
  `F_Road_Name` varchar(128) DEFAULT NULL,
  `F_Phase_ID` varchar(32) DEFAULT NULL,
  `F_Phase_Code` varchar(16) DEFAULT NULL,
  `F_Phase_Count` decimal(8,0) DEFAULT NULL,
  `F_Elastic_Phase_No` decimal(8,0) DEFAULT NULL,
  `F_Greent_Bi_Type` bigint(1) DEFAULT NULL,
  `F_Cur_Vote_Times` decimal(8,0) DEFAULT NULL,
  `F_Cur_Vote_Times1` decimal(8,0) DEFAULT NULL,
  `F_Cur_Vote_Times2` decimal(8,0) DEFAULT NULL,
  `F_Cur_Vote_Times3` decimal(8,0) DEFAULT NULL,
  `F_Newly_Vote_Time` datetime DEFAULT NULL,
  `F_Up_Times_Green_Bi` decimal(8,0) DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_opt_preference_gn_bi_dl
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_preference_gn_bi_dl`;
CREATE TABLE `t_utc_opt_preference_gn_bi_dl` (
  `F_ID` varchar(32) NOT NULL,
  `F_Preference_Gn_Bi_ID` varchar(32) DEFAULT NULL,
  `F_Phase_01` decimal(8,0) DEFAULT NULL,
  `F_Phase_02` decimal(8,0) DEFAULT NULL,
  `F_Phase_03` decimal(8,0) DEFAULT NULL,
  `F_Phase_04` decimal(8,0) DEFAULT NULL,
  `F_Phase_05` decimal(8,0) DEFAULT NULL,
  `F_Phase_06` decimal(8,0) DEFAULT NULL,
  `F_Phase_07` decimal(8,0) DEFAULT NULL,
  `F_Phase_08` decimal(8,0) DEFAULT NULL,
  `F_Phase_09` decimal(8,0) DEFAULT NULL,
  `F_Phase_10` decimal(8,0) DEFAULT NULL,
  `F_Phase_11` decimal(8,0) DEFAULT NULL,
  `F_Phase_12` decimal(8,0) DEFAULT NULL,
  `F_Phase_13` decimal(8,0) DEFAULT NULL,
  `F_Phase_14` decimal(8,0) DEFAULT NULL,
  `F_Phase_15` decimal(8,0) DEFAULT NULL,
  `F_Phase_16` decimal(8,0) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_opt_preference_offset
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_preference_offset`;
CREATE TABLE `t_utc_opt_preference_offset` (
  `F_ID` varchar(32) NOT NULL,
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Device_Code` varchar(16) DEFAULT NULL,
  `F_Road_Name` varchar(128) DEFAULT NULL,
  `F_Offsetval_Type` varchar(1) DEFAULT NULL,
  `F_Cur_Min_Cycle_Times` decimal(8,0) DEFAULT NULL,
  `F_Cur_Middle_Cycle_Times` decimal(8,0) DEFAULT NULL,
  `F_Cur_Middle2_Cycle_Times` decimal(8,0) DEFAULT NULL,
  `F_Cur_Max_Cycle_Times` decimal(8,0) DEFAULT NULL,
  `F_Newly_Vote_Time` datetime DEFAULT NULL,
  `F_Up_Times_Cycle` decimal(8,0) DEFAULT NULL,
  `F_Up_Time_Offsetval` decimal(8,0) DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_opt_preference_offset_dl
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_preference_offset_dl`;
CREATE TABLE `t_utc_opt_preference_offset_dl` (
  `F_ID` varchar(32) NOT NULL,
  `F_Preference_Offset_ID` varchar(32) DEFAULT NULL,
  `F_Offset_value` decimal(8,0) DEFAULT NULL,
  `F_Re_Offset_value` decimal(8,0) DEFAULT NULL,
  `F_Is_Comute` varchar(1) DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_opt_program_formal
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_program_formal`;
CREATE TABLE `t_utc_opt_program_formal` (
  `F_ID` varchar(32) NOT NULL,
  `F_Code` varchar(16) DEFAULT NULL,
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Device_Code` varchar(16) DEFAULT NULL,
  `F_Road_Name` varchar(128) DEFAULT NULL,
  `F_Phase_Code` varchar(16) DEFAULT NULL,
  `F_Phs_Count` decimal(8,0) DEFAULT NULL,
  `F_Concert_Phs` decimal(8,0) DEFAULT NULL,
  `F_Offsetval` decimal(8,0) DEFAULT NULL,
  `F_Cycle` decimal(8,0) DEFAULT NULL,
  `F_Base_Dir` varchar(1) DEFAULT NULL,
  `F_Dis_Offsetval` decimal(8,0) DEFAULT NULL,
  `F_Create_Time` datetime DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_opt_program_formal_dl
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_program_formal_dl`;
CREATE TABLE `t_utc_opt_program_formal_dl` (
  `F_ID` varchar(32) NOT NULL,
  `F_Program_ID` varchar(32) DEFAULT NULL,
  `F_Program_Code` varchar(16) DEFAULT NULL,
  `F_Min_Values` decimal(8,0) DEFAULT NULL,
  `F_Min_Gtime` decimal(8,0) DEFAULT NULL,
  `F_Max_Gtime` decimal(8,0) DEFAULT NULL,
  `F_G_Time` decimal(8,0) DEFAULT NULL,
  `F_G_F_Time` decimal(8,0) DEFAULT NULL,
  `F_Y_Time` decimal(8,0) DEFAULT NULL,
  `F_R_Time` decimal(8,0) DEFAULT NULL,
  `F_P_G_F_Time` decimal(8,0) DEFAULT NULL,
  `F_P_R_Time` decimal(8,0) DEFAULT NULL,
  `F_P_G_Time` decimal(8,0) DEFAULT NULL,
  `F_Phs_No` decimal(8,0) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_opt_service_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_service_evaluate`;
CREATE TABLE `t_utc_opt_service_evaluate` (
  `F_ID` varchar(32) NOT NULL,
  `F_Control_Area_ID` varchar(32) DEFAULT NULL,
  `F_Control_Area_Code` varchar(16) DEFAULT NULL,
  `F_Control_Area_Name` varchar(128) DEFAULT NULL,
  `F_Create_Time` datetime DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_opt_service_level
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_service_level`;
CREATE TABLE `t_utc_opt_service_level` (
  `F_ID` varchar(32) NOT NULL,
  `F_Service_Evaluate_ID` varchar(32) DEFAULT NULL,
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Device_Code` varchar(16) DEFAULT NULL,
  `F_Road_Name` varchar(128) DEFAULT NULL,
  `F_Saturation` decimal(8,2) DEFAULT NULL,
  `F_Service_Level` varchar(1) DEFAULT NULL,
  `F_Up_Service_Level` varchar(1) DEFAULT NULL,
  `F_Up_Saturation` decimal(8,2) DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_opt_standard_cycle
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_standard_cycle`;
CREATE TABLE `t_utc_opt_standard_cycle` (
  `F_ID` varchar(32) NOT NULL,
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Device_Code` varchar(32) DEFAULT NULL,
  `F_Device_Name` varchar(128) DEFAULT NULL,
  `F_Phase_Key_Sum_Y` decimal(8,2) DEFAULT NULL,
  `F_Yellow_Time` decimal(8,0) DEFAULT NULL,
  `F_All_Red_Time` decimal(8,0) DEFAULT NULL,
  `F_Green_Time` decimal(8,0) DEFAULT NULL,
  `F_Start_Loss_Time` decimal(8,0) DEFAULT NULL,
  `F_Sum_Loss_Time` decimal(8,0) DEFAULT NULL,
  `F_Cycle` decimal(8,0) DEFAULT NULL,
  `F_Autal_Cycle` decimal(8,0) DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_opt_total_delay_dl
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_total_delay_dl`;
CREATE TABLE `t_utc_opt_total_delay_dl` (
  `F_ID` varchar(32) NOT NULL,
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Device_Code` varchar(16) DEFAULT NULL,
  `F_Road_Name` varchar(128) DEFAULT NULL,
  `F_Total_Delay_Type` varchar(1) DEFAULT NULL,
  `F_Total_Delay_Time` decimal(8,0) DEFAULT NULL,
  `F_Running_Speed` decimal(8,2) DEFAULT NULL,
  `F_Overall_Speed` decimal(8,2) DEFAULT NULL,
  `F_Up_Total_Delay_Time` decimal(8,0) DEFAULT NULL,
  `F_Up_Runing_Speed` decimal(8,2) DEFAULT NULL,
  `F_Up_Overall_Speed` decimal(8,2) DEFAULT NULL,
  `F_Delay_Rate` decimal(8,2) DEFAULT NULL,
  `F_Running_Rise_Rate` decimal(8,2) DEFAULT NULL,
  `F_Overall_Rise_Rate` decimal(8,2) DEFAULT NULL,
  `F_Create_Time` datetime DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_opt_travel_time_dl
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_opt_travel_time_dl`;
CREATE TABLE `t_utc_opt_travel_time_dl` (
  `F_ID` varchar(32) NOT NULL,
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Device_Code` varchar(16) DEFAULT NULL,
  `F_Road_Name` varchar(128) DEFAULT NULL,
  `F_Travel_Type` varchar(1) DEFAULT NULL,
  `F_Travel_Time` decimal(8,2) DEFAULT NULL,
  `F_Up_Travel_Time` decimal(8,0) DEFAULT NULL,
  `F_Create_Time` datetime DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_phase_formal
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_phase_formal`;
CREATE TABLE `t_utc_phase_formal` (
  `F_ID` varchar(32) NOT NULL,
  `F_Code` varchar(16) DEFAULT NULL,
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Device_Code` varchar(16) DEFAULT NULL,
  `F_Road_Name` varchar(128) DEFAULT NULL,
  `F_Phs_Count` decimal(8,0) DEFAULT NULL,
  `F_Phs_Type` varchar(1) DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_phase_formal_dl
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_phase_formal_dl`;
CREATE TABLE `t_utc_phase_formal_dl` (
  `F_ID` varchar(32) NOT NULL,
  `F_Phase_ID` varchar(32) DEFAULT NULL,
  `F_Phase_No` decimal(8,0) DEFAULT NULL,
  `F_Lg_Dir` varchar(1) DEFAULT NULL,
  `F_Nesw_Left_x` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Left_y` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Straight_x` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Straight_y` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Right_x` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Right_y` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Return_x` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Return_y` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Ped_x` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Ped_y` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Ped2_x` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Ped2_y` decimal(8,0) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_phase_formal_plate
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_phase_formal_plate`;
CREATE TABLE `t_utc_phase_formal_plate` (
  `F_ID` varchar(32) NOT NULL,
  `F_Code` varchar(16) DEFAULT NULL,
  `F_Name` varchar(128) DEFAULT NULL,
  `F_Plate_Type` varchar(1) DEFAULT NULL,
  `F_Phs_Count` decimal(8,0) DEFAULT NULL,
  `F_Seq` decimal(8,0) DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_phase_formal_plate_dl
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_phase_formal_plate_dl`;
CREATE TABLE `t_utc_phase_formal_plate_dl` (
  `F_ID` varchar(32) NOT NULL,
  `F_Plate_ID` varchar(32) DEFAULT NULL,
  `F_Plate_Code` varchar(16) DEFAULT NULL,
  `F_Plate_Name` varchar(128) DEFAULT NULL,
  `F_Phase_No` decimal(8,0) DEFAULT NULL,
  `F_Lg_Dir` varchar(1) DEFAULT NULL,
  `F_Nesw_Left_x` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Left_y` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Straight_x` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Straight_y` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Right_x` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Right_y` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Return_x` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Return_y` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Ped_x` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Ped_y` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Ped2_x` decimal(8,0) DEFAULT NULL,
  `F_Nesw_Ped2_y` decimal(8,0) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_program_formal
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_program_formal`;
CREATE TABLE `t_utc_program_formal` (
  `F_ID` varchar(32) NOT NULL,
  `F_Code` varchar(16) DEFAULT NULL,
  `F_Program_Type` varchar(1) DEFAULT NULL,
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Device_Code` varchar(32) DEFAULT NULL,
  `F_Road_Name` varchar(128) DEFAULT NULL,
  `F_Phase_Code` varchar(16) DEFAULT NULL,
  `F_Phs_Count` decimal(8,0) DEFAULT NULL,
  `F_Concert_Phs` decimal(8,0) DEFAULT NULL,
  `F_Offsetval` decimal(8,0) DEFAULT NULL,
  `F_Cycle` decimal(8,0) DEFAULT NULL,
  `F_Base_Dir` decimal(8,0) DEFAULT NULL,
  `F_Dis_Offsetval` decimal(8,0) DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_program_formal_dl
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_program_formal_dl`;
CREATE TABLE `t_utc_program_formal_dl` (
  `F_ID` varchar(32) NOT NULL,
  `F_Program_ID` varchar(32) DEFAULT NULL,
  `F_Program_Code` varchar(16) DEFAULT NULL,
  `F_Min_Values` decimal(8,0) DEFAULT NULL,
  `F_Min_Gtime` decimal(8,0) DEFAULT NULL,
  `F_Max_Gtime` decimal(8,0) DEFAULT NULL,
  `F_G_Time` decimal(8,0) DEFAULT NULL,
  `F_G_F_Time` decimal(8,0) DEFAULT NULL,
  `F_Y_Time` decimal(8,0) DEFAULT NULL,
  `F_R_Time` decimal(8,0) DEFAULT NULL,
  `F_P_G_F_Time` decimal(8,0) DEFAULT NULL,
  `F_P_R_Time` decimal(8,0) DEFAULT NULL,
  `F_P_G_Time` decimal(8,0) DEFAULT NULL,
  `F_Phs_No` decimal(8,0) DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_road
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_road`;
CREATE TABLE `t_utc_road` (
  `F_ID` varchar(32) NOT NULL DEFAULT '',
  `F_Code` varchar(16) DEFAULT NULL,
  `F_Name` varchar(128) DEFAULT NULL,
  `F_Area_ID` varchar(32) DEFAULT NULL,
  `F_Area_Code` varchar(16) DEFAULT NULL,
  `F_Area_Name` varchar(128) DEFAULT NULL,
  `F_Road_Type` varchar(1) DEFAULT NULL,
  `F_Gis_X` double(32,12) DEFAULT NULL,
  `F_Gis_Y` double(32,12) DEFAULT NULL,
  `F_Road_Pic` blob,
  `F_East_Road_ID` varchar(32) DEFAULT NULL,
  `F_East_Road_Dis` decimal(8,2) DEFAULT NULL,
  `F_West_Road_ID` varchar(32) DEFAULT NULL,
  `F_West_Road_Dis` decimal(8,2) DEFAULT NULL,
  `F_South_Road_ID` varchar(32) DEFAULT NULL,
  `F_South_Road_Dis` decimal(8,2) DEFAULT NULL,
  `F_North_Road_ID` varchar(32) DEFAULT NULL,
  `F_North_Road_Dis` decimal(8,2) DEFAULT NULL,
  `F_Seq` decimal(8,0) DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_special
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_special`;
CREATE TABLE `t_utc_special` (
  `F_ID` varchar(32) NOT NULL,
  `F_Code` varchar(16) DEFAULT NULL,
  `F_Name` varchar(128) DEFAULT NULL,
  `F_Speed` decimal(8,4) DEFAULT NULL,
  `F_Remark` varchar(254) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_special_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_special_detail`;
CREATE TABLE `t_utc_special_detail` (
  `F_ID` varchar(32) NOT NULL,
  `F_Special_ID` varchar(32) DEFAULT NULL,
  `F_Special_Code` varchar(16) DEFAULT NULL,
  `F_Special_Name` varchar(128) DEFAULT NULL,
  `F_In_Direct` varchar(1) DEFAULT NULL,
  `F_Out_Direct` varchar(1) DEFAULT NULL,
  `F_Start_Hour` varchar(2) DEFAULT NULL,
  `F_Start_Minute` varchar(2) DEFAULT NULL,
  `F_Start_Second` varchar(2) DEFAULT NULL,
  `F_End_Hour` varchar(2) DEFAULT NULL,
  `F_End_Minute` varchar(2) DEFAULT NULL,
  `F_End_Second` varchar(2) DEFAULT NULL,
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Device_Code` varchar(16) DEFAULT NULL,
  `F_Road_Name` varchar(128) DEFAULT NULL,
  `F_Execute_Type` varchar(1) DEFAULT NULL,
  `F_Distance` decimal(8,4) DEFAULT NULL,
  `F_Speed` decimal(8,4) DEFAULT NULL,
  `F_Seq` decimal(8,0) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_utc_week_formal
-- ----------------------------
DROP TABLE IF EXISTS `t_utc_week_formal`;
CREATE TABLE `t_utc_week_formal` (
  `F_ID` varchar(32) NOT NULL,
  `F_Device_ID` varchar(32) DEFAULT NULL,
  `F_Device_Code` varchar(16) DEFAULT NULL,
  `F_Road_Name` varchar(128) DEFAULT NULL,
  `F_Week_Type` varchar(1) DEFAULT NULL,
  `F_Day_Code` varchar(16) DEFAULT NULL,
  `F_Ext` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `t_vehicle`;
CREATE TABLE `t_vehicle` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Code` varchar(32) DEFAULT NULL COMMENT '编码',
  `F_Name` varchar(32) DEFAULT NULL COMMENT '名称',
  `F_Plate_Number` varchar(32) DEFAULT NULL COMMENT '车牌号码',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_Description` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Point_Current_Time` varchar(0) DEFAULT NULL COMMENT '点当前时间',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆表';

-- ----------------------------
-- Table structure for t_vehicle_official
-- ----------------------------
DROP TABLE IF EXISTS `t_vehicle_official`;
CREATE TABLE `t_vehicle_official` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Hphm` varchar(16) DEFAULT NULL COMMENT '号牌号码',
  `F_Hpzl` varchar(2) DEFAULT NULL COMMENT '号牌种类',
  `F_Clpp1` varchar(32) DEFAULT NULL COMMENT '中文品牌',
  `F_Clxh` varchar(32) DEFAULT NULL COMMENT '车辆型号',
  `F_Clpp2` varchar(32) DEFAULT NULL COMMENT '英文品牌',
  `F_Gcjk` varchar(1) DEFAULT NULL COMMENT '国产/进口',
  `F_Zzg` varchar(4) DEFAULT NULL COMMENT '制造国',
  `F_Clsbdh` varchar(32) DEFAULT NULL COMMENT '车辆识别代号',
  `F_Fdjh` varchar(32) DEFAULT NULL COMMENT '发动机号',
  `F_Cllx` varchar(4) DEFAULT NULL COMMENT '车辆类型',
  `F_Csys` varchar(8) DEFAULT NULL COMMENT '车身颜色',
  `F_Syxz` varchar(1) DEFAULT NULL COMMENT '使用性质',
  `F_Ccdjrq` datetime DEFAULT NULL COMMENT '初次登记日期',
  `F_Djrq` datetime DEFAULT NULL COMMENT '最近定检日期',
  `F_Yxqz` datetime DEFAULT NULL COMMENT '检验有效期止',
  `F_Qzbfqz` datetime DEFAULT NULL COMMENT '强制报废期止',
  `F_Fzjg` varchar(16) DEFAULT NULL COMMENT '发证机关',
  `F_Glbm` varchar(16) DEFAULT NULL COMMENT '管理部门',
  `F_Fprq` datetime DEFAULT NULL COMMENT '发牌日期',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆表(来源六合一系统)';

-- ----------------------------
-- Table structure for t_vehicle_person
-- ----------------------------
DROP TABLE IF EXISTS `t_vehicle_person`;
CREATE TABLE `t_vehicle_person` (
  `F_ID` varchar(32) NOT NULL COMMENT '编号',
  `F_Hphm` varchar(16) DEFAULT NULL COMMENT '号牌号码',
  `F_Hpzl` varchar(2) DEFAULT NULL COMMENT '号牌种类',
  `F_Sfzhm` varchar(32) DEFAULT NULL COMMENT '身份证号码',
  `F_Syr` varchar(16) DEFAULT NULL COMMENT '机动车所有人',
  `F_Lxdh` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `F_Sjhm` varchar(16) DEFAULT NULL COMMENT '手机号码',
  `F_Xszbh` varchar(32) DEFAULT NULL COMMENT '行驶证编号',
  `F_Zsxxdz` varchar(128) DEFAULT NULL COMMENT '住所详细地址',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆所有人信息表(六合一)';

-- ----------------------------
-- Table structure for t_vio_code
-- ----------------------------
DROP TABLE IF EXISTS `t_vio_code`;
CREATE TABLE `t_vio_code` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_Code` varchar(32) DEFAULT NULL COMMENT '违法行为代码',
  `F_Type` varchar(4) DEFAULT NULL COMMENT '违法类型',
  `F_Name` varchar(512) DEFAULT NULL COMMENT '违法行为名称',
  `F_Grade` decimal(6,0) DEFAULT '0' COMMENT '违法扣分数',
  `F_Fee` decimal(6,0) DEFAULT '0' COMMENT '违法罚款数',
  `F_Fee_Lowest` decimal(6,0) DEFAULT '0' COMMENT '最低罚款',
  `F_Fee_Highest` decimal(6,0) DEFAULT '0' COMMENT '最高罚款',
  `F_Law` varchar(512) DEFAULT NULL COMMENT '法律法规条文',
  `F_Enabled` tinyint(1) DEFAULT NULL COMMENT '是否启用',
  `F_Remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='违法行为编码表';

-- ----------------------------
-- Table structure for t_vio_info
-- ----------------------------
DROP TABLE IF EXISTS `t_vio_info`;
CREATE TABLE `t_vio_info` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_Plate` varchar(32) DEFAULT NULL COMMENT '号牌号码',
  `F_Plate_Type` varchar(8) DEFAULT NULL COMMENT '号牌种类',
  `F_Violate_Time` datetime DEFAULT NULL COMMENT '违法时间',
  `F_Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_Gate_ID` varchar(32) DEFAULT NULL COMMENT '路口编码',
  `F_Gate_Channel_ID` varchar(32) DEFAULT NULL COMMENT '设备编码',
  `F_Direction` varchar(64) DEFAULT NULL COMMENT '方向',
  `F_Lane_No` varchar(2) DEFAULT NULL COMMENT '车道编号',
  `F_Speed` decimal(6,0) DEFAULT '0' COMMENT '抓拍速度',
  `F_Max_Speed` decimal(6,0) DEFAULT '0' COMMENT '最大限制速度',
  `F_Min_Speed` decimal(6,0) DEFAULT '0' COMMENT '最小限制速度',
  `F_Catch_User_ID` varchar(32) DEFAULT NULL COMMENT '抓拍人ID',
  `F_Status` varchar(2) DEFAULT NULL COMMENT '状态',
  `F_Vio_Code_ID` varchar(32) DEFAULT NULL COMMENT '违法行为ID',
  `F_Lock_Flag` varchar(1) DEFAULT NULL COMMENT '锁定标记',
  `F_Lock_Time` datetime DEFAULT NULL COMMENT '锁定时间',
  `F_Lock_User_ID` varchar(32) DEFAULT NULL COMMENT '锁定用户',
  `F_Panorama_Img_Url_List` varchar(255) DEFAULT NULL COMMENT '全景图',
  `F_Feature_Img_Url_List` varchar(255) DEFAULT NULL COMMENT '特征图',
  `F_Plate_Color` varchar(2) DEFAULT NULL COMMENT '车牌颜色',
  `F_Face_Num` int(1) DEFAULT NULL COMMENT '人脸个数',
  `F_Opt_User_ID` varchar(32) DEFAULT NULL COMMENT '操作用户ID',
  `F_Video_Url_List` varchar(255) DEFAULT NULL COMMENT '视频',
  `F_Special_Car` varchar(2) DEFAULT NULL COMMENT '特牌车类型',
  `F_Print_Time` datetime DEFAULT NULL COMMENT '罚单打印时间',
  `F_Owner_Name` varchar(64) DEFAULT NULL COMMENT '使用人/单位',
  `F_Owner_Address` varchar(64) DEFAULT NULL COMMENT '地址',
  `F_Owner_Phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `F_Car_Classify` varchar(32) DEFAULT NULL COMMENT '车辆类型',
  `F_Car_Frame_No` varchar(32) DEFAULT NULL COMMENT '车架号',
  `F_Car_Engine_No` varchar(32) DEFAULT NULL COMMENT '发动机号',
  `F_Vehicle_Color` varchar(32) DEFAULT NULL COMMENT '车身颜色',
  `F_Vehicle_Length` varchar(2) DEFAULT NULL COMMENT '车长',
  `F_Vehicle_Logo` varchar(2) DEFAULT NULL COMMENT '车标',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON',
  PRIMARY KEY (`F_ID`),
  KEY `Idx_Plate` (`F_Plate`) USING BTREE,
  KEY `Idx_Plate_Type` (`F_Plate_Type`),
  KEY `Idx_Violate_Time` (`F_Violate_Time`),
  KEY `Idx_Direction` (`F_Direction`),
  KEY `Idx_Status` (`F_Status`),
  KEY `Idx_OrgUnit_ID` (`F_OrgUnit_ID`),
  KEY `Idx_Gate_ID` (`F_Gate_ID`),
  KEY `Idx_Gate_Channel_ID` (`F_Gate_Channel_ID`),
  KEY `Idx_Vio_Code_ID` (`F_Vio_Code_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='违法信息表';

-- ----------------------------
-- Table structure for t_vio_opt_history
-- ----------------------------
DROP TABLE IF EXISTS `t_vio_opt_history`;
CREATE TABLE `t_vio_opt_history` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_Vio_ID` varchar(32) DEFAULT NULL COMMENT '违法记录ID',
  `F_Vio_Table` varchar(2) DEFAULT NULL COMMENT '违法表类型',
  `F_Vio_Code` varchar(32) DEFAULT NULL COMMENT '违法行为编码',
  `F_Status` varchar(2) DEFAULT NULL COMMENT '提交请求时的状态',
  `F_Opt_Result` varchar(2) DEFAULT NULL COMMENT '操作结果',
  `F_Opt_User` varchar(32) DEFAULT NULL COMMENT '操作用户',
  `F_Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `F_Work_Stat` varchar(2) DEFAULT NULL COMMENT '是否参加工作量统计',
  `F_Finish_Flag` varchar(1) DEFAULT NULL COMMENT '完成标记',
  `F_Deleted_Reason` varchar(2) DEFAULT NULL COMMENT '录入不通过原因（废片原因）',
  `F_Remark` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='违法操作记录表';

-- ----------------------------
-- Table structure for t_vio_special_car
-- ----------------------------
DROP TABLE IF EXISTS `t_vio_special_car`;
CREATE TABLE `t_vio_special_car` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_Plate` varchar(32) DEFAULT NULL COMMENT '号牌号码',
  `F_Plate_Type` varchar(8) DEFAULT NULL COMMENT '号牌种类',
  `F_Vio_Code_ID` varchar(512) DEFAULT NULL COMMENT '违法行为编码',
  `F_Type` varchar(32) DEFAULT NULL COMMENT '类型(红名单、白名单)',
  `F_Create_User` varchar(32) DEFAULT NULL COMMENT '创建用户',
  `F_Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `F_Valid_From` datetime DEFAULT NULL COMMENT '生效开始时间',
  `F_Valid_To` datetime DEFAULT NULL COMMENT '生效结束时间',
  `F_Approver` varchar(32) DEFAULT NULL COMMENT '审批人',
  `F_Approve_Time` datetime DEFAULT NULL COMMENT '审批时间',
  `F_Owner_Unit` varchar(128) DEFAULT NULL COMMENT '车主单位',
  `F_Owner_Name` varchar(128) DEFAULT NULL COMMENT '车主姓名',
  `F_Remark` varchar(512) DEFAULT NULL COMMENT '描述',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='特殊车辆信息表';

-- ----------------------------
-- Table structure for t_vio_stat_work
-- ----------------------------
DROP TABLE IF EXISTS `t_vio_stat_work`;
CREATE TABLE `t_vio_stat_work` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_User_ID` varchar(32) NOT NULL COMMENT '用户ID',
  `F_Stat_Day` varchar(16) NOT NULL COMMENT '时间',
  `F_Vio_Code` varchar(32) DEFAULT NULL COMMENT '违法行为代码',
  `F_Input` int(5) DEFAULT '0' COMMENT '有效性录入',
  `F_Input_Valid` int(5) DEFAULT '0' COMMENT '有效性录入（有效）',
  `F_Input_Invalid` int(5) DEFAULT '0' COMMENT '有效性录入（无效）',
  `F_One_Audit_Pass` int(5) DEFAULT '0' COMMENT '有效性一审通过',
  `F_One_Audit_Fail` int(5) DEFAULT '0' COMMENT '有效性一审不通过',
  `F_Two_Audit_Pass` int(5) DEFAULT '0' COMMENT '有效性二审通过',
  `F_Two_Audit_Fail` int(5) DEFAULT '0' COMMENT '有效性二审不通过',
  `F_Three_Audit_Pass` int(5) DEFAULT '0' COMMENT '有效性三审通过',
  `F_Three_Audit_Fail` int(5) DEFAULT '0' COMMENT '有效性三审不通过',
  `F_Waste` int(5) DEFAULT '0' COMMENT '无效性录入',
  `F_Waste_Valid` int(5) DEFAULT '0' COMMENT '无效性录入（有效）',
  `F_Waste_Invalid` int(5) DEFAULT '0' COMMENT '无效性录入（无效）',
  `F_One_Waste_Audit_Pass` int(5) DEFAULT '0' COMMENT '无效性一审通过',
  `F_One_Waste_Audit_Fail` int(5) DEFAULT '0' COMMENT '无效性一审不通过',
  `F_Two_Waste_Audit_Pass` int(5) DEFAULT '0' COMMENT '无效性二审通过',
  `F_Two_Waste_Audit_Fail` int(5) DEFAULT '0' COMMENT '无效性二审不通过',
  `F_Three_Waste_Audit_Pass` int(5) DEFAULT '0' COMMENT '无效性三审通过',
  `F_Three_Waste_Audit_Fail` int(5) DEFAULT '0' COMMENT '无效性三审不通过',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for v_map_type_mark
-- ----------------------------
DROP VIEW IF EXISTS `v_map_type_mark`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER  VIEW `v_map_type_mark` AS select `t_gate`.`F_ID` AS `F_ID`,`t_gate`.`F_Code` AS `F_CODE`,`t_gate`.`F_Name` AS `F_NAME`,`t_gate`.`F_OrgUnit_ID` AS `F_OrgUnit_ID`,'gate' AS `Device_Type` from `t_gate` union all select `t_ccu`.`F_ID` AS `F_ID`,`t_ccu`.`F_Code` AS `F_CODE`,`t_ccu`.`F_Name` AS `F_NAME`,`t_ccu`.`F_OrgUnit_ID` AS `F_OrgUnit_ID`,'ccu' AS `Device_Type` from `t_ccu` union all select `t_guide_device`.`F_ID` AS `F_ID`,`t_guide_device`.`F_Code` AS `F_CODE`,`t_guide_device`.`F_Name` AS `F_NAME`,`t_guide_device`.`F_OrgUnit_ID` AS `F_OrgUnit_ID`,'guide' AS `Device_Type` from `t_guide_device` union all select `t_camera`.`F_ID` AS `F_ID`,`t_camera`.`F_Code` AS `F_CODE`,`t_camera`.`F_Name` AS `F_NAME`,`t_camera`.`F_OrgUnit_ID` AS `F_OrgUnit_ID`,'camera' AS `Device_Type` from `t_camera` ;

-- ----------------------------
-- View structure for v_orgunit_device_tree
-- ----------------------------
DROP VIEW IF EXISTS `v_orgunit_device_tree`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER  VIEW `v_orgunit_device_tree` AS select `ou`.`F_ID` AS `id`,`ou`.`F_Parent_ID` AS `pid`,`ou`.`F_Name` AS `NAME`,'OrgUnit' AS `TYPE`,'diy01' AS `iconSkin`,'' AS `unitName`,'' AS `ip` from `t_org_unit` `ou` union all select `t`.`F_ID` AS `id`,`t2`.`F_ID` AS `pid`,`t`.`F_Name` AS `NAME`,'Decoder' AS `TYPE`,'diy04' AS `iconSkin`,`t2`.`F_Name` AS `unitName`,`t`.`F_IpAddress` AS `ip` from (`t_decoder` `t` join `t_org_unit` `t2`) where (`t`.`F_OrgUnit_ID` = `t2`.`F_ID`) union all select `t`.`F_ID` AS `id`,`t2`.`F_ID` AS `pid`,`t`.`F_Name` AS `NAME`,'GateServer' AS `TYPE`,'diy04' AS `iconSkin`,`t2`.`F_Name` AS `unitName`,`t`.`F_IpAddress` AS `ip` from (`t_gate_server` `t` join `t_org_unit` `t2`) where (`t`.`F_OrgUnit_ID` = `t2`.`F_ID`) union all select `t`.`F_ID` AS `id`,`t2`.`F_ID` AS `pid`,`t`.`F_Name` AS `NAME`,'AccessServer' AS `TYPE`,'diy04' AS `iconSkin`,`t2`.`F_Name` AS `unitName`,`t`.`F_IpAddress` AS `ip` from (`t_access_server` `t` join `t_org_unit` `t2`) where (`t`.`F_OrgUnit_ID` = `t2`.`F_ID`) union all select `t`.`F_ID` AS `id`,`t2`.`F_ID` AS `pid`,`t`.`F_Name` AS `NAME`,'IvsServer' AS `TYPE`,'diy04' AS `iconSkin`,`t2`.`F_Name` AS `unitName`,`t`.`F_IpAddress` AS `ip` from (`t_ivs_server` `t` join `t_org_unit` `t2`) where (`t`.`F_OrgUnit_ID` = `t2`.`F_ID`) union all select `t`.`F_ID` AS `id`,`t2`.`F_ID` AS `pid`,`t`.`F_Name` AS `NAME`,'PvgServer' AS `TYPE`,'diy04' AS `iconSkin`,`t2`.`F_Name` AS `unitName`,`t`.`F_IpAddress` AS `ip` from (`t_pvg_server` `t` join `t_org_unit` `t2`) where (`t`.`F_OrgUnit_ID` = `t2`.`F_ID`) ;

-- ----------------------------
-- View structure for v_user_person
-- ----------------------------
DROP VIEW IF EXISTS `v_user_person`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER  VIEW `v_user_person` AS select `u`.`F_Uid` AS `F_Uid`,`u`.`F_Pwd` AS `F_Pwd`,`u`.`F_Is_Forever_Valid` AS `F_Is_Forever_Valid`,`p`.`F_Name` AS `personName`,`r`.`F_Name` AS `roleName`,`p`.`F_Card_No` AS `F_Card_No`,`p`.`F_Sex` AS `F_Sex`,`p`.`F_MobTel` AS `F_MobTel`,`u`.`F_User_Level` AS `F_User_Level`,`u`.`F_Is_Disable` AS `F_Is_Disable`,`p`.`F_OrgUnit_ID` AS `F_OrgUnit_ID`,`p`.`F_Post` AS `F_Post`,`un`.`F_Code` AS `F_Code`,`un`.`F_Name` AS `orgUnitName`,`p`.`F_TelePhone` AS `F_TelePhone`,`u`.`F_StartTime_Valid` AS `F_StartTime_Valid`,`u`.`F_EndTime_Valid` AS `F_EndTime_Valid`,`p`.`F_Description` AS `F_Description` from ((((`t_user` `u` join `t_person` `p`) join `t_user_role` `ur`) join `t_role` `r`) join `t_org_unit` `un`) where ((`p`.`F_ID` = `u`.`F_Person_ID`) and (`u`.`F_ID` = `ur`.`F_User_ID`) and (`r`.`F_ID` = `ur`.`F_Role_ID`) and (`p`.`F_OrgUnit_ID` = `un`.`F_ID`)) ;
