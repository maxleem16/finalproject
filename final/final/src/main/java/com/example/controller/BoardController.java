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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.BoardMapper;
import com.example.service.BoardService;

@Controller

public class BoardController {
	@Resource(name = "dogPath")
	private String path;
	
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	BoardService service;
	
	@RequestMapping("/board/list")
	public void list(Model model, Criteria cri) {
		cri.setPerPageNum(10);

		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(cri));

		model.addAttribute("list", mapper.list(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pm", pm);
	}

	@RequestMapping("/board/insert")
	public void insert() {

	}

	@RequestMapping("/board/delete")
	public void delet(int postingNo){
		mapper.delete(postingNo);
	}

	@RequestMapping("/board/read")
	public void read(Model model, int postingNo) {
		model.addAttribute("vo", mapper.read(postingNo));
		model.addAttribute("list", mapper.getAttach(postingNo));
	}
	
	@RequestMapping(value = "/board/insert", method = RequestMethod.POST)
	public String inserPost(BoardVO vo, MultipartHttpServletRequest multi) throws Exception {
		// 대표이미지 업로드
		MultipartFile file = multi.getFile("file");
		if (!file.isEmpty()) {
			String image = System.currentTimeMillis() + file.getOriginalFilename();
			file.transferTo(new File(path + File.separator + image));
			vo.setImage(image);
		}
		// 추가 이미지 업로드
		List<MultipartFile> files = multi.getFiles("files");
		List<String> images = new ArrayList<String>();
		for (MultipartFile attFile : files) {
			if (!attFile.isEmpty()) {
				String image = System.currentTimeMillis() + attFile.getOriginalFilename();
				attFile.transferTo(new File(path + File.separator + image));
				images.add(image);
			}
		}
		vo.setImages(images);

		service.insert(vo);
		return "redirect:list";
	}

	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String updatePost(BoardVO vo, MultipartHttpServletRequest multi) throws Exception {
		// 대표이미지 업로드
		MultipartFile file = multi.getFile("file");
		if (!file.isEmpty()) {
			String oldImage=vo.getImage(); //기존에 있던 이미지
			// 옛날 대표이미지 삭제
			if (!oldImage.equals("")) {
				new File(path + File.separator + oldImage).delete();
			}
			String image = System.currentTimeMillis() + file.getOriginalFilename();
			file.transferTo(new File(path + File.separator + image));
			vo.setImage(image);
		}
		// 첨부이미지 업로드
		List<MultipartFile> files = multi.getFiles("files");
		//옛날 첨부이미지 있으면 삭제
		if(!files.get(0).isEmpty()){
			List<String> oldImages=mapper.getAttach(vo.getPostingNo());
			for(String oldImage:oldImages){
				new File(path + File.separator + oldImage).delete();
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
		return "redirect:list";
	}
	
	@RequestMapping(value = "/board/delete", method = RequestMethod.POST)
	public String deletePost(BoardVO vo) {
		// 대표이미지가 있으면 삭제
		if (!vo.getImage().equals("")) {
			new File(path + File.separator + vo.getImage()).delete();
		}
		// 첨부이미가 있으면 삭제
		List<String> images = mapper.getAttach(vo.getPostingNo());
		for (String image : images) {
			new File(path + File.separator + image).delete();
		}
		service.delete(vo.getPostingNo());
		return "redirect:list";
	}

	// 이미지파일 브라우저에 출력
	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName) throws Exception {
		ResponseEntity<byte[]> result = null;
		// display fileName이 있는 경우
		if (!fileName.equals("")) {
			File file = new File(path + File.separator + fileName);
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}
}
