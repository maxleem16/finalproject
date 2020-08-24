<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<link rel="stylesheet" type="text/css" href="/resources/css/style2.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<title>WELCOME TO DDOGDOG</title>
<style>
	*{margin: 0;padding: 0;box-sizing: border-box}
	body {
		background: #e0e5ec;
	}
	#tblterms{padding-bottom:50px;margin-bottom:50px;width:500px;top:8%;
		left:36%;position:absolute;}
	ul>li{list-style: none;font-size:13px}
	a{text-decoration: none;}
	.clearfix::after{content: "";display: block;clear: both;}
	#joinForm{width: 460px;margin: 0 auto;}
	ul.join_box{border: 1px solid #ddd;background-color: #fff;margin-left:35px;margin-right:35px;}
	.checkBox,.checkBox>ul{position: relative;}
	.checkBox>ul>li{float: left;}
	.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
	.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
	.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none;}
	.footBtwrap{margin-top: 15px;margin-left:35px;margin-right:35px;}
	.footBtwrap>li{float: left;width: 50%;height: 60px;}
	.footBtwrap>li>button{display: block; width: 94%;height: 100%; font-size: 20px;text-align: center;line-height: 60px;}
	.fpmgBt1{background-color: #fff;color:#888}
	.fpmgBt2{background-color: lightsalmon;color: #fff; margin-left:13px;}
	.fpmgBt1,.fpmgBt2 {outline:none; border:none; border-radius: 20px;cursor:pointer;}
</style>
</head>
<body>
		<div id="tblterms" style="">
			<div id="joinlogo" onClick="location.href='../'"
				style="cursor: pointer;">
				<img src="/resources/img/logo.png" alt="인덱스로 이동">
			</div><br><br><br><br><br><br><br><br><br><br>
			<ul class="join_box">
				<li class="checkBox check01">
					<ul class="clearfix">
						<li style="font-size:13px; font-weight:600;">이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두
							동의합니다.</li>
						<li class="checkAllBtn"><input type="checkbox" id="chkAll"></li>
					</ul>
				</li>
				<li class="checkBox check02">
					<ul class="clearfix">
						<li>이용약관 동의(필수)</li>
						<li class="checkBtn"><input type="checkbox" class="chk" id="chk1">
						</li>
					</ul> <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
				</li>
				<li class="checkBox check03">
					<ul class="clearfix">
						<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
						<li class="checkBtn"><input type="checkbox" class="chk" id="chk2">
						</li>
					</ul> <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
				</li>
				<li class="checkBox check03">
					<ul class="clearfix">
						<li>위치정보 이용약관 동의(선택)</li>
						<li class="checkBtn"><input type="checkbox" class="chk" id="chk3">
						</li>
					</ul> <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
				</li>
				<li class="checkBox check04">
					<ul class="clearfix">
						<li>이벤트 등 프로모션 알림 메일 수신(선택</li>
						<li class="checkBtn"><input type="checkbox" class="chk" id="chk4">
						</li>
					</ul>
				</li>
			</ul>
			<ul class="footBtwrap clearfix">
				<li><button class="fpmgBt1">비동의</button></li>
				<li><button class="fpmgBt2">동의</button></li>
			</ul>
		</div>
</body>
<script>
	$(".fpmgBt2").on("click",function(){
		if(!$("#chk1").prop("checked")){
			alert("필수항목을 확인하세요!");
		}else if(!$("#chk2").prop("checked")){
			alert("필수항목을 확인하세요!");
		}else{
			alert("다음단계로 이동합니다.");
			location.href="/user/insert";
		}
	});
	
	//전체선택버튼을 클릭할 경우 (B방법)
	$("#chkAll").on("click", function() {
	   if ($(this).prop("checked")) {
	      $(".chk").each(function() {
	         $(this).prop("checked", true);
	      });
	   } else {
	      $(".chk").each(function() {
	         $(this).prop("checked", false);
	      });
	   }
	});
	
	//각행의 체크버튼을 클릭한 경우 전체체크 부분이 사라진다
	$(".chk").on("click", function() {
	   var isChkAll = true;
	   $(".chk").each(function() {
	      if (!$(this).is(":checked"))
	         isChkAll = false;
	   });
	   if (isChkAll) {
	      $("#chkAll").prop("checked", true);
	   } else {
	      $("#chkAll").prop("checked", false);
	   }
	});
</script>
</html>