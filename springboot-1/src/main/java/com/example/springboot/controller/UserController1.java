package com.example.springboot.controller;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.CallableStatementCreator;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.springboot.model.SysUser;
import com.example.springboot.service.UserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


@Api(value = "用户相关操作")
@RestController
@RequestMapping("/api/test")
public class UserController1 {

	
	/**
	 @Api：修饰整个类，描述Controller的作用
@ApiOperation：描述一个类的一个方法，或者说一个接口
@ApiParam：单个参数描述
@ApiModel：用对象来接收参数
@ApiProperty：用对象接收参数时，描述对象的一个字段
	 */
	/*
	 * @Autowired UserMapper userMapper;
	 */
	
	@Autowired 
	UserService  userService ;
	

    @Autowired
    private JdbcTemplate jdbcTemplate;

	/*
	 * @RequestMapping(value={"/selectUserById"}, method=RequestMethod.GET) public
	 * User selectUserById(String id){ System.out.println("ssssssssssssssssssss");
	 * User user = userMapper.selectUserById(Integer.parseInt(id)); return user; }
	 * 
	 * @RequestMapping(value={"/selectUserByName"}, method=RequestMethod.GET) public
	 * List<User> selectUserByName(String userName){ return
	 * userMapper.selectUserByName(userName); }
	 * 
	 * @RequestMapping(value={"/addUser"}, method=RequestMethod.POST) public void
	 * addUser(User user){ userMapper.addUser(user); }
	 * 
	 * @RequestMapping(value={"/updateUser"}, method=RequestMethod.POST) public void
	 * updateUser(User user){ userMapper.updateUser(user); }
	 * 
	 * @RequestMapping(value={"/deleteUser"}, method=RequestMethod.POST) public void
	 * deleteUser(String id){ userMapper.deleteUser(Integer.parseInt(id)); }
	 */
    @ApiOperation(value = "查询接口",notes="用户列表查询")
    @RequestMapping(value={"/user/list"}, method=RequestMethod.GET)
    public List<SysUser> getUserList(){
    	return userService.selectUserList();
    }
    
    @RequestMapping(value={"/user/all"}, method=RequestMethod.GET)
    public List<Map<String,Object>> getUserAll(){
		String sql = "select *  from user ";
		return jdbcTemplate.queryForList(sql) ;
    }
/**
  String param2Value = (String) jdbcTemplate.execute( 
     new CallableStatementCreator() { 
        public CallableStatement createCallableStatement(Connection con) throws SQLException { 
           String storedProc = "{call sp_select_table (?,?)}";// 调用的sql 
           CallableStatement cs = con.prepareCall(storedProc); 
           cs.setString(1, "p1");// 设置输入参数的值 
           cs.registerOutParameter(2,OracleTypes.Varchar);// 注册输出参数的类型 
           return cs; 
        } 
     }, new CallableStatementCallback() { 
         public Object doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException { 
           cs.execute(); 
           return cs.getString(2);// 获取输出参数的值 
     } 
  });

 */
    
    @RequestMapping(value={"/user/proess"}, method=RequestMethod.GET)
    //@ApiParam(name="sex",value="性别")
    public int getUserCount(){
    	@SuppressWarnings({ "unchecked", "unused" })
		String param2Value = (String) jdbcTemplate.execute( 
				
    		     new CallableStatementCreator() { 
    		        public CallableStatement createCallableStatement(Connection con) throws SQLException { 
    		           String storedProc = "{call user_count (?,?)}";// 调用的sql 
    		           CallableStatement cs = con.prepareCall(storedProc); 
    		           cs.setString(1, "1");// 设置输入参数的值 
    		           cs.registerOutParameter(2,Types.VARCHAR);// 注册输出参数的类型
    		           return cs; 
    		        } 
    		     }, new CallableStatementCallback<Object>() { 
    		         public Object doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException { 
    		           cs.execute(); 
    		           return cs.getString(2);// 获取输出参数的值 
    		     } 
    		  });
    	
    	System.out.println(param2Value);
    	return param2Value == null ? 0 : Integer.parseInt(param2Value);
    }
    
    
    
