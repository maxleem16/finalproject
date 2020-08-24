<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/style.css">
<style>
input[id="menuTop1"]{
	display:none;
}
input[id="menuTop1"] + label{
	display:block;
	border-radius:25px;
	margin-left:0px;
	border-bottom:0;
	color:black;
	font-weight:900;
	cursor:pointer;
	position:relative;
	width:240px;
}

input[id="menuTop1"] + label + div {
	width:240px;
	max-height:0;
	transition:all .35s;
	overflow:hidden;
	background:#F2BB13;
	border-radius:0px 0px 25px 25px;
	font-size:13px;
	text-indent: 2em;
}

input[id="menuTop1"] + label + div p {
	display:inline-block;
	padding:10px 0px 10px 25px;
	cursor:pointer;
}

.inacc img {
	margin-left:20px;
	width:50px;
	border-radius:100%;
}

#option {
	
}
input[id="menuTop1"]:checked + label + div {max-height:900px;}
input[id="menuTop1"]:checked + label em {background-position:0 -30px;}

.mypageRightImg {
	width:240px;
	background:#F2BB13;
	float:right;
	padding-top:10px;
	margin-top:30px;
	position:relative;
	top:10%;
	right:6%;
	border-radius:30px 30px 30px 30px;
	z-index: 1;
}

.mypageRightImg #menuTopID {
	position:absolute;
	top:18%;
	left:30%;
}

#menuTopID {
	font-size: 20px;
	margin-left:20px;
}

.op a{
	text-decoration: none;
	color:black; font-size:15px;
	font-weight: 550;
}
</style>
</head>
<body>
   <div id="menuTop">
      <div id="mypagelogo" onClick="location.href='../ '"
         style="cursor: pointer;">
         <img src="/resources/img/logo.png">
      </div>
      <span class="myPageSearch" style="font-family:'나눔명조'; letter-spacing: 16px;"> 
         MYPAGE
      </span>
	<div class="mypageRightImg">
		<div class="inacc">
		
			<input type="checkbox" id="menuTop1">
			<label for="menuTop1"><em><img
            src="https://fiorecommunications.com/wp-content/uploads/2019/05/instagram-blog-person-icon.jpg">
         <span id="menuTopID">${id}</span></em></label>
			
			<div id="option">
				<div class="op" style="margin-top:10px;"><a href="/user/logout">로그아웃</a></div><br>
				<div class="op"><a href="/mypage/readPassword">회원정보수정</a></div><br>
				<div class="op"style="margin-bottom:10px;"><a href="/">메인으로</a></div>
			</div>
		</div>
	</div>
		
	</div>
</body>
<script>

   
</script>
</html>