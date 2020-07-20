package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.DogMapper;

@Controller

public class DogController {
	
	@Autowired
	DogMapper mapper;
	
	@RequestMapping("/index")
	public void index() {
		
	}
	
	@RequestMapping("/menu")
	public void menu() {
		
	}
	
	@RequestMapping("/footer")
	public void footer() {
		
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
}
