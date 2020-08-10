package com.example.mapper;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.UserVO;

public interface UserMapper {

	public List<UserVO> list(Criteria cri);

	public int totalCount(Criteria cri);

	public UserVO read(String id);

	public void insert(UserVO vo);

	public void update(UserVO vo);

	public void delete(String id);
}