package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.Criteria;
import com.example.domain.DogVO;
import com.example.domain.PageMaker;
import com.example.mapper.DogMapper;

@Controller

public class DogController {
   
   @Autowired
   DogMapper mapper;

   @RequestMapping("/dog/companyInfo")
   public void companyInfo() {
	   
   }
   
   @RequestMapping("/dog/adoptStep")
   public void adoptStep() {
      
   }
   
   @RequestMapping("/dog/read")
   public void dogRead(Model model,String dogCode) {
   model.addAttribute("vo", mapper.read(dogCode));
         
   }
   
   @RequestMapping("/dog/read2")
   public void dogRead2(Model model,String dogCode) {
   model.addAttribute("vo", mapper.read(dogCode));
         
   }
   
   @RequestMapping("/dog/list")
   public void dogList(Model model, Criteria cri) {
      cri.setPerPageNum(8);
      PageMaker pm = new PageMaker();
      pm.setCri(cri);
      pm.setTotalCount(mapper.totalCount(cri));
      model.addAttribute("pm", pm);
      model.addAttribute("cri", cri);
      model.addAttribute("list", mapper.list(cri));
   }
   
   @RequestMapping("/dog/insert")
   public void insert() {
   }
   
   @RequestMapping(value="/dog/insert", method=RequestMethod.POST)
   public void insertPost(DogVO vo) {
      System.out.println(vo.toString());
      mapper.insert(vo);
   }
   

}