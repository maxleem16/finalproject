package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> list(Criteria cri);

	// �Է�
	public void insert(BoardVO vo);

	// �б�
	public BoardVO read(int postingNo);

	// ������Ʈ
	public void update(BoardVO vo);

	// ����
	public void delete(int postingNo);

	// �����Ͱ���
	public int totalCount(Criteria cri);

	public void addAttach(@Param("image") String image, @Param("postingNo") int postingNo);

	public void delAttach(int postingNo);

	public List<String> getAttach(int postingNo);

	public int replyCount(int postingNo);
	public void updateViewcnt(int postingNo);
	public void updateReplycnt(@Param("postingNo") int postingNo, @Param("amount") int amount);
}
