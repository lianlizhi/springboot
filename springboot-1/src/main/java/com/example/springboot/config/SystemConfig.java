package com.example.springboot.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
@ConfigurationProperties(prefix = "config.author")
@PropertySource(value = "classpath:config/config.properties", encoding = "UTF-8") 
public class SystemConfig {
	
	    private String name;
	    private String age;
	    private String address;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getAge() {
			return age;
		}
		public void setAge(String age) {
			this.age = age;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		@Override
		public String toString() {
			return "SystemConfig [name=" + name + ", age=" + age + ", address=" + address + "]";
		}
		public SystemConfig(String name, String age, String address) {
			super();
			this.name = name;
			this.age = age;
			this.address = address;
		}
		public SystemConfig() {
			super();
			// TODO Auto-generated constructor stub
		}
	    
		private static SystemConfig instance = null;

		public static SystemConfig getInstance() {
			if (instance == null)
				instance = new SystemConfig();
			return instance;
		}
	    
	
}
