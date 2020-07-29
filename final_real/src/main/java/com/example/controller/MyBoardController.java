package com.example.controller;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.MyBoardMapper;


@Controller
public class MyBoardController {

	@Autowired
	MyBoardMapper mapper;
	
	@RequestMapping("/myBoard/boardList")
	public String boardList(Criteria cri, Model model,String id){
		HashMap<String, Object> param=new HashMap<String, Object>();
		cri.setPerPageNum(5);
		param.put("id", id);
		param.put("cri", cri);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(id));
		System.out.println(pm.toString());
		model.addAttribute("pm", pm);
		model.addAttribute("list", mapper.boardList(param));
		return "/myBoard/boardList";
	}
	
	@RequestMapping("/myBoard/infoList")
	public String infoList(Criteria cri, Model model,String id){
		HashMap<String, Object> param=new HashMap<String, Object>();
		cri.setPerPageNum(5);
		param.put("id", id);
		param.put("cri", cri);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(id));
		model.addAttribute("pm", pm);
		model.addAttribute("list", mapper.infoList(param));
		return "/myBoard/infoList";
	}
	
	@RequestMapping("/myBoard/missingList")
	public String missingList(Criteria cri, Model model,String id){
		HashMap<String, Object> param=new HashMap<String, Object>();
		cri.setPerPageNum(5);
		param.put("id", id);
		param.put("cri", cri);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(id));
		model.addAttribute("pm", pm);
		model.addAttribute("list", mapper.missingList(param));
		return "/myBoard/missingList";
	}
	
}
