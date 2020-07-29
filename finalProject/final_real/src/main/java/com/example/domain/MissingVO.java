package com.example.domain;

import java.util.ArrayList;
import java.sql.Date;

public class MissingVO {
	
	private int reportNo;
	private Date missingTime;
    private String missingLocation;
    private String dogImage;
    private int reward;
    private String tel;
    private String writer;
    private String feature;
    private Date preperationTime;
    private Date modifiedTime;
    private String name;	//유저이름
    private String title;
    private ArrayList<String> images;
    
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public Date getMissingTime() {
		return missingTime;
	}
	public void setMissingTime(Date missingTime) {
		this.missingTime = missingTime;
	}
	public String getMissingLocation() {
		return missingLocation;
	}
	public void setMissingLocation(String missingLocation) {
		this.missingLocation = missingLocation;
	}
	public String getDogImage() {
		return dogImage;
	}
	public void setDogImage(String dogImage) {
		this.dogImage = dogImage;
	}
	public int getReward() {
		return reward;
	}
	public void setReward(int reward) {
		this.reward = reward;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public ArrayList<String> getImages() {
		return images;
	}
	public void setImages(ArrayList<String> images) {
		this.images = images;
	}
	@Override
	public String toString() {
		return "MissingVO [reportNo=" + reportNo + ", missingTime=" + missingTime + ", missingLocation="
				+ missingLocation + ", dogImage=" + dogImage + ", reward=" + reward + ", tel=" + tel + ", writer="
				+ writer + ", feature=" + feature + ", preperationTime=" + preperationTime + ", modifiedTime="
				+ modifiedTime + ", name=" + name + ", title=" + title + ", images=" + images + "]";
	}
    
}
