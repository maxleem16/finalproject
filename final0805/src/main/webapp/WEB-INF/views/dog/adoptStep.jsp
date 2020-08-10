<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#adoptStepImg {
		width:1000px;
		margin:auto;
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
	<jsp:include page="../footer.jsp"/>
</body>
</html>