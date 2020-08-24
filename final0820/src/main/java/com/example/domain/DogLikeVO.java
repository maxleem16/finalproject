package com.example.domain;

public class DogLikeVO extends DogVO{
   private String id;
   private String dogCode;
   private String heart;
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getDogCode() {
      return dogCode;
   }
   public void setDogCode(String dogCode) {
      this.dogCode = dogCode;
   }
   public String getHeart() {
      return heart;
   }
   public void setHeart(String heart) {
      this.heart = heart;
   }
   @Override
   public String toString() {
      return "DogLikeVO [id=" + id + ", dogCode=" + dogCode + ", heart=" + heart + "]";
   }
   
   
}