package com.example.springboot.core;

import java.io.File;

import com.np.sz.util.FileHelper;

/**
 * 全局配置
 */
public class AppGlobal {

	/**
	 * 全局键值
	 */
	public static final String KEY = "";

	/**
	 * 当前目录, 不含最后的File.seprator
	 */
	private static final String CURRENT_DIR = FileHelper.GetCurrentDirectory().substring(0, FileHelper.GetCurrentDirectory().lastIndexOf(File.separator));

	/**
	 * 服务根目录
	 */
	public static final String ROOT_DIR = CURRENT_DIR.substring(0, CURRENT_DIR.lastIndexOf(File.separator)) + File.separator;

	/**
	 * 配置目录
	 */
	private static final String CONFIG_DIR = "config" + File.separator;

	/**
	 * 业务配置路径
	 */
	public static final String BIZ_CONFIG_DIR = ROOT_DIR + CONFIG_DIR + "biz" + File.separator;

	/**
	 * 系统配置文件路径
	 */
	public static final String SYSTEM_CONFIG_PATH = ROOT_DIR + CONFIG_DIR + "SystemConfig.properties";
	
}
