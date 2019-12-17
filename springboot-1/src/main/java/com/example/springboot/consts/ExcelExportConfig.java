package com.example.springboot.consts;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;



public class ExcelExportConfig {
	

	private String VioExportCN = "车牌号码, 号牌种类, 时间, 违法行为, 地点, 方向, 车速, 限速, 状态 , 录入人员, 审核人员, 无效原因, 上传状态, 上传信息";
	private String VioExportEN = "Plate, Plate_Type, Violate_Time, Violate_Action, Address, Direction, Speed, Limit, Status, CreatePersonName, ApprovePersonName, Reason, PstmcapStatusName, PstmcapInfo";

	private String StatusExportCN = "名称, 类型, 所属区域, IP地址, 设备状态, 检测时间";
	private String StatusExportEN = "Name, Type, Region, IpAddress, Devices condition, Detection time";

	private String GisMarkExportCN = "名称, 类型, 描述";
	private String GisMarkExportEN = "Name, Type, Description";

	private String LogExportCN = "用户, 所属部门, 操作时间, 模块, 操作详情, IP地址";
	private String LogExportEN = "User, Affiliates, Time, Module,Operation details, IP_Address";

	private String IssueExportCN = "名称, 类型, 所属区域, 故障等级, 故障描述, 安装地点, 状态, 报障时间";
	private String IssueExportEN = "Name, Type, Region, Malfunction level, Malfunction description, Install spot location, Process state, Commit_Time";

	private String DutyExportCN = "警号, 姓名, 组织机构, 迟到, 早退, 缺勤";
	private String DutyExportEN = "Police_No, Name, Department, Late,Early, Absence";

	private String VehicleExportCN = "车牌号码, 通过卡口, 通过车道, 经过时间, 行驶车速(km/h), 号牌种类, 车辆颜色, 车辆类型";
	private String VehicleExportEN = "Plate, GateName, GateChannelName, PassTime, VehicleSpeed, PlateType, VehicleColor, VehicleType";

	private String VehicleExportCNImg = "车牌号码, 通过卡口, 通过车道, 时间, 车速(km/h), 号牌种类, 车辆颜色, 车辆类型, 图片路径";
	private String VehicleExportENImg = "Plate, GateName, GateChannelName, PassTime, VehicleSpeed, PlateType, VehicleColor, VehicleType, PanoramaImage";
	
	private String AlarmExportCN = "车牌号码, 处警状态, 报警类型, 经过时间, 经过卡口";
	private String AlarmExportEN = "PlateNo, ResponseState, EventType, PassTime, GateName";

	private String ControlCenterExportCN = "编号, 名称, 所属区域, OPT协调IP地址, OPT端口, OPT协调状态, CCU服务IP地址, CCU端口, CCU服务状态";
	private String ControlCenterExportEN = "Code, Name, OrgUnitName, OptIpAddress, OptIpPort, OptState, CcuIpAddress, CcuIpPort, CcuState";

	private String ControlAreaExportCN = "编号, 控制子区名称, 控制中心名称";
	private String ControlAreaExportEN = "Code, Name, ControlName";

	private String RoadExportCN = "路口编码, 路口名称, 所属控制子区, 路口类型, X坐标, Y坐标";
	private String RoadExportEN = "Code, Name, AreaName, RoadType, GisX, GisY";

	private String LanExportCN = "编号, 车道名称, 所属路口, 车道类型, 车道方向";
	private String LanExportEN = "Code, Name, RoadName, LanType, LanDir";

	private String RoadFlowExportCN = "时间, 路口1, 路口2";
	private String RoadFlowExportEN = "FlowTime, Road1, Road2";

	private String DetectorExportCN = "车检器编码, 路口名称, 环路线圈间距, 环路线圈宽度, 平均车长, 车中判别参数, 车速高限, 连续有车时间上限(分), 连续无车占压时间上限(分), 流量上限异常值";
	private String DetectorExportEN = "Code, RoadName, CoilSpacing, CoilWidth, AvgLen, LanClassif, SpeedLimit, TimeLimit, OccupiesTimeLimit, FlowValue";

