package com.example.demo;

import javax.sql.DataSource;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.example.demo.core.StartupRunner;

@SpringBootApplication
@ImportResource("classpath:transaction.xml")
//@EnableTransactionManagement
@EnableAutoConfiguration
@MapperScan("com.example.demo.mapper")//将项目中对应的mapper类的路径加进来就可以了
//@EnableScheduling //开启定时任务
public class SpringbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootApplication.class, args);
	
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
	



}
