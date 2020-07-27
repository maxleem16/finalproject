package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.DonationVO;
import com.example.domain.PageMaker;
import com.example.mapper.DonationMapper;

@Controller

public class DonationController {
	@Autowired
	DonationMapper mapper;
	
	@RequestMapping("/donation/list")
	public String list(Criteria cri,Model model) {
		PageMaker pm=new PageMaker();
		cri.setPerPageNum(10);
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(cri));
		model.addAttribute("cri",cri);
		model.addAttribute("pm",pm);
		model.addAttribute("list",mapper.list(cri));
		return "/donation/list";
	}
	
	@RequestMapping("/donation/applyList")
	@ResponseBody
	public HashMap<String, Object> applyList(DonationVO vo, Criteria cri) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		PageMaker pm=new PageMaker();
	    cri.setPerPageNum(10);
	    pm.setCri(cri);
	    vo.setDonationMethod("0");
	    pm.setTotalCount(mapper.totalCount2(vo.getDonationMethod(), cri));
		map.put("pm", pm);
		map.put("apply", mapper.applyList(vo.getDonationMethod(), cri));
		map.put("tp",mapper.totalPrice(vo.getDonationMethod()));
		return map;
	}
	
	@RequestMapping(value="/donation/insert",method=RequestMethod.POST)
	public String insert(DonationVO vo) {
		mapper.insert(vo);
		return "redirect:/donation/list";
	}
}
