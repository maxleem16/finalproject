package com.example.domain;

public class DonationVO extends UserVO{

	private int donationNo;
	private int price;
	private String sponsor;
	private String sponsorContent;
	private String donationMethod;
	private String paymentMethod;
	private int month;
	
	public int getDonationNo() {
		return donationNo;
	}
	public void setDonationNo(int donationNo) {
		this.donationNo = donationNo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSponsor() {
		return sponsor;
	}
	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}
	public String getSponsorContent() {
		return sponsorContent;
	}
	public void setSponsorContent(String sponsorContent) {
		this.sponsorContent = sponsorContent;
	}
	public String getDonationMethod() {
		return donationMethod;
	}
	public void setDonationMethod(String donationMethod) {
		this.donationMethod = donationMethod;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	@Override
	public String toString() {
		return "DonationVO [donationNo=" + donationNo + ", price=" + price + ", sponsor=" + sponsor
				+ ", sponsorContent=" + sponsorContent + ", donationMethod=" + donationMethod + ", paymentMethod="
				+ paymentMethod + "]";
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	
}
