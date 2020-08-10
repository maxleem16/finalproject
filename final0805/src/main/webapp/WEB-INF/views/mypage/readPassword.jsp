<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<link rel="shortcut icon" type="image⁄x-icon"   href="/resources/img/page_logo.png">
<link rel="stylesheet" href="/resources/css/style.css">
<title>DDOGDOG MYPAGE</title>
</head>
<body>
	<jsp:include page="../menu3.jsp" />
	<div class="menuBox">
		<jsp:include page="../menuTop.jsp" />
		<div id="backIMG"><img src="/resources/img/9.png"></div>
		<div id="readH">회원정보 <b style="color:#F25F29; font-size:21px;">수정</b>을 위해 비밀번호를 입력해주세요</div>
		<table width=400 cellpadding=0 cellspacing=0 id="readP">
			<tr id="readP1">
				<td><input type="password" id="password" size=40 placeholder="비밀번호를 입력하세요"></td>
			</tr>
			<tr id="readP2">
				<td colspan=2><input type="button" id="btnPassRead" value="확인">
				</td>
			</tr>
		</table>
		
	</div>

	<jsp:include page="../myPageFooter.jsp" />
</body>
<script>
	$("#password").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#btnPassRead").click();
		}
	});

	$("#btnPassRead").on("click", function() {
		var id = "${id}";
		var password = $("#password").val();
		$.ajax({
			type : "get",
			url : "/user/readPasswordCheck",
			data : {
				"id" : id,
				"password" : password
			},
			success : function(data) {
				if (data == 0) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#password").focus();
				} else if (data == 1) {
					location.href = "/user/read?id=" + id;
				}
			}
		});
	});
</script>
</html>