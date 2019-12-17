package com.example.springboot.consts;

import java.nio.charset.Charset;

/**
 * 常量
 * 
 * @author Administrator
 *
 */

public class Consts {

	/**
	 * utf-8编码
	 */
	public static final String UTF8 = "utf-8";

	/**
	 * utf-8编码
	 */
	public static final Charset CHARSET_UTF8 = Charset.forName("utf-8");

	/**
	 * 数据库版本标识 DBVersion
	 */
	public static final String DBVersion = "DBVersion";

	/**
	 * 超级管理员用户名
	 */
	public static final String USER_ADMIN = "admin";

	/**
	 * 超级管理员默认密码
	 */
	public static final String USER_ADMIN_PWD = "21232f297a57a5a743894a0e4a801fc3";

	/**
	 * 超级管理员用户ID
	 */
	public static final String USER_ADMIN_ID = "user_1";

	/**
	 * 超级管理人员ID
	 */
	public static final String ADMIN_PERSON_ID = "person_1";

	/**
	 * 超级管理员权限ID
	 */
	public static final String ADMIN_ROLE_ID = "role_1";

	/**
	 * 超级管理员用户角色ID
	 */
	public static final String ADMIN_USER_ROLE_ID = "user_role_1";

	/**
	 * 默认基础配置ID，如部门、区域等
	 */
	public static final String ROOT_BASE_CONFIG_ID = "1";

	/**
	 * ATMS
	 */
	public static final String SYSTEM_NAME = "ATMS";

	/**
	 * session语言属性 language
	 */
	public static final String SESSION_ATTRIBUTE_LANGUAGE = "language";

	/**
	 * session用户信息属性 user
	 */
	public static final String SESSION_ATTRIBUTE_USER = "user";

	/**
	 * session人员信息属性 person
	 */
	public static final String SESSION_ATTRIBUTE_PERSON = "person";

	/**
	 * session授权信息属性 authority
	 */
	public static final String SESSION_ATTRIBUTE_AUTHORITY = "authority";

	/**
	 * session模块树属性 moduleTreeList
	 */
	public static final String SESSION_ATTRIBUTE_MODULETREELIST = "moduleTreeList";

	/**
	 * session功能Key列表属性 funtionKeyList
	 */
	public static final String SESSION_ATTRIBUTE_FUNCTIONKEYLIST = "funtionKeyList";

	/**
	 * session用户属性 roleList
	 */
	public static final String SESSION_ATTRIBUTE_ROLELIST = "roleList";

	/**
	 * session非结构化服务器地址属性 pfsServer
	 */
	public static final String SESSION_ATTRIBUTE_PFSSERVER = "pfsServer";

	/**
	 * session消息服务器(websocket)信息属性 msgServerInfo
	 */
	public static final String SESSION_ATTRIBUTE_MSGSERVER_INFO = "msgServerInfo";

	/**
	 * session违法处理时是否自动(从六合一平台)查询车辆信息属性 isAutoQueryVehicleInfo
	 */
	public static final String SESSION_ATTRIBUTE_AUTO_FILL_VEHICLEINFO = "isAutoQueryVehicleInfo";

	/**
	 * session违法数据是否提取属性 enableVioPriority
	 */
	public static final String SESSION_ATTRIBUTE_IS_PRIORITY = "enableVioPriority";

	/**
	 * session 项目名称
	 */
	public static final String SESSION_ATTRIBUTE_PROJECT_NAME = "projectName";

	public static final String USER_IDS = "UserIds";

	public static final String EVENT_RULE_ID = "EventRuleID";

	public static final String ALL = "All";

	/**
	 * 组织机构
	 */
	public static final String ORGUNIT = "OrgUnit";

	/**
	 * 违法记录导出
	 */
	public static final String VIO_EXPORT = "VioExport";
	/**
	 * 设备状态导出
	 */
	public static final String STATUS_EXPORT = "StatusExport";

	/**
	 * 交通设施导出
	 */
	public static final String GIS_MARK_EXPORT = "GisMarkExport";

	/**
	 * 系统日志导出
	 *
	 */
	public static final String LOG_EXPORT = "LogExport";

	/**
	 * 报障信息导出
	 * 
	 */
	public static final String ISSUE_EXPORT = "IssueExport";

	/**
	 * 信号控制UTC
	 */
	public static final String UTC_EXPORT = "UtcExport";

	/**
	 * 勤务考核导出
	 */
	public static final String DUTY_EXPORT = "DutyExport";

	/**
	 * 过车分析导出
	 */
	public static final String CAR_ANALYSIS_EXPORT = "CarAnalysisExport";

	/**
	 * 过车对比导出
	 */
	public static final String CAR_COMPARE_EXPORT = "CarCompare";

	/**
	 * 套牌数据导出
	 */
	public static final String DECK_EXPORT = "DeckExport";

	public static final int LOG_MAX_RECORD_NUM = 200;

	/**
	 * 摄像机子码流通道
	 */
	public static final String CAMERA_SUB_CHANNEL = "bitstream1";

	/**
	 * 违法人工抓拍导入
	 */
	public static final String VIOINFO_MANUAL = "manual";

	/**
	 * 首次入城导出
	 *
	 */
	public static final String FIRSTWALL_EXPORT = "FirstwallExport";

	/**
	 * bimg上传图片url前缀格式 http://192.168.1.52:6551/UpLoadFile
	 */
	public static final String BIMG_UPLOAD_URL_PREFIX_FORMAT = "http://%s:%d/UpLoadFile";

	/**
	 * bimg违法图片根目录格式 dest=PFS:/TIC/Violation/
	 */
	public static final String BIMG_VIO_URL_PREFIX_FORMAT = "dest=PFS:/%s/";

	/**
	 * bimg图片url前缀格式 http://192.168.1.52:6551/DownLoadFile?filename=
	 */
	public static final String BIMG_FILE_URL_PREFIX_FORMAT = "http://%s:%d/DownLoadFile?filename=";

	/**
	 * PCC（目前只有PCC3.0支持REST请求）http://192.168.1.52:5334
	 */
	public static final String PCC_URL_PREFIX_FORMAT = "http://%s:%d";

	/**
	 * 车辆归属
	 */
	public static final String VEHICLE_OWNER_SHIP = "VehicleOwnership";
	/**
	 * 车辆归属 redis的key
	 */
	public static final String LOCAL_PROVINCE_VEHICLE_SIGN = "LocalProvinceVehicleSign";
	/**
	 * 车辆归属 redis的key
	 */
	public static final String LOCAL_CITY_VEHICLE_SIGN = "LocalCityVehicleSign";

	/**
	 * 特殊类布控原因
	 */
	public static final String MONITOR_REASON_NAME = "其他";

	/**
	 * 系统自有布控原因查询条件
	 */
	public static final String GATE_ALARM_TYPE = "GateAlarmType";

	/**
	 * 违法待定数量常量
	 */
	public static final Integer VIOINFO_PENDING_NUMBER = 3;
}
