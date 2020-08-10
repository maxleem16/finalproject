package com.example.domain;

import java.sql.Date;
import java.util.List;

public class BoardVO {
   private String image;
   private List<String> images;
   private String writer;
   private int postingNo;
   private Date preperationTime;
   private Date modifiedTime;
   private String postTitle;
   private String postContent;
   private String cotegory;
   private int replycnt;
   
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
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public int getPostingNo() {
      return postingNo;
   }
   public void setPostingNo(int postingNo) {
      this.postingNo = postingNo;
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
   public String getCotegory() {
      return cotegory;
   }
   public void setCotegory(String cotegory) {
      this.cotegory = cotegory;
   }
   public int getReplycnt() {
      return replycnt;
   }
   public void setReplycnt(int replycnt) {
      this.replycnt = replycnt;
   }
   
   @Override
   public String toString() {
      return "BoardVO [image=" + image + ", images=" + images + ", writer=" + writer
            + ", postingNo=" + postingNo + ", preperationTime=" + preperationTime + ", modifiedTime=" + modifiedTime
            + ", postTitle=" + postTitle + ", postContent=" + postContent + ", cotegory=" + cotegory + ", replycnt="
            + replycnt + "]";
   }
   
}