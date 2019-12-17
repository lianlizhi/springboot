package com.example.springboot.core;

import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;


@Order(1)
public class StartupRunner implements CommandLineRunner{
	
	 
	@Override
	public void run(String... paramArrayOfString) throws Exception {
		
       /* CacheMap cacheMap = (CacheMap) ApplicationContextHelper.getBean(CacheMap.class);
        cacheMap.initCache();*/
		
	}

}
