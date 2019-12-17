package com.example.springboot.job;


import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Task {
	
	private final Logger log = Logger.getLogger(Task.class) ;
	
	@Async
	@Scheduled(cron = "${cron}")
	public void process() {
		log.info("任务1启动");
		
		try {
			for (int i = 0; i < 10; i++) {
				if(i>5) {
					System.out.println(i);
					break ;
				}
			}
			
		} catch (Throwable t) {
			log.info("任务1异常");
		}
	}
	
	
	@Async
	@Scheduled(cron = "${pro}")
	public void pro() {
		log.info("任务2启动");
		
		try {
			for (int i = 0; i < 10; i++) {
				if(i>5) {
				System.out.println(i);
					break ;
				}
			}
			
		} catch (Throwable t) {
			log.info("任务2异常");
		}

	}
}