<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style4manage.css">
<title>유저목록</title>
<style>
#tblReserve {
	margin: auto;
	width: 1000px;
	margin-top:50px;
}

#tblReserve .subject {
	background: #DDB247;
	color: #FAFAFA;
	font-weight: bold;
	text-align: center;
	padding: 20px;
}

#tblReserve .contents {
	padding: 15px;
}

#tblReserve .row:nth-child(2n) {
	background: #F7FBFA;
}

#tblReserve .row:nth-child(2n+1) {
	background: #F5F7FD;
}

.date, .user, .time, .cancle {
	text-align: center;
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
				<li><a href="#">상담예약일정</a></li>
			</ul>
		</div>
		<div id="management">
			<table id="tblReserve">
				<tr class="title">
					<td class="subject" width="200">예약날짜</td>
					<td class="subject" width="400">유기견정보</td>
					<td class="subject" width="200">예약자성함</td>
					<td class="subject" width="100">상담시간</td>
					<td class="subject" width="100">취소여부</td>
				</tr>
				<c:forEach items="${list}" var="vo">
					<tr class="row">
						<td class="contents date"><fmt:parseDate var="counselingDate"
								value="${vo.counselingDate }" pattern="yyyy-MM-dd" /> <fmt:formatDate
								value="${counselingDate }" pattern="yyyy년 MM월 dd일" /></td>
						<td class="contents dog">[${vo.dogCode }] ${vo.species} :
							${vo.age }살 <c:if test="${vo.gender == 0}">
                          	 남아
                  </c:if> <c:if test="${vo.gender == 1}">
                     	여아
                  </c:if>
						</td>
						<td class="contents user">${vo.name }(${vo.id })</td>
						<td class="contents time"><c:if
								test="${vo.counselingTime < 12 && vo.counselingTime >= 9}">
					 오전 ${vo.counselingTime }시
					</c:if> <c:if test="${vo.counselingTime >= 12 || vo.counselingTime < 6}">
					 오후 ${vo.counselingTime }시
					</c:if></td>
						<td class="contents cancle"><fmt:parseDate var="nowDate"
								value="${now}" pattern="yyyy-MM-dd" /> <c:choose>
								<c:when test="${vo.cancleCheck == 0}">
									<c:if test="${counselingDate >= nowDate}">
							상담예정
							</c:if>
									<c:if test="${counselingDate < nowDate }">
						 		상담완료
							</c:if>
								</c:when>
								<c:when test="${vo.cancleCheck == 1}">
							예약취소
						</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</table>
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
	$(".pagination a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "counselingList?page=" + page;
	});
</script>
</html>