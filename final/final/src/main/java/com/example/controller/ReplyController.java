package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ReplyVO;
import com.example.mapper.BoardMapper;
import com.example.mapper.ReplyMapper;
import com.example.service.ReplyService;

@Controller

public class ReplyController {

	@Autowired
	
	ReplyMapper mapper;
	
	@Autowired
	BoardMapper bMapper;
	
	
	
	
	@RequestMapping(value="/reply/list")
	@ResponseBody
	
	public HashMap<String,Object> list(int postingNo,Criteria cri){
		HashMap<String,Object> map=new HashMap<String,Object>();
		
		cri.setPerPageNum(3);
		PageMaker pm= new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(bMapper.replyCount(postingNo));
		
		map.put("pm", pm);
		map.put("list", mapper.list(postingNo,cri));
		return map;
	}
	
	@RequestMapping(value="/reply/reply")
	public void reply() {
		
	}
	
	@RequestMapping(value="/reply/insert")
	@ResponseBody
	public void insert(ReplyVO vo){
		mapper.insert(vo);
	}
	
	@RequestMapping(value="/reply/update", method=RequestMethod.POST)
	@ResponseBody
	public void update(@RequestBody ReplyVO vo){
		mapper.update(vo);
		
	}
	
	@RequestMapping(value="/delete/{commentNo}", method=RequestMethod.DELETE)
	@ResponseBody
	public void delete(@PathVariable("commentNo") int commentNo){
		//System.out.println(vo.toString());
		mapper.delete(commentNo);
		
	}
}
