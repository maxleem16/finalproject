package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> list(Criteria cri);

	// 입력
	public void insert(BoardVO vo);

	// 읽기
	public BoardVO read(int postingNo);

	// 업데이트
	public void update(BoardVO vo);

	// 삭제
	public void delete(int postingNo);

	// 데이터갯수
	public int totalCount(Criteria cri);

	public void addAttach(@Param("image") String image, @Param("postingNo") int postingNo);

	public void delAttach(int postingNo);

	public List<String> getAttach(int postingNo);

	public int replyCount(int postingNo);
	public void updateViewcnt(int postingNo);
	public void updateReplycnt(@Param("postingNo") int postingNo, @Param("amount") int amount);
}
