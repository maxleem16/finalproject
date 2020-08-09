<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>DDOGDOG LIST</title>
<link rel="shortcut icon" type="image⁄x-icon"   href="/resources/img/page_logo.png">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/style.css">
<style>

   body {
	background-image: url('/resources/img/adoptBack.jpg');                                                               
    background-size: cover;')
	
	}
</style>
</head>
<body>


	<div id="mpWrap">
	   <jsp:include page="../menu3.jsp"/>
	   <div class="menuBox">
	   		<div id="mypagelogo" onClick="location.href='../index'" style="cursor:pointer;">
	   		<img src="/resources/img/logo.png"></div>
			<span class="myPageSearch"> 
				<input type="text" 	placeholder="검색어를 입력하세요"> &nbsp;&nbsp;&nbsp; 
				<input type="button" class="mpwordSearch" value=" SEARCH ">
			</span> 
			<div class="mypageRightImg">
				<img src="https://fiorecommunications.com/wp-content/uploads/2019/05/instagram-blog-person-icon.jpg">
				<span>유저 아이디 들어감</span>
			</div>
			<div class="userMenu">
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
	         <button id="btnUserDelete">정보삭제</button>
	      </div>
	      <div class="menuadopt">
	         <span class="menuTitle">입양관리</span>
	      </div>
	      <div>
	      	<a href="#">입양신청 내역</a>
	      </div>
	                 <div>
               <a href="#">상담예약 확인</a>
            </div>
            <div>내가 찜한 아이들</div>
            <div>
               <c:forEach items="${list}" var="vo">
                  <div class="divListbox" code="${vo.dogCode}">
                     <div class="divListImg">
                        <c:if test="${vo.dogImage == null}">
                           <img src="http://placehold.it/300x250">
                        </c:if>
                        <c:if test="${vo.dogImage != null}">
                           <img src="/display?fileName=${vo.dogImage}" width=250 height=230>
                        </c:if>
                        <br>
                     </div>
                     <span id="divListBoxInfo"> &nbsp;&nbsp;&nbsp;<b>#
                           ${vo.species} # ${vo.age}살</b>
                     </span> <span class="like"> <i class="fas fa-heart"></i>
                     </span>
                  </div>
               </c:forEach>
            </div>
         </div>
	      
	      <div class="menuDonation">
	         <span class="menuTitle">후원금</span>
	      </div>
	      <div class="menuQ">
	         <span class="menuTitle">1:1문의</span>
	      </div>
	      <div class="menuWrite">
	         <span class="menuTitle">내가 쓴 글</span>
	         <div><a href="/myBoard/boardList?id=${id}">자유게시판</a></div>
	         <div><a href="/myBoard/missingList?id=${id}">실종신고</a></div>
	         <div><a href="/myBoard/infoList?id=${id}">유기제보</a></div>
	      </div>
	   </div>
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