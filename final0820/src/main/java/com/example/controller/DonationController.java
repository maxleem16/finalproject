package com.example.controller;

import java.util.HashMap;
import java.util.List;

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
   
   @RequestMapping("/donation/kakaoPaySuccess")
   public void kakaoPaySuccess(Model model, int donationNo) {
      model.addAttribute("read", mapper.read(donationNo));
   }
   
   @RequestMapping("/donation/list")
   public String list(Criteria cri,Model model,DonationVO vo) {
      PageMaker pm=new PageMaker();
      cri.setPerPageNum(10);
      pm.setCri(cri);
      pm.setTotalCount(mapper.totalCount(cri));
      model.addAttribute("cri",cri);
      model.addAttribute("pm",pm);
      model.addAttribute("list",mapper.list(cri));
      vo.setDonationMethod("0");
      model.addAttribute("tp",mapper.totalPrice(vo.getDonationMethod()));
      return "/donation/list";
   }
   
   @RequestMapping("/donation/applyList")
   @ResponseBody
   public HashMap<String, Object> applyList(DonationVO vo, Criteria cri) {
      HashMap<String, Object> map=new HashMap<String, Object>();
      HashMap<String, Object> param=new HashMap<String, Object>();
       vo.setDonationMethod("0");
       PageMaker pm=new PageMaker();
       cri.setPerPageNum(10);
       param.put("donationMethod", vo.getDonationMethod());
       param.put("cri", cri);
       map.put("apply", mapper.applyList(param));
       pm.setCri(cri);
       pm.setTotalCount(mapper.totalCount2(vo.getDonationMethod()));
       map.put("tp",mapper.totalPrice(vo.getDonationMethod()));
       map.put("pm", pm);
      return map;
   }
   
   @RequestMapping("/manage/float/donationPurchased.json")
   @ResponseBody
   public HashMap<String,Object> manageDonation(Criteria cri){
	   HashMap<String, Object> map=new HashMap<String, Object>();
	   cri.setSearchType("donationMethod");
	   cri.setKeyword("1");
	   map.put("dlist",mapper.list(cri));
	   map.put("total", mapper.totalPrice(cri.getKeyword()));
	   return map;
   }
   
   @RequestMapping("/donation/insert")
   public void insert() {
   }
   
   @RequestMapping(value="/donation/insert",method=RequestMethod.POST)
   public String insertPost(DonationVO vo) {
      mapper.insert(vo);
      return "redirect:/donation/list";
   }
   
   @RequestMapping(value="/donation/insert2",method=RequestMethod.POST)
   public String insertPost2(DonationVO vo) {
      mapper.insert(vo);
      int donationNo=vo.getDonationNo();
      return "redirect:/donation/kakaoPaySuccess?donationNo="+donationNo;
   }
}