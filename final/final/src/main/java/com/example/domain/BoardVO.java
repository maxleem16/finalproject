package com.example.domain;

import java.util.Date;
import java.util.List;

public class BoardVO {
	private String category;
	private int postingNo;
	private String postTitle;
	private String postContent;
	private String writer;
	private Date preperationTime;
	private Date modiifiedTime;
	private String image;
	private List<String> images;
	private int replycnt;
	private int viewcnt;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPostingNo() {
		return postingNo;
	}
	public void setPostingNo(int postingNo) {
		this.postingNo = postingNo;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
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
	public Date getModiifiedTime() {
		return modiifiedTime;
	}
	public void setModiifiedTime(Date modiifiedTime) {
		this.modiifiedTime = modiifiedTime;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public List<String> getImages() {
		return images;
	}
	public void setImages(List<String> images) {
		this.images = images;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	@Override
	public String toString() {
		return "BoardVO [category=" + category + ", postingNo=" + postingNo + ", postTitle=" + postTitle
				+ ", postContent=" + postContent + ", writer=" + writer + ", preperationTime=" + preperationTime
				+ ", modiifiedTime=" + modiifiedTime + ", image=" + image + ", images=" + images + ", replycnt="
				+ replycnt + ", viewcnt=" + viewcnt + "]";
	}
	
}