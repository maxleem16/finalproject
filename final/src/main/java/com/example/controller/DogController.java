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
	
	@RequestMapping("/index")
	public void index() {

	}

	@RequestMapping("/menu")
	public void menu() {

	}

	@RequestMapping("/footer")
	public void footer() {

	}

	@RequestMapping("/dog")
	public void dog() {

	}

	@RequestMapping("/dog/read")
	public void dogRead(Model model, String dogCode) {
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

	@RequestMapping(value = "/dog/insert")
	public void insert(Model model, Criteria cri) {
		model.addAttribute("total", mapper.totalCount(cri));
	}

	@RequestMapping(value = "/dog/insert", method = RequestMethod.POST)
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
		return "redirect:list";
	}

}
