package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.DogVO;
import com.example.mapper.DogMapper;

@Service
public class DogServiceImpl implements DogService {
	@Autowired
	DogMapper mapper;
	
	@Transactional
	@Override
	public void insert(DogVO vo) {
		mapper.insert(vo);
		List<String> images = vo.getImages();
		for (String image : images) {
			mapper.dog_attach(vo.getDogCode(), image);
		}
	}

	@Override
	public void update(DogVO vo) {
		mapper.update(vo);
		List<String> images = vo.getImages();
		if (images.size() > 0) {
			mapper.del_attach(vo.getDogCode());
			for (String image : images) {
				mapper.dog_attach(vo.getDogCode(), image);
			}
		}
	}

	@Override
	public void delete(String dogCode) {
		// TODO Auto-generated method stub

	}

}