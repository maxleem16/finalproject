package com.example.mapper;

import java.util.List;

import com.example.domain.AdoptFormVO;
import com.example.domain.CounselingVO;

public interface ManageMapper {

	public List<AdoptFormVO> applyList();
	public List<CounselingVO> counselingList();
	
}
