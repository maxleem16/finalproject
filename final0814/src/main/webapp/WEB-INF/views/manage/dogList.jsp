<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style4manage.css">
<style>
.m_divListbox {
	width: 300px;
	height: 180px;
	margin: 10px;
	padding: 20px;
	margin-left: 30px;
	color: black;
	float: left;
	font-size: 15px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	overflow: hidden;
	background-size: 100% 100%;
}

#divContent {
	text-align: center;
	margin: auto;
	width: 1360px;
	overflow: hidden;
}

.divPage {
	text-align: center;
}

.dogCode {
	font-weight: bold;
}

.divDogList {
	width: 170px;
	float: right;
	padding: 10px;
	background-color: rgba(255, 255, 255, 0.7);
	text-align: right;
}

.circular--landscape {
	text-align: center;
	float: left;
	background-color: blue;
	padding-top: 10px;
	width: 140px;
	height: 140px;
}

.circular--landscape img {
	border-radius: 50%;
}

.divPage ul {
	text-align: center;
}

.divPage ul li {
	display: inline;
	vertical-align: middle;
}

.divPage ul li a {
	display: -moz-inline-stack; /*FF2*/
	display: inline-block;
	vertical-align: top;
	padding: 4px;
	margin-right: 3px;
	width: 15px !important;
	color: #000;
	font: bold 12px tahoma;
	border: 1px solid #eee;
	text-align: center;
	text-decoration: none;
	width /**/: 26px; /*IE 5.5*/
}

.divPage ul li a.now {
	color: #fff;
	background-color: #f40;
	border: 1px solid #f40;
}

.divPage ul li a:hover, ul li a:focus {
	color: #fff;
	border: 1px solid #f40;
	background-color: #f40;
}
</style>
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="management">
			<div id="divContent">
				<c:forEach items="${list}" var="vo">
					<div class="m_divListbox">
						<div class="circular--landscape">
							<img src="/display?fileName=${vo.dogImage}"
								style="width: 120px; height: 120px;">
						</div>
						<div id="divDogList">
							<span class="dogCode">${vo.dogCode} </span>
							<hr>
							<span>${vo.species}</span> <br> <span>${vo.age}살</span> <br>
							<span> <c:if test="${vo.gender == 0}">
                       		남아
                 		</c:if> <c:if test="${vo.gender == 1}">
                    	 	여아
                  		</c:if>
							</span> <br> <span> <c:if test="${vo.adoptStatus == 0}">
                       	 	입양대기
                 		</c:if> <c:if test="${vo.adoptStatus == 1}">
                   	  		입양완료
                 		</c:if>
							</span> <br>
							<button class="btn btn-outline-primary btnUpdate">정보수정</button>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="divPage">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${pm.prev}">
							<li><a href="${pm.startPage-1}"> <span>«</span></a></li>
						</c:if>
						<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
							<c:if test="${pm.cri.page == i }">
								<li class="active"><a href="${i}">${i}</a></li>
							</c:if>
							<c:if test="${pm.cri.page != i }">
								<li class="page"><a href="${i}">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pm.next}">
							<li><a href="${pm.endPage+1}"> <span>»</span></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
<script>
	$(".divPage a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "dogList?page=" + page;
	});
	$(".btnUpdate").on("click", function() {
		var dogCode = $(this).parent().find(".dogCode").html();
		location.href = "dogRead?dogCode=" + dogCode;
	});
</script>
</html>