<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG COMPANY INFO</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="shortcut icon" type="image⁄x-icon"   href="/resources/img/page_logo.png">
<style>
	#adoptStepImg {
		width:1300px;
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
		<img src="/resources/img/comInfo.jpg">
	</div>
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