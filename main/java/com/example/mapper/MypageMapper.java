package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.AdoptFormVO;
import com.example.domain.CounselingVO;
import com.example.domain.Criteria;
import com.example.domain.QnAMessageVO;

public interface MypageMapper {

	public List<AdoptFormVO> applyList(String id);

	public AdoptFormVO applyRead(int applicationNo);

	public void counselInsert(CounselingVO vo);

	public List<QnAMessageVO> qnaList(@Param("cri") Criteria cri, @Param("id") String id);

	public void messageInsert(QnAMessageVO vo);

	public void messageDelete(QnAMessageVO vo);

	public int replyCount(@Param("messageNo") int messageNo, @Param("id") String id);

	public void messageChecked(int replyNp);

	public int uncheckedMessage(String id);
}
