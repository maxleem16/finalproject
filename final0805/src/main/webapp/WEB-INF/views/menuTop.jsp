<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/2594a0d020.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
   <div id="menuTop">
      <div id="mypagelogo" onClick="location.href='../index'"
         style="cursor: pointer;">
         <img src="/resources/img/logo.png">
      </div>
      <span class="myPageSearch"> 
         <input type="text" placeholder="검색어를 입력하세요"> 
         &nbsp;&nbsp;&nbsp; 
         <input type="button" class="mpwordSearch" value=" SEARCH ">
      </span>
      <div class="mypageRightImg">
         <img
            src="https://fiorecommunications.com/wp-content/uploads/2019/05/instagram-blog-person-icon.jpg">
         <span id="menuTopID">${id}
         </span>
      </div>
   </div>
</body>
</html>