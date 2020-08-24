<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image⁄x-icon"
	href="/resources/img/page_logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<title>DDOGDOG MYPAGE</title>
<style>
</style>
</head>
<body>
	<jsp:include page="../menu3.jsp" />
	<div class="menuBox">
		<jsp:include page="../menuTop.jsp" />
		<div class="mplistWrap">
		<div class="MPtext">내가 찜한 강아지</div>
		<table border=1 id="dogLikeList">
			<tr class="dogLikeTitle">
				<td>강아지코드</td>
				<td>견죵</td>
				<td>성별</td>
				<td>나이</td>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr class="row">
					<td class="dogCode">${vo.dogCode}</td>
					<td>${vo.species}</td>
					<c:if test="${vo.gender==0}">
						<td>남아</td>
					</c:if>
					<c:if test="${vo.gender==1}">
						<td>여아</td>
					</c:if>
					<td>${vo.age}살</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagination">
			<c:if test="${pm.prev}">
				<a href="${pm.startPage-1}">◀</a>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
				<c:if test="${pm.cri.page == i }">
                [<a href="${i}" class='active'>${i}</a>]
            </c:if>
				<c:if test="${pm.cri.page != i }">
                [<a href="${i}">${i}</a>]
            </c:if>
			</c:forEach>
			<c:if test="${pm.next}">
				<a href="${pm.endPage+1}">▶</a>
			</c:if>
		</div>
		</div>
	</div>
	<jsp:include page="../myPageFooter.jsp" />
</body>
<script>
	$("#pagination a").click(function(e) {
		e.preventDefault();
		var id = $
		{
			id
		}
		;
		var page = $(this).attr("href");
		location.href = "dogLikeList?id=" + id + "&page=" + page;
	});

	$("#dogLikeList").on("click", ".row", function() {
		var dogCode = $(this).find(".dogCode").html();
		location.href = "/dog/read2?dogCode=" + dogCode;
	});
</script>
</html>