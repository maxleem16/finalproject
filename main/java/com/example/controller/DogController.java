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
import com.example.domain.DogVO;
import com.example.domain.PageMaker;
import com.example.mapper.DogMapper;
import com.example.service.DogService;

@Controller

public class DogController {
	
	@Autowired
	DogMapper mapper;
	

	@Autowired
	DogService service;

	@Resource(name = "dogPath")
	private String path;
	

	@RequestMapping("/dog/adoptStep")
	public void adoptStep() {
		
	}
	
	@RequestMapping("/dog/read")
	public void dogRead(Model model,String dogCode) {
		model.addAttribute("list", mapper.get_Attach(dogCode));
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
	
	@RequestMapping("/manage/dogList")
	public void dogManageList(Model model, Criteria cri) {
		cri.setPerPageNum(12);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(cri));
		model.addAttribute("pm", pm);
		model.addAttribute("cri", cri);
		model.addAttribute("list", mapper.list(cri));
	}
	
	@RequestMapping("/manage/dogRead")
	public void dogManageRead(Model model,String dogCode) {
	model.addAttribute("list", mapper.get_Attach(dogCode));
	model.addAttribute("vo", mapper.read(dogCode));
	      
	}
	
	@RequestMapping("/manage/dogInsert")
	public void insert() {
	}
	
	@RequestMapping(value="/manage/dogInsert", method=RequestMethod.POST)
	public String insertPost(DogVO vo, MultipartHttpServletRequest multi) throws Exception {
		// 대표이미지
		MultipartFile file = multi.getFile("file");
		if (!file.isEmpty()) {
			String image = System.currentTimeMillis() + file.getOriginalFilename();
			file.transferTo(new File(path + File.separator + image));
			vo.setDogImage(image);
		}
		// 추가이미지
		List<MultipartFile> files = multi.getFiles("files");
		List<String> images = new ArrayList<String>();
		for (MultipartFile attfile : files) {
			if (!attfile.isEmpty()) {
				String image = System.currentTimeMillis() + attfile.getOriginalFilename();
				attfile.transferTo(new File(path + File.separator + image));
				images.add(image);
			}
		}
		vo.setImages(images);
		service.insert(vo);
		return "redirect:/manage/dogList";
	}

	@RequestMapping(value="/manage/dogUpdate", method=RequestMethod.POST)
	public String dogUpdate(DogVO vo, MultipartHttpServletRequest multi) throws Exception {
		MultipartFile file = multi.getFile("file");
		if (!file.isEmpty()) {
			if (!vo.getDogImage().equals("")) {
				new File(path + File.separator + vo.getDogImage()).delete();
			}
			String image = System.currentTimeMillis() + file.getOriginalFilename();
			file.transferTo(new File(path + File.separator + image));
			vo.setDogImage(image);
		}

		List<MultipartFile> files = multi.getFiles("files");
		List<String> images = new ArrayList<String>();

		if (!files.get(0).isEmpty()) {
			List<String> oldImages = mapper.get_Attach(vo.getDogCode());
			for (String oldImage : oldImages) {
				new File(path + File.separator + oldImage).delete();
			}
		}

		for (MultipartFile attfile : files) {
			if (!attfile.isEmpty()) {
				String image = System.currentTimeMillis() + attfile.getOriginalFilename();
				attfile.transferTo(new File(path + File.separator + image));
				images.add(image);
			}
		}
		vo.setImages(images);
		service.update(vo);
		return "redirect:/manage/dogList";
	}

}
