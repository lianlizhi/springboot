/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.164_mysql
Source Server Version : 50625
Source Host           : 192.168.1.164:3309
Source Database       : tic

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2018-09-11 15:55:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_vio_info_waste
-- ----------------------------

CREATE TABLE `t_vio_info_waste` (
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
  `F_Panorama_Img_Url_List` varchar(1024) DEFAULT NULL,
  `F_Feature_Img_Url_List` varchar(1024) DEFAULT NULL,
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
  `F_Vehicle_Logo` varchar(20) DEFAULT NULL COMMENT '车标',
  `F_Ext` varchar(4096) DEFAULT NULL COMMENT '扩展JSON',
  `F_Pstmcap_Status` varchar(2) DEFAULT 'N' COMMENT '上传公安网违法系统状态',
  `F_Pstmcap_Message` varchar(1024) DEFAULT NULL COMMENT '上传公安网违法系统消息',
  `F_Vehicle_Info` varchar(5000) DEFAULT NULL COMMENT '六合一车辆信息',
  `F_Reason` varchar(64) DEFAULT NULL COMMENT '无效原因',
  `F_Source` varchar(1) DEFAULT '0' COMMENT '数据来源',
  PRIMARY KEY (`F_ID`,`F_Violate_Time`),
  KEY `Idx_Plate` (`F_Plate`) USING BTREE,
  KEY `Idx_Plate_Type` (`F_Plate_Type`),
  KEY `Idx_Violate_Time` (`F_Violate_Time`),
  KEY `Idx_Direction` (`F_Direction`),
  KEY `Idx_Status` (`F_Status`),
  KEY `Idx_OrgUnit_ID` (`F_OrgUnit_ID`),
  KEY `Idx_Gate_ID` (`F_Gate_ID`),
  KEY `Idx_Gate_Channel_ID` (`F_Gate_Channel_ID`),
  KEY `Idx_Vio_Code_ID` (`F_Vio_Code_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='违法信息废片表' PARTITION BY RANGE (TO_DAYS(F_Violate_Time))(
	PARTITION p0
	VALUES
		less than (TO_DAYS('2018-08-01'))
);