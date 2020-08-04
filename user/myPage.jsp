<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>DDOGDOG LIST</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style>
   #userMenu{border: 1px solid black; width:400px; height:250px;}
   .menu{border: 1px solid black; width:250px; height:250px;}
   .menuTitle{font-size: 30px; font-weight: bold;}
</style>
</head>
<body>
   <div id="divMenu">
      <jsp:include page="../menu.jsp"/>
   </div>
   <div id="divListImg">
      <img src="/resources/img/list_ad.jpg">      <!-- 광고 이미지 -->
   </div>
   <jsp:include page="../menu3.jsp"/>
   <div class="menuBox">
      <div id="userMenu">
         <span class="menuTitle">프로필</span>
         <div>
            <div>아이디: <span>${vo.id}</span></div>
            <div>이름: <span>${vo.name}</span></div>
            <div>생년월일: <span>${vo.birthday}</span></div>
            <div>주소: <span>${vo.address}</span></div>
            <div>전화번호: <span>${vo.tel}</span></div>
            <div>이메일: <span>${vo.email}</span></div>
         </div>
         <button id="btnUserUpdate">정보수정</button>
         <button id="btnUserDelete">정보수정</button>
      </div>
      <div class="menu">
         <span class="menuTitle">입양관리</span>
      </div>
      <div class="menu">
         <span class="menuTitle">내가 쓴 글</span>
         <div><a href="/myBoard/boardList?id=${id}">자유게시판</a></div>
         <div><a href="/myBoard/missingList?id=${id}">실종신고</a></div>
         <div><a href="/myBoard/infoList?id=${id}">유기제보</a></div>
      </div>
      <div class="menu">
         <span class="menuTitle">후원금</span>
      </div>
      <div class="menu">
         <span class="menuTitle">1:1문의</span>
      </div>
   </div>
   <jsp:include page="../footer.jsp"/>
</body>
<script>
   $("#btnUserUpdate").on("click",function(){
      location.href="/user/readPassword";
   });
   
   $("#btnUserDelete").on("click",function(){
      location.href="/user/deletePassword";
   });
</script>
</html>