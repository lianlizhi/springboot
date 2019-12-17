package com.example.springboot.consts;

import java.awt.Color;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.EscherGraphics;
import org.apache.poi.hssf.usermodel.EscherGraphics2d;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFShapeGroup;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFCellUtil;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Hyperlink;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.RegionUtil;
import org.springframework.core.annotation.Order;

/**
 * 导出Excel文档工具类
 */


@Order(2)
public class ExcelUtil {

	/**
	 * 
	 * @param list
	 * @param keys
	 * @param columnNames
	 * @return
	 */
	public static Workbook createWorkBook(List<Map<String, Object>> list, String[] keys, String columnNames[]) {
		// 创建excel工作簿
		Workbook wb = new HSSFWorkbook();
		// 创建第一个sheet（页），并命名
		Sheet sheet = wb.createSheet(list.get(0).get("sheetName").toString());
		// 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。
		for (int i = 0; i < keys.length; i++) {
			if (i == 0)
				sheet.setColumnWidth((short) i, (short) (67.7 * 150));
			else
				sheet.setColumnWidth((short) i, (short) (45.7 * 150));
		}

		// 创建第一行
		Row row = sheet.createRow((short) 0);

		// 创建两种单元格格式
		CellStyle cs = wb.createCellStyle();
		CellStyle cs2 = wb.createCellStyle();

		// 创建两种字体
		Font f = wb.createFont();
		Font f2 = wb.createFont();

		// 创建第一种字体样式（用于列名）
		f.setFontHeightInPoints((short) 10);
		f.setColor(IndexedColors.BLACK.getIndex());
		f.setBoldweight(Font.BOLDWEIGHT_BOLD);

		// 创建第二种字体样式（用于值）
		f2.setFontHeightInPoints((short) 10);
		f2.setColor(IndexedColors.BLACK.getIndex());

		// 设置第一种单元格的样式（用于列名）
		cs.setFont(f);
		cs.setBorderLeft(CellStyle.BORDER_THIN);
		cs.setBorderRight(CellStyle.BORDER_THIN);
		cs.setBorderTop(CellStyle.BORDER_THIN);
		cs.setBorderBottom(CellStyle.BORDER_THIN);
		cs.setAlignment(CellStyle.ALIGN_CENTER);

		cs.setFillPattern(HSSFCellStyle.BIG_SPOTS);
		cs.setFillForegroundColor(HSSFColor.YELLOW.index);
		cs.setFillBackgroundColor(HSSFColor.YELLOW.index);

		// 设置第二种单元格的样式（用于值）
		cs2.setFont(f2);
		cs2.setBorderLeft(CellStyle.BORDER_THIN);
		cs2.setBorderRight(CellStyle.BORDER_THIN);
		cs2.setBorderTop(CellStyle.BORDER_THIN);
		cs2.setBorderBottom(CellStyle.BORDER_THIN);
		cs2.setAlignment(CellStyle.ALIGN_CENTER);
		// 设置列名
		for (int i = 0; i < columnNames.length; i++) {
			Cell cell = row.createCell(i);
			cell.setCellValue(columnNames[i]);
			cell.setCellStyle(cs);
		}
		// 设置每行每列的值
		for (short i = 1; i < list.size(); i++) {
			// Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
			// 创建一行，在页sheet上
			Row row1 = sheet.createRow((short) i);
			// 在row行上创建一个方格
			for (short j = 0; j < keys.length; j++) {
				Cell cell = row1.createCell(j);
				cell.setCellValue(list.get(i).get(keys[j]) == null ? " " : list.get(i).get(keys[j]).toString());
				cell.setCellStyle(cs2);
			}
		}
		return wb;
	}