	private String DeviceExportCN = "信号机编号, 控制子区名称, 信号机配置类型, 信号机安装位置, 路口类型, 信号机状态, 信号机类型, 信号机IP地址, 信号机端口, 次序";
	private String DeviceExportEN = "Signal controller code, Control sub-area name, Configuration type, Installation location, Intersection type, Signal controller condition, Signal controller type, Signal controller IP, DevicePort, Sequence";

	private String FlowExportCN = "时间, 路口名称, 北左转, 北直行, 北右转, 北掉头, 东左转, 东直行, 东右转, 东掉头, 南左转, 南直行, 南右转, 南掉头, 西左转, 西直行, 西右转, 西掉头, 总计";
	private String FlowExportEN = "Time, Name, N left-turn, N go straight, N right-turn, N u-turn, E left-turn, E go straight, E right-turn, E u-turn, S left-turn, S go straight, S right-turn, S u-turn, W left-turn, W go straight, W right-turn, W u-turn, Total";
	private String EmergencyExportCN = "报警内容,警情类型,警情级别,事发地点,天气情况,报警人,报警时间,报警电话,发送状态,部门,处警人员,处理警车,到警时间,受伤人数,死亡人数,是否逃逸,录入人";
	private String EmergencyExportEN = "Content, Category, Level,  Address, Weather Condition, Alert,Time, Alarm Call ,Send Condition ,Dept.,Police Officer,Police Vehicle, Arrived Time , Injury, Death, Escape, Entering By ";
	private String RoadTrafficFluxExportCN = "检测时间, 路段, 车流量, 平均车速(公里/小时), 运行状态, 服务水平, 起始路口, 结束路口";// 列名
	private String RoadTrafficFluxExportEN = "CheckTime, Name, TrafficFlow, AvgSpeed, TrafficState, ServiceLevel, StartGate, EndGate";// map中的key

	/**
	 * 套牌数据导出列
	 */
	private String DeckExportCN = "车牌号码,车牌颜色,车辆颜色,车牌类型,车辆类型,车辆品牌,第一次过车卡口,第一次过车时间,第一次过车速度,第二次过车卡口,第二次过车时间,第二次过车速度";
	private String DeckExportEN = "VehiclePlate,PlateColor,VehicleColor,PlateType,VehicleType,VehicleLogo,FirstTimePassGate,FirstTimePassTime,FirstTimeSpeed,LastTimePassGate,LastTimePassTime,LastTimeSpeed";

	/**
	 * 流量分布导出列
	 */
	private String TrafficFlowExportCN = "路段名称,时间,车流量 (辆）";
	private String TrafficFlowExportEN = "Road section name,Time,Traffic Flow (The number of vehicles）";

	/**
	 * 过车统计导出列
	 */
	private String PassCarExportCN = "卡口, 方向 , 所属区域,总数";
	private String PassCarExportEN = "CheckPoint, Direction, orgUnit, count";
	
	/**
	 * 过车分析导出列
	 */
	private String CarAnalysisExportCN = "卡口, 方向 , 所属区域, 总数, 环比";
	private String CarAnalysisExportEN = "CheckPoint, Direction, OrgUnit, Count, Chain";

