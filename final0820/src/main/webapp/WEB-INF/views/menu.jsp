<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style>
input[id="menuicon"]{
	display:none;
}
input[id="menuicon"] + label{
	display:block;
	margin:65px 0px 0px 0px;
	float:right;
	width:40px;
	height:30px;
	position:relative;
	right:305px;	
	cursor:pointer;
}

input[id="menuicon"] + label span {
	display:block;
	position:absolute;
	width:100%;
	height:5px;
	border-radius:30px;
	background:#000;
	transition:all .35s;
}

input[id="menuicon"] + label span:nth-child(1) {
	top:0;
}

input[id="menuicon"] + label span:nth-child(2) {
	top:50%;
	transform:translateY(-50%);
}

input[id="menuicon"] + label span:nth-child(3) {
	bottom:0;
}

input[id="menuicon"]:checked + label {
	z-index:2;
}

input[id="menuicon"]:checked + label span {
	background:#626565;
}

input[id="menuicon"]:checked + label span:nth-child(1) {
	top:50%;
	transform:translateY(-50%) rotate(45deg);
}

input[id="menuicon"]:checked + label span:nth-child(2) {
	opacity:0;
}

input[id="menuicon"]:checked + label span:nth-child(3) {
	bottom:50%;
	transform:translateY(50%) rotate(-45deg);
}

div[class="sidebar"] {
	width:300px; height:100%;
	background:	#E2E2E2;
	position:fixed;
	top:0; right:-300px;
	z-index:1;
	transition:all .35s;
}

input[id="menuicon"]:checked + label + div {
	right:0;
}
input[id*="answer"]{
	display:none;
}
input[id*="answer"] + label{
	display:block;
	padding:15px 0px 15px 0px;
	border-bottom:0;
	background:#ebecee;
	color:#626565;
	font-weight:750;
	cursor:pointer;
	position:relative;
	width:300px;
	text-align:center;
	letter-spacing:2px;
}

input[id*="answer"] + label + div {
	width:300px;
	max-height:0;
	transition:all .35s;
	overflow:hidden;
	background:#e3e4e6;
	font-size:13px;
	text-align:center;
}

input[id*="answer"] + label + div p {
	display:inline-block;
	cursor:pointer;
	text-align:center;
	letter-spacing:3px;
}
input[id*="answer"]:checked + label + div {max-height:600px;}
input[id*="answer"]:checked + label em {background-position:0 -30px;}

#daum {
	position:absolute; top:9%; left:63%;
	background:#f5d87f;border-radius:20px;
	padding:10px;
}

