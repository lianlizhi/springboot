package com.example.springboot;

import java.util.Properties;

import org.apache.ibatis.plugin.Interceptor;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.example.springboot.core.StartupRunner;
import com.github.pagehelper.PageHelper;

//@ImportResource("classpath:spring/transaction.xml")
@SpringBootApplication
@EnableAutoConfiguration
@EnableScheduling //开启定时任务
@EnableAsync
@EnableTransactionManagement
@EnableCaching
public class Springboot1Application {

	public static void main(String[] args) {
		SpringApplication.run(Springboot1Application.class, args);
	}
	
	 /**
     * 
      * @Title: startupRunner
      * @Description: 应用启动后执行操作
      * @return
     */
    @Bean
    public StartupRunner startupRunner(){
    	
       return new StartupRunner();
       
    }
    
    
  //配置mybatis的分页插件pageHelper
    @Bean
    public PageHelper pageHelper(){
    	PageHelper pageHelper=new PageHelper();
        Properties properties=new Properties();
        properties.setProperty("helperDialect","mysql");
        properties.setProperty("reasonable","true");
        properties.setProperty("supportMethodsArguments","true");
        properties.setProperty("params","count=countSql");
        pageHelper.setProperties(properties);
        return pageHelper;
    }

}
