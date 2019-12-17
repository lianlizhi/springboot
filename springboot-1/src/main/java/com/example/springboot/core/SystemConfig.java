package com.example.springboot.core;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.example.springboot.consts.Consts;

public class SystemConfig {


	// 项目名称，每个项目固定名称，供客户端匹配用。茂名：Maoming；邹城：Zoucheng
	private String projectName = "Maoming";

	// 本地服务器IP和端口
	private String serverAddress;
	private int serverPort;

	// ActiveMQ服务器IP和端口(服务器内部消息转发)
	private String activeMqAddress = "127.0.0.1";
	private int activeMqPort = 61616;

	// 是否启用kafka订阅（因存在双网部署的项目，如茂名项目，在公安网无需订阅kafka获取违法数据，违法数据从视频网同步进来，故加此参数）
	boolean isEnableKafka = false;
	// kafka地址，如192.168.1.165:9092,192.168.1.162:9092,192.168.1.163:9092
	private String kafkaBroker;
	// kafka违法数据主题
	private String kafkaVioTopic = "bdm_wfjlout";
	// kafka分组ID
	private String kafkaGroupID;
	// 是否传统的违法数据模式，true：传统，违法数据与卡口数据共用卡口、车道等基础配置；false：非传统，违法数据使用独立的违法地点配置。默认true
	private boolean isTraditionalVioMode = true;

	// Redis服务器IP和端口(缓存服务器)
	private String redisServerAddress = "127.0.0.1";
	private int redisServerPort = 6379;

	// 消息服务器服务器IP和端口(与web客户端交互)
	private String msgServerAddress = "127.0.0.1";
	private int msgServerPort = 8090;
	private int msgServerSslPort = 8443;

	// 业务FTP地址和用户信息
	private String ftpServerAddress = "127.0.0.1";
	private int ftpServerPort = 21;
	private String ftpServerUser = "tic";
	private String ftpServerPassword = "tic";

	// 本地NTP监听端口
	private int ntpListenPort = 8123;
	// NTP客户端端口（NTP同步工具监听端口）
	private int ntpClientPort = 18123;

	// 路况变更消息主题
	private String mqTopicTrafficState = "traffic_state_chaged";

	// 数字证书
	private String keyStorePass = "tickey";

	// bimg上传图片url前缀 http://192.168.1.52:6551/UpLoadFile
	private String bimgUploadUrlPrefix;
	// bimg违法图片存储根目录 dest=PFS:/TIC/Violation/
	private String bimgVioUrlPrefix;
	// bimg图片url前缀 http://192.168.1.52:6551/DownLoadFile?filename=
	private String bimgFileUrlPrefix;

	// UTC是否访问大数据BDM
	private boolean utcFlowBDM = false;
	// 发送指令次数，默认2次
	private int sendNum = 2;
	// 轮询次数,默认300次
	private int pollingNum = 300;
	// 轮询次数,默认300次(港辉)
	private int pollingNumGH = 300;
	// 信号机流量限阀值
	private boolean flowThreshold = false;

	// PCC url前缀，如http://192.168.1.188:5334
	private String pccUrlPrefix;

	// 是否启用违法数据录入优先级，若启用则只录入具有优先级标签的违法数据，false: 不启用；true: 启用。默认为false
	private boolean isEnableVioPriority = false;
	// 公安网已经变更图片URL的违法数据才能做优先级设置（视频网url进入公安网后如果直接设置优先级提取违法数据，在违法处理会看不到图片，故强制只有图片url做了变更才能设置优先级）
	// 与参数IsEnableVioPriority配合使用，true: 是；false: 否。默认为false。茂名项目true
	private boolean isVioPrioritySwitchUpdatedUrl = true;
	// 是否过滤无车牌违法数据，默认false，不过滤
	private boolean isFilterNoPlateVio = false;
	// 是否过滤限行违法数据（一辆车一天只保留一条限行违法数据）
	private boolean isFilterRestrictionVio = false;
	// 是否启用违法录入/审核用户锁定限制，false: 不启用，只锁定当前查看的数据；true:
	// 启用，每个用户最多能锁定若干条数据。默认false
	private boolean isEnableVioLockLimit = false;
	// 违法录入/审核用户锁定（暂存）数量最大值，默认5
	private int vioLockThreshold = 5;

	// 首页报警消息主题
	private String mqTopicIndexAlarm = "index_alarm_info";

	private static SystemConfig instance = null;

	public static SystemConfig getInstance() {
		if (instance == null)
			instance = new SystemConfig();
		return instance;
	}

