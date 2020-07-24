package com.example.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.infoReportVO;
import com.example.mapper.infoReportMapper;
import com.example.service.infoReportService;




@Controller
public class infoReportController {
   @Resource(name="dogPath")
   private String path;
   
   @Autowired
   infoReportMapper mapper;

   @Autowired
   infoReportService service;
   
   @RequestMapping("/infoReport/insert")
   public void insert(){

   }
   
   @RequestMapping("/infoReport/list")
   public String list(Criteria cri, Model model){

      cri.setPerPageNum(5);
      PageMaker pm=new PageMaker();
      pm.setCri(cri);
      pm.setTotalCount(mapper.totalCount(cri));
      
      model.addAttribute("cri", cri);
      model.addAttribute("pm", pm);
      model.addAttribute("list", mapper.list(cri));
      return "/infoReport/list";
   }
   
   @RequestMapping("/infoReport/read")
   public void read(Model model, int foundNo){
      model.addAttribute("list", mapper.getAttach(foundNo));
      model.addAttribute("vo", mapper.read(foundNo));
   }
   
   @RequestMapping(value="/infoReport/insert", method=RequestMethod.POST)
   public String insertPost(infoReportVO vo, MultipartHttpServletRequest multi)throws Exception{
      System.out.println(vo.toString());
      mapper.insert(vo);
      return "redirect:list";
   }
   
   @RequestMapping(value="/infoReport/update", method=RequestMethod.POST)
   public String updatePost(infoReportVO vo, MultipartHttpServletRequest multi)throws Exception{
      MultipartFile file=multi.getFile("file");
      // 대표이미지 업로드
      if(!file.isEmpty()){
         // 기존 대표이미지가 있으면 삭제
         if(!vo.getDogImage().equals("")){
            new File(path + File.separator + vo.getDogImage()).delete();
         }
         String image=System.currentTimeMillis() + file.getOriginalFilename();
         file.transferTo(new File(path + File.separator + image));
         vo.setDogImage(image);
      }
      
      // 추가이미지 업로드
      List<MultipartFile> files=multi.getFiles("files");
      // 기존 추가이미지가 있으면 삭제
      if(!files.get(0).isEmpty()){
         List<String> oldImages=mapper.getAttach(vo.getFoundNo());
         for(String oldImage:oldImages){
            new File(path + File.separator + oldImage).delete();
         }
      }
      // 새로운 추가이미지 업로드
      ArrayList<String> images=new ArrayList<String>();
      for(MultipartFile attFile:files){
         if(!attFile.isEmpty()){
            String image=System.currentTimeMillis() + attFile.getOriginalFilename();
            attFile.transferTo(new File(path + File.separator + image));
            images.add(image);
         }
      }
      vo.setdogImages(images);
      service.update(vo);
      return "redirect:list";
   }
   
   @RequestMapping(value="/infoReport/delete", method=RequestMethod.POST)
   public String deletePost(infoReportVO vo)throws Exception{
      // 대표이미지 삭제
      String oldImage=vo.getDogImage();
      if(!oldImage.equals("")){
         new File(path + File.separator + oldImage).delete();
      }
      // 추가이미지 삭제
      List<String> images=mapper.getAttach(vo.getFoundNo());
      for(String image:images){
         if(!image.equals("")){
            new File(path + File.separator + image).delete();
         }
      }
      service.delete(vo.getFoundNo());
      return "redirect:list";
   }


}