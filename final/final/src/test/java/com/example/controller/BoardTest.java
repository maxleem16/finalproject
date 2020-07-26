package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.mapper.BoardMapper;


@RunWith(SpringJUnit4ClassRunner.class) // 먼저 SpringJUnit4ClassRunner.class import한다.
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardTest {
	@Autowired
	private BoardMapper mapper;

	@Test
	public void update() {
		BoardVO vo=new BoardVO();
		vo.setCategory("강아지");
		vo.setPostTitle("ㅇㅇ");
		vo.setPostContent("ㅇㅇ");
		vo.setPostingNo(47);
		mapper.update(vo);
	}

}