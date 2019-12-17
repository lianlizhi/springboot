package com.example.springboot.core;

import java.util.Properties;

/**
 * java.util.Properties助手类
 * 
 * @author Administrator
 *
 */
public class PropertiesHelper {

	/**
	 * 提取字符串属性
	 * 
	 * @param properties
	 * @param key
	 * @param defVal
	 * @return
	 */
	public static String getConfigValStr(Properties properties, String key, String defVal) {
		String strVal = defVal;
		String temp = null;

		if (properties.containsKey(key))
			temp = properties.getProperty(key);

		if (null != temp && "" != temp) {
			strVal = temp;
		}

		return strVal;
	}

	/**
	 * 提取整数属性
	 * 
	 * @param properties
	 * @param key
	 * @param defVal
	 * @return
	 */
	public static Integer getConfigValInt(Properties properties, String key, Integer defVal) {
		String strVal = getConfigValStr(properties, key, String.valueOf(defVal));
		return Integer.valueOf(strVal);
	}

	/**
	 * 提取bool属性
	 * 
	 * @param properties
	 * @param key
	 * @param defVal
	 * @return
	 */
	public static boolean getConfigValBool(Properties properties, String key, boolean defVal) {
		String strVal = getConfigValStr(properties, key, String.valueOf(defVal));
		return Boolean.parseBoolean(strVal);
	}
}

