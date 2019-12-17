/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : tic

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2019-02-21 16:57:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_vio_stat_work_by_approvetime
-- ----------------------------
CREATE TABLE IF NOT EXISTS `t_vio_stat_work_by_approvetime` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_User_ID` varchar(32) NOT NULL COMMENT '用户ID',
  `F_Stat_Day` varchar(16) NOT NULL COMMENT '统计日期，格式yyyyMMdd',
  `F_Vio_Code` varchar(32) NOT NULL COMMENT '违法行为代码',
  `F_Input` int(5) DEFAULT '0' COMMENT '录入总数',
  `F_Input_Pass` int(5) DEFAULT '0' COMMENT '有效录入数',
  `F_Input_NotPass` int(5) DEFAULT '0' COMMENT '无性录入数',
  `F_Input_NotPass_Items` varchar(256) DEFAULT NULL COMMENT '无效性录入明细',
  `F_Input_Pending` int(5) DEFAULT '0' COMMENT '录入待定',
  `F_Valid_One_Audit` int(5) DEFAULT '0' COMMENT '有效一审（通过、无效、打回、待定）总数',
  `F_Valid_One_Audit_Pass` int(5) DEFAULT '0' COMMENT '有效一审通过数',
  `F_Valid_One_Audit_NotPass` int(5) DEFAULT '0' COMMENT '有效一审不通过（无效）数',
  `F_Valid_One_Audit_NotPass_Items` varchar(256) DEFAULT NULL COMMENT '有效一审无效明细',
  `F_Valid_One_Audit_Reject` int(5) DEFAULT '0' COMMENT '有效一审打回',
  `F_Valid_One_Audit_Pending` int(5) DEFAULT '0' COMMENT '有效一审待定',
  `F_Valid_Two_Audit` int(5) DEFAULT '0' COMMENT '有效二审（通过、无效、打回、待定）总数',
  `F_Valid_Two_Audit_Pass` int(5) DEFAULT '0' COMMENT '有效二审通过数',
  `F_Valid_Two_Audit_NotPass` int(5) DEFAULT '0' COMMENT '有效二审不通过（无效）数',
  `F_Valid_Two_Audit_NotPass_Items` varchar(256) DEFAULT NULL COMMENT '有效二审无效明细',
  `F_Valid_Two_Audit_Reject` int(5) DEFAULT '0' COMMENT '有效二审打回',
  `F_Valid_Two_Audit_Pending` int(5) DEFAULT '0' COMMENT '有效二审待定',
  `F_Valid_Three_Audit` int(5) DEFAULT '0' COMMENT '有效三审（通过、无效、打回、待定）总数',
  `F_Valid_Three_Audit_Pass` int(5) DEFAULT '0' COMMENT '有效三审通过数',
  `F_Valid_Three_Audit_NotPass` int(5) DEFAULT '0' COMMENT '有效三审不通过（无效）数',
  `F_Valid_Three_Audit_NotPass_Items` varchar(256) DEFAULT NULL COMMENT '有效三审无效明细',
  `F_Valid_Three_Audit_Reject` int(5) DEFAULT '0' COMMENT '有效三审打回',
  `F_Valid_Three_Audit_Pending` int(5) DEFAULT '0' COMMENT '有效三审待定',
  `F_InValid_One_Audit` int(5) DEFAULT '0' COMMENT '无效一审（无效、打回、待定）总数',
  `F_InValid_One_Audit_NotPass` int(5) DEFAULT '0' COMMENT '无效一审无效数',
  `F_InValid_One_Audit_NotPass_Items` varchar(256) DEFAULT NULL COMMENT '无效一审无效明细',
  `F_InValid_One_Audit_Reject` int(5) DEFAULT '0' COMMENT '无效一审打回',
  `F_InValid_One_Audit_Pending` int(5) DEFAULT '0' COMMENT '无效一审待定',
  `F_InValid_Two_Audit` int(5) DEFAULT '0' COMMENT '无效二审（无效、打回、待定）总数',
  `F_InValid_Two_Audit_NotPass` int(5) DEFAULT '0' COMMENT '无效二审无效数',
  `F_InValid_Two_Audit_NotPass_Items` varchar(256) DEFAULT NULL COMMENT '无效二审无效明细',
  `F_InValid_Two_Audit_Reject` int(5) DEFAULT '0' COMMENT '无效二审打回',
  `F_InValid_Two_Audit_Pending` int(5) DEFAULT '0' COMMENT '无效二审待定',
  `F_InValid_Three_Audit` int(5) DEFAULT '0' COMMENT '无效三审（无效、打回、待定）总数',
  `F_InValid_Three_Audit_NotPass` int(5) DEFAULT '0' COMMENT '无效三审无效数',
  `F_InValid_Three_Audit_NotPass_Items` varchar(256) DEFAULT NULL COMMENT '无效三审无效明细',
  `F_InValid_Three_Audit_Reject` int(5) DEFAULT '0' COMMENT '无效三审打回',
  `F_InValid_Three_Audit_Pending` int(5) DEFAULT '0' COMMENT '无效三审待定',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='违法录入人员考核表（按审核时间）';
