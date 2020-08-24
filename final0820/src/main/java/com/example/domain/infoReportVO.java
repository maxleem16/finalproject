package com.example.domain;

import java.util.Date;
import java.util.List;

public class infoReportVO {
   private String foundTime; //date type-> string 으로 수정
   private String foundLocation;
   private String dogImage;
   private List<String> dogImages;
   private String protection;
   private String tel;
   private String writer;
   private String feature;
   private int foundNo;
   private Date preperationTime;
   private Date modifiedTime;
   

   public String getFoundTime() {
	return foundTime;
}
	public void setFoundTime(String foundTime) {
		this.foundTime = foundTime;
	}
	public String getFoundLocation() {
	      return foundLocation;
   }
   public void setFoundLocation(String foundLocation) {
      this.foundLocation = foundLocation;
   }
   public String getDogImage() {
      return dogImage;
   }
   public void setDogImage(String dogImage) {
      this.dogImage = dogImage;
   }
   public List<String> getDogImages() {
      return dogImages;
   }
   public void setDogImages(List<String> dogImages) {
      this.dogImages = dogImages;
   }
   public String getProtection() {
      return protection;
   }
   public void setProtection(String protection) {
      this.protection = protection;
   }
   public String getTel() {
      return tel;
   }
   public void setTel(String tel) {
      this.tel = tel;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public String getFeature() {
      return feature;
   }
   public void setFeature(String feature) {
      this.feature = feature;
   }
   public int getFoundNo() {
      return foundNo;
   }
   public void setFoundNo(int foundNo) {
      this.foundNo = foundNo;
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
      return "infoReportVO [foundTime=" + foundTime + ", foundLocation=" + foundLocation + ", dogImage=" + dogImage
            + ", dogImages=" + dogImages + ", protection=" + protection + ", tel=" + tel + ", writer=" + writer
            + ", feature=" + feature + ", foundNo=" + foundNo + ", preperationTime=" + preperationTime
            + ", modifiedTime=" + modifiedTime + "]";
   }

   
}