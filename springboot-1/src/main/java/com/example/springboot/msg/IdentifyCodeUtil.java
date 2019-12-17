package com.example.springboot.msg;


/**
 * 随机生成六位短信随机码
 * @author hjc
 *
 */
public class IdentifyCodeUtil {
	 
    public static String getRandom() {
        String num = "";
        for (int i = 0; i < 6; i++) {
            num = num + String.valueOf((int) Math.floor(Math.random() * 9 + 1));
        }
        return num;
    }
}
