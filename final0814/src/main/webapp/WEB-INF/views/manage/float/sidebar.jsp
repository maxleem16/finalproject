<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<style>
body {
	margin: auto;
	padding: 0;
	font-family: "맑은 고딕";
	font-size: 0.9em;
}

ul#navi {
	width: 300px;
	text-indent: 10px;
	position: absolute;
	top: 230px;
	text-indent: 2em;
}

ul#navi, ul#navi ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

li.group {
	margin-bottom: 3px;
	background-color: rgba(255, 255, 255, 0.0);
}

li.group div.title {
	line-height: 30px;
	font-weight: bold;
	color:white;
	font-size: 17px;
	height: 40px;
	padding-top: 20px;
	margin-bottom:20px;

}

ul.sub li {
	margin-bottom: 2px;
	height: 40px;
	line-height: 28px;
	text-align:left;
	cursor: pointer;
	background-color: rgba(255, 255, 255, 0.2);
}

ul.sub li a {
	width: 100%;
	height: 100%;
	padding: 6px 8px 8px 16px;
	text-decoration: none;
	font-size: 14px;
	color: #818181;
	display: block;
}

ul.sub li:hover {
	font-weight: bold;
}
</style>
<div>
	<img src="/resources/img/logo.png" onClick="location.href='/index'"
		width="130px" height="130px" style="margin:auto;">
</div>
<div>
	<a href="/manage/index">
		something that I can go to manageindex
	</a>
</div>
<ul id="navi">
	<li class="group">
		<div class="title">유기견관리</div>
		<ul class="sub">
			<li><a href="/manage/dogList">유기견리스트</a></li>
			<li><a href="/manage/dogInsert">유기견등록</a></li>
		</ul>
	</li>
	<li class="group">
		<div class="title">사용자관리</div>
		<ul class="sub">
			<li><a href="/manage/userList">사용자리스트</a></li>
		</ul>
	</li>
	<li class="group">
		<div class="title">후원금관리</div>
		<ul class="sub">
			<li><a href="/manage/donationManage">후원금내역</a></li>
		</ul>
	</li>
	<li class="group">
		<div class="title">예약 상담 관리</div>
		<ul class="sub">
			<li><a href="/adopt/applyList">신청서관리</a></li>
			<li><a href="/manage/counselingList">상담예약일정</a></li>
		</ul>
	</li>
	<li class="group">
		<div class="title">1:1문의</div>
		<ul class="sub">
			<li><a href="/manage/messageList">문의 답변</a></li>
		</ul>
	</li>
</ul>