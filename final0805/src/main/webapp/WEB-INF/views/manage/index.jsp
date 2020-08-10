<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wholePage {
	width: 1800px;
	background: lightgray;
	margin: auto;
}

#sidebar {
	width: 400px;
	height:1500px;
	margin: 10px;
	background: white;
	text-align: center;
	padding: 10px;
}

#counselingList{
	background:white;
	width:1300px;
	position: absolute;
	top: 0%;
	left: 23%;	
	}

#management {
	width: 1360px;
	margin: 10px;
}

.menuList {
	width: 340px;
	margin: 20px;
	text-align: center;
	margin-top: 30px;
}
</style>
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp"/>
		</div>
		<div id="management">
			<div id="messageList"></div>
			<div id="adoptRequest"></div>
			<div id="counselingList">
				<jsp:include page="/WEB-INF/views/manage/float/counselingList.jsp"/>
			</div>
		</div>
	</div>
</body>
</html>