<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>
#manager {
	border-collapse: collapse;
	margin: auto;
}

td {
	padding: 5px;
	text-align: center;
}

.title {
	color: white;
	font-weight: bold;
}

#manager .title {
	background-color: #f39c11;
}

#manager .row:nth-child(2n+1) {
	background-color: lightgray;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style4manage.css">
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="management">
			<div id="messageList">
				<jsp:include page="/WEB-INF/views/manage/float/messageList.jsp" />
			</div>
			<div id="adoptRequest">
				<jsp:include page="/WEB-INF/views/manage/float/adoptRequest.jsp" />
			</div>
			<div id="manageProfile">
				<h2>manage whatever</h2>
				<table id="manager">
					<tr class="title">
						<td>i mean</td>
						<td>i think</td>
						<td>i write</td>
						<td>something..</td>
					</tr>
					<tr class="row">
						<td>but</td>
						<td>the</td>
						<td>thing</td>
						<td>is</td>
					</tr>
					<tr class="row">
						<td>i dont</td>
						<td>know</td>
						<td>what am i</td>
						<td>doing</td>
					</tr>
					<tr class="row">
						<td>actually</td>
						<td>i wanna</td>
						<td>go home</td>
						<td>ya whateva</td>
					</tr>
				</table>
			</div>
			<div id="counselingList">
				<jsp:include page="/WEB-INF/views/manage/float/counselingList.jsp" />
			</div>
		</div>
	</div>
</body>
</html>