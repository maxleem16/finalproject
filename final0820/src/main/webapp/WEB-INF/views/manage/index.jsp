<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style4manage.css">
<style>
td {
	padding: 5px;
	text-align: center;
}

.title {
	color: white;
	font-weight: bold;
}

#messageList a, #adoptRequest a, #donationByPurchase a {
	float: right;
}
a{
text-decoration: none;
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
				<li><a href="#">관리자 메인</a></li>
			</ul>
		</div>
		<div id="management">
			<div id="messageList">
				<jsp:include page="/WEB-INF/views/manage/float/messageList.jsp" />
			</div>
			<div id="adoptRequest">
				<jsp:include page="/WEB-INF/views/manage/float/adoptRequest.jsp" />
			</div>
			<div id="donationByPurchase">
				<jsp:include
					page="/WEB-INF/views/manage/float/donationByPurchase.jsp" />
			</div>
			<div id="counselingList">
				<jsp:include page="/WEB-INF/views/manage/float/counselingList.jsp" />
			</div>
		</div>
	</div>
</body>
</html>