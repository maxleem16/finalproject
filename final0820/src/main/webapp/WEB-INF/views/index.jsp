<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG HomePage</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css" media="screen and (min-width: 512px) and (max-width:1024px)">  
/* style */
</style> 

<style>

body{
 -ms-overflow-style: none;
 }

::-webkit-scrollbar {
  display: none;
}

#divImgBtn{
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

#divImgBtn:hover {
  background-color: none;
  box-shadow: 0px 15px 20px rgba(80, 80, 73, 0.4);
  color: #fff;
  transform: translateY(-7px);
}

#divDogBtn{
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }


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
}

.divItem {
	width:1880px;
}

.dropdown, .itemSearch {
	margin-top:47px;
}
#daum {
	margin-top:40px;
}

.slide2{
	width:1800px;
	margin:auto;
}

input[id*="answer"] + label + div p {
	display:inline-block;
	padding:10px 0px 10px 0px;
	cursor:pointer;
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
		<div id="indexSlide" class="slide2">
			<jsp:include page="indexSlide2.jsp"/>
		</div>
		<button id="divImgBtn" onClick="location.href='/dog/list'">입양하기  </button>
		<button id="divDogBtn" onClick="location.href='/board/list'">후기보기 </button>
		<a href="#" id="aTop">
			<img src="/resources/img/top.png" >
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