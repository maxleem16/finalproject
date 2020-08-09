package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.AdoptFormVO;
import com.example.domain.AdoptVO;
import com.example.domain.CounselingVO;
import com.example.domain.Criteria;
import com.example.domain.DogLikeVO;
import com.example.domain.PageMaker;
import com.example.mapper.MypageMapper;
import com.example.service.AdoptService;

@Controller
public class MypageController {

   @Autowired
   MypageMapper mapper;
   
   @Autowired
   AdoptService aService;
   
   @RequestMapping("/mypage/dogLikeList")
   public void list(String id, Model model) {
      model.addAttribute("list", mapper.dogLikeList(id));
   }
   

   @RequestMapping(value="/mypage/dogLikeInsert", method=RequestMethod.POST)
   @ResponseBody
   public int insert(DogLikeVO vo) {
      int count=mapper.count(vo);
      if(count==0) {
         System.out.println(vo.toString());
         mapper.dogLikeInsert(vo);
      }
      return count;
   }
   
   @RequestMapping(value="/mypage/dogLikeDelete", method=RequestMethod.POST)
   @ResponseBody
   public void delete(DogLikeVO vo) {
      mapper.dogLikeDelete(vo);
   }
   
   @RequestMapping("/mypage/readPassword")
   public void readPassword() {

   }
   
   @RequestMapping("/mypage/deletePassword")
   public void deletePassword() {

   }
   
   @RequestMapping("/mypage/myPage")
   public void myPage(Model model, String id) {
      model.addAttribute("vo", mapper.read(id));
      model.addAttribute("list", mapper.dogLikeList(id));
   }
   
   @RequestMapping("/mypage/applyList")
   public void applyList(Model model, String id) {
      model.addAttribute("list", mapper.applyList(id));
   }
   
   @RequestMapping("/mypage/applyRead")
   public void applyRead(Model model, @RequestParam("applicationNo")int applicationNo) {
      model.addAttribute("vo", mapper.applyRead(applicationNo));
      model.addAttribute("applicationNo", applicationNo);
   }
   
   @RequestMapping(value="/mypage/applyCancle", method=RequestMethod.POST)
   public void applyCancle(AdoptVO vo) {
      aService.cancle(vo);
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
   
    @RequestMapping("/myBoard/boardList")
      public String boardList(Criteria cri, Model model,String id){
         HashMap<String, Object> param=new HashMap<String, Object>();
         cri.setPerPageNum(5);
         param.put("id", id);
         param.put("cri", cri);
         PageMaker pm=new PageMaker();
         pm.setCri(cri);
         pm.setTotalCount(mapper.totalCount(id));
         
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