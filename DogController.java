package com.example.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.DogVO;
import com.example.domain.PageMaker;
import com.example.mapper.DogMapper;

@Controller

public class DogController {
	@Autowired
	DogMapper mapper;

	
	//유기견 크롤링
	@RequestMapping("dog.json")
	@ResponseBody
	public HashMap<String, Object> dogJson()throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		Document doc=Jsoup.connect("http://pawinhand.kr/").get();
		Elements es=doc.select(".row");
		ArrayList<HashMap<String,Object>> SSibal= new ArrayList<HashMap<String,Object>>(); 
		for(Element e:es.select("#barchart_values")) {
			HashMap<String, Object> m= new HashMap<String, Object>();
			m.put("why", e.select("tr:nth-child(3) td:nth-child(2)").text());

			SSibal.add(m);
		}
		map.put("sibal", SSibal);
		return map;
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
	
	
	@RequestMapping("/index")
	public void index() {
		
	}
	
	@RequestMapping("/menu")
	public void menu() {
		
	}
	
	@RequestMapping("/footer")
	public void footer() {
		
	}
	
	@RequestMapping("/dog/adoptStep")
	public void adoptStep() {
		
	}
	
	@RequestMapping("/dog")
	public void dog() {
		
	}
	
	@RequestMapping("/dog/read")
	public void dogRead(Model model,String dogCode) {
	model.addAttribute("vo", mapper.read(dogCode));
	      
	}
	
	@RequestMapping("/dog/list")
	public void dogList(Model model, Criteria cri) {
		cri.setPerPageNum(8);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(cri));
		model.addAttribute("pm", pm);
		model.addAttribute("cri", cri);
		model.addAttribute("list", mapper.list(cri));
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public void insert(DogVO vo) {
		System.out.println(vo.toString());
		mapper.insert(vo);
	}
	
	@RequestMapping(value="/dog/delete", method=RequestMethod.POST)
	public void delete(String dogCode) {
		mapper.delete(dogCode);
		
	}
	
	
	@RequestMapping("/dog/update")
	public void update(Model model, String dogCode) {
		model.addAttribute("vo", mapper.read(dogCode));
	}
	

	
	@RequestMapping(value="/dog/update", method=RequestMethod.POST)
	public String update(DogVO vo) {
		System.out.println(vo.toString());
		
		mapper.update(vo);
		return "redirect:/dog/list";
	}

	

}