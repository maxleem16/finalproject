<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<title>로그인</title>
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp"/>
	</div>
	<div id="divListImg">
		<img src="/resources/img/list_ad.jpg">		<!-- 광고 이미지 -->
	</div>
	<jsp:include page="../menu3.jsp"/>
	<h1>[비밀번호 확인]</h1>
		<table width=300 border=1>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" id="password" size=10></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="button" id="btnRead" value="확인">
				</td>
			</tr>
		</table>
		<jsp:include page="../footer.jsp"/>
</body>
<script>
	
	$("#password").keydown(function(key){
		if(key.keyCode==13){
			$("#btnRead").click();
		}
	});

	$("#btnRead").on("click",function() {
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
					location.href="/user/read?id="+id;	
				}
			}	
		});
	});
	
</script>
</html>