package com.example.demo.job;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Task {
	
	
	private static final Logger logger = Logger.getLogger(Task.class);
	
	
	@Scheduled(cron = "${cron}")
	public void process() {
		
		logger.warn(String.format("开始任务"));
		try {
			for (int i = 0; i < 10; i++) {
				if(i>5) {
					System.out.println(i);
					break ;
				}
			}
			logger.warn(String.format("任务结束"));
		} catch (Throwable t) {
			logger.error(String.format("任务异常"));
		}
	}

}
