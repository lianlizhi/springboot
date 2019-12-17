package com.example.demo.core;

import org.apache.log4j.Logger;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;

/**
 * 
  * @ClassName: StartupRunner
  * @Description: 应用启动后初始化操作
  * @author liutuan
  * @date 2018年1月10日 上午9:17:07
  *
 */
@Order(1)
public class StartupRunner implements CommandLineRunner {
    
    /**
     * 日志
     */
    private static Logger LOG = Logger.getLogger(StartupRunner.class);
    
    @Override
    public void run(String... args) throws Exception {
        LOG.info("应用启动后初始化操作...");
//        CacheMap cacheMap = (CacheMap) ApplicationContextHelper.getBean(CacheMap.class);
//        cacheMap.initCache();
    	
   }

}