package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AdoptVO extends UserVO {
	private int applicationNo;
	private String applicant;
	private String dogCode;
	private String applicationConfirm;
	@JsonFormat(pattern="yyyy-MM-dd hh:mm",timezone ="Asia/Seoul")
	private Date appliedDate;
	private String cancleCheck;

	public int getApplicationNo() {
		return applicationNo;
	}

	public void setApplicationNo(int applicationNo) {
		this.applicationNo = applicationNo;
	}

	public String getApplicant() {
		return applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	public String getDogCode() {
		return dogCode;
	}

	public void setDogCode(String dogCode) {
		this.dogCode = dogCode;
	}

	public String getApplicationConfirm() {
		return applicationConfirm;
	}

	public void setApplicationConfirm(String applicationConfirm) {
		this.applicationConfirm = applicationConfirm;
	}

	public Date getAppliedDate() {
		return appliedDate;
	}

	public void setAppliedDate(Date appliedDate) {
		this.appliedDate = appliedDate;
	}
	
	public String getCancleCheck() {
		return cancleCheck;
	}

	public void setCancleCheck(String cancleCheck) {
		this.cancleCheck = cancleCheck;
	}

	@Override
	public String toString() {
		return "AdoptVO [applicationNo=" + applicationNo + ", applicant=" + applicant + ", dogCode=" + dogCode
				+ ", applicationConfirm=" + applicationConfirm + ", appliedDate=" + appliedDate + ", cancleCheck="
				+ cancleCheck + ", getSpecies()=" + getSpecies() + ", getDogImage()=" + getDogImage() + "]";
	}


	
	
	

}
