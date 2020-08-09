<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG HomePage</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<script src="https://kit.fontawesome.com/2594a0d020.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>

body, html { 
    margin: 0;
    padding: 0;
    height: 100%;
}

img {
    border: 0;
    padding: 0; 
    width:100%;
}

.divWrap #divMenu {
	position:absolute;
	top:0.6%;
	left:0%;
}



</style>
</head>
<body>
	<div class="divWrap">
		<div id="divMenu">
			<jsp:include page="menu.jsp"/>
		</div>
		<div id="divImg">
			<img src="/resources/img/index.jpg">		<!-- 배경 이미지 -->
		</div>
		<div id="chart">
			<jsp:include page="chart.jsp"/>
		</div>
		<div id="indexside">
			<img src="/resources/img/index_sidedog.png">
		</div>
		<div id="indexSlide">
			<jsp:include page="indexSlide.jsp"/>
		</div>
		<button id="divImgBtn" onClick="location.href='/dog/list'">입양하기  <i class="far fa-hand-point-right"></i></button>
		<button id="divDogBtn" onClick="location.href='/board/list'">후기보기  <i class="far fa-smile-wink"></i></button>
		<a href="#" id="aTop">
			<img src="/resources/img/top.jpg" >
		</a>
		<div id="kakao-talk-channel-chat-button"
			data-channel-public-id="_ktxnAK" data-title="consult"
			data-size="small" data-color="yellow" data-shape="pc"
			data-support-multiple-densities="true"></div>
	</div>
	<jsp:include page="footer.jsp"/>

</body>
<script>
	$("#aTop").click(function(){
	    $('body,html').animate({scrollTop:0},400 );
	    return false;
	  });
	
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('c089c8172def97eb00c07217cae17495');
    // 채널 1:1 채팅 버튼을 생성합니다.
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
      channelPublicId: '_ktxnAK',
      title: 'consult',
      size: 'small',
      color: 'yellow',
      shape: 'pc',
      supportMultipleDensities: true,
    });
</script>
</html>