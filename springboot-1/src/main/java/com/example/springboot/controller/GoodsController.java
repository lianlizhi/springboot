package com.example.springboot.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.activemq.command.ActiveMQQueue;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.springboot.activemq.Producer;
import com.example.springboot.consts.BaseResponseInfo;
import com.example.springboot.mapper.GoodsMapper;
import com.example.springboot.model.Goods;

@RestController
@RequestMapping("/good")
public class GoodsController {

	@Autowired
	private Producer producer;

	
	@InitBinder
    protected void init(HttpServletRequest request, ServletRequestDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }
	
	private final Logger log = Logger.getLogger(HelloController.class) ;
	
	@Autowired 
	GoodsMapper goodsMapper ;
	
	//@ResponseBody
	//@RequestMapping(value = "mapper"  , method = { RequestMethod.POST }) 
	@PostMapping("mapper")
	  public BaseResponseInfo hello(Goods goods) throws ParseException{ 
		 BaseResponseInfo info  = new BaseResponseInfo() ;
		 //Goods goods = new Goods() ;
		/*
		 * goods.setGoodName("test"); SimpleDateFormat format = new
		 * SimpleDateFormat("yyyy-MM-dd"); Date date = format.parse("1992-02-01");
		 * goods.setCreateTime(date); goods.setId(1);
		 */
		 goodsMapper.insert(goods);
		info.code = 200 ;
		info.data = goods ;
		return info ; 
	  } 
	
	
	@ResponseBody
	@RequestMapping("list") 
	  public BaseResponseInfo listhello() throws ParseException{ 
		 BaseResponseInfo info  = new BaseResponseInfo() ;
		 //Goods goods = new Goods() ;
		/*
		 * goods.setGoodName("test"); SimpleDateFormat format = new
		 * SimpleDateFormat("yyyy-MM-dd"); Date date = format.parse("1992-02-01");
		 * goods.setCreateTime(date); goods.setId(1);
		 */
		 List<Goods> list = goodsMapper.selectByExample(null);
		 
		 producer.sendMessage(new ActiveMQQueue("mytest.queue"), list.get(0).toString());
		 
		info.code = 200 ;
		info.data = list ;
		return info ; 
	  } 
}
