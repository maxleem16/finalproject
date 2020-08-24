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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://kit.fontawesome.com/2594a0d020.js" crossorigin="anonymous"></script>
<style>
	body {
		background: #e0e5ec;
	}
	
	#divid #btnCheck {
		position:absolute;
		top:8%;
		left:68.5%;
		background: #e0e5ec;
		color:#F25F29;
		border:none;
		outline:none;
		height:40px;
		border-radius: 20px 20px 20px 20px;
		box-shadow: inset 4px 4px 4px #d4d2d2, 
            inset -5px -5px 3px #ffffff;
		text-indent: -0em;
	}
	#tel .phone {
		position:absolute;
		left:67.5%;
		background: #e0e5ec;
		border:none;
		outline:none;
		height:42px;
		border-radius: 20px 20px 20px 20px;
		box-shadow: inset 4px 4px 4px #d4d2d2, 
            inset -5px -5px 3px #ffffff;
		text-indent: -0em;
	}

	#tel #checkPhone #checkBtn {
		position:absolute;
		left:35%;
		background: #e0e5ec;
		border:none;
		outline:none;
		height:42px;
		border-radius: 20px 20px 20px 20px;
		box-shadow: inset 4px 4px 4px #d4d2d2, 
            inset -5px -5px 3px #ffffff;
		text-indent: -0em;
	}

	#divid input[type='button']{
		text-indent: -0em;
	}
</style>

</head>
<body>
	<div id="divJoin">
		<div id="joinlogo" onClick="location.href='../'" style="cursor:pointer;">
			<img src="/resources/img/logo.png">
		</div>
		<div id="join">
		<div id="divid">
			<input type="text" class="id" size=31 placeholder="* 아이디 입력"> 
			<input type="button" id="btnCheck" value="&nbsp;&nbsp;&nbsp;중복확인&nbsp;&nbsp;">
		</div>
		<div id="password">
			<input type="password" class="password1" size=40 placeholder="* 비밀번호(숫자,영문 조합 최소 8자)" required />
			&nbsp;<i class="fa fa-eye fa-lg"></i><br>
			<input type="password" class="password2" size=40 placeholder="* 비밀번호 확인 " required />
			&nbsp;<i class="fa fa-eye fa-lg"></i>
			<div id="alert-success" style="color:green;font-size:14px;margin-top:5px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호가 일치합니다.
			</div>
			<div id="alert-danger" style="color:red;font-size:14px;margin-top:5px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호가 일치하지 않습니다.
			</div>
		</div>
		<div id="name">
			<input type="text" size=45 class="name" placeholder="* 사용자 이름 입력">
		</div>
		<div id="birthday">
			<p>생년월일 입력</p>
			<input type="text" size=10 placeholder="YYYY" class="birthday1" maxlength=4>년
			<input type="text" size=6 placeholder="MM" class="birthday2" minlength=2 maxlength=2>월
			<input type="text" size=6 placeholder="dd" class="birthday3" minlength=2 maxlength=2>일
		</div>
		<div id="address">
			<form name="form" id="form" method="post">
				<input type="hidden" id="roadAddrPart1" name="roadAddrPart1" /><br>
				<input type="text" id="zipNo" name="zipNo" placeholder="* 우편번호" readonly size=30/>
				<input type="button" onClick="goPopup();" value="&nbsp;&nbsp;도로명 검색&nbsp;&nbsp;" id="btnaddS" />
				<input type="hidden" id="addrDetail" name="addrDetail" /><br>
				<input type="text" id="roadFullAddr" name="roadFullAddr" placeholder="* 상세주소 입력 " size=45 /><br> 
				<input type="hidden" id="roadAddrPart2" name="roadAddrPart2" /><br>	
			</form>
		</div>
		<div id="tel">
			<p>* 전화번호 입력</p>
			<!-- <input type="text" size=8 placeholder="ex) 010" class="tel1">&nbsp;&nbsp;&nbsp;-
			<input type="text" size=8 placeholder="1111" class="tel2">&nbsp;&nbsp;&nbsp;-
			<input type="text" size=8 placeholder="2222" class="tel3"> -->
			<input type="text" size=32 placeholder="번호사이에  - 없이 입력하세요!&nbsp;&nbsp;" class="tel" maxlength=11>
			<input type="button" class="phone" value="&nbsp;&nbsp;SMS인증&nbsp;&nbsp;">
			<div id="checkPhone">
				<input type="text" size=16 id="inputCertifiedNumber" placeholder="인증번호입력">
				<input type="button" id="checkBtn" value="&nbsp;&nbsp;&nbsp;확인&nbsp;&nbsp;&nbsp;">
			</div>
		</div>
		<div id="email">
			<p>* 이메일 입력</p>
           	<input type="text" value="${tomail}" class="email" size=45 placeholder="ex) ddogdog@gmail.com">
           	<p style="color:#f25f29; margin-left:49.2%;">이메일로 인증메일이 발송됩니다.</p>
        </div>
		</div>
		<div class="btnJoin">
			<input type="submit" value="가입" id="btnInsert"> <br>
			<input type="reset" value="취소">
			<!-- <input type="button" id="test" value="test"> -->
		</div>
		<div id="returnLogin">
				Already have an account?<a href="login"> &nbsp; Login</a>
		</div>
	</div>