    @RequestMapping(value={"/user/pro"}, method=RequestMethod.GET)
    public List getPro(){
    	@SuppressWarnings({ "unchecked", "unused", "rawtypes" })
    	List<Map<Object, Object>> resultsMap = new ArrayList(); 
    	List list = (List) jdbcTemplate.execute( 
    		     new CallableStatementCreator() { 
    		        public CallableStatement createCallableStatement(Connection con) throws SQLException { 
    		           String storedProc = "{call sp_name ()}";// 调用的sql 
    		           CallableStatement cs = con.prepareCall(storedProc); 
    		          // cs.setString(1, "1");// 设置输入参数的值 
    		          // cs.registerOutParameter(1,Types.VARCHAR);// 注册输出参数的类型 
    		           return cs; 
    		        } 
    		     }, new CallableStatementCallback<Object>() { 
    		         public Object doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException { 	
    		        	  boolean flag =  cs.execute(); 
    		           //ResultSet rs = (ResultSet) cs.getObject(1);
    		           while (flag) {
    		        	   ResultSet rs = cs.getResultSet();
    		           while (rs.next()) {// 转换每行的返回值到Map中  User
						Map<Object,Object> rowMap = new HashMap<Object, Object>(); 
    		               rowMap.put("id", rs.getInt("id")); 
    		               rowMap.put("userage", rs.getInt("userage")); 
    		               rowMap.put("username", rs.getString("username")); 
    		               rowMap.put("useraddress", rs.getString("useraddress")); 
						resultsMap.add(rowMap); 
    		            }
    		           flag = cs.getMoreResults(); // 检查是否存在更多结果集
    		         }
    		           return resultsMap;// 获取输出参数的值 
    		     } 
    		  });
    	
    	System.out.println(list);
    	return resultsMap;
    }
    
    @RequestMapping(value={"/user/insert"}, method=RequestMethod.GET)
    public void insertUser(){
    	try {
    		SysUser user = new SysUser() ;
    		user.setUserId("10001");
    		user.setUsername("bbbb");
    		userService.insertUser(user);
    		// int a = 1 / 0 ;
		} catch (Exception e) {
			/*.error(String.format("Method vioLocation/checkCode exception: %s", e.getMessage()), e);*/
		}
    }
    
    
    
