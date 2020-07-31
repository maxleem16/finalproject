package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.UserVO;
import com.example.mapper.AdoptMapper;
import com.example.mapper.ManageMapper;
import com.example.mapper.MypageMapper;
import com.example.mapper.UserMapper;

@Controller
public class ManageController {
	@Autowired
	ManageMapper mapper;
	@Autowired
	UserMapper umapper;
	@Autowired
	MypageMapper mmapper;
	@Autowired
	AdoptMapper amapper;
	
	@RequestMapping(value="/manage/cancleUpdate",method=RequestMethod.POST)
	public String cancleUpdate(UserVO vo) {
		mapper.cancleUpdate(vo);
		String id=vo.getId();
		return "redirect:/manage/userRead?id"+id;
	}
	
	@RequestMapping("/manage/userRead")
	public String read(String id,Model model,String cancleCheck) {
		model.addAttribute("read",umapper.read(id));
		model.addAttribute("list", mmapper.applyList(id));
		cancleCheck="1";
		model.addAttribute("count",amapper.cancleCount(cancleCheck, id));
		return "/manage/userRead";
	}
	
	@RequestMapping("/manage/userList")
	public String list(Criteria cri,Model model) {
		PageMaker pm=new PageMaker();
		cri.setPerPageNum(10);
		pm.setCri(cri);
		pm.setTotalCount(umapper.totalCount(cri));
		model.addAttribute("cri",cri);
		model.addAttribute("pm",pm);
		model.addAttribute("list",umapper.list(cri));
		return "/manage/userList";
	}
	
	@RequestMapping("/manage/counselingList")
	public void counselingList() {
	}
	
	@RequestMapping(value="/manage/counseling",method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> counseling() {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("cs",mapper.counselingList());
		return map;
	}
	
	@RequestMapping("/manage/applyList")
	public void applyList() {
	}

	@RequestMapping("/manage/applyList.json")
	@ResponseBody
	public HashMap<String, Object> applyListJson(Criteria cri) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		PageMaker pm = new PageMaker();
		cri.setPerPageNum(10);
		pm.setCri(cri);
		pm.setTotalCount(mapper.applyCount(cri));
		map.put("list", mapper.applyList(cri));
		map.put("pm", pm);
		return map;
	}

}
