package com.example.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.AdoptFormVO;
import com.example.domain.AdoptVO;
import com.example.mapper.AdoptMapper;
import com.example.mapper.DogMapper;
import com.example.service.AdoptService;

@Controller
public class AdoptController {
	@Autowired
	DogMapper mapper;
	
	@Autowired
	AdoptMapper aMapper;
	
	@Autowired
	AdoptService service;

	@RequestMapping("/adopt/applyList")
	public void applyList() {
	}

	@RequestMapping("/adopt/read")
	public void read(Model model, int applicationNo) {
		model.addAttribute("vo", aMapper.read(applicationNo));
		model.addAttribute("fvo", aMapper.formRead(applicationNo));
	}
	
	@RequestMapping(value="/adopt/confirm", method = RequestMethod.POST)
	public void confirm(AdoptVO vo) {
		aMapper.checkUpdate(vo);
	}
	
	@RequestMapping("/adopt/insert")
	public void insert(Model model, String dogCode) {
		model.addAttribute("vo", mapper.read(dogCode));
	}

	@RequestMapping(value = "/adopt/insert", method = RequestMethod.POST)
	public String insert(AdoptFormVO vo) {
		service.insert(vo);
		return "redirect:/dog/list";
	}

	@RequestMapping(value = "/adopt/tempSave", method = RequestMethod.POST)
	public void tempSave(AdoptFormVO vo, HttpServletResponse response) {

	}
}
