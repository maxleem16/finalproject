<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
#divContent {
	margin-top:30px;
	margin-left:100px;
}

.divPage {
	text-align: center;
	position: absolute;
	top: 80%;
	left: 55%;
}
#invoice-POS {
	box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);
	padding: 10px;
	margin: 10px;
	width: 260px;
	height:330px;
	background: #FFF; 
	color: #FFF;
	float: left;
::selection {background: #f31544}
::moz-selection {
	background: #f31544;
	color: #FFF;
	}
}

h1 {
	font-size: 1.5em;
	color: #222;
}

h6 {
	font-size: 10px;
	text-align: center;
	font-family: 'Binggrae-Bold';
}

h3 {
	font-size: 1.2em;
	font-weight: 300;
	line-height: 2em;
}

p {
	font-size: .7em;
	color: #666;
	line-height: 1.2em;
}

#top, #mid, #bot { /* Targets all id with 'col-' */
	width: 235px;
}

#top {
	min-height: 100px;
}

#mid {
	min-height: 80px;
}

#bot {
	min-height: 50px;
}

#top .logo { //
	float: left;
	height: 60px;
	width: 60px;
	background: url(/resources/img/logo.png) no-repeat;
	background-size: 60px 60px;
}

.clientlogo {
	float: left;
	height: 60px;
	width: 60px;
	background: url(/resources/img/logo.png) no-repeat;
	background-size: 60px 60px;
	border-radius: 50px;
}

.info {
	display: block; //
	float: left;
	margin-left: 0;
}

.info h6{
color:black;
}

.title p {
	text-align: right;
}

table {
	width: 100%;
	border-collapse: collapse;
	width: inherit;
	margin:auto;
	text-align: center;
}

td {
	padding: 5px;
	border: 1px solid #EEE
}

.tabletitle { //
	padding: 5px;
	font-size: 8px;
	background: #EEE;
	text-align: center;
}

.service {
	padding: 15px;
	border-bottom: 1px solid #EEE;
	text-align: center;
}

.item {
	width: 24mm;
}

.itemtext {
	font-size: .5em;
	margin-bottom:0px;
}

#legalcopy {
	margin-top: 5mm;
	width: inherit;
}
</style>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style4manage.css">
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="navBar">
			<ul>
				<li><a href="#">후원금내역</a></li>
			</ul>
		</div>
		<div id="management">
			<div id="divContent">
				<c:forEach items="${list}" var="vo">
					<div id="invoice-POS">
						<div id="top">
							<div class="logo">
							</div>
							<div class="info">
								<h6>DDogdog</h6>
							</div>
							<!--End Info-->
						</div>
						<!--End InvoiceTop-->
						<div id="mid">
							<div class="info">
								<p>
									<strong>후원자명 : ${vo.name }</strong><br>
									Address : ${vo.address }</br> Email : ${vo.email }</br> Phone : ${vo.tel}</br>
								</p>
							</div>
						</div>
						<!--End Invoice Mid-->

						<div id="bot">

							<div id="table">
								<table>
									<tr class="tabletitle">
										<td class="item">sponsor</td>
										<td class="Hours">purchased</td>
										<td class="Rate">price</td>
									</tr>
									<tr class="service">
										<td class="tableitem"><p class="itemtext">${vo.sponsor }</p></td>
										<td class="tableitem"><p class="itemtext">
											카드결제
										</p></td>
										<td class="tableitem"><p class="itemtext">${vo.price }</p></td>
									</tr>
								</table>
							</div>
							<!--End Table-->
							<div id="legalcopy">
								<p class="legal">
									<strong>똑독(주)|대표이사:오은지</strong><br>
									인천시 미추홀구 학익동 대성빌딩 5층<br>
									사업자 등록번호 : 120-51-090291<br>
									통신판매업신고 : 2020-인천미추홀-0680
								</p>
							</div>
						</div>
						<!--End InvoiceBot-->
					</div>
					<!--End Invoice-->
				</c:forEach>
			</div>
			<div class="divPage">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${pm.prev}">
							<li class="page-item"><a class="page-link"
								href="${pm.startPage-1}"> <span>«</span></a></li>
						</c:if>
						<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
							<c:if test="${pm.cri.page == i }">
								<li class="active page-item"><a class="page-link"
									href="${i}">${i}</a></li>
							</c:if>
							<c:if test="${pm.cri.page != i }">
								<li class="page page-item"><a class="page-link" href="${i}">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pm.next}">
							<li class="page-item"><a class="page-link"
								href="${pm.endPage+1}"><span>»</span></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
<script>
	//페이징
	$(".page-link").on("click", function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "/manage/donationList?page=" + page;
	});
</script>
</html>