	/**
	 * 事故黑点导出列
	 */
	private String AccidentSpotCN = "报警时间, 受伤人数 , 死亡人数, 处理部门, 事发地址, 是否逃逸, 报警人, 处警人员";
	private String AccidentSpotEN = "AccidentTime, InjuredNum, DeathToll, DeptID, Address, Escape, AlarmPerson, Policeman";
	/**
	 * 车辆类型导出列
	 */
	private String VehicleTypeAnalysisExportCN = "车辆类型, 外省机动车通行总量, 占比";
	private String VehicleTypeAnalysisExportEN = "Type, Other province total vehicle traffic volume, Proportion";
	/**
	 * 车辆总数导出列
	 */
	private String VehicleTotalAnalysisExportCN = "本市机动车通行总量, 本省外市机动车通行总量, 外省机动车通行总量 , 其他机动车通行总量 , 通行总量";
	private String VehicleTotalAnalysisExportEN = "This city total vehicle traffic volume, This province total vehicle traffic volume, Other province total vehicle traffic volume , Others total vehicle traffic volume , Total vehicle traffic volume";
	/**
	 * 违法时间导出列
	 */
	private String VioByTimeExportCN = "违法时间, 违法次数 ";
	private String VioByTimeExportEN = "vioTime, vioCount";
	/**
	 * 违法地点导出列
	 */
	private String VioByAddressExportCN = "违法地点,  违法次数";
	private String VioByAddressExportEN = "vioAddress, vioCount";
	/**
	 * 违法行为统计导出列
	 */
	private String VioByStatsCodeOrRoadExportCN = "违法行为, 违法数量 , 占比";
	private String VioByStatsCodeOrRoadExportEN = "vioCodeAndName, count, scale";
	/**
	 * 流量设备导出列
	 */
	private String FluxDeviceExportCN = "名称, 设备类型, 设备编码, IP地址, 端口, 所属路段, 所属方向";
	private String FluxDeviceExportEN = "Name, DeviceType, Code, IpAddress, Port, RoadName, Direction";
	/**
	 * 人员考核录入导出列
	 */
	private String examineCN = "人员, 违法行为, 总录入, 有效, 无效, 有效率";
	private String examineEN = "People, VioCode, InputNum, InputValid, InputInvalid, InputPassRate";
	/**
	 * 人员考核审核导出列
	 */
	private String auditingCN = "人员, 违法行为, 审核数量, 一审审核数量";
	private String auditingEN = "People, VioCode, AuditNum, AuditOneNum";
	
	/**
	 * 违法时间导出列
	 */
	private String VioTimeExportCN = "违法时间, 违法次数 ";
	private String VioTimeExportEN = "vioTime, vioCount";
	/**
	 * 违法地点导出列
	 */
	private String VioAddressExportCN = "违法地点,  违法数量 ";
	private String VioAddressExportEN = "vioAddress, vioCount";
	/**
	 * 违法行为统计导出列
	 */
	private String VioStatsCodeOrRoadExportCN = "违法名称, 违法代码, 违法数量 , 占比";
	private String VioStatsCodeOrRoadExportEN = "vioName, vioCode, count , scale";
	
	

	public String getVioTimeExportCN() {
		return VioTimeExportCN;
	}

	public void setVioTimeExportCN(String vioTimeExportCN) {
		VioTimeExportCN = vioTimeExportCN;
	}

	public String getVioTimeExportEN() {
		return VioTimeExportEN;
	}

	public void setVioTimeExportEN(String vioTimeExportEN) {
		VioTimeExportEN = vioTimeExportEN;
	}

	public String getVioAddressExportCN() {
		return VioAddressExportCN;
	}

	public void setVioAddressExportCN(String vioAddressExportCN) {
		VioAddressExportCN = vioAddressExportCN;
	}

	public String getVioAddressExportEN() {
		return VioAddressExportEN;
	}

	public void setVioAddressExportEN(String vioAddressExportEN) {
		VioAddressExportEN = vioAddressExportEN;
	}

	public String getFluxDeviceExportCN() {
		return FluxDeviceExportCN;
	}

	public void setFluxDeviceExportCN(String fluxDeviceExportCN) {
		FluxDeviceExportCN = fluxDeviceExportCN;
	}

	public String getFluxDeviceExportEN() {
		return FluxDeviceExportEN;
	}

	public void setFluxDeviceExportEN(String fluxDeviceExportEN) {
		FluxDeviceExportEN = fluxDeviceExportEN;
	}

	public String getVioStatsCodeOrRoadExportCN() {
		return VioStatsCodeOrRoadExportCN;
	}