	/**
	 * 
	 * @param list
	 * @param keys
	 * @param columnNames
	 * @return
	 */
	public static Workbook createWorkBookwithLink(List<Map<String, Object>> list, String[] keys, String columnNames[]) {
		// 创建excel工作簿
		Workbook wb = new HSSFWorkbook();
		// 创建第一个sheet（页），并命名
		Sheet sheet = wb.createSheet(list.get(0).get("sheetName").toString());
		// 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。
		for (int i = 0; i < keys.length; i++) {
			sheet.setColumnWidth((short) i, (short) (35.7 * 150));
		}

		// 创建第一行
		Row row = sheet.createRow((short) 0);

		// 创建两种单元格格式
		CellStyle cs = wb.createCellStyle();
		CellStyle cs2 = wb.createCellStyle();

		// 创建两种字体
		Font f = wb.createFont();
		Font f2 = wb.createFont();

		// 创建第一种字体样式（用于列名）
		f.setFontHeightInPoints((short) 10);
		f.setColor(IndexedColors.BLACK.getIndex());
		f.setBoldweight(Font.BOLDWEIGHT_BOLD);

		// 创建第二种字体样式（用于值）
		f2.setFontHeightInPoints((short) 10);
		f2.setColor(IndexedColors.BLACK.getIndex());

		// 设置第一种单元格的样式（用于列名）
		cs.setFont(f);
		cs.setBorderLeft(CellStyle.BORDER_THIN);
		cs.setBorderRight(CellStyle.BORDER_THIN);
		cs.setBorderTop(CellStyle.BORDER_THIN);
		cs.setBorderBottom(CellStyle.BORDER_THIN);
		cs.setAlignment(CellStyle.ALIGN_CENTER);

		cs.setFillPattern(HSSFCellStyle.BIG_SPOTS);
		cs.setFillForegroundColor(HSSFColor.YELLOW.index);
		cs.setFillBackgroundColor(HSSFColor.YELLOW.index);

		// 设置第二种单元格的样式（用于值）
		cs2.setFont(f2);
		cs2.setBorderLeft(CellStyle.BORDER_THIN);
		cs2.setBorderRight(CellStyle.BORDER_THIN);
		cs2.setBorderTop(CellStyle.BORDER_THIN);
		cs2.setBorderBottom(CellStyle.BORDER_THIN);
		cs2.setAlignment(CellStyle.ALIGN_CENTER);
		// 设置列名
		for (int i = 0; i < columnNames.length; i++) {
			Cell cell = row.createCell(i);
			cell.setCellValue(columnNames[i]);
			cell.setCellStyle(cs);
		}
		// 设置每行每列的值
		for (short i = 1; i < list.size(); i++) {
			// Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
			// 创建一行，在页sheet上
			Row row1 = sheet.createRow((short) i);
			// 在row行上创建一个方格
			for (short j = 0; j < keys.length; j++) {
				// 最后一个加上文件链接字段
				if (j == keys.length - 1) {
					Cell cell = row1.createCell(j);
					cell.setCellValue(list.get(i).get(keys[j]) == null ? " " : list.get(i).get(keys[j]).toString());
					CreationHelper createHelper = wb.getCreationHelper();
					Hyperlink link = createHelper.createHyperlink(Hyperlink.LINK_URL);
					// HSSFHyperlink link = new
					// HSSFHyperlink(HSSFHyperlink.LINK_FILE);
					link.setAddress(list.get(i).get(keys[j]) == null ? " " : list.get(i).get(keys[j]).toString());
					cell.setHyperlink(link);
					cell.setCellStyle(cs2);
				} else {

					Cell cell = row1.createCell(j);
					cell.setCellValue(list.get(i).get(keys[j]) == null ? " " : list.get(i).get(keys[j]).toString());
					cell.setCellStyle(cs2);
				}

			}
		}
		return wb;
	}

