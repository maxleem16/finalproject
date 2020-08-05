package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CounselingVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.QnAMessageVO;
import com.example.domain.QnAReplyVO;
import com.example.mapper.ManageMapper;
import com.example.service.ManageService;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class ManageController {

	@Autowired
	ManageMapper mapper;

	@RequestMapping("/manage/applyList")
	public void applyList() {
	}

	@RequestMapping("/manage/index")
	public void index() {
	}

	@RequestMapping("/manage/float/counselingList")
	public void counselingList() {
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

	@RequestMapping(value = "/manage/float/counseling", method = RequestMethod.GET)
	@ResponseBody
	public String counseling() {
		List<CounselingVO> list=mapper.counselingList();
		JsonArray array=new JsonArray();
		
		for(CounselingVO vo:list) {
			JsonObject obj=new JsonObject();
			String title=vo.getCounselingTime()+"½Ã »ó´ã-"+vo.getId();
			obj.addProperty("title", title);
			obj.addProperty("start", vo.getCounselingDate());
			array.add(obj);
		}
		
		return array.toString();
	}
}