</body>
<script>
	$("#checkPhone").hide();
	
	//비밀번호 일치 확인
	$(function(){
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function(){
			var pwd1=$(".password1").val();
			var pwd2=$(".password2").val();
			if(pwd1 != "" || pwd2 != ""){
				if(pwd1 == pwd2){
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				}else{
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				} 
			} 
		}); 
	});

	//전화번호 인증
	$('.phone').click(function(){
	    var phoneNumber = $('.tel').val();
	    if(phoneNumber==""){
	    	alert("전화번호를 입력해주세요!");
	    }else{
		    alert('인증번호 발송 완료!');
		    $("#checkPhone").show();
		    $.ajax({
		        type: "GET",
		        url: "/check/sendSMS",
		        data: {
		            "phoneNumber" : phoneNumber
		        },
		        success: function(res){
		            $('#checkBtn').click(function(){
		                if($.trim(res) ==$('#inputCertifiedNumber').val()){
		                    alert("인증이 정상적으로 완료되었습니다.");
		                    $("#checkPhone").hide();
		                    $(".phone").val("  인증완료  ");
		                    $(".phone").css("color","#F25F29");
		                    $(".phone").css("font-weight","bold");
		                    $('.phone').prop('disabled', true);       
		                }else{
		                    alert("인증번호가 올바르지 않습니다!");
		                }
		            });
		        }
		    });
	    }
	});
	
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

	//회원가입 버튼
	$("#btnInsert").on("click",function(){
	      var id=$(".id").val();
	      var password1=$(".password1").val();
	      var password2=$(".password2").val();
	      var name=$(".name").val();
	      var birthday1=$(".birthday1").val();
	      var birthday2=$(".birthday2").val();
	      var birthday3=$(".birthday3").val();
	      var birthday=birthday1+birthday2+birthday3;
	      var address=$("#roadFullAddr").val();
	      var tel=$(".tel").val();
	      var email=$(".email").val();
	      if (!check) {
	         alert("아이디 중복체크를 해주세요.");
	         $(".id").focus();
	      } else if(password1!=password2){
	    	  alert("비밀번호가 일치하지 않습니다!");
	    	  $(".password1").focus();
	      } else if(name==""){
	    	  alert("이름을 입력해주세요!");
	    	  $(".name").focus();
	      } else if(birthday1=="" || birthday2=="" || birthday3==""){
	    	  alert("생년월일을 입력해주세요!");
	    	  $(".birthday1").focus();
	      } else if(tel==""){
	    	  alert("전화번호를 입력해주세요!");
	    	  $(".tel").focus();
	      } else if(email==""){
	    	  alert("이메일을 입력해주세요!");
	    	  $(".email").focus();
	      } else {
	         if(password1==password2){
	            $.ajax({
	               type:"post",
	               url:"/user/insert",
	               data:{"id":id,"password":password1,"name":name,"birthday":birthday,"address":address,"tel":tel,"email":email,},
	               success:function(){
	                  alert("입력하신 주소로 메일이 발송되었습니다. 메일 인증 후 가입이 완료됩니다.");
	                  location.href="/user/login";
	               }
	            });
	         }
	      }
	});

	$(".id").change(function() {
		check = false;
	});

	//아이디 중복체크
	$("#btnCheck").on("click", function() {
	      var id = $(".id").val();
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
	                  $(".id").focus();
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