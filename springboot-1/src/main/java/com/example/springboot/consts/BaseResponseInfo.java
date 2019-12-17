package com.example.springboot.consts;

import org.springframework.stereotype.Component;

@Component
public class BaseResponseInfo {
	
	public int code = 200;
	
	public Object data;

	public BaseResponseInfo() {
		
	}

	public BaseResponseInfo(int code) {
		this(code, null);
	}

	public BaseResponseInfo(int code, Object data) {
		this();
		this.code = code;
		this.data = data;
	}
}
