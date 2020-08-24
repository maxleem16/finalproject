<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>유저 정보</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style4manage.css">
<style>
#userUD {
	width: 1000px;
	margin-top: 0px;
	border: 1px solid #e3e4e6;
	text-algin: center;
	margin: auto;
	border-collapse: collapse;
	margin-top: 30px;
}

#userUD td {
	height: 80px;
}

.UDtitle {
	background: #ebecee;
	width: 100px;
	text-indent: 2em;
	color: #47484a;
	font-size: 15px;
}

.UD {
	width: 500px;
	text-align: left;
	padding-left: 50px;
	font-size: 13px;
}

.UD input {
	border: none;
	outline: none;
}

#tblUserInfo {
	border-collapse:collapse;
	width:1000px;
	margin:auto;
	border:1px solid #e3e4e6;
	margin-top:10px;
}

#tblUserInfo .title {
	background:#ebecee;
	text-align:center;
	height:40px;
	
}

#tblUserInfo .row {
	height:30px;
	text-align:center;
}
</style>
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="navBar">
			<ul>
				<li><a href="#">회원정보</a></li>
			</ul>
		</div>
		<div id="management">
			<br>
			<table border=1 id="userUD">
				<tr>
					<td class="UDtitle">아이디</td>
					<td class="UD">${read.id}&nbsp;&nbsp;&nbsp;&nbsp;<c:if
							test="${read.position==0}">
							<b style="color: gray;">일반회원</b>
						</c:if> <c:if test="${read.position==1}">
							<b style="color: blue;">관리자</b>
						</c:if> <c:if test="${read.position==2}">
							<b style="color: red;">블랙리스트</b>
						</c:if> &nbsp;&nbsp; <input type="button" value="변경하기" id="btnChange">
						<span id="change"> <select id="position">
								<option value="0"
									<c:out value="${read.position=='0'?'selected':''}"/>>일반회원
								</option>
								<option value="2"
									<c:out value="${read.position=='2'?'selected':''}"/>>블랙리스트
								</option>
						</select> <input type="button" value="변경" id="btnPosition">
					</span>
					</td>
				</tr>
				<tr>
					<td class="UDtitle">이름</td>
					<td class="UD">${read.name}</td>
				</tr>
				<tr>
					<td class="UDtitle">생년월일</td>
					<td class="UD">${read.birthday}</td>
				</tr>
				<tr>
					<td class="UDtitle">주소</td>
					<td class="UD">${read.address}</td>
				</tr>
				<tr>
					<td class="UDtitle">전화번호</td>
					<td class="UD">${read.tel}</td>
				</tr>
				<tr>
					<td class="UDtitle">이메일</td>
					<td class="UD">${read.email}</td>
				</tr>
			</table>
			<div>
				<table id="tblUserInfo"></table>
				<script id="temp" type="text/x-handlebars-template">
	<tr>
<th class="title" colspan=4>입양신청내역</th>
</tr>
<tr class="title">
<td>신청번호</td>
<td>강아지코드</td>
<td>신청날짜</td>
<td>취소여부</td>
</tr>
{{#each .}}
		<tr class="row">
		<td>{{applicationNo}}</td>
		<td>{{dogCode}} [{{species}}]</td>
		<td>{{appliedDate}}</td>
		<td>{{{printChk cancleCheck}}}</td>
		</tr>
	{{/each}}
			</script>
			</div>
			<input type="button" id="btnList" class="btn btn-outline-info" value="목록" style="margin-left:800px; margin-top:20px;">
		</div>
	</div>
</body>
<script>
	var id = "${read.id}";
	getList();
	$("#change").hide();
	Handlebars.registerHelper('printChk', function(ac) {
		var src;
		if (ac == '1') {
			src = "<font color='red'>신청취소</font>";
		} else {
			src = "승인대기"
		}
		return src;
	});
	$("#btnChange").on("click", function() {
		$("#change").show();
		$("#btnChange").hide();
	});

	$("#btnPosition").on("click", function() {
		var id = "${read.id}";
		var position = $("#position option:selected").val();
		$.ajax({
			type : "post",
			url : "/manage/cancleUpdate",
			data : {
				"id" : id,
				"position" : position
			},
			success : function() {
				alert("수정되었습니다!");
				location.href = "/manage/userRead?id=" + id;
			}
		});
	});

	$("#btnList").on("click", function() {
		location.href = "/manage/userList";
	});

	function getList() {
		$.ajax({
			type : "get",
			url : "/manage/personalApplyList.json",
			data : {
				"id" : id
			},
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tblUserInfo").html(temp(data));
			}
		});
	}
</script>
</html>