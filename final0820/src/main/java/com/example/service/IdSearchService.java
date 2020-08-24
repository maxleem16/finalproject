package com.example.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper.UserMapper;

@Service
public class IdSearchService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private UserMapper userDao;

	// 아이디 찾기
	public String get_searchId(String name, String tel) {
		userDao = sqlSession.getMapper(UserMapper.class);
		String result = "";
		try {
			result = userDao.searchId(name, tel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}