	public void setVioStatsCodeOrRoadExportCN(String vioStatsCodeOrRoadExportCN) {
		VioStatsCodeOrRoadExportCN = vioStatsCodeOrRoadExportCN;
	}

	public String getVioStatsCodeOrRoadExportEN() {
		return VioStatsCodeOrRoadExportEN;
	}

	public void setVioStatsCodeOrRoadExportEN(String vioStatsCodeOrRoadExportEN) {
		VioStatsCodeOrRoadExportEN = vioStatsCodeOrRoadExportEN;
	}

	public String getVehicleTotalAnalysisExportCN() {
		return VehicleTotalAnalysisExportCN;
	}

	public void setVehicleTotalAnalysisExportCN(String vehicleTotalAnalysisExportCN) {
		VehicleTotalAnalysisExportCN = vehicleTotalAnalysisExportCN;
	}

	public String getVehicleTotalAnalysisExportEN() {
		return VehicleTotalAnalysisExportEN;
	}

	public void setVehicleTotalAnalysisExportEN(String vehicleTotalAnalysisExportEN) {
		VehicleTotalAnalysisExportEN = vehicleTotalAnalysisExportEN;
	}

	public void setVehicleTypeAnalysisExportCN(String vehicleTypeAnalysisExportCN) {
		VehicleTypeAnalysisExportCN = vehicleTypeAnalysisExportCN;
	}

	public void setVehicleTypeAnalysisExportEN(String vehicleTypeAnalysisExportEN) {
		VehicleTypeAnalysisExportEN = vehicleTypeAnalysisExportEN;
	}

	public String getVehicleTypeAnalysisExportCN() {
		return VehicleTypeAnalysisExportCN;
	}

	public String getVehicleTypeAnalysisExportEN() {
		return VehicleTypeAnalysisExportEN;
	}

	public String getAccidentSpotCN() {
		return AccidentSpotCN;
	}

	public void setAccidentSpotCN(String accidentSpotCN) {
		AccidentSpotCN = accidentSpotCN;
	}

	public String getAccidentSpotEN() {
		return AccidentSpotEN;
	}

	public void setAccidentSpotEN(String accidentSpotEN) {
		AccidentSpotEN = accidentSpotEN;
	}

	public String getPassCarExportCN() {
		return PassCarExportCN;
	}

	public void setPassCarExportCN(String passCarExportCN) {
		PassCarExportCN = passCarExportCN;
	}

	public String getPassCarExportEN() {
		return PassCarExportEN;
	}

	public void setPassCarExportEN(String passCarExportEN) {
		PassCarExportEN = passCarExportEN;
	}
	
	public String getCarAnalysisExportCN() {
		return CarAnalysisExportCN;
	}

	public void setCarAnalysisExportCN(String carAnalysisExportCN) {
		CarAnalysisExportCN = carAnalysisExportCN;
	}

	public String getCarAnalysisExportEN() {
		return CarAnalysisExportEN;
	}

	public void setCarAnalysisExportEN(String carAnalysisExportEN) {
		CarAnalysisExportEN = carAnalysisExportEN;
	}



	private static ExcelExportConfig instance = null;

	public static ExcelExportConfig getInstance() {
		if (instance == null)
			instance = new ExcelExportConfig();
		return instance;
	}

	private ExcelExportConfig() {
		initData();
	}

