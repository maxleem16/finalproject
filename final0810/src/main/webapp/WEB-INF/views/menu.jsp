<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style>
</style>
<div class="divItem">
   <c:if test="${id==null}">
   <span class="mitems"><img src="/resources/img/logo.png" align=middle onClick="location.href='/index'"></span>
   <div class="dropdown">
      <button class="dropbtn">유기견</button>
      <div class="dropdown-content">
         <a href="/dog/adoptStep">입양절차</a> 
         <a href="/dog/list">유기견 목록</a> 
      </div>
   </div>
   <div class="dropdown">
      <button class="dropbtn">실종동물</button>
      <div class="dropdown-content">
         <a href="/missing/list">실종 신고</a> 
         <a href="/infoReport/list">유기 제보</a> 
      </div>
   </div>
   <div class="dropdown">
      <button class="dropbtn">접종예상비용</button>
      <div class="dropdown-content">
         <a href="/vaccination/list">예상 비용 확인</a> 
         <a href="/vaccination/list">내 주변 병원 찾기</a> 
      </div>
   </div>
   <div class="dropdown">
      <button class="dropbtn">커뮤니티</button>
      <div class="dropdown-content">
         <a href="/board/list">자유게시판</a> 
         <a href="/donation/list">후원금</a> 
      </div>
   </div>
   <span class="itemSearch"> 
      <input type="text"   placeholder="검색어를 입력하세요"> &nbsp;&nbsp;&nbsp; 
      <input   type="button" class="wordSearch" value=" SEARCH ">
   </span>
   <span class="items"><a href="/user/login">LOGIN</a></span>
   </c:if>
   
   <c:if test="${id!=null}">
      <span class="mitems"><img src="/resources/img/logo.png" align=middle onClick="location.href='/index'"></span>
   <div class="dropdown">
      <button class="dropbtn">유기견</button>
      <div class="dropdown-content">
         <a href="/dog/adoptStep">입양절차</a> 
         <a href="/dog/list">유기견 목록</a> 
      </div>
   </div>
   <div class="dropdown">
      <button class="dropbtn">실종동물</button>
      <div class="dropdown-content">
         <a href="/missing/list">실종 신고</a> 
         <a href="/infoReport/list">유기 제보</a> 
      </div>
   </div>
   <div class="dropdown">
      <button class="dropbtn">접종예상비용</button>
      <div class="dropdown-content">
         <a href="/vaccination/list">예상 비용 확인</a> 
         <a href="/vaccination/list">내 주변 병원 찾기</a> 
      </div>
   </div>
   <div class="dropdown">
      <button class="dropbtn">커뮤니티</button>
      <div class="dropdown-content">
         <a href="/board/list">자유게시판</a> 
         <a href="/donation/list">후원금</a> 
      </div>
   </div>
   <span class="itemSearch"> 
      <input type="text"   placeholder="검색어를 입력하세요"> &nbsp;&nbsp;&nbsp; 
      <input   type="button" class="wordSearch" value=" SEARCH ">
   </span>
   <span class="itemsMypage"><a href="/mypage/myPage?id=${id}">안녕하세요 ${name}님!</a></span>
   <span class="Mlogout"><a href="/user/logout" >LOGOUT</a></span>
   </c:if>
</div>
<script>
   $(".Mlogout").on("click",function(){
      alert("로그아웃 되었습니다.");
   });
   
</script>