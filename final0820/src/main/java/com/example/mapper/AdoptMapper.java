package com.example.mapper;

import com.example.domain.AdoptVO;
import com.example.domain.Criteria;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.AdoptFormVO;

public interface AdoptMapper {

	public void insert(AdoptVO vo);
	
	public AdoptVO insertCheck(String dogCode);

	public void apply(AdoptFormVO vo);

	public AdoptVO read(int applicationNo);
	
	public AdoptFormVO formRead(int applicationNo);

	public void adoptCancle(AdoptVO vo);

	public void deleteForm(int applicationNo);

	public void checkUpdate(AdoptVO vo);

	public List<AdoptVO> list(Criteria cri);

	public int totalCount();
	
	public int cancleCount(@Param("cancleCheck") String cancleCheck, @Param("id") String id);
}
