package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.AdoptFormVO;
import com.example.domain.AdoptVO;
import com.example.domain.CounselingVO;
import com.example.mapper.AdoptMapper;
import com.example.mapper.MypageMapper;
import com.example.service.AdoptService;

@Controller
public class MypageController {
	@Autowired
	MypageMapper mapper;
	@Autowired
	AdoptService aService;
	@Autowired
	AdoptMapper amapper;
	
	@RequestMapping("/mypage/applyList")
	public void applyList(Model model, String id, String cancleCheck) {
		model.addAttribute("list", mapper.applyList(id));
		cancleCheck="1";
		model.addAttribute("count",amapper.cancleCount(cancleCheck, id));
	}
	
	@RequestMapping("/mypage/applyRead")
	public void applyRead(Model model, @RequestParam("applicationNo")int applicationNo) {
		model.addAttribute("vo", mapper.applyRead(applicationNo));
		model.addAttribute("applicationNo", applicationNo);
	}
	
	@RequestMapping(value="/mypage/applyCancle", method=RequestMethod.POST)
	public String applyCancle(AdoptVO vo) {
		aService.cancle(vo);
		String applicant=vo.getApplicant();
		return "redirect/manage/userRead?id="+applicant; 
	}
	
	@RequestMapping("/mypage/counselReserve")
	public void counselReserve(Model model, AdoptFormVO vo) {
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value="/mypage/counselInsert", method=RequestMethod.POST)
	public void counselInsert(CounselingVO vo) {
		System.out.println(vo.toString());
		mapper.counselInsert(vo);
	}
}
