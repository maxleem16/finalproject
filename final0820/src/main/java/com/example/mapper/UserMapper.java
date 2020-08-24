package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.UserVO;

public interface UserMapper {

	public List<UserVO> list(Criteria cri);

	public int totalCount(Criteria cri);

	public UserVO read(String id);

	public void insert(UserVO vo);

	public void update(UserVO vo);

	public void delete(String id);
	
	public int GetKey(String id, String user_key);
	
	public int alter_userKey(String id, String user_key);
	
	public String searchId(@Param("name")String name, @Param("tel")String tel); // 유저 ID 찾기
	
	public int searchPassword(String id, String email, String key); // 회원 임시 비밀번호 변경 메서드

}