	private void initData() {
		InputStream inputStream = null;
		Properties properties = null;
		try {
			/*inputStream = new FileInputStream(AppGlobal.EXCEL_EXPORT_PATH);
			properties = new Properties();
			properties.load(inputStream);*/

			String temp = null;
			/*if (properties.containsKey("PassCarExportCN"))
				temp = properties.getProperty("PassCarExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				PassCarExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("PassCarExportEN"))
				temp = properties.getProperty("PassCarExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				PassCarExportEN = temp;
			}

			temp = null;
			if (properties.containsKey("VioExportCN"))
				temp = properties.getProperty("VioExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("VioExportEN"))
				temp = properties.getProperty("VioExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioExportEN = temp;
			}

			
			 * temp = null; if (properties.containsKey("StatusExportCN")) temp =
			 * properties.getProperty("StatusExportCN"); if
			 * (!StringHelper.isNullOrEmpty(temp)) { StatusExportCN = temp; }
			 * 
			 * temp = null; if (properties.containsKey("StatusExportEN")) temp =
			 * properties.getProperty("StatusExportEN"); if
			 * (!StringHelper.isNullOrEmpty(temp)) { StatusExportEN = temp; }
			 
			temp = null;
			if (properties.containsKey("VioByTimeExportCN"))
				temp = properties.getProperty("VioByTimeExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioByTimeExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("VioByTimeExportEN"))
				temp = properties.getProperty("VioByTimeExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioByTimeExportEN = temp;
			}
			temp = null;
			if (properties.containsKey("VioByAddressExportCN"))
				temp = properties.getProperty("VioByAddressExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioByAddressExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("VioByAddressExportEN"))
				temp = properties.getProperty("VioByAddressExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioByAddressExportEN = temp;
			}
			temp = null;
			if (properties.containsKey("VioByStatsCodeOrRoadExportCN"))
				temp = properties.getProperty("VioByStatsCodeOrRoadExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioByStatsCodeOrRoadExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("VioByStatsCodeOrRoadExportEN"))
				temp = properties.getProperty("VioByStatsCodeOrRoadExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioByStatsCodeOrRoadExportEN = temp;
			}
			
			
			
			
			
			
			temp = null;
			if (properties.containsKey("CarAnalysisExportCN"))
				temp = properties.getProperty("CarAnalysisExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				CarAnalysisExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("CarAnalysisExportEN"))
				temp = properties.getProperty("CarAnalysisExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				CarAnalysisExportEN = temp;
			}
			
			temp = null;
			if (properties.containsKey("VioStatsCodeOrRoadExportCN"))
				temp = properties.getProperty("VioStatsCodeOrRoadExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioStatsCodeOrRoadExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("VioStatsCodeOrRoadExportEN"))
				temp = properties.getProperty("VioStatsCodeOrRoadExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioStatsCodeOrRoadExportEN = temp;
			}
			temp = null;
			if (properties.containsKey("VioStatsCodeOrRoadExportEN"))
				temp = properties.getProperty("VioStatsCodeOrRoadExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioStatsCodeOrRoadExportEN = temp;
			}

			temp = null;
			if (properties.containsKey("VioTimeExportCN"))
				temp = properties.getProperty("VioTimeExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioTimeExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("VioTimeExportEN"))
				temp = properties.getProperty("VioTimeExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioTimeExportEN = temp;
			}

			temp = null;
			if (properties.containsKey("VioAddressExportCN"))
				temp = properties.getProperty("VioAddressExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VioAddressExportCN = temp;
			}
			temp = null;
			if (properties.containsKey("VehicleTotalAnalysisExportCN"))
				temp = properties.getProperty("VehicleTotalAnalysisExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VehicleTotalAnalysisExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("VehicleTotalAnalysisExportEN"))
				temp = properties.getProperty("VehicleTypeAnalysisExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VehicleTypeAnalysisExportEN = temp;
			}

			temp = null;
			if (properties.containsKey("VehicleTypeAnalysisExportCN"))
				temp = properties.getProperty("VehicleTypeAnalysisExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VehicleTypeAnalysisExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("VehicleTypeAnalysisExportEN"))
				temp = properties.getProperty("VehicleTypeAnalysisExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				VehicleTypeAnalysisExportEN = temp;
			}

			temp = null;
			if (properties.containsKey("GisMarkExportCN"))
				temp = properties.getProperty("GisMarkExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				GisMarkExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("GisMarkExportEN"))
				temp = properties.getProperty("GisMarkExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				GisMarkExportEN = temp;
			}

			temp = null;
			if (properties.containsKey("LogExportCN"))
				temp = properties.getProperty("LogExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				LogExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("LogExportEN"))
				temp = properties.getProperty("LogExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				LogExportEN = temp;
			}

			temp = null;
			if (properties.containsKey("IssueExportCN"))
				temp = properties.getProperty("IssueExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				IssueExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("IssueExportEN"))
				temp = properties.getProperty("IssueExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				IssueExportEN = temp;
			}

			temp = null;
			if (properties.containsKey("DutyExportCN"))
				temp = properties.getProperty("DutyExportCN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				DutyExportCN = temp;
			}

			temp = null;
			if (properties.containsKey("DutyExportEN"))
				temp = properties.getProperty("DutyExportEN");
			if (!StringHelper.isNullOrEmpty(temp)) {
				DutyExportEN = temp;
			}*/

		} catch (Exception e) {
			// ConsoleOutputFormat.PrintErrorLog(logger, e, "Initialize ExcelExportconfig exception: %s", e.getMessage());
			instance = null;
		} finally {
			try {
				if (inputStream != null)
					inputStream.close();
				if (properties != null)
					properties.clear();
			} catch (IOException e) {
				e.printStackTrace();
			}
			inputStream = null;
			properties = null;
		}
	}

