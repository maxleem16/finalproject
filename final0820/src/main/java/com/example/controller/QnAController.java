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

import com.example.domain.Criteria;
import com.example.domain.QnAMessageVO;
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
		model.addAttribute("cri", cri);
		model.addAttribute("total", mapper.allMessage());
		model.addAttribute("list", mapper.qnaList(cri));
		model.addAttribute("unchecked", mapper.uncheckedMessage());
	}
	
	@RequestMapping("/manage/float/messageList")
	public String floatmessage() {
		return "/manage/float/messageList";
	}
	
	@RequestMapping("/manage/qnaMessage.json")
	@ResponseBody
	public HashMap<String, Object> qnaMessage(Criteria cri) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		cri.setPage(1);
		cri.setPerPageNum(3);
		map.put("list", mapper.qnaList(cri));
		return map;
	}
	
	@RequestMapping("/manage/qnaReply.json")
	@ResponseBody
	public QnAReplyVO qnaReply(int messageNo) {
		return mapper.qnaReply(messageNo);
	}
	
	@RequestMapping("/manage/float/messageInsert")
	public void messageInsert(Model model,@RequestParam("messageNo") int messageNo) {
		model.addAttribute("vo", mapper.getName(messageNo));
	}
	
	@RequestMapping(value="/manage/float/messageInsert", method=RequestMethod.POST)
	@ResponseBody
	public void messageInsertPost(QnAReplyVO vo) {
		System.out.println(vo.toString());
		service.insertNcheck(vo);
	}
	
	@RequestMapping(value="/mypage/messageInsert",method=RequestMethod.POST)
	public String mypageInsertPost(QnAMessageVO vo) {
		mapper.messageInsert(vo);
		String id=vo.getSender();
		return "redirect:/mypage/message?sender="+id;
	}
	
	@RequestMapping("/mypage/messageInsert")
	public void mypageInsert() {
	}
	
	@RequestMapping("/mypage/message")
	public void mypageList(Model model, String sender) {
		model.addAttribute("li",mapper.list(sender));
	}
}
