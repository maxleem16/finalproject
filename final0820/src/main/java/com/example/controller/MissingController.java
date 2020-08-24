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
import com.example.domain.MissingVO;
import com.example.mapper.MissingMapper;
import com.example.service.MissingService;

@Controller
public class MissingController {
   @Resource(name="dogPath")   //servlet-context���� ������ ���ε� id�̸�
   private String path;

   @Autowired
   MissingMapper mapper;
   @Autowired
   MissingService service;

   //�̹������� �������� ���
   @RequestMapping("/display")
   @ResponseBody
   public ResponseEntity<byte[]> display(String fileName) throws Exception {
      ResponseEntity<byte[]> result = null;
      // display fileName�� �ִ� ���
      if (fileName!=("")) {
         File file = new File(path + File.separator + fileName);
         HttpHeaders header = new HttpHeaders();
         header.add("Content-Type", Files.probeContentType(file.toPath()));
         result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
      }
      return result;
   }
   
   @RequestMapping("/missing/list")
   public String list(Criteria cri,Model model) {
      PageMaker pm=new PageMaker();
      cri.setPerPageNum(5);
      pm.setCri(cri);
      pm.setTotalCount(mapper.totalCount(cri));
      model.addAttribute("cri",cri);
      model.addAttribute("pm",pm);
      model.addAttribute("list",mapper.list(cri));
      return "/missing/list";
   }
   
   @RequestMapping("/missing/read")
   public String read(int reportNo,Model model) {
      model.addAttribute("list",mapper.getAttach(reportNo));
      model.addAttribute("read",mapper.read(reportNo));
      return "/missing/read";
   }
   
   @RequestMapping("/missing/read2")
   public String read2(int reportNo,Model model) {
      model.addAttribute("list",mapper.getAttach(reportNo));
      model.addAttribute("read",mapper.read(reportNo));
      return "/missing/read2";
   }
   
   @RequestMapping("/missing/insert")
   public String insert() {
      return "/missing/insert";
   }
   
   @RequestMapping(value="/missing/insert", method=RequestMethod.POST)
   public String insertPost(MissingVO vo, MultipartHttpServletRequest multi) throws Exception {
      MultipartFile file=multi.getFile("file");   //"file"�� form������ �̸�
      //���Ͼ��ε�
      if(!file.isEmpty()) {   //���ε��� ������ �������������
         String dogImage=System.currentTimeMillis()+file.getOriginalFilename(); //�и��������� �ߺ�����
         file.transferTo(new File(path + File.separator + dogImage));   //Separator�� ������, �������� �˾Ƽ�
         vo.setDogImage(dogImage);
      }
      System.out.println(vo.toString());
      //÷�����Ͼ��ε�(������ �ѹ���)
      List<MultipartFile> files=multi.getFiles("files");
      ArrayList<String> images=new ArrayList<String>();
      for(MultipartFile addFile:files) {
         if(!addFile.isEmpty()) {   //���ε��� ������ �������������
            String image=System.currentTimeMillis()+addFile.getOriginalFilename();
            addFile.transferTo(new File(path + File.separator + image));
            images.add(image);
         }
      }
      vo.setImages(images);
      System.out.println(vo.toString());
      service.insert(vo);
      return "redirect:/missing/list";
   }
   
   @RequestMapping(value="/missing/delete", method=RequestMethod.POST)
   public String deletePost(MissingVO vo) throws Exception {
      //���ϻ���
      String oldImage=vo.getDogImage();
      System.out.println(oldImage);
      if(oldImage!=("")) { 
         new File(path + File.separator + oldImage).delete();
      }
      //÷������(������) ����
      List<String> images=mapper.getAttach(vo.getReportNo());
      for(String image:images) {
         if(image!=("")) {
            new File(path + File.separator + image).delete();
         }
      }
      service.delete(vo.getReportNo());
      return "redirect:/missing/list";
   }
   
   @RequestMapping(value="/missing/update", method=RequestMethod.POST)
   public String updatePost(MissingVO vo, MultipartHttpServletRequest multi) throws Exception {
      MultipartFile file=multi.getFile("file");   //"file"�� form������ �̸�
      
      //���Ͼ��ε�
      if(!file.isEmpty()) {   //���ε��� ������ �������������
         String oldImage=vo.getDogImage(); //������ �ִ� �̹���
         System.out.println(oldImage);
         if(oldImage!="") {   //�����̹����� ������ ����
            new File(path + File.separator + oldImage).delete();
         }
         String dogImage=System.currentTimeMillis()+file.getOriginalFilename(); //�� �̹���
         file.transferTo(new File(path + File.separator + dogImage));   //Separator�� ������, �������� �˾Ƽ�
         vo.setDogImage(dogImage);
      }
      //÷�� �̹��� ���ε�
      List<MultipartFile> files = multi.getFiles("files");
      if(!files.get(0).isEmpty()) {
         List<String> oldImages=mapper.getAttach(vo.getReportNo());
         for(String oldImage:oldImages) {
            new File(path + File.separator + oldImage).delete();
         }
      }
      ArrayList<String> images = new ArrayList<String>();
      for (MultipartFile attFile : files) {
         if (!attFile.isEmpty()) {
            String image = System.currentTimeMillis() + attFile.getOriginalFilename();
            attFile.transferTo(new File(path + File.separator + image));
            images.add(image);
         }
      }
      vo.setImages(images);
      System.out.println(vo.toString());
      service.update(vo);
      return "redirect:/missing/list";
   }
   
}