	public String getVioExportCN() {
		return VioExportCN;
	}

	public void setVioExportCN(String vioExportCN) {
		VioExportCN = vioExportCN;
	}

	public String getVioExportEN() {
		return VioExportEN;
	}

	public void setVioExportEN(String vioExportEN) {
		VioExportEN = vioExportEN;
	}

	public String getStatusExportCN() {
		return StatusExportCN;
	}

	public void setStatusExportCN(String statusExportCN) {
		StatusExportCN = statusExportCN;
	}

	public String getStatusExportEN() {
		return StatusExportEN;
	}

	public void setStatusExportEN(String statusExportEN) {
		StatusExportEN = statusExportEN;
	}

	public String getGisMarkExportCN() {
		return GisMarkExportCN;
	}

	public void setGisMarkExportCN(String gisMarkExportCN) {
		GisMarkExportCN = gisMarkExportCN;
	}

	public String getGisMarkExportEN() {
		return GisMarkExportEN;
	}

	public void setGisMarkExportEN(String gisMarkExportEN) {
		GisMarkExportEN = gisMarkExportEN;
	}

	public String getLogExportCN() {
		return LogExportCN;
	}

	public void setLogExportCN(String logExportCN) {
		LogExportCN = logExportCN;
	}

	public String getLogExportEN() {
		return LogExportEN;
	}

	public void setLogExportEN(String logExportEN) {
		LogExportEN = logExportEN;
	}

	public String getIssueExportCN() {
		return IssueExportCN;
	}

	public void setIssueExportCN(String issueExportCN) {
		IssueExportCN = issueExportCN;
	}

	public String getIssueExportEN() {
		return IssueExportEN;
	}

	public void setIssueExportEN(String issueExportEN) {
		IssueExportEN = issueExportEN;
	}

	public String getDutyExportCN() {
		return DutyExportCN;
	}

	public void setDutyExportCN(String dutyExportCN) {
		DutyExportCN = dutyExportCN;
	}

	public String getDutyExportEN() {
		return DutyExportEN;
	}

	public void setDutyExportEN(String dutyExportEN) {
		DutyExportEN = dutyExportEN;
	}

	public String getVehicleExportCN() {
		return VehicleExportCN;
	}

	public String getVehicleExportCNImg() {
		return VehicleExportCNImg;
	}

	public void setVehicleExportCNImg(String vehicleExportCNImg) {
		VehicleExportCNImg = vehicleExportCNImg;
	}

	public String getVehicleExportENImg() {
		return VehicleExportENImg;
	}