    // excel  start 
    
	
	/**
	 * 流量设备管理导出Excel
	 * @param request
	 * @param response
	 * @param ps
	 * @param bean
	 * @param language
	 * @return
	 */
	/*@ResponseBody
	@RequestMapping(value = { "/export" }, method = { RequestMethod.GET })
	public BaseResponseInfo fluxtDeviceExport(HttpServletRequest request, HttpServletResponse response,  String language) {
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Consts.SESSION_ATTRIBUTE_USER);
		try {
			session.setAttribute(Consts.DUTY_EXPORT, "10");
			List<User> userList = userService.selectUserList();
			session.setAttribute(Consts.DUTY_EXPORT, "30");
			List<Map<String, Object>> alarmList = userService.createExceldata(userList);
			session.setAttribute(Consts.DUTY_EXPORT, "50");
			String columnNames[] = { "名称", "设备类型", "设备编码", "IP地址", "端口", "所属路段", "所属方向" };// 列名
			String keys[] = { "Name", "DeviceType", "Code", "IpAddress", "Port", "RoadName", "Direction" };// map中的key
			if (!StringHelper.isNullOrEmpty(language)) {
				if (language.equals(LanguageType.CN.name().toString()))
					columnNames = ExcelExportConfig.getInstance().getFluxDeviceExportCN().split(",");
				else if (language.equals(LanguageType.EN.toString()))
					columnNames = ExcelExportConfig.getInstance().getFluxDeviceExportEN().split(",");
			} else {
				columnNames = ExcelExportConfig.getInstance().getFluxDeviceExportCN().split(",");
			}
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			try {
				ExcelUtil.createWorkBook(alarmList, keys, columnNames).write(os);
			} catch (IOException e) {
				e.printStackTrace();
			}
			session.setAttribute(Consts.DUTY_EXPORT, "90");
			byte[] content = os.toByteArray();
			InputStream is = new ByteArrayInputStream(content);
			// 设置response参数，可以打开下载页面
			response.reset();
			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Pragma", "public");
			response.setHeader("Content-Disposition", "attachment;filename=" + new String(("fluxtDevice_" + dateFormat.format(new Date()) + ".xls").getBytes(), "iso-8859-1"));
			ServletOutputStream out = response.getOutputStream();

			bis = new BufferedInputStream(is);
			bos = new BufferedOutputStream(out);                                  
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
			session.setAttribute(Consts.DUTY_EXPORT, "100");
		} catch (Exception e) {
			session.setAttribute(Consts.DUTY_EXPORT, "500");
			logger.error(String.format("Method fluxtDevice/export exception: %s", e.getMessage()), e);
		} finally {
			if (bis != null)
				try {
					bis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			if (bos != null)
				try {
					bos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		return null;
	}

	*//**
	 * 流量设备管理Excel导出进度
	 * 
	 * @param request
	 * @param response
	 * @return
	 *//*
	@ResponseBody
	@RequestMapping(value = { "/exportRate" }, method = { RequestMethod.GET })
	public BaseResponseInfo fluxtDeviceExportRate(HttpServletRequest request, HttpServletResponse response) {
		BaseResponseInfo info = new BaseResponseInfo();
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute(Consts.SESSION_ATTRIBUTE_USER);
			Map<String, String> result = new HashMap<String, String>();
			String rate = session.getAttribute(Consts.DUTY_EXPORT).toString();
			if ( null != rate && rate != "" )
				rate = null;
			result.put("rate", rate);
			info.data = result;
			info.code = 200;
		} catch (Exception e) {
			logger.error(String.format("Method fluxtDevice/export exception: %s", e.getMessage()), e);
		}
		return info;
	}
    
    
	
	
	*//**
	 * @param request
	 * @param file
	 * @return
	 *//*
	@ResponseBody
	@RequestMapping(value = { "/import" }, method = { RequestMethod.POST })
	public BaseResponseInfo importVioLocationInfo(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
		BaseResponseInfo info = new BaseResponseInfo();
		boolean isEmpty = false;
		try {
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
			if (multipartResolver.isMultipart(request)) {
				Workbook workbook = null;
				try {
					workbook = new XSSFWorkbook(file.getInputStream());
				} catch (Exception e) {
					workbook = (Workbook) new HSSFWorkbook(file.getInputStream());
				}
				Sheet sheet = workbook.getSheetAt(0);
				for (int i = 1; sheet.getLastRowNum() >= i; i++) {
					Row row = sheet.getRow(i);
					if (POIUtil.isRowEmpty(row)) {
						isEmpty = true;
						break;
					}
					VioLocation vioLocation = new VioLocation();
					// 编号
					vioLocation.setID(UuidHelper.getRandomString());
					// 地点名称
					String name = POIUtil.getCellValue(row, 0);
					// 地点编码
					String code = POIUtil.getCellValue(row, 1);
					// 设备编号
					vioLocation.setSbbh(POIUtil.getCellValue(row, 2));
					// 所属区域ID
					vioLocation.setOrgUnitID(POIUtil.getCellValue(row, 3));
					// 行政区划代码
					String xzqf = POIUtil.getCellValue(row, 4);
					// 违法地点代码，5位
					String wfdd = POIUtil.getCellValue(row, 5);
					// 路段代码公里数，4位
					String lddm = POIUtil.getCellValue(row, 6);
					// 地点米数，3位
					String ddms = POIUtil.getCellValue(row, 7);
					// 大车限速
					String largeVehicleLimitSpeed = POIUtil.getCellValue(row, 8);
					// 小车限速
					String smallVehicleLimitSpeed = POIUtil.getCellValue(row, 9);
					// 是否上传
					String IsUpload = POIUtil.getCellValue(row, 10);
					String vioCodes = POIUtil.getCellValue(row, 11) ;
					if (StringHelper.isNullOrEmpty(name)) {
						info.code = CommonErrorCode.ParamError.getValue();
						return info;
					}
					vioLocation.setName(name);
					
					if (StringHelper.isNullOrEmpty(code)) {
						info.code = CommonErrorCode.ParamError.getValue();
						return info;
					}
					VioLocation  record = new VioLocation() ;
					record.setCode(code);
					boolean flag = this.vioLocationService.checkCode(record);
					if(flag){
						info.code = CommonErrorCode.ParamError.getValue();
						return info;
					}
					vioLocation.setCode(code);
					if (StringHelper.isNullOrEmpty(xzqf)) {
						info.code = CommonErrorCode.ParamError.getValue();
						return info;
					}
					
					vioLocation.setXzqh(xzqf);
	
					if (StringHelper.isNotEmpty(wfdd)){
						vioLocation.setWfdd(wfdd);
					}
					
					if (StringHelper.isNotEmpty(lddm)) {
						vioLocation.setLddm(lddm);
					}

					if (StringHelper.isNotEmpty(ddms)) {
						vioLocation.setDdms(ddms);
					}
					
					if (StringHelper.isNotEmpty(largeVehicleLimitSpeed)) {
						vioLocation.setLargeVehicleLimitSpeed(Integer.parseInt(largeVehicleLimitSpeed));
					}
				
					if (StringHelper.isNotEmpty(smallVehicleLimitSpeed)) {
						vioLocation.setSmallVehicleLimitSpeed(Integer.parseInt(smallVehicleLimitSpeed));
					}
					
					if (StringHelper.isNotEmpty(IsUpload)) {
						if (IsUpload.equals("是")){
							vioLocation.setIsDirectUpload(true);
							if (StringHelper.isNotEmpty(vioCodes)) {
								String[] arr = vioCodes.split(",");
								String string = StrToArray.getStrToArr(arr);
								vioLocation.setVioCodes(string);
							}else{
								info.code = CommonErrorCode.ParamError.getValue();
								return info;
							}
						}else{
							vioLocation.setIsDirectUpload(false);
						}
					}		
					vioLocation.setOrderNo(vioLocationService.getMaxOrderNo()+1);
					this.vioLocationService.insert(vioLocation);
				}
			}
			info.code = 200;
			if (isEmpty)
				info.data = "empty";
			else
				info.data = true;
		} catch (Exception e) {
			//ConsoleOutputFormat.PrintErrorLog(logger, e, "Method vioLocation/importVioLocationInfo exception: %s", e.getMessage());
			info.code = 500;
		}
		return info;
	}*/

	
	
    // end
    
    
}
