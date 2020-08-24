package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class QnAMessageVO {
	private int messageNo;
	private String sender;
	private String title;
	private String message;
	@JsonFormat(pattern="yyyy-MM-dd hh:mm",timezone ="Asia/Seoul")
	private Date sendDate;
	private Date readDate;
	private String sendDel;
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
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
	public String getSendDel() {
		return sendDel;
	}
	public void setSendDel(String sendDel) {
		this.sendDel = sendDel;
	}
	@Override
	public String toString() {
		return "QnAMessageVO [messageNo=" + messageNo + ", sender=" + sender + ", title=" + title + ", message="
				+ message + ", sendDate=" + sendDate + ", readDate=" + readDate + ", sendDel=" + sendDel + "]";
	}
	
	
}
