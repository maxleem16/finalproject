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
        width: 200px;
        text-indent: 10px;
}
    ul#navi, ul#navi ul {
        margin:0;
        padding:0;
        list-style:none;
}
    li.group {
        margin-bottom: 3px;
}
    li.group div.title {
        height: 35px;
        line-height: 35px;
        background:#f56105;
        cursor:pointer;
        text-align: center;
        font-weight: bold;
}
    ul.sub li {
        margin-bottom: 2px;
        height:35px;
        line-height:35px;
        background:#f4f4f4;
        cursor:pointer;
}
    ul.sub li a {
        display: block;
        width: 100%;
        height:100%;
        text-decoration:none;
        color:#000;
}
    ul.sub li:hover {
        background:#cf0;
}
</style>
	<ul id="navi">
        <li class="group">
            <div class="title">회원정보</div>
            <ul class="sub">
                <li><a href="/user/readPassword">회원정보 수정</a></li>
                <li><a href="/user/deletePassword">회원탈퇴</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">입양관리</div>
            <ul class="sub">
                <li><a href="#">입양신청 내역</a></li>          
                <li><a href="#">상담예약 확인</a></li>         
            </ul>
        </li>
        <li class="group">
            <div class="title">내가 쓴 글</div>
            <ul class="sub">
                <li><a href="/myBoard/boardList?id=${id}">자유게시판</a></li>                
                <li><a href="/myBoard/missingList?id=${id}">실종신고</a></li>    
                <li><a href="/myBoard/infoList?id=${id}">유기제보</a></li> 
            </ul>
        </li>   
        <li class="group">
            <div class="title">후원금</div>
            <ul class="sub">
                <li><a href="#">내가 후원한 내역</a></li>                
            </ul>
        </li>    
        <li class="group">
            <div class="title">1:1문의</div>
            <ul class="sub">
                <li><a href="#">내가 문의한 내역</a></li>                
            </ul>
        </li>     
    </ul>