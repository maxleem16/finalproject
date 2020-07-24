package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> list(@Param("postingNo") int postingNo, @Param("cri") Criteria cri);
	public void insert(ReplyVO vo);
	public void delete(int commentNo);
	public ReplyVO read(int commentNo);
	public void update(ReplyVO vo);
	public int total(int postingNo);
}
