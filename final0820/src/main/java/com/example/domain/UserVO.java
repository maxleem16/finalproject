package com.example.domain;

public class UserVO extends DogVO{
   private String id;
   private String password;
   private String name;
   private String birthday;
   private String address;
   private String tel;
   private String email;
   private String image;
   private String position;
   private int point;
   private String activeStatus;
   private String user_key;
   
   public String getUser_key() {
	   return user_key;
   }
   public void setUser_key(String user_key) {
	   this.user_key = user_key;
   }
   public String getId() {
	   return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getBirthday() {
      return birthday;
   }
   public void setBirthday(String birthday) {
      this.birthday = birthday;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getTel() {
      return tel;
   }
   public void setTel(String tel) {
      this.tel = tel;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getImage() {
      return image;
   }
   public void setImage(String image) {
      this.image = image;
   }
   public String getPosition() {
      return position;
   }
   public void setPosition(String position) {
      this.position = position;
   }
   public String getActiveStatus() {
      return activeStatus;
   }
   public void setActiveStatus(String activeStatus) {
      this.activeStatus = activeStatus;
   }
   public int getPoint() {
      return point;
   }
   public void setPoint(int point) {
      this.point = point;
   }
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", birthday=" + birthday + ", address="
				+ address + ", tel=" + tel + ", email=" + email + ", image=" + image + ", position=" + position + ", point="
				+ point + ", activeStatus=" + activeStatus + ", user_key=" + user_key + "]";
	}
   
}