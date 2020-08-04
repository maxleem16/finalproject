<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<link rel="stylesheet" type="text/css" href="/resources/css/style2.css">
<title>DDOGDOG JOIN US</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="https://kit.fontawesome.com/2594a0d020.js" crossorigin="anonymous"></script>
<style>
	body {
		background: #e0e5ec;
	}
	
	#btnCheck {
		position:absolute;
		top:5.7%;
		left:58%;
		color:#F25F29;
		text-indent: -0em;
	}

	#id input[type='button']{
		text-indent: -0em;
	}
</style>

</head>
<body>
	
		<div id="divJoin">
			<div id="joinlogo" onClick="location.href='../index'" style="cursor:pointer;"><img src="/resources/img/logo.png"></div>
			<div id="join">
			<div id="id">
				<input type="text" id="id" size=31 placeholder="* 아이디 입력"> 
				<input type="button" onClick="location.href='#'" id="btnCheck" value="&nbsp;&nbsp;&nbsp;중복확인&nbsp;&nbsp;">
			</div>
			<div id="password">
				<input type="password" size=40 placeholder="* 비밀번호(숫자,영문,특수문자 조합 최소 8자)">
				&nbsp;<i class="fa fa-eye fa-lg"></i>
			</div>
			<div id="name"><input type="text" size=45 id="name" placeholder="* 사용자 이름 입력"></div>
			<div id="birthday">
				<input type="text" size=45 placeholder="생년월일 입력">
			</div>
			<div id="address">
				<form name="form" id="form" method="post">
					<input type="hidden" id="roadAddrPart1" name="roadAddrPart1" /><br>
					<input type="text" id="zipNo" name="zipNo" placeholder="* 주소 입력" readonly size=30/>
					<input type="button" onClick="goPopup();" value="&nbsp;&nbsp;도로명 검색&nbsp;&nbsp;" id="btnaddS" />
					<input type="hidden" id="addrDetail" name="addrDetail" /><br>
					<input type="text" id="roadFullAddr" name="roadFullAddr" placeholder="* 상세주소 입력 " size=45 /><br> 
					<input type="hidden" id="roadAddrPart2" name="roadAddrPart2" /><br>	
				</form>
			</div>
			
			<div id="tel"><input type="text" size=45 placeholder="* 전화번호 입력"></div>
			<div id="email"><input type="text" size=45 id="email"  placeholder="이메일 입력"></div>
			</div>
			<div class="btnJoin">
				<input type="submit" value="가입" id="btnInsert"> <br>
				<input type="reset" value="취소">
			</div>
			
			<div id="returnLogin">
					Already have an account?<a href="login"> &nbsp; Login</a>
			</div>
		</div>
</body>
<script>

// 비밀번호 보이게 하기 
$(document).ready(function(){
    $('#password i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye-slash fa-lg")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye fa-lg")
            .prev('input').attr('type','password');
        }
    });
});


	var check = false;

	$("#btnInsert").on("click",function(){
		var id=$("#id").val();
		var password=$("#password").val();
		var name=$("#name").val();
		var birthday=$("#birthday").val();
		var address=$("#address").val();
		var tel=$("#tel").val();
		var email=$("#email").val();
		if (!check) {
			alert("아이디 중복체크를 해주세요.");
		} else {
			$.ajax({
				type:"post",
				url:"/user/insert",
				data:{"id":id,"password":password,"name":name,"birthday":birthday,"address":address,"tel":tel,"email":email,},
				success:function(){
					alert("회원가입이 완료되었습니다.");
				}
			});
		}
	});

	$("#id").change(function() {
		check = false;
	});

	$("#btnCheck").on("click", function() {
	      var id = $("#id").val();
	      if(id!=""){
	         $.ajax({
	            type : "post",
	            url : "/user/login2",
	            data : {
	               "id" : id
	            },
	            success : function(data) {
	               if (data != 0) {
	                  alert("이미 존재하는 아이디입니다.");
	                  $("#id").focus();
	               } else {
	                  alert("사용할 수 있는 아이디입니다.");
	                  check = true;
	               }
	            }
	         });
	      }else{
	         alert("확인하실 아이디를 입력해주세요.");
	      }
	   });
	
	//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다.
	// (＂팝업 API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "http://localhost:8088";
	function goPopup() {
		//경로는 시스템에 맞게 수정하여 사용 
		//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를
		//호출하게 됩니다.
		var pop = window.open("/user/addressAPI", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/ 
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 
		// 실제 주소검색 URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다. 
		// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
	}
</script>
</html>