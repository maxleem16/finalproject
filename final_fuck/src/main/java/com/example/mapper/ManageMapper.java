package com.example.mapper;

import java.util.List;

import com.example.domain.AdoptFormVO;
import com.example.domain.CounselingVO;
import com.example.domain.Criteria;

public interface ManageMapper {

	public List<AdoptFormVO> applyList(Criteria cri);
	public List<CounselingVO> counselingList();
	public int applyCount(Criteria cri);
}
