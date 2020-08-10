package com.example.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.CounselingVO;
import com.example.domain.Criteria;
import com.example.domain.DogVO;
import com.example.domain.PageMaker;
import com.example.domain.QnAMessageVO;
import com.example.domain.QnAReplyVO;
import com.example.mapper.AdoptMapper;
import com.example.mapper.DogMapper;
import com.example.mapper.ManageMapper;
import com.example.mapper.MypageMapper;
import com.example.mapper.QnAMapper;
import com.example.mapper.UserMapper;
import com.example.service.DogService;
import com.example.service.ManageService;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class ManageController {

	@Autowired
	ManageMapper mapper;
	
	@Autowired
	UserMapper umapper;
	
	@Autowired
	MypageMapper mmapper;
	
	@Autowired
	AdoptMapper amapper;
	
	@Autowired
	QnAMapper qmapper;
	
	@Autowired
	DogMapper dmapper;
	
	@Autowired
	DogService service;

	@Resource(name = "dogPath")
	private String path;
	
	
	@RequestMapping("/manage/dogList")
	public void dogManageList(Model model, Criteria cri) {
		cri.setPerPageNum(12);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(dmapper.totalCount(cri));
		model.addAttribute("pm", pm);
		model.addAttribute("cri", cri);
		model.addAttribute("list", dmapper.list(cri));
	}
	
	@RequestMapping("/manage/dogRead")
	public void dogManageRead(Model model,String dogCode) {
	model.addAttribute("list", dmapper.get_Attach(dogCode));
	model.addAttribute("vo", dmapper.read(dogCode));
	      
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
			List<String> oldImages = dmapper.get_Attach(vo.getDogCode());
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
	@RequestMapping("/manage/index")
	public void index(Model model) {
		model.addAttribute("unReadMessage", qmapper.uncheckedMessage());
	}

	@RequestMapping("/manage/float/counselingList")
	public void counselingList() {
	}
	
	
	@RequestMapping("/manage/userRead")
	public String read(String id,Model model,String cancleCheck) {
		model.addAttribute("read",umapper.read(id));
		model.addAttribute("list", mmapper.applyList(id));
		cancleCheck="1";
		model.addAttribute("count",amapper.cancleCount(cancleCheck, id));
		return "/manage/userRead";
	}
	
	@RequestMapping("/manage/userList")
	public String list(Criteria cri,Model model) {
		PageMaker pm=new PageMaker();
		cri.setPerPageNum(16);
		pm.setCri(cri);
		pm.setTotalCount(umapper.totalCount(cri));
		model.addAttribute("cri",cri);
		model.addAttribute("pm",pm);
		model.addAttribute("list",umapper.list(cri));
		return "/manage/userList";
	}
	
	@RequestMapping("/manage/applyList.json")
	@ResponseBody
	public HashMap<String, Object> applyListJson(Criteria cri) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.applyCount(cri));
		map.put("list", mapper.applyList(cri));
		map.put("pm", pm);
		return map;
	}
	
	@RequestMapping(value = "/manage/float/counseling", method = RequestMethod.GET)
	@ResponseBody
	public String counseling() {
		List<CounselingVO> list=mapper.counselingList();
		JsonArray array=new JsonArray();
		
		for(CounselingVO vo:list) {
			JsonObject obj=new JsonObject();
			String title=vo.getCounselingTime()+"시 상담-"+vo.getId();
			obj.addProperty("title", title);
			obj.addProperty("start", vo.getCounselingDate());
			array.add(obj);
		}
		
		return array.toString();
	}
}
