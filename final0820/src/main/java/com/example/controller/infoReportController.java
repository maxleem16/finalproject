package com.example.controller;

import java.io.File;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

   @RequestMapping(value="/infoReport/insert", method=RequestMethod.POST)
   public String insertPost(infoReportVO vo, MultipartHttpServletRequest multi)throws Exception{
	   // 대표이미지 업로드
         MultipartFile file=multi.getFile("file");
         if(!file.isEmpty()) { // 이미지파일이 있으면
            String image=System.currentTimeMillis() + file.getOriginalFilename();
            file.transferTo(new File(path + File.separator + image));
            vo.setDogImage(image);
         }

      //추가 이미지 업로드
      List<MultipartFile> files=multi.getFiles("files");
      List<String> images=new ArrayList<String>();
      for(MultipartFile attFile:files) {
         if(!attFile.isEmpty()) {
            String image=System.currentTimeMillis() + attFile.getOriginalFilename();
            attFile.transferTo(new File(path + File.separator + image));
            images.add(image);
         }
      }
      vo.setDogImages(images);
      service.insert(vo);
      return "redirect:/infoReport/list";
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
   public void read(Model model, int foundNo, Criteria cri){
      model.addAttribute("cri", cri);
      model.addAttribute("list", mapper.getAttach(foundNo));
      model.addAttribute("vo", mapper.read(foundNo));
   }
   
   @RequestMapping(value="/infoReport/update", method=RequestMethod.POST)
      public String updatePost(infoReportVO vo, MultipartHttpServletRequest multi,Criteria cri) throws Exception {
         MultipartFile file=multi.getFile("file");   //"file"은 form에서의 이름
         //파일업로드
         if(!file.isEmpty()) {   //업로드할 파일이 비어있지않으면
            String oldImage=vo.getDogImage(); //기존에 있던 이미지
            if(oldImage!="") {   //기존이미지가 있으면 삭제
               new File(path + File.separator + oldImage).delete();
            }
            String dogImage=System.currentTimeMillis()+file.getOriginalFilename(); //새 이미지
            file.transferTo(new File(path + File.separator + dogImage));   //Separator는 슬래시, 역슬래시 알아서
            vo.setDogImage(dogImage);
         }            
         
         //첨부 이미지 업로드
         List<MultipartFile> files = multi.getFiles("files");
         if(files.size()!=0){
            if(!files.get(0).isEmpty()) {
               List<String> oldImages=mapper.getAttach(vo.getFoundNo());
               for(String oldImage:oldImages) {
                  new File(path + File.separator + oldImage).delete();
               }
            }
         }
         List<String> images = new ArrayList<String>();
         for (MultipartFile attFile : files) {
            if (!attFile.isEmpty()) {
               String image = System.currentTimeMillis() + attFile.getOriginalFilename();
               attFile.transferTo(new File(path + File.separator + image));
               images.add(image);
            }
         }
         vo.setDogImages(images);
         
         service.update(vo);
         return "redirect:list?page="+cri.getPage();
      }
   
   @RequestMapping(value="/infoReport/delete", method=RequestMethod.POST)
   public String delete(int foundNo,Criteria cri){
      service.delete(foundNo);
      return "redirect:list?page="+cri.getPage();
   }
   
}