	/**
	 * 
	 * @param list
	 * @param keys
	 * @param columnNames
	 * @return
	 */
	public static Workbook createWorkBook2carAnalysis(List<Map<String, Object>> list, String[] keys, String columnNames[]) {
		// 创建excel工作簿
		HSSFWorkbook wb = new HSSFWorkbook();
		// 创建第一个sheet（页），并命名
		HSSFSheet sheet = wb.createSheet(list.get(0).get("sheetName").toString());

		float PXTOPT = 0.75f;

		// 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。
		// for(int i=0;i<keys.length;i++){
		// if(i==0){
		// sheet.setColumnWidth((short) i, (short) (35.7 * 150 * 2));
		// }else{
		// sheet.setColumnWidth((short) i, (short) (35.7 * 150));
		//
		// }
		// }

		// 创建第一行
		HSSFRow row = sheet.createRow((short) 0);
		row.setHeightInPoints(77 * PXTOPT);

		// 创建两种单元格格式
		CellStyle cs = wb.createCellStyle();
		CellStyle cs2 = wb.createCellStyle();

		// 创建两种字体
		Font f = wb.createFont();
		Font f2 = wb.createFont();

		// 创建第一种字体样式（用于列名）
		f.setFontHeightInPoints((short) 10);
		f.setColor(IndexedColors.BLACK.getIndex());
		f.setBoldweight(Font.BOLDWEIGHT_BOLD);

		// 创建第二种字体样式（用于值）
		f2.setFontHeightInPoints((short) 10);
		f2.setColor(IndexedColors.BLACK.getIndex());

		// 设置第一种单元格的样式（用于列名）
		cs.setFont(f);
		cs.setBorderLeft(CellStyle.BORDER_THIN);
		cs.setBorderRight(CellStyle.BORDER_THIN);
		cs.setBorderTop(CellStyle.BORDER_THIN);
		cs.setBorderBottom(CellStyle.BORDER_THIN);
		cs.setAlignment(CellStyle.ALIGN_CENTER);

		cs.setFillPattern(HSSFCellStyle.BIG_SPOTS);
		cs.setFillForegroundColor(HSSFColor.YELLOW.index);
		cs.setFillBackgroundColor(HSSFColor.YELLOW.index);

		// 设置第二种单元格的样式（用于值）
		cs2.setFont(f2);
		cs2.setBorderLeft(CellStyle.BORDER_THIN);
		cs2.setBorderRight(CellStyle.BORDER_THIN);
		cs2.setBorderTop(CellStyle.BORDER_THIN);
		cs2.setBorderBottom(CellStyle.BORDER_THIN);
		cs2.setAlignment(CellStyle.ALIGN_CENTER);
		// 设置列名
		int x1 = 80, y1 = 97;
		int x2 = 144, y2 = 76;
		int[] xys = { x1, y1, x2, y2 };

		for (int i = 0; i < columnNames.length; i++) {
			if (i == 0) {
				Cell cell = row.createCell(i);
				drawLine(sheet, row, 0, 0, 144, 77, xys);
				cell.setCellValue(columnNames[0] + "\t   " + columnNames[1] + "   " + columnNames[2]);
				cell.setCellStyle(cs);
			} else if (i < 3) {
				continue;
			} else {
				Cell cell = row.createCell(i);
				cell.setCellValue(columnNames[i]);
				cell.setCellStyle(cs);
			}

		}
		// 列名第二行
		HSSFRow row1 = sheet.createRow(1);
		for (int i = 0; i < (columnNames.length - 3) * 2; i++) {

			Cell cell = row1.createCell(2);
			cell.setCellValue(i % 2 > 0 ? "流量" : "环比");
			cell.setCellStyle(cs);
		}
		// //设置每行每列的值
		// for (short i = 1; i < list.size(); i++) {
		// // Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
		// // 创建一行，在页sheet上
		// Row row2 = sheet.createRow((short) i);
		// // 在row行上创建一个方格
		// for(short j=0;j<keys.length;j++){
		// Cell cell = row2.createCell(j);
		// cell.setCellValue(list.get(i).get(keys[j]) == null?" ":
		// list.get(i).get(keys[j]).toString());
		// cell.setCellStyle(cs2);
		// }
		// }

		// Region region1 = new Region(0, (short)0, 1, (short)0);
		//
		// Region region2 = new Region(0, (short)1, 1, (short)1);
		//
		// Region region3 = new Region(0, (short)2, 1, (short)2);
		//
		// Region region4 = new Region(0, (short)3, 0, (short)6);
		//
		// Region region5 = new Region(0, (short)7, 0, (short)10);
		//
		//
		// sheet.addMergedRegion(region1);
		//
		// sheet.addMergedRegion(region2);
		//
		// sheet.addMergedRegion(region3);
		//
		// sheet.addMergedRegion(region4);
		//
		// sheet.addMergedRegion(region5);

		return wb;
	}

