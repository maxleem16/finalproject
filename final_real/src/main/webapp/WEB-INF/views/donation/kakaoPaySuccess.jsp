<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<title>결제완료페이지</title>
</head>
<body>
	<div class="container">
		<div class="card-body text-center mt-5">
			<h2>결제가 완료되었습니다.</h2>
			<table border=1>
				<tr>
					<td>후원인</td>
					<td>${read.name}</td>
				</tr>
				<tr>
					<td>후원금액</td>
					<td><fmt:formatNumber value="${read.price}" pattern="#,###원"/></td>
				</tr>
				<tr>
					<td>한마디</td>
					<td><textarea cols=50 rows=3>${read.sponsorContent}</textarea></td>
				</tr>
			</table>
			<button id="close">닫기</button>
		</div>
	</div>
</body>
<script>
	$("#close").on("click",function(){
		opener.parent.location="/donation/list";
		window.close();
	});
</script>
</html>