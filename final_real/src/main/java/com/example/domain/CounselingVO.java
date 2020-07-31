package com.example.domain;

import java.util.Date;

public class CounselingVO extends AdoptVO{
	private String counselingDate;
	private String counselingTime;
	private Date reservedDate;
	private String cancleCheck;
	
	public String getCounselingTime() {
		return counselingTime;
	}
	public void setCounselingTime(String counselingTime) {
		this.counselingTime = counselingTime;
	}
	public Date getReservedDate() {
		return reservedDate;
	}
	public void setReservedDate(Date reservedDate) {
		this.reservedDate = reservedDate;
	}
	public String getCancleCheck() {
		return cancleCheck;
	}
	public void setCancleCheck(String cancleCheck) {
		this.cancleCheck = cancleCheck;
	}
	public String getCounselingDate() {
		return counselingDate;
	}
	public void setCounselingDate(String counselingDate) {
		this.counselingDate = counselingDate;
	}
	@Override
	public String toString() {
		return "CounselingVO [counselingDate=" + counselingDate + ", counselingTime=" + counselingTime
				+ ", reservedDate=" + reservedDate + ", cancleCheck=" + cancleCheck + ", getApplicationNo()="
				+ getApplicationNo() + ", getApplicant()=" + getApplicant() + ", getDogCode()=" + getDogCode() + "]";
	}
	
	
	
}
