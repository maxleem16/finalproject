<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style>
    body {
        margin:20px auto;
        padding: 0;
        font-family:"맑은 고딕";
        font-size:0.9em;

   }

    ul#navi {
        width: 285px;
        height:1100px;
        text-indent: 10px;
        position:absolute;
        top:230px;
        background-color: rgba( 255, 255, 255, 0.2 );
        text-indent: 2em;
        
}
    ul#navi, ul#navi ul {
        margin:0;
        padding:0;
        list-style:none;
}
    li.group {
        margin-bottom: 3px;
        background-color: rgba( 255, 255, 255, 0.0 );
}
    li.group div.title {
        line-height: 35px;
        font-weight: bold;
        font-size:18px;
        height:50px;
        padding-top:20px;
}
    ul.sub li {
        margin-bottom: 2px;
        height:40px;
        line-height:35px;
        cursor:pointer;
        background-color: rgba( 255, 255, 255, 0.0 );
}
    ul.sub li a {
        display: block;
        background-color: rgba( 255, 255, 255, 0.0 );
        width: 100%;
        height:100%;
        text-decoration:none;
        color:#000;
       
}
    ul.sub li:hover {
        background:#c8c8c8;
        background-color: rgba( 255, 255, 255, 0.4 );
}
</style>
<div id="menuWrap">
   <div id="mpUserInfo">
      <div class="mpUser" onClick="location.href='/mypage/myPage?id='+${id}">
             <img src="https://fiorecommunications.com/wp-content/uploads/2019/05/instagram-blog-person-icon.jpg">
             <p style="font-weight:700;font-size:20px; line-height:15px;">${id} </p>
             <p style="line-height:2px;">${name} </p>
        </div>
   </div>
   <ul id="navi">
        <li class="group">
            <div class="title">회원정보</div>
            <ul class="sub">
                <li><a href="/mypage/readPassword">회원정보 수정</a></li>
                <li><a href="/mypage/deletePassword">회원탈퇴</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">입양관리</div>
            <ul class="sub">
                <li><a href="/mypage/applyList?id=${id}">입양신청 내역</a></li>          
                <li><a href="/mypage/counselingList?id=${id}">상담예약 확인</a></li>
                <li><a href="/mypage/dogLikeList?id=${id}">내가 찜한 아이들</a></li>           
            </ul>
        </li>
        <li class="group">
            <div class="title">내가 쓴 글</div>
            <ul class="sub">
                <li><a href="/mypage/boardList?id=${id}">자유게시판</a></li>                
                <li><a href="/mypage/missingList?id=${id}">실종신고</a></li>    
                <li><a href="/mypage/infoList?id=${id}">유기제보</a></li> 
                
            </ul>
        </li>   
        <li class="group">
            <div class="title">후원금</div>
            <ul class="sub">
                <li><a href="/mypage/donation?id=${id}&donationMethod=">내가 후원한 내역</a></li>                
            </ul>
        </li>    
        <li class="group">
            <div class="title">1:1문의</div>
            <ul class="sub">
                <li><a href="/mypage/message?sender=${id}">내가 문의한 내역</a></li>                
            </ul>
        </li>     
    </ul>
</div>