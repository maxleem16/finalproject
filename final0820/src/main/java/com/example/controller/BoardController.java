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
         // ��ǥ�̹��� ���ε�
         MultipartFile file=multi.getFile("file");
         if(!file.isEmpty()) { // �̹��������� ������
            String image=System.currentTimeMillis() + file.getOriginalFilename();
            file.transferTo(new File(path + File.separator + image));
            vo.setImage(image);
         }

      //�߰� �̹��� ���ε�
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
      MultipartFile file=multi.getFile("file");   //"file"�� form������ �̸�
         //���Ͼ��ε�
         if(!file.isEmpty()) {   //���ε��� ������ �������������
            String oldImage=vo.getImage(); //������ �ִ� �̹���
            if(oldImage!="") {   //�����̹����� ������ ����
               new File(path + File.separator + oldImage).delete();
            }
            String image=System.currentTimeMillis()+file.getOriginalFilename(); //�� �̹���
            file.transferTo(new File(path + File.separator + image));   //Separator�� ������, �������� �˾Ƽ�
            vo.setImage(image);
         }            
         
         //÷�� �̹��� ���ε�
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