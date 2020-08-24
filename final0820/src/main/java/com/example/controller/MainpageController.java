package com.example.controller;

import java.util.HashMap;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainpageController {
	
	@RequestMapping("/pagination")
	public void pagination() {
		
	}
	@RequestMapping("/sideLogin")
	public void sideLogin() {
		
	}
	
	@RequestMapping("/test")
	public void test() {
		
	}
	
	@RequestMapping("/indexSlide2")
    public void indexSlide2() {
      
    }
	
   @RequestMapping("/indexSlide")
   public void indexSlide() {
      
   }
	
   @RequestMapping("/chart")
   public void listb() {
      
   }
	
	@RequestMapping("/index")
	public void index() {

	}

	@RequestMapping("/menu")
	public void menu() {

	}

	@RequestMapping("/footer")
	public void footer() {

	}

	@RequestMapping("/dog")
	public void dog() {

	}
	@RequestMapping("/naverLogin")
	public void naverLogin() {
		
	}
	@RequestMapping("/box")
	public void box() {
		
	}
	
	@RequestMapping("/login")
	public void login() {
		
	}
	
	//´ÙÀ½ ³¯¾¾
	@RequestMapping("/weather.json")
	@ResponseBody
	public HashMap<String, Object> weatherJson() throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		Document doc=Jsoup.connect("https://www.daum.net/").get();
		Elements es=doc.select(".info_today");
		map.put("date", es.select(".date_today").text());
		Elements ele=doc.select(".list_weather");
		ArrayList<HashMap<String,Object>> array= new ArrayList<HashMap<String,Object>>(); 
		for(Element e:ele.select("li")) {
			HashMap<String, Object> m= new HashMap<String, Object>();
			m.put("location", e.select(".txt_part").text());
			m.put("temper", e.select(".txt_temper").text());
			m.put("wa", e.select(".ir_wa").text());
			m.put("icon", e.select(".ico_ws").text());
			array.add(m);
			
		}
		map.put("array", array);
		return map;
	}
	
}
