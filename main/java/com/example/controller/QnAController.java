package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.QnAReplyVO;
import com.example.mapper.QnAMapper;
import com.example.service.ManageService;

@Controller
public class QnAController {
	
	@Autowired
	QnAMapper mapper;
	

	@Autowired
	ManageService service;
	
	@RequestMapping("/manage/messageList")
	public void messageList(Model model, Criteria cri) {
		model.addAttribute("list", mapper.qnaList(cri));
		model.addAttribute("unchecked", mapper.uncheckedMessage());
	}
	
	@RequestMapping("/manage/qnaReply.json")
	@ResponseBody
	public QnAReplyVO qnaReply(int messageNo) {
		return mapper.qnaReply(messageNo);
	}
	
	@RequestMapping("/manage/float/messageInsert")
	public void messageInsert(Model model,@RequestParam("messageNo") int messageNo) {
		model.addAttribute("messageNo", messageNo);
	}
	
	@RequestMapping(value="/manage/float/messageInsert", method=RequestMethod.POST)
	public void messageInsertPost(QnAReplyVO vo) {
		service.insertNcheck(vo);
	}
}
