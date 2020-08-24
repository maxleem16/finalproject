package com.example.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public void read(Model model, @RequestParam int applicationNo) {
		model.addAttribute("applicationNo", applicationNo);
		model.addAttribute("vo", aMapper.read(applicationNo));
		model.addAttribute("fvo", aMapper.formRead(applicationNo));
	}

	@RequestMapping(value = "/adopt/confirm", method = RequestMethod.POST)
	public void confirm(AdoptVO vo) {
		System.out.println(vo.toString());
		aMapper.checkUpdate(vo);
	}

	@RequestMapping("/adopt/insert")
	public void insert(Model model, String dogCode) {
		model.addAttribute("vo", mapper.read(dogCode));
	}

	@RequestMapping("/adopt/insertCheck")
	@ResponseBody
	public int insertCheck(String dogCode) {
		int result = 0;
		AdoptVO check = aMapper.insertCheck(dogCode);
		if (check != null) {
			result = 1;
		}

		return result;
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
