package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class QnAReplyVO extends QnAMessageVO{
	
	private int replyNo;
	private int messageNo;
	private String receiver;
	private String content;
	@JsonFormat(pattern="yyyy-MM-dd hh:mm",timezone ="Asia/Seoul")
	private Date sendDate;
	private Date readDate;
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public Date getReadDate() {
		return readDate;
	}
	public void setReadDate(Date readDate) {
		this.readDate = readDate;
	}
	@Override
	public String toString() {
		return "QnAReplyVO [replyNo=" + replyNo + ", messageNo=" + messageNo + ", receiver=" + receiver + ", content="
				+ content + ", sendDate=" + sendDate + ", readDate=" + readDate + "]";
	}
	
}