	// draw cell line
	private static void drawLine(HSSFSheet sheet, HSSFRow row, int i, int j, int width, int height, int[] xys) {
		float PXTOPT = 0.75f;
		final int PERCENT_WIDTH = 50;
		final int PERCENT_HEIGHT = 20;
		int cellWidth = (int) (PERCENT_WIDTH * PXTOPT * width);
		short cellHeight = (short) (PERCENT_HEIGHT * PXTOPT * height);
		sheet.setColumnWidth(j, cellWidth);
		row.setHeight(cellHeight);

		HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
		HSSFClientAnchor a = new HSSFClientAnchor(0, 0, 1023, 255, (short) j, i, (short) (j), i);
		HSSFShapeGroup group = patriarch.createGroup(a);
		float verticalPointsPerPixel = a.getAnchorHeightInPoints(sheet);
		EscherGraphics g = new EscherGraphics(group, sheet.getWorkbook(), Color.black, verticalPointsPerPixel);
		EscherGraphics2d g2d = new EscherGraphics2d(g);

		for (int l = 0; l < xys.length; l += 2) {
			int x = (int) ((PERCENT_WIDTH * 0.75 * xys[l] / cellWidth) * 1023);
			int y = (int) ((PERCENT_HEIGHT * 0.75 * xys[l + 1] / cellHeight) * 255);
			g2d.drawLine(0, 0, x, y);
		}
	}

	/**
	 * 带分类标题导出Excel的方法
	 * 
	 * @param title
	 *            excel中的sheet名称
	 * @param gateHead
	 *            两列的头的标题
	 * @param dateHeadName
	 *            分类列
	 * @param date_num
	 *            分类列行数
	 * @param headers
	 *            分类列行数
	 * @param columns
	 *            列名
	 * @param result
	 *            结果集
	 * @param out
	 *            输出流
	 * @param pattern
	 *            时间格式
	 */
	@SuppressWarnings("deprecation")
	public static Workbook exportoExcel1(String title, String gateHead, String[] dateHeadName, int[] date_num, String[] headers, String[] columns, List<Map<String, Object>> list, OutputStream out, List<String> keys)
			throws Exception {

		// 声明一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 生成一个表格
		HSSFSheet sheet = workbook.createSheet(title);
		
		// 设置表格默认列宽度为20个字节
		//sheet.setDefaultColumnWidth((short) 30);
		
		// 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。
		for (int i = 0; i < keys.size(); i++) {
			if (i == 0)
				sheet.setColumnWidth((short) i, (short) (67.7 * 150));
			else
				sheet.setColumnWidth((short) i, (short) (25.7 * 150));
		}

		// 生成一个样式
		HSSFCellStyle style = workbook.createCellStyle();
		// 设置单元格背景色，设置单元格背景色以下两句必须同时设置
		style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index); // 设置填充色
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);// 设置填充样式

		// 设置单元格上、下、左、右的边框线
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
		style.setAlignment(CellStyle.ALIGN_CENTER);

		// 生成一个字体
		HSSFFont font = workbook.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		// 把字体应用到当前的样式
		style.setFont(font);

		// 指定当单元格内容显示不下时自动换行
		style.setWrapText(true);
		
		// 以下可以用于设置导出的数据的样式
		// 产生表格标题行
		// 表头的样式
		HSSFCellStyle titleStyle = workbook.createCellStyle();// 创建样式对象
		titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER_SELECTION);// 水平居中
		titleStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中
		// 设置字体
		HSSFFont titleFont = workbook.createFont(); // 创建字体对象
		titleFont.setFontHeightInPoints((short) 15); // 设置字体大小
		titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 设置粗体
		// titleFont.setFontName("黑体"); // 设置为黑体字
		titleStyle.setFont(titleFont);
		// 第1行
		Region firstReg = new Region(0,   (short)0,  0, (short) (headers.length + 2 -1));
		//CellRangeAddress cra = new CellRangeAddress(0, (short) 0, 0, (short) (headers.length + 2 -1));// 参数:起始行号，终止行号，
																									// 起始列号，终止列号
		CellRangeAddress cra = new CellRangeAddress(firstReg.getRowFrom(), firstReg.getRowTo(), firstReg.getColumnFrom(), firstReg.getColumnTo());// 参数:起始行号，终止行号，
		
		sheet.addMergedRegion(cra);



		Row row = sheet.createRow(0);
		Cell row0 = row.createCell(0);
		row0.setCellValue(title);
		row0.setCellStyle(titleStyle);

		// 表头第二行

		// 第1 2格子

		
		cra = new CellRangeAddress(1, 2, 0, 1);
		sheet.addMergedRegion(cra);




		// 第3开始往后每两格合并
		int sum1 = 0;
		int sum2 = 0;
		for (int i = 0; i < dateHeadName.length; i++) {
			sum1 += date_num[i];
			cra = new CellRangeAddress(1, 1, 2 + sum2, sum1 + 1); //
			sheet.addMergedRegion(cra);
			sum2 += date_num[i];
		}

		// 单元格内容
		row = sheet.createRow(1);
		// 第1 2格子内容

		Cell cell = row.createCell(0);
		cell.setCellStyle(style);
		cell.setCellValue(gateHead);
		setRegionStyle(sheet, new CellRangeAddress(1, 1, 1,1), style);
		// 第3 4，5 6后面
		int sum = 0;
		for (int i = 0; i < dateHeadName.length; i++) {
			cell = row.createCell(2 + sum); //
			cell.setCellStyle(style);
			cell.setCellValue(dateHeadName[i]);
			sum += date_num[i];
			//setRegionStyle(sheet, new CellRangeAddress(1, 1, 0,0), style);
			setRegionStyle(sheet, new CellRangeAddress(1, 1,  sum, sum+1), style);

		}

		// 第三行
		row = sheet.createRow(2);
		for (int i = 0; i < headers.length; i++) {
			cell = row.createCell(i + 2); //
			cell.setCellStyle(style);
			cell.setCellValue(headers[i]);
		}
		//值得樣式
		CellStyle cs2 = workbook.createCellStyle();
		Font f2 = workbook.createFont();
		f2.setFontHeightInPoints((short) 10);
		f2.setColor(IndexedColors.BLACK.getIndex());
		cs2.setFont(f2);
		cs2.setBorderLeft(CellStyle.BORDER_THIN);
		cs2.setBorderRight(CellStyle.BORDER_THIN);
		cs2.setBorderTop(CellStyle.BORDER_THIN);
		cs2.setBorderBottom(CellStyle.BORDER_THIN);
		cs2.setAlignment(CellStyle.ALIGN_CENTER);
		
		// 遍历集合数据，产生数据行
		// 设置每行每列的值
		for (short i = 0; i < list.size(); i++) {
			// Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
			// 创建一行，在页sheet上
			Row row1 = sheet.createRow((short) i+3);
			// 在row行上创建一个方格
			Map<String, Object> resultMap = list.get(i);
			for (short j = 0; j < headers.length+2; j++) {
				Cell result = row1.createCell(j);
				result.setCellValue(resultMap.get(keys.get(j)) == null ? " " : resultMap.get(keys.get(j)).toString());
				result.setCellStyle(cs2);
			}
		}
		
		return workbook;
	}

	public static Workbook export2CarAnalysisList(List<Map<String, Object>> list, List<String> keys, List<String> columnNames) throws Exception {

		String title = "过车分析表";
		if(columnNames!=null && !columnNames.isEmpty()){
			String gateHead = columnNames.get(0) + columnNames.get(1) + columnNames.get(2) ;
			//确定表头数
			List<String> headList = columnNames.subList(3, columnNames.size());
			int[] cate_num = new int[headList.size()];
			for (int i = 0; i < headList.size(); i++) {
				cate_num[i] = 2;
			}
			//一级表头
			String[] dateHeadName = headList.stream().toArray(String[]::new);
			//二级表头
			String[] headers = new String[headList.size() * 2];
			for(int i=0;i<headList.size() *2;i++){
				headers[i]= i % 2 > 0 ? "环比" :"流量";
			}
			String[] columns = { "itmnm", "count01", "tstv01Max", "tstv01Min", "tstv01Avg", "count02", "tstv02Max", "tstv02Min", "tstv02Avg", "ostnv", "count03", "tstv03Max", "tstv03Min", "tstv03Avg",
					"estnv" };
//			File tempFile = new File("d:\\tempexcel.xls");
//			OutputStream out = new FileOutputStream(tempFile);

			return exportoExcel1(title, gateHead, dateHeadName, cate_num, headers, columns, list, null, keys);

		}
		return null;
		
	}
	
	
	public static Workbook export2CarCompareList(List<Map<String, Object>> list, List<String> keys, List<String> columnNames) throws Exception {

		String title = "过车对比表";
		if(columnNames!=null && !columnNames.isEmpty()){
			String gateHead = columnNames.get(0) + columnNames.get(1) + columnNames.get(2) ;
			//确定表头数
			List<String> headList = columnNames.subList(3, columnNames.size());
			int[] cate_num = new int[headList.size()];
			for (int i = 0; i < headList.size(); i++) {
				cate_num[i] = 2;
			}
			//一级表头
			String[] dateHeadName = headList.stream().toArray(String[]::new);
			//二级表头
			String[] headers = new String[headList.size() * 2];
			for(int i=0;i<headList.size() *2;i++){
				headers[i]= i % 2 > 0 ? "同比" :"流量";
			}
			String[] columns = { "itmnm", "count01", "tstv01Max", "tstv01Min", "tstv01Avg", "count02", "tstv02Max", "tstv02Min", "tstv02Avg", "ostnv", "count03", "tstv03Max", "tstv03Min", "tstv03Avg",
					"estnv" };
//			File tempFile = new File("d:\\tempexcel.xls");
//			OutputStream out = new FileOutputStream(tempFile);

			return exportoExcel1(title, gateHead, dateHeadName, cate_num, headers, columns, list, null, keys);

		}
		return null;
		
	}
	
	
	public static void setRegionBorder(int border, CellRangeAddress region, Sheet sheet,Workbook wb){  
        RegionUtil.setBorderBottom(border,region, sheet, wb);  
        RegionUtil.setBorderLeft(border,region, sheet, wb);  
        RegionUtil.setBorderRight(border,region, sheet, wb);  
        RegionUtil.setBorderTop(border,region, sheet, wb);  
    } 
	
	private static void setRegionStyle(HSSFSheet sheet, CellRangeAddress region,
            HSSFCellStyle cs) {
        for (int i = region.getFirstRow(); i <= region.getLastRow(); i++) {
            HSSFRow row = HSSFCellUtil.getRow(i, sheet);
            HSSFCell cell = null;
            //循环设置单元格样式
            for (int j = region.getFirstColumn(); j <= region.getLastColumn(); j++) {
                cell = HSSFCellUtil.getCell(row, (short) j);
                cell.setCellStyle(cs);
            }
        }
    }

	/*public static void main(String[] args) {

		try {
//			export_MonthTestrstList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}*/

}