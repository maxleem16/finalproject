<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style2.css">
<title>ID/PASSWORD 찾기</title>
</head>
<style>
body {
	background: #e0e5ec;
}

#inputName_1, #inputTel_1 {
	width: 230px;
	margin-left: 105px;
}

.USreturn a {
	margin: auto;
	text-decoration: none;
	color: gray;
	text-align: center;
}

.USreturn {
	text-align: center;
}

.USreturn a:not(:last-child) {
	margin-bottom: 30px;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

body {
	background: #e0e5ec;
}

#tblterms {
	padding-bottom: 50px;
	margin-bottom: 50px;
	width: 500px;
	top: 8%;
	left: 36%;
	position: absolute;
}

ul>li {
	list-style: none
}

a {
	text-decoration: none;
}

.clearfix::after {
	content: "";
	display: block;
	clear: both;
}

#joinForm {
	width: 460px;
	margin: 0 auto;
}

ul.join_box {
	border: 1px solid #ddd;
	background-color: #fff;
	margin-left: 35px;
	margin-right: 35px;
}

.checkBox, .checkBox>ul {
	position: relative;
}

.checkBox>ul>li {
	float: left;
}

.checkBox>ul>li:first-child {
	width: 85%;
	padding: 15px;
	font-weight: 600;
	color: #888;
}

.checkBox>ul>li:nth-child(2) {
	position: absolute;
	top: 50%;
	right: 30px;
	margin-top: -12px;
}

.checkBox textarea {
	width: 96%;
	height: 90px;
	margin: 0 2%;
	background-color: #f7f7f7;
	color: #888;
	border: none;
}

.footBtwrap {
	margin-top: 15px;
	margin-left: 35px;
	margin-right: 35px;
}

.footBtwrap>li {
	float: left;
	width: 50%;
	height: 60px;
}

.footBtwrap>li>button {
	display: block;
	width: 94%;
	height: 100%;
	font-size: 20px;
	text-align: center;
	line-height: 60px;
}

.fpmgBt1 {
	background-color: #fff;
	color: #888;
	margin-right: 100px;
}

.fpmgBt2 {
	background-color: lightsalmon;
	color: #fff
}

.fpmgBt1, .fpmgBt2 {
	outline: none;
	border: none;
	border-radius: 20px;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/user/userIdSearchModal.jsp"%>
	<%-- <%@ include file="/WEB-INF/views/user/modal.jsp" %> --%>
	<div id="tblLogin"
		style="width: 400px; margin: auto; margin-top: 150px; padding-bottom: 50px;">
		<div class="container" style="width: 400px; text-align: center;">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">
					<h3 style="margin-top: 30px; font-weight: 600;">아이디/비밀번호 찾기</h3>
					<p style="font-size: 12px; color: gray;">인증된 이메일만 정보 찾기가 가능합니다
						:)</p>
				</div>
				<div style="margin-bottom: 20px; margin-top: 20px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1"
						name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"
						for="search_1">아이디 찾기</label> <input type="radio"
						class="custom-control-input" id="search_2" name="search_total"
						onclick="search_check(2)"> <label
						class="custom-control-label font-weight-bold text-white"
						for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputName_1"
							style="position: absolute; top: 34.8%; left: 42%;">이름</label>
						<div>
							<input type="text" class="form-control" id="inputName_1"
								name="inputName_1" placeholder="ex) 홍길동">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputTel_1"
							style="position: absolute; top: 39%; left: 42%;">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="inputTel_1"
								name="inputPhone_1" placeholder="ex) 01012345678">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()"
							class="btn btn-primary btn-block" data-toggle="modal"
							data-target="#myModal" style="width: 300px; margin: auto;">확인</button>
						<a class="btn btn-danger btn-block"
							href="${pageContext.request.contextPath}"
							style="width: 300px; margin: auto; margin-top: 15px;">취소</a>
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId"
								name="inputId_2" placeholder="ex) godmisu">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"
								name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button"
							class="btn btn-primary btn-block">확인</button>
						<a class="btn btn-danger btn-block"
							href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<div class="USreturn">
			<a href="login" style="margin-bottom: 20px;">로그인</a><br> <a
				href="insert2">회원가입</a>
		</div>
	</div>
</body>
<script>
	//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}

	/* $(document).ready(function() {
	   /////////모///달///기///능///////////
	   // 1. 모달창 히든 불러오기
	   $('#searchBtn').click(function() {
	      $('#myModal').show();
	   });
	   // 2. 모달창 닫기 버튼
	   $('.close').on('click', function() {
	      $('#myModal').hide();
	   });
	   // 3. 모달창 위도우 클릭 시 닫기
	   $(window).on('click', function() {
	      if (event.target == $('#background_modal').get(0)) {
	            $('#background_modal').hide();
	         }
	   });
	}); */

	// 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function() {
		$.ajax({
			type : "POST",
			url : "/user/userSearch?inputName_1=" + $('#inputName_1').val()
					+ "&inputTel_1=" + $('#inputTel_1').val(),
			success : function(data) {
				if (data == 0) {
					$('#id_value').text("회원 정보를 확인해주세요!");
				} else {
					$('#id_value').text(data);
					// 아이디값 별도로 저장
					idV = data;
				}
			}
		});
	}

	$("#searchBtn2").on("click", function() {
		var id = $('#inputId').val();
		var email = $('#inputEmail_2').val();
		$.ajax({
			type : "get",
			url : "/user/searchPassword?id=" + id + "&email=" + email,
			success : function() {
				alert("해당 이메일로 임시 비밀번호가 발송하였습니다.");
			}
		});
	});
</script>
</html>