	private SystemConfig() {
		initData();
	}

	private void initData() {
		InputStream inputStream = null;
		Properties properties = null;
		try {
			inputStream = new FileInputStream(AppGlobal.SYSTEM_CONFIG_PATH);
			properties = new Properties();
			properties.load(inputStream);

			projectName = PropertiesHelper.getConfigValStr(properties, "ProjectName", "Maoming");

			serverAddress = PropertiesHelper.getConfigValStr(properties, "ServerAddress", "127.0.0.1");
			serverPort = PropertiesHelper.getConfigValInt(properties, "ServerPort", 40001);

			activeMqAddress = PropertiesHelper.getConfigValStr(properties, "ActiveMqAddress", "127.0.0.1");
			activeMqPort = PropertiesHelper.getConfigValInt(properties, "ActiveMqPort", 61616);
			
			isEnableKafka = PropertiesHelper.getConfigValBool(properties, "IsEnableKafka", false);
			kafkaBroker = PropertiesHelper.getConfigValStr(properties, "KafkaBroker", "127.0.0.1:9092");
			kafkaVioTopic = PropertiesHelper.getConfigValStr(properties, "KafkaVioTopic", "bdm_wfjlout");
			kafkaGroupID = PropertiesHelper.getConfigValStr(properties, "KafkaGroupID", "vioinfoGroupID");
			isTraditionalVioMode = PropertiesHelper.getConfigValBool(properties, "IsTraditionalVioMode", true);

			redisServerAddress = PropertiesHelper.getConfigValStr(properties, "RedisServerAddress", "127.0.0.1");
			redisServerPort = PropertiesHelper.getConfigValInt(properties, "RedisServerPort", 6379);

			msgServerAddress = PropertiesHelper.getConfigValStr(properties, "MsgServerAddress", "127.0.0.1");
			msgServerPort = PropertiesHelper.getConfigValInt(properties, "MsgServerPort", 8090);
			msgServerSslPort = PropertiesHelper.getConfigValInt(properties, "MsgServerSslPort", 8443);

			ftpServerAddress = PropertiesHelper.getConfigValStr(properties, "FtpServerAddress", "127.0.0.1");
			ftpServerPort = PropertiesHelper.getConfigValInt(properties, "FtpServerPort", 21);
			ftpServerUser = PropertiesHelper.getConfigValStr(properties, "FtpServerUser", "tic");
			ftpServerPassword = PropertiesHelper.getConfigValStr(properties, "FtpServerPassword", "tic");

			mqTopicTrafficState = PropertiesHelper.getConfigValStr(properties, "MQTopicTrafficState", "traffic_state_chaged");

			mqTopicIndexAlarm = PropertiesHelper.getConfigValStr(properties, "MQTopicIndexAlarm", "index_alarm_info");

			ntpListenPort = PropertiesHelper.getConfigValInt(properties, "NtpListenPort", 8123);
			ntpClientPort = PropertiesHelper.getConfigValInt(properties, "NtpClientPort", 18123);

			keyStorePass = PropertiesHelper.getConfigValStr(properties, "KeyStorePass", "tickey");

			String bimgHost = PropertiesHelper.getConfigValStr(properties, "BimgAddress", "127.0.0.1");
			int bimgPort = PropertiesHelper.getConfigValInt(properties, "BimgPort", 6551);
			String bimgVioRootDir = PropertiesHelper.getConfigValStr(properties, "BimgVioRootDir", "TIC/Violation");

			bimgUploadUrlPrefix = String.format(Consts.BIMG_UPLOAD_URL_PREFIX_FORMAT, bimgHost, bimgPort);
			bimgVioUrlPrefix = String.format(Consts.BIMG_VIO_URL_PREFIX_FORMAT, bimgVioRootDir);
			bimgFileUrlPrefix = String.format(Consts.BIMG_FILE_URL_PREFIX_FORMAT, bimgHost, bimgPort);

			utcFlowBDM = PropertiesHelper.getConfigValBool(properties, "UtcFlowBDM", false);
			sendNum = PropertiesHelper.getConfigValInt(properties, "SendCmdNumber", 2);
			pollingNum = PropertiesHelper.getConfigValInt(properties, "PollingNumber", 300);
			pollingNumGH = PropertiesHelper.getConfigValInt(properties, "PollingNumberGH", 300);
			flowThreshold = PropertiesHelper.getConfigValBool(properties, "FlowThreshold", false);

			String pccHost = PropertiesHelper.getConfigValStr(properties, "PccAddress", "127.0.0.1");
			int pccPort = PropertiesHelper.getConfigValInt(properties, "PccPort", 5334);
			pccUrlPrefix = String.format(Consts.PCC_URL_PREFIX_FORMAT, pccHost, pccPort);

			isEnableVioPriority = PropertiesHelper.getConfigValBool(properties, "IsEnableVioPriority", false);
			isVioPrioritySwitchUpdatedUrl = PropertiesHelper.getConfigValBool(properties, "IsVioPrioritySwitchUpdatedUrl", false);
			isFilterNoPlateVio = PropertiesHelper.getConfigValBool(properties, "IsFilterNoPlateVio", false);
			isFilterRestrictionVio = PropertiesHelper.getConfigValBool(properties, "IsFilterRestrictionVio", false);
			isEnableVioLockLimit = PropertiesHelper.getConfigValBool(properties, "IsEnableVioLockLimit", false);
			vioLockThreshold = PropertiesHelper.getConfigValInt(properties, "VioLockThreshold", 3);

		} catch (Exception e) {
		
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

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getServerAddress() {
		return serverAddress;
	}

	public void setServerAddress(String serverAddress) {
		this.serverAddress = serverAddress;
	}

	public int getServerPort() {
		return serverPort;
	}

	public void setServerPort(int serverPort) {
		this.serverPort = serverPort;
	}

	public String getActiveMqAddress() {
		return activeMqAddress;
	}

	public void setActiveMqAddress(String activeMqAddress) {
		this.activeMqAddress = activeMqAddress;
	}

	public int getActiveMqPort() {
		return activeMqPort;
	}

	public void setActiveMqPort(int activeMqPort) {
		this.activeMqPort = activeMqPort;
	}

	public boolean isEnableKafka() {
		return isEnableKafka;
	}

	public void setEnableKafka(boolean isEnableKafka) {
		this.isEnableKafka = isEnableKafka;
	}

	public String getKafkaBroker() {
		return kafkaBroker;
	}

	public void setKafkaBroker(String kafkaBroker) {
		this.kafkaBroker = kafkaBroker;
	}

	public String getKafkaVioTopic() {
		return kafkaVioTopic;
	}

	public void setKafkaVioTopic(String kafkaVioTopic) {
		this.kafkaVioTopic = kafkaVioTopic;
	}

	public String getKafkaGroupID() {
		return kafkaGroupID;
	}

	public void setKafkaGroupID(String kafkaGroupID) {
		this.kafkaGroupID = kafkaGroupID;
	}

	public boolean isTraditionalVioMode() {
		return isTraditionalVioMode;
	}

	public void setTraditionalVioMode(boolean isTraditionalVioMode) {
		this.isTraditionalVioMode = isTraditionalVioMode;
	}

	public String getRedisServerAddress() {
		return redisServerAddress;
	}

	public void setRedisServerAddress(String redisServerAddress) {
		this.redisServerAddress = redisServerAddress;
	}

	public int getRedisServerPort() {
		return redisServerPort;
	}

	public void setRedisServerPort(int redisServerPort) {
		this.redisServerPort = redisServerPort;
	}

	public String getMsgServerAddress() {
		return msgServerAddress;
	}

	public void setMsgServerAddress(String msgServerAddress) {
		this.msgServerAddress = msgServerAddress;
	}

	public int getMsgServerPort() {
		return msgServerPort;
	}

	public void setMsgServerPort(int msgServerPort) {
		this.msgServerPort = msgServerPort;
	}

	public int getMsgServerSslPort() {
		return msgServerSslPort;
	}

	public void setMsgServerSslPort(int msgServerSslPort) {
		this.msgServerSslPort = msgServerSslPort;
	}

	public String getFtpServerAddress() {
		return ftpServerAddress;
	}

	public void setFtpServerAddress(String ftpServerAddress) {
		this.ftpServerAddress = ftpServerAddress;
	}

	public int getFtpServerPort() {
		return ftpServerPort;
	}

	public void setFtpServerPort(int ftpServerPort) {
		this.ftpServerPort = ftpServerPort;
	}

	public String getFtpServerUser() {
		return ftpServerUser;
	}

	public void setFtpServerUser(String ftpServerUser) {
		this.ftpServerUser = ftpServerUser;
	}

	public String getFtpServerPassword() {
		return ftpServerPassword;
	}

	public void setFtpServerPassword(String ftpServerPassword) {
		this.ftpServerPassword = ftpServerPassword;
	}

	public int getNtpListenPort() {
		return ntpListenPort;
	}

	public void setNtpListenPort(int ntpListenPort) {
		this.ntpListenPort = ntpListenPort;
	}

	public int getNtpClientPort() {
		return ntpClientPort;
	}

	public void setNtpClientPort(int ntpClientPort) {
		this.ntpClientPort = ntpClientPort;
	}

	public String getMqTopicTrafficState() {
		return mqTopicTrafficState;
	}

	public void setMqTopicTrafficState(String mqTopicTrafficState) {
		this.mqTopicTrafficState = mqTopicTrafficState;
	}

	public String getKeyStorePass() {
		return keyStorePass;
	}

	public void setKeyStorePass(String keyStorePass) {
		this.keyStorePass = keyStorePass;
	}

	public String getBimgUploadUrlPrefix() {
		return bimgUploadUrlPrefix;
	}

	public void setBimgUploadUrlPrefix(String bimgUploadUrlPrefix) {
		this.bimgUploadUrlPrefix = bimgUploadUrlPrefix;
	}

	public String getBimgVioUrlPrefix() {
		return bimgVioUrlPrefix;
	}

	public void setBimgVioUrlPrefix(String bimgVioUrlPrefix) {
		this.bimgVioUrlPrefix = bimgVioUrlPrefix;
	}

	public String getBimgFileUrlPrefix() {
		return bimgFileUrlPrefix;
	}

	public void setBimgFileUrlPrefix(String bimgFileUrlPrefix) {
		this.bimgFileUrlPrefix = bimgFileUrlPrefix;
	}

	public boolean isUtcFlowBDM() {
		return utcFlowBDM;
	}

	public void setUtcFlowBDM(boolean utcFlowBDM) {
		this.utcFlowBDM = utcFlowBDM;
	}

	public int getSendNum() {
		return sendNum;
	}

	public void setSendNum(int sendNum) {
		this.sendNum = sendNum;
	}

	public int getPollingNum() {
		return pollingNum;
	}

	public void setPollingNum(int pollingNum) {
		this.pollingNum = pollingNum;
	}

	public int getPollingNumGH() {
		return pollingNumGH;
	}

	public void setPollingNumGH(int pollingNumGH) {
		this.pollingNumGH = pollingNumGH;
	}

	public boolean isFlowThreshold() {
		return flowThreshold;
	}

	public void setFlowThreshold(boolean flowThreshold) {
		this.flowThreshold = flowThreshold;
	}

	public String getPccUrlPrefix() {
		return pccUrlPrefix;
	}

	public void setPccUrlPrefix(String pccUrlPrefix) {
		this.pccUrlPrefix = pccUrlPrefix;
	}

	public boolean isFilterNoPlateVio() {
		return isFilterNoPlateVio;
	}

	public void setFilterNoPlateVio(boolean isFilterNoPlateVio) {
		this.isFilterNoPlateVio = isFilterNoPlateVio;
	}

	public boolean isFilterRestrictionVio() {
		return isFilterRestrictionVio;
	}

	public void setFilterRestrictionVio(boolean isFilterRestrictionVio) {
		this.isFilterRestrictionVio = isFilterRestrictionVio;
	}

	public boolean isEnableVioPriority() {
		return isEnableVioPriority;
	}

	public void setEnableVioPriority(boolean isEnableVioPriority) {
		this.isEnableVioPriority = isEnableVioPriority;
	}

	public boolean isVioPrioritySwitchUpdatedUrl() {
		return isVioPrioritySwitchUpdatedUrl;
	}

	public void setVioPrioritySwitchUpdatedUrl(boolean isVioPrioritySwitchUpdatedUrl) {
		this.isVioPrioritySwitchUpdatedUrl = isVioPrioritySwitchUpdatedUrl;
	}

	public boolean isEnableVioLockLimit() {
		return isEnableVioLockLimit;
	}

	public void setEnableVioLockLimit(boolean isEnableVioLockLimit) {
		this.isEnableVioLockLimit = isEnableVioLockLimit;
	}

	public int getVioLockThreshold() {
		return vioLockThreshold;
	}

	public void setVioLockThreshold(int vioLockThreshold) {
		this.vioLockThreshold = vioLockThreshold;
	}

	public String getMqTopicIndexAlarm() {
		return mqTopicIndexAlarm;
	}

	public void setMqTopicIndexAlarm(String mqTopicIndexAlarm) {
		this.mqTopicIndexAlarm = mqTopicIndexAlarm;
	}

}
