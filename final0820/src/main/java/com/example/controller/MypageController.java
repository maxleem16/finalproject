package com.example.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.example.mapper.BoardMapper;
import com.example.mapper.DonationMapper;
import com.example.mapper.MissingMapper;
import com.example.mapper.MypageMapper;
import com.example.mapper.QnAMapper;
import com.example.mapper.infoReportMapper;
import com.example.service.AdoptService;

@Controller
public class MypageController {

   @Autowired
   MypageMapper mapper;
   
   @Autowired
   DonationMapper dMapper;
   
   @Autowired
   QnAMapper qMapper;
   
   @Autowired
   infoReportMapper iMapper;
   
   @Autowired
   MissingMapper mMapper;
   
   @Autowired
   BoardMapper bMapper;
   
   @Autowired
   AdoptService aService;
   
   @RequestMapping("/menuTop")
   public void menuTop() {
      
   }
   
   @RequestMapping("/mypage/dogLikeList")
   public void list(String id, Model model, Criteria cri) {
      HashMap<String, Object> param=new HashMap<String, Object>();
         cri.setPerPageNum(5);
         param.put("id", id);
         param.put("cri", cri);
         PageMaker pm=new PageMaker();
         pm.setCri(cri);
         pm.setTotalCount(mapper.totalCount(id));
         
         model.addAttribute("pm", pm);   
         model.addAttribute("list", mapper.dogLikeList(param));
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
   public void myPage(Model model, String id,Criteria cri) {
      model.addAttribute("vo", mapper.read(id));
      model.addAttribute("messageList", qMapper.list(id));
      model.addAttribute("dogList", mapper.myDogLikeList(id));
      model.addAttribute("donationList",dMapper.myList(id,"0"));
      model.addAttribute("boardList",bMapper.myList(id));
      model.addAttribute("missingList",mMapper.myList(id));
      model.addAttribute("infoList",iMapper.myList(id));
   }
   
   @RequestMapping("/mypage/donation")
   public String myDonation(Model model,String id,Criteria cri,String donationMethod) {
      HashMap<String, Object> param=new HashMap<String, Object>();
         cri.setPerPageNum(5);
         param.put("id", id);
         param.put("donationMethod", donationMethod);
         param.put("cri", cri);
         PageMaker pm=new PageMaker();
         pm.setCri(cri);
         pm.setTotalCount(mapper.totalCount(id));
      model.addAttribute("pm",pm);
      model.addAttribute("list",mapper.donationList(param));
      return "/mypage/donation";
   }
   
   @RequestMapping("/mypage/boardList")
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
      return "/mypage/boardList";
   }
   
   @RequestMapping("/mypage/infoList")
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
      return "/mypage/infoList";
   }
   
   @RequestMapping("/mypage/missingList")
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
      return "/mypage/missingList";
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
   @ResponseBody
   public void applyCancle(AdoptVO vo) {
      aService.cancle(vo);
   }
   
   @RequestMapping("/mypage/counselReserve")
   public void counselReserve(Model model, AdoptFormVO vo) {
      model.addAttribute("vo", vo);
   }
   
   @RequestMapping(value="/mypage/counselInsert", method=RequestMethod.POST)
   @ResponseBody
   public void counselInsert(CounselingVO vo) {
      System.out.println(vo.toString());
      mapper.counselInsert(vo);
   }
   
    @RequestMapping("/mypage/counselingList")
    public void counselList(String id,Model model) {
    	Date today=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String now=sdf.format(today);
		model.addAttribute("now", now);
    	model.addAttribute("list", mapper.counselList(id));
    }
    
    @RequestMapping(value="/mypage/counselCancle", method=RequestMethod.POST)
    @ResponseBody
    public void counselCancle(String reserveNo) {
    	System.out.println(reserveNo);
    	mapper.counselCancle(reserveNo);
    }
}