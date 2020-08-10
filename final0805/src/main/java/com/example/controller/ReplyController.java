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
import com.example.domain.ReplyVO;
import com.example.mapper.BoardMapper;
import com.example.mapper.ReplyMapper;
import com.example.service.ReplyService;

@Controller
public class ReplyController {
   @Autowired
   ReplyMapper mapper;
   @Autowired
   BoardMapper bmapper;
   @Autowired
   ReplyService service;

   @RequestMapping(value = "/reply/list")
   @ResponseBody
   public HashMap<String, Object> list(int postingNo,Criteria cri) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      HashMap<String, Object> param = new HashMap<String, Object>();
        PageMaker pm=new PageMaker();
         cri.setPerPageNum(5);
         param.put("postingNo", postingNo);
         param.put("cri", cri);
         map.put("list", mapper.list(param));
         pm.setCri(cri);
         pm.setTotalCount(bmapper.replyCount(postingNo));
         map.put("pm", pm);
      return map;
   }

   @RequestMapping(value = "/reply/reply")
   public void reply(@RequestParam("postingNo") int postingNo, Model model) {
      model.addAttribute("postingNo", postingNo);
   }

   @RequestMapping(value = "/reply/insert", method = RequestMethod.POST)
   @ResponseBody
   public void insert(ReplyVO vo) {
      service.insert(vo);
   }

   @RequestMapping(value = "/reply/delete", method = RequestMethod.POST)
   @ResponseBody
   public void delete(int commentNo) {
      service.delete(commentNo);
   }
}