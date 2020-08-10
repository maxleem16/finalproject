<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<title>유저 정보</title>
</head>
<body>
	<h1>[유저 정보]</h1>
	<table border=1>
		<tr>
			<td>아이디</td>
			<td>${read.id}&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${read.position==0}"><b style="color:gray;">일반회원</b></c:if>
				<c:if test="${read.position==1}"><b style="color:blue;">관리자</b></c:if>
				<c:if test="${read.position==2}"><b style="color:red;">블랙리스트</b></c:if>
				&nbsp;&nbsp;
				<input type="button" value="변경하기" id="btnChange">
				<span id="change">
					<select id="position">
						<option value="0"
							<c:out value="${read.position=='0'?'selected':''}"/>>일반회원
						</option>
						<option value="2"
							<c:out value="${read.position=='2'?'selected':''}"/>>블랙리스트
						</option>
					</select>
					<input type="button" value="변경" id="btnPosition">
				</span>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${read.name}</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${read.birthday}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td width=500>${read.address}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${read.tel}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${read.email}</td>
		</tr>
	</table>
	<input type="button" id="btnList" value="목록">
	<br><br>
	<jsp:include page="../mypage/applyList.jsp"/>
</body>
<script>
	$("#change").hide();

	$("#btnChange").on("click",function(){
		$("#change").show();
		$("#btnChange").hide();
	});

	$("#btnPosition").on("click",function(){
		var id="${read.id}";
		var position=$("#position option:selected").val();
		$.ajax({
			type:"post",
			url:"/manage/cancleUpdate",
			data:{"id":id,"position":position},
			success:function(){
				alert("수정되었습니다!");
				location.href="/manage/userRead?id="+id;
			}
		});
	});

	$("#btnList").on("click",function(){
		location.href="/manage/userList";
	});
</script>
</html>