package com.example.springboot.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.example.springboot.ApplicationContextHelper;
import com.example.springboot.redis.RedisUtils;

@RestController
public class SmsController {
    //注入redis服务
	//@Resource
    //private RedisService myRedis;
 
	
	
		
	
	
    //登录页面
    @RequestMapping("/mt")
    public String shouUI(){
        return "mtlogin";
    }
 
    @ResponseBody
    @RequestMapping("/ajaxNum")
    public String sendMsg(String phoneNum) throws Exception{
    	RedisUtils redis = (RedisUtils)ApplicationContextHelper.getBean(RedisUtils.class);
        //设置超时时间-可自行调整
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");
        //初始化ascClient需要的几个参数
        /*final String product = "Dysmsapi";//短信API产品名称（短信产品名固定，无需修改）
        final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名（接口地址固定，无需修改）
        //替换成你的AK
        final String accessKeyId = AliAccessKey.accessKeyId;//你的accessKeyId,参考本文档步骤2
        final String accessKeySecret = AliAccessKey.accessKeySecret;//你的accessKeySecret，参考本文档步骤2
        //初始化ascClient,暂时不支持多region（请勿修改）
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId,accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);
        //组装请求对象
        phoneNum = "18772938657" ;
       // CommonRequest request = new CommonRequest();
        //request.setProtocol(ProtocolType.HTTPS);
        SendSmsRequest request = new SendSmsRequest();
        request.setRegionId("cn-shanghai");
        request.setProductDomain(new ProductDomain(product, domain));
        request.setVersion("2017-05-25");
        //使用post提交
        request.setMethod(MethodType.POST);
        //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式；发送国际/港澳台消息时，接收号码格式为国际区号+号码，如“85200000000”
        request.setPhoneNumbers(phoneNum);
        //必填:短信签名-可在短信控制台中找到
        request.setSignName("连理枝");
        //必填:短信模板-可在短信控制台中找到，发送国际/港澳台消息时，请使用国际/港澳台短信模版
        request.setTemplateCode("SMS_165109365");
        //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
        //友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
        //生成6位的动态验证码
        String code = IdentifyCodeUtil.getRandom();
        request.setTemplateParam("{\"TemplateParam\":\""+code+"\"}");
        //可选-上行短信扩展码(扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段)
        //request.setSmsUpExtendCode("90997");
        //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
        request.setOutId("yourOutId");*/
        
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAIUjXXquMikRmM", "7IPZa60yYbYnHMkzDN0y8FjpKRjL43");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        //request.setProtocol(ProtocolType.HTTPS);
        request.setMethod(MethodType.GET);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", phoneNum);
        request.putQueryParameter("SignName", "连理枝");
        request.putQueryParameter("TemplateCode", "SMS_165109365");
        request.putQueryParameter("TemplateParam", "{\"code\":\"123456\"}");
 
//        //请求失败这里会抛ClientException异常
        CommonResponse sendSmsResponse = client.getCommonResponse(request);
        if(sendSmsResponse !=null && sendSmsResponse.getHttpStatus() == 200) {
            //请求成功
            redis.set("sms_"+phoneNum,"123456",120);
            
            System.out.println(redis.get("sms_"+phoneNum));
             return String.valueOf(sendSmsResponse.getHttpStatus());
        }else {
            System.out.println("失败状态"+sendSmsResponse.getHttpStatus());
            System.out.println("失败原因"+sendSmsResponse.getData());
            return "error";
        }
 
       // myRedis.set("sms_"+phoneNum,numeric,120);
 
        //return numeric;
    }
 
 
}
