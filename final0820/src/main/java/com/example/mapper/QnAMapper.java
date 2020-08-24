package com.example.mapper;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.QnAMessageVO;
import com.example.domain.QnAReplyVO;

public interface QnAMapper {

	public List<QnAMessageVO> qnaList(Criteria cri);

	public QnAReplyVO qnaReply(int messageNo);

	public void replyInsert(QnAReplyVO vo);

	public void messageChecked(int messageNo);

	public int uncheckedMessage();

	public int allMessage();

	public QnAMessageVO getName(int messageNo);

	// 마이페이지 1대1 문의 목록
	public List<QnAMessageVO> list(String sender);

	// 마이페이지 1대1 문의하기
	public void messageInsert(QnAMessageVO vo);
}