#today {font-weight:550; font-size:18px;}
#weather {font-weight:500;margin-left:15px;}
</style>
<div class="divItem">
<c:choose>
   <c:when test="${empty id}">
   <span class="mitems"><img src="/resources/img/logo.png" 
   style="width:160px;	margin-left:155px; cursor:pointer;"align=middle onClick="location.href='/'"></span>
   <div class="dropdown">
      <button class="dropbtn">유기견</button>
      <div class="dropdown-content">
      	 <a href="/dog/companyInfo">회사소개</a> 
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
         <a href="/donation/list">후원하기</a> 
      </div>
   </div>
 	<div id="daum">
		<span id="today"></span>
		<span id="weather"></span>
	</div>
   	<input type="checkbox" id="menuicon">
	<label for="menuicon">
		<span></span>
		<span></span>
		<span></span>
	</label>
	<div class="sidebar">
		<span class="items"><a href="/user/login">LOGIN</a></span>
		<span class="items2"><a href="/user/insert2">SIGN UP</a></span>
	</div>
   </c:when>
   
   <c:when test="${id ne 'admin'}">
      <span class="mitems"><img src="/resources/img/logo.png" 
      style="width:160px;margin-left:155px; cursor:pointer;"align=middle onClick="location.href='/'"></span>
   <div class="dropdown">
      <button class="dropbtn">유기견</button>
      <div class="dropdown-content">
      	 <a href="/dog/companyInfo">회사소개</a> 
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
         <a href="/donation/list">후원하기</a> 
      </div>
   </div>
	<div id="daum">
		<span id="today"></span>
		<span id="weather"></span>
	</div>
	<input type="checkbox" id="menuicon">
	<label for="menuicon"> 
	<span></span> <span></span> <span></span>
	</label>
	<div class="sidebar">
		<div class="itemsProfile"><img src="/resources/img/profile.png"></div>
		<div class="itemsMypage">안녕하세요 "${name}"님!</div><br><br><hr>
		<div class="itemsMypage2"><a href="/mypage/myPage?id=${id}">MYPAGE</a></div>
			<div class="accordion">
				<input type="checkbox" id="answer01"> <label for="answer01">회원 정보<em></em></label>
				<div>
					<p onClick="location.href='/mypage/readPassword'">회원 정보 수정</p>
					<br>
					<p onClick="location.href='/mypage/deletePassword'">회원 탈퇴</p>
				</div>
				<input type="checkbox" id="answer02"> <label for="answer02">입양 관리<em></em></label>
				<div>
					<p onClick="location.href='/mypage/applyList?id=${id}'">입양 신청 내역</p>
					<br>
					<p onClick="location.href='/mypage/counselingList?id=${id}'">상담 예약 확인</p>
					<br>
					<p onClick="location.href='/mypage/dogLikeList?id=${id}'">내가 찜한 아이들</p>
				</div>
				<input type="checkbox" id="answer03"> <label for="answer03">내가 쓴 글<em></em></label>
				<div>
					<p onClick="location.href='/mypage/boardList?id=${id}'">자유게시판</p>
					<br>
					<p onClick="location.href='/mypage/missingList?id=${id}'">실종 신고</p>
					<br>
					<p onClick="location.href='/mypage/infoList?id=${id}'">유기 제보</p>
				</div>
				<input type="checkbox" id="answer04"> <label for="answer04">후원금<em></em></label>
				<div>
					<p onClick="location.href='/mypage/donation?id=${id}&donationMethod='">내가 후원한 내역</p>
				</div>
				<input type="checkbox" id="answer05"> <label for="answer05">1:1문의<em></em></label>
				<div>
					<p onClick="location.href='/mypage/message?sender=${id}'">내가 문의한 내역</p>
				</div>
			</div>
		
		<span class="Mlogout"><a href="/user/logout" >LOGOUT</a></span>
	</div>
   </c:when>
    <c:when test="${id eq 'admin'}">
      <span class="mitems"><img src="/resources/img/logo.png" 
      style="width:160px;margin-left:155px; cursor:pointer;"align=middle onClick="location.href='/'"></span>
   <div class="dropdown">
      <button class="dropbtn">유기견</button>
      <div class="dropdown-content">
		 <a href="/dog/companyInfo">회사소개</a> 
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
         <a href="/donation/list">후원하기</a> 
      </div>
   </div>
   	<div id="daum">
		<span id="today"></span>
		<span id="weather"></span>
	</div>
	<input type="checkbox" id="menuicon">
	<label for="menuicon"> 
	<span></span> <span></span> <span></span>
	</label>
	<div class="sidebar">
		<div class="itemsProfile"><img src="/resources/img/profile.png"></div>
		<div class="itemsMypageAD">${name} 모드</div><br><br><hr>
		<div class="itemsMypageAD2" style="text-align:center;"><a href="/manage/index">MANAGE ZONE</a></div>
		
		<span class="Mlogout"><a href="/user/logout" >LOGOUT</a></span>
	</div>
   </c:when>
   </c:choose>
</div>
<script>
   $(".Mlogout").on("click",function(){
      alert("로그아웃 되었습니다.");
   });
   
   
	getWeather();
	var weather=[];
	function getWeather(){
		$.ajax({
			type:"get",
			url:"/weather.json",
			dataType:"json",
			success:function(data){
				$("#today").html(data.date);
				var i=0;
				$(data.array).each(function(){
					var location=this.location;
					var temper=this.temper;
					var wa=this.wa;
					var icon=this.icon;
					//console.log(location +temper + wa+ icon );
					weather[i]=location + "   "+ temper + wa + "   " +icon 
					i++;
				});
				i=0;
				var interval=setInterval(function(){
					$("#weather").html(weather[i]);
					if(i<weather.length-1){
						i++;
					}else{
						i=0;
					}
				},1500);
			}
		});
	}
   
</script>