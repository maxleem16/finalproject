<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG ADOPT STEP</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="shortcut icon" type="image⁄x-icon"   href="/resources/img/page_logo.png">
<style>
	#adoptStepImg {
		width:1000px;
		margin:auto;
	}
	#aTop {
		display:scroll;
		position:fixed;
		bottom:30px;
		right:30px; 
		width:70px;
	}
	
	img {
    border: 0;
    padding: 0; 
    width:100%;
}
	
	#btnAdoptStep {
	
	cursor:pointer;
	background:#FA3313;
	margin:auto;
	text-align:center;
	margin-left:880px;
	margin-bottom:100px;
	height:45px;
	width:130px;
	border-radius: 5px 5px 5px 5px;
	font-size:20px;
	color:white;
	border: none;
	outline: none;

	}
	
</style>
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp"/>
	</div>
	<div id="divListImg">
		<jsp:include page="../box.jsp"/>	<!-- 광고 이미지 -->
	</div>
	<div id="adoptStepImg">
		<img src="/resources/img/adoptStep.jpg">
	</div>
	<button id="btnAdoptStep"onClick="location.href='/dog/list'">입양하기</button>
	<a href="#" id="aTop">
		<img src="/resources/img/top.png" >
	</a>
	<jsp:include page="../footer.jsp"/>
</body>
<script>
$("#aTop").click(function(){
    $('body,html').animate({scrollTop:0},400 );
    return false;
  });
</script>
</html>