/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : tic

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2019-02-25 11:13:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_vio_stat_by_createtime
-- ----------------------------
CREATE TABLE IF NOT EXISTS `t_vio_stat_by_createtime` (
  `F_ID` varchar(32) NOT NULL COMMENT 'ID',
  `F_Stat_Day` varchar(16) DEFAULT NULL COMMENT '统计日期，格式yyyyMMdd，如20190225',
  `F_Un_Extract_Num` int(11) DEFAULT NULL COMMENT '未提取数',
  `F_Wait_Input_Num` int(11) DEFAULT NULL COMMENT '待录入数',
  `F_Valid_Audit_Num` int(11) DEFAULT NULL COMMENT '有效审核数',
  `F_InValid_Audit_Num` int(11) DEFAULT NULL COMMENT '无效审核数',
  `F_Formal_Num` int(11) DEFAULT NULL COMMENT '正式违法数据数',
  `F_Special_Num` int(11) DEFAULT NULL COMMENT '特牌车违法数据数',
  `F_Waste_Num` int(11) DEFAULT NULL COMMENT '废片违法数据数',
  `F_Vio_Code` varchar(5) DEFAULT NULL COMMENT '违法行为代码',
  `F_Vio_Type` varchar(4) DEFAULT NULL COMMENT '违法类型',
  `F_Gate_ID` varchar(32) DEFAULT NULL COMMENT '卡口编号',
  `F_OrgUnit_ID` varchar(32) DEFAULT NULL COMMENT '组织机构编号',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON数据',
  PRIMARY KEY (`F_ID`),
  KEY `Idx_VioStat_StatDay` (`F_Stat_Day`),
  KEY `Idx_VioStat_VioCode` (`F_Vio_Code`),
  KEY `Idx_VioStat_GateID` (`F_Gate_ID`),
  KEY `Idx_VioStat_OrgUnitID` (`F_OrgUnit_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='违法数据统计表（按入库时间）';
