package com.example.springboot.core;

import java.util.concurrent.Executor;

import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.aop.interceptor.SimpleAsyncUncaughtExceptionHandler;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;


/**
 * ①利用＠EnableAsync 注解开启异步任务支持。
 * ②配置类实现AsyncConfigurer 接口并重写getAsyncExecutor 方法，并返回一个
 * ThreadPoolTaskExecutor ，这样我们就获得了一个基于线程池TaskExecutor。
 */
@Configuration
@ComponentScan("com.example.spring.framework.taskexecutor")
@EnableAsync
public class TaskExecutorConfig implements AsyncConfigurer{

	   @Override
	    public Executor getAsyncExecutor() { // 2
	        ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
	        taskExecutor.setCorePoolSize(5);
	        taskExecutor.setMaxPoolSize(10);
	        taskExecutor.setQueueCapacity(25);
	        taskExecutor.initialize();
	        return taskExecutor;
	    }

	    @Override
	    public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
	        return new SimpleAsyncUncaughtExceptionHandler();
	    }

}
