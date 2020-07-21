package com.example.mapper;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.DogVO;

public interface DogMapper {
	public List<DogVO> list(Criteria cri); 
	public int totalCount(Criteria cri);
}
