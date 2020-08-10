package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.QnAReplyVO;
import com.example.mapper.ManageMapper;
import com.example.mapper.QnAMapper;

@Service
public class ManageServiceImpl implements ManageService{
	
	@Autowired
	QnAMapper mapper;

	@Transactional
	@Override
	public void insertNcheck(QnAReplyVO vo) {
		mapper.messageChecked(vo.getMessageNo());
		mapper.replyInsert(vo);
	}

}
