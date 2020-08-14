package com.example.mapper;

import java.util.List;

import com.example.domain.AdoptFormVO;
import com.example.domain.CounselingVO;
import com.example.domain.Criteria;
import com.example.domain.UserVO;

public interface ManageMapper {

	public List<AdoptFormVO> applyList(Criteria cri);

	public List<CounselingVO> counselingList(Criteria cri);

	public int applyCount(Criteria cri);

	public void cancleUpdate(UserVO vo);
	
	public int counselingCount();
}
