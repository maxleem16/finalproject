package com.example.service;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.domain.MissingVO;
import com.example.mapper.MissingMapper;

@Service
public class MissingServiceImpl implements MissingService{
	@Autowired
	MissingMapper mapper;
	
	@Transactional
	@Override
	public void insert(MissingVO vo) {
		mapper.insert(vo);
		//Ã·ºÎÆÄÀÏ insert
		ArrayList<String> images=vo.getImages();
		for(String image:images) {
			mapper.addAttach(image, vo.getReportNo());
			System.out.println(vo.toString());
		}
	}

	@Transactional
	@Override
	public void delete(int reportNo) {
		mapper.delAttach(reportNo);
		mapper.delete(reportNo);
	}

	@Transactional
	@Override
	public void update(MissingVO vo) {
		System.out.println(vo.toString());
		mapper.update(vo);
		
		ArrayList<String> images = vo.getImages();
		if(images.size() > 0) {
			mapper.delAttach(vo.getReportNo());
			for (String image : images) {
				mapper.addAttach(image, vo.getReportNo());
			}
		}
	}

}