	public void setVehicleExportENImg(String vehicleExportENImg) {
		VehicleExportENImg = vehicleExportENImg;
	}

	public void setVehicleExportCN(String vehicleExportCN) {
		VehicleExportCN = vehicleExportCN;
	}

	public String getVehicleExportEN() {
		return VehicleExportEN;
	}

	public void setVehicleExportEN(String vehicleExportEN) {
		VehicleExportEN = vehicleExportEN;
	}

	public String getControlCenterExportCN() {
		return ControlCenterExportCN;
	}

	public void setControlCenterExportCN(String controlCenterExportCN) {
		ControlCenterExportCN = controlCenterExportCN;
	}

	public String getControlCenterExportEN() {
		return ControlCenterExportEN;
	}

	public void setControlCenterExportEN(String controlCenterExportEN) {
		ControlCenterExportEN = controlCenterExportEN;
	}

	public String getControlAreaExportCN() {
		return ControlAreaExportCN;
	}

	public void setControlAreaExportCN(String controlAreaExportCN) {
		ControlAreaExportCN = controlAreaExportCN;
	}

	public String getControlAreaExportEN() {
		return ControlAreaExportEN;
	}

	public void setControlAreaExportEN(String controlAreaExportEN) {
		ControlAreaExportEN = controlAreaExportEN;
	}

	public String getRoadExportCN() {
		return RoadExportCN;
	}

	public void setRoadExportCN(String roadExportCN) {
		RoadExportCN = roadExportCN;
	}

	public String getRoadExportEN() {
		return RoadExportEN;
	}

	public void setRoadExportEN(String roadExportEN) {
		RoadExportEN = roadExportEN;
	}

	public String getLanExportCN() {
		return LanExportCN;
	}

	public void setLanExportCN(String lanExportCN) {
		LanExportCN = lanExportCN;
	}

	public String getLanExportEN() {
		return LanExportEN;
	}

	public void setLanExportEN(String lanExportEN) {
		LanExportEN = lanExportEN;
	}

	public String getDeviceExportCN() {
		return DeviceExportCN;
	}

	public void setDeviceExportCN(String deviceExportCN) {
		DeviceExportCN = deviceExportCN;
	}

	public String getDeviceExportEN() {
		return DeviceExportEN;
	}

	public void setDeviceExportEN(String deviceExportEN) {
		DeviceExportEN = deviceExportEN;
	}

	public String getAlarmExportCN() {
		return AlarmExportCN;
	}

	public void setAlarmExportCN(String alarmExportCN) {
		AlarmExportCN = alarmExportCN;
	}

	public String getAlarmExportEN() {
		return AlarmExportEN;
	}

	public void setAlarmExportEN(String alarmExportEN) {
		AlarmExportEN = alarmExportEN;
	}

	public String getEmergencyExportCN() {
		return EmergencyExportCN;
	}

	public void setEmergencyExportCN(String emergencyExportCN) {
		EmergencyExportCN = emergencyExportCN;
	}

	public String getEmergencyExportEN() {
		return EmergencyExportEN;
	}

	public String getFlowExportCN() {
		return FlowExportCN;
	}

	public void setFlowExportCN(String flowExportCN) {
		FlowExportCN = flowExportCN;
	}

	public String getFlowExportEN() {
		return FlowExportEN;
	}

	public void setFlowExportEN(String flowExportEN) {
		FlowExportEN = flowExportEN;
	}

	public void setEmergencyExportEN(String emergencyExportEN) {
		EmergencyExportEN = emergencyExportEN;
	}

	public String getRoadTrafficFluxExportCN() {
		return RoadTrafficFluxExportCN;
	}

	public void setRoadTrafficFluxExportCN(String roadTrafficFluxExportCN) {
		RoadTrafficFluxExportCN = roadTrafficFluxExportCN;
	}

	public String getRoadTrafficFluxExportEN() {
		return RoadTrafficFluxExportEN;
	}

	public void setRoadTrafficFluxExportEN(String roadTrafficFluxExportEN) {
		RoadTrafficFluxExportEN = roadTrafficFluxExportEN;
	}

