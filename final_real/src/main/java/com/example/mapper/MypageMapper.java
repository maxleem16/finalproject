package com.example.mapper;

import java.util.List;

import com.example.domain.AdoptFormVO;
import com.example.domain.CounselingVO;

public interface MypageMapper {

	public List<AdoptFormVO> applyList(String id);
	
	public AdoptFormVO applyRead(int applicationNo);
	
	public void counselInsert(CounselingVO vo);
}
