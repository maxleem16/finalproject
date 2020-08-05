package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.AdoptFormVO;
import com.example.domain.AdoptVO;
import com.example.mapper.AdoptMapper;
@Service
public class AdoptServiceImpl implements AdoptService{
	
	@Autowired
	AdoptMapper mapper;
	
	@Transactional
	@Override
	public void insert(AdoptFormVO vo) {
		mapper.insert(vo);
		mapper.apply(vo);
	}

	@Transactional
	public void cancle(AdoptVO vo) {
		//원래폼이업슬경우...는?
		mapper.deleteForm(vo.getApplicationNo());
		mapper.adoptCancle(vo);
	}

	
	
}