	public String getRoadFlowExportCN() {
		return RoadFlowExportCN;
	}

	public void setRoadFlowExportCN(String roadFlowExportCN) {
		RoadFlowExportCN = roadFlowExportCN;
	}

	public String getRoadFlowExportEN() {
		return RoadFlowExportEN;
	}

	public void setRoadFlowExportEN(String roadFlowExportEN) {
		RoadFlowExportEN = roadFlowExportEN;
	}

	public String getDetectorExportCN() {
		return DetectorExportCN;
	}

	public void setDetectorExportCN(String detectorExportCN) {
		DetectorExportCN = detectorExportCN;
	}

	public String getDetectorExportEN() {
		return DetectorExportEN;
	}

	public void setDetectorExportEN(String detectorExportEN) {
		DetectorExportEN = detectorExportEN;
	}

	public String getDeckExportCN() {
		return DeckExportCN;
	}

	public void setDeckExportCN(String deckExportCN) {
		DeckExportCN = deckExportCN;
	}

	public String getDeckExportEN() {
		return DeckExportEN;
	}

	public void setDeckExportEN(String deckExportEN) {
		DeckExportEN = deckExportEN;
	}

	public String getTrafficFlowExportCN() {
		return TrafficFlowExportCN;
	}

	public void setTrafficFlowExportCN(String trafficFlowExportCN) {
		TrafficFlowExportCN = trafficFlowExportCN;
	}

	public String getTrafficFlowExportEN() {
		return TrafficFlowExportEN;
	}

	public void setTrafficFlowExportEN(String trafficFlowExportEN) {
		TrafficFlowExportEN = trafficFlowExportEN;
	}

	public String getExamineCN() {
		return examineCN;
	}

	public void setExamineCN(String examineCN) {
		this.examineCN = examineCN;
	}

	public String getExamineEN() {
		return examineEN;
	}

	public void setExamineEN(String examineEN) {
		this.examineEN = examineEN;
	}

	public String getAuditingCN() {
		return auditingCN;
	}

	public void setAuditingCN(String auditingCN) {
		this.auditingCN = auditingCN;
	}

	public String getAuditingEN() {
		return auditingEN;
	}

	public void setAuditingEN(String auditingEN) {
		this.auditingEN = auditingEN;
	}

	public String getVioByTimeExportCN() {
		return VioByTimeExportCN;
	}

	public void setVioByTimeExportCN(String vioByTimeExportCN) {
		VioByTimeExportCN = vioByTimeExportCN;
	}

	public String getVioByTimeExportEN() {
		return VioByTimeExportEN;
	}

	public void setVioByTimeExportEN(String vioByTimeExportEN) {
		VioByTimeExportEN = vioByTimeExportEN;
	}

	public String getVioByAddressExportCN() {
		return VioByAddressExportCN;
	}

	public void setVioByAddressExportCN(String vioByAddressExportCN) {
		VioByAddressExportCN = vioByAddressExportCN;
	}

	public String getVioByAddressExportEN() {
		return VioByAddressExportEN;
	}

	public void setVioByAddressExportEN(String vioByAddressExportEN) {
		VioByAddressExportEN = vioByAddressExportEN;
	}

	public String getVioByStatsCodeOrRoadExportCN() {
		return VioByStatsCodeOrRoadExportCN;
	}

	public void setVioByStatsCodeOrRoadExportCN(String vioByStatsCodeOrRoadExportCN) {
		VioByStatsCodeOrRoadExportCN = vioByStatsCodeOrRoadExportCN;
	}

	public String getVioByStatsCodeOrRoadExportEN() {
		return VioByStatsCodeOrRoadExportEN;
	}

	public void setVioByStatsCodeOrRoadExportEN(String vioByStatsCodeOrRoadExportEN) {
		VioByStatsCodeOrRoadExportEN = vioByStatsCodeOrRoadExportEN;
	}

	
}
