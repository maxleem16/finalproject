<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<title>로그인</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<h1>[로그인]</h1>
	<form name="frm" action="login" method="post">
		<table width=300 border=1>
			<tr>
				<td>아이디:</td>
				<td><input type="text" name="id" size=10></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" size=10></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="로그인">
					<input type="checkbox" name="chkLogin">로그인 상태 유지 <a href="insert">회원가입</a>
					<input type="button" value="회원탈퇴" id="btnDelete">
					<a id="btnKakao">
						<img src="/resources/img/kakao_login_medium_narrow.png">
					</a>
				</td>
			</tr>
		</table>
	</form>
</body>
<script>

	$("#btnDelete").on("click",function(){
		$.ajax({
			type : "post",
			url : "/user/login",
			data : {
				"id" : id,
				"password" : password,
				"chkLogin" : chkLogin
			},
			success : function(data) {
	
			}
		});
	});

	$(frm).submit(function(e) {
		var id = $(frm.id).val();
		var password = $(frm.password).val();
		var chkLogin = $(frm.chkLogin).is(":checked") == true;
		e.preventDefault();
		$.ajax({
			type : "post",
			url : "/user/login",
			data : {
				"id" : id,
				"password" : password,
				"chkLogin" : chkLogin
			},
			success : function(data) {
				if (data == 0) {
					alert("아이디가 존재하지 않습니다.");
					$(frm.id).focus();
				} else if (data == 1) {
					alert("비밀번호가 일치하지 않습니다.");
					$(frm.pass).focus();
				} else if (data == 3){
					alert("탈되된 회원아이디입니다.");
					$(frm.id).focus();
				}else{
					alert("로그인 되었습니다.");
					var dest = "${dest}";
					if (dest != "") {
						location.href = "${dest}";
					} else {
						location.href = "../index";
					}

				}
			}
		});
	});
	
	$("#btnKakao").click(function() {
		location.href = "https://kauth.kakao.com/oauth/authorize?client_id=e0e7c8bee72c7c04d50224a121304a09&redirect_uri=http://localhost:8088/user/oauth&response_type=code";
	});
</script>
</html>