package com.example.springboot.utils;

import java.text.SimpleDateFormat;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.NumberToTextConverter;

/**
 * poi操作Excel工具类
 * 
 * @author YongLiu
 *
 */
public class POIUtil {

	/**
	 * 过滤空行的方法 判断是否是空行
	 * 
	 * @param row
	 * @return
	 */
	public static boolean isRowEmpty(Row row) {
		for (int i = row.getFirstCellNum(); i < row.getLastCellNum(); i++) {
			Cell cell = row.getCell(i);
			if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK)
				return false;
		}
		return true;
	}

	/**
	 * 
	 * @param row
	 * @param cellIndex
	 * @return
	 */
	public static String getCellValue(Row row, int cellIndex) {
		// DecimalFormat df = new DecimalFormat("#");
		Cell cell = row.getCell((short) cellIndex);
		String cellvalue = "";
		if (cell != null) {
			switch (cell.getCellType()) {
			case HSSFCell.CELL_TYPE_NUMERIC: {
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					cellvalue = sdf.format(HSSFDateUtil.getJavaDate(cell.getNumericCellValue()));
				} else {
					cellvalue = NumberToTextConverter.toText(cell.getNumericCellValue());
					// df.format(cell.getNumericCellValue());
				}
				break;
			}
			case HSSFCell.CELL_TYPE_FORMULA:
				cellvalue = cell.getCellFormula();
			case HSSFCell.CELL_TYPE_STRING:
				cellvalue = cell.getStringCellValue().replaceAll("'", "''");
				break;
			default: {
				cellvalue = "";
			}
			}
		} else {
			cellvalue = "";
		}
		return cellvalue;
	}

}
