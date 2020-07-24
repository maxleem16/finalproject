package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyVO {
	private int commentNo;
	private int postingNo;
	private String commentContent;
	private String writer;
	private Date preperationTime;
	private Date modifiedTime;
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getPostingNo() {
		return postingNo;
	}
	public void setPostingNo(int postingNo) {
		this.postingNo = postingNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getPreperationTime() {
		return preperationTime;
	}
	public void setPreperationTime(Date preperationTime) {
		this.preperationTime = preperationTime;
	}
	public Date getModifiedTime() {
		return modifiedTime;
	}
	public void setModifiedTime(Date modifiedTime) {
		this.modifiedTime = modifiedTime;
	}
	@Override
	public String toString() {
		return "ReplyVO [commentNo=" + commentNo + ", postingNo=" + postingNo + ", commentContent=" + commentContent
				+ ", writer=" + writer + ", preperationTime=" + preperationTime + ", modifiedTime=" + modifiedTime
				+ "]";
	}
	
}
