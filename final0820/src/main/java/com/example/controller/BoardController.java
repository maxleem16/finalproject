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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.BoardMapper;
import com.example.service.BoardService;

@Controller
public class BoardController {
   @Resource(name="dogPath")
   private String path;
   
   @Autowired
   BoardMapper mapper;
   
   @Autowired
   BoardService service;
   
   @RequestMapping("/board/insert")
   public void insert(){
      
   }
   
   @RequestMapping(value="/board/insert",method=RequestMethod.POST)
   public String insertPost(BoardVO vo,MultipartHttpServletRequest multi)throws Exception{
         // 대표이미지 업로드
         MultipartFile file=multi.getFile("file");
         if(!file.isEmpty()) { // 이미지파일이 있으면
            String image=System.currentTimeMillis() + file.getOriginalFilename();
            file.transferTo(new File(path + File.separator + image));
            vo.setImage(image);
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
      vo.setImages(images);
      service.insert(vo);
      return "redirect:list";
   }
   
   @RequestMapping("/board/list")
   public String list(Criteria cri, Model model){
      cri.setPerPageNum(6);
      PageMaker pm=new PageMaker();
      pm.setCri(cri);
      pm.setTotalCount(mapper.totalCount(cri));
      
      model.addAttribute("cri", cri);
      model.addAttribute("pm", pm);
      model.addAttribute("list", mapper.list(cri));
      return "/board/list";
   }
   
   
   @RequestMapping("/board/read")
   @ResponseBody
   public BoardVO read(int postingNo, Model model){
      return mapper.read(postingNo);
   }
   
   @RequestMapping("/board/read2")
   public void read2(int postingNo, Model model){
      model.addAttribute("vo", mapper.read(postingNo));
   }
   
   @RequestMapping(value="/board/update", method=RequestMethod.POST)
   public String update(BoardVO vo, Criteria cri, Model model,MultipartHttpServletRequest multi)throws Exception{
      System.out.println(vo.toString());
      MultipartFile file=multi.getFile("file");   //"file"은 form에서의 이름
         //파일업로드
         if(!file.isEmpty()) {   //업로드할 파일이 비어있지않으면
            String oldImage=vo.getImage(); //기존에 있던 이미지
            if(oldImage!="") {   //기존이미지가 있으면 삭제
               new File(path + File.separator + oldImage).delete();
            }
            String image=System.currentTimeMillis()+file.getOriginalFilename(); //새 이미지
            file.transferTo(new File(path + File.separator + image));   //Separator는 슬래시, 역슬래시 알아서
            vo.setImage(image);
         }            
         
         //첨부 이미지 업로드
         List<MultipartFile> files = multi.getFiles("files");
         if(files.size()!=0){
            if(!files.get(0).isEmpty()) {
               List<String> oldImages=mapper.getAttach(vo.getPostingNo());
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
         vo.setImages(images);
       service.update(vo);
      model.addAttribute("cri", cri);
      return "redirect:list?page="+cri.getPage();
   }
   
   @RequestMapping(value="/board/delete", method=RequestMethod.POST)
   public String delete(int postingNo, Criteria cri, Model model){
      service.delete(postingNo);
      model.addAttribute("cri", cri);
      return "redirect:list?page="+cri.getPage();
   }
   
   @RequestMapping(value="/board/replyCount")
   @ResponseBody
   public int replyCount(int postingNo){
      return mapper.replyCount(postingNo);
   }
   

}