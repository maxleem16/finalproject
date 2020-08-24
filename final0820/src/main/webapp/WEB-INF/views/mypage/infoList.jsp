<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>제보목록</title>
<style>
.box {
	padding: 10px;
	background: gray;
	width: 500px;
	margin: auto;
}
</style>
</head>
<body>
	<jsp:include page="../menu3.jsp" />
	<div class="menuBox">
		<jsp:include page="../menuTop.jsp" />
		<div class="mplistWrap">
		<div class="MPtext2">유기제보 내가 쓴 글</div>
		<input id="btnInsert" value="글쓰기" type="button"></input>
		<table border=1 id="mpInfoList">
			<tr class="mpInfoTitle">
				<td>게시물번호</td>
				<td>작성자</td>
				<td>발견위치</td>
				<td>작성시간</td>
			</tr>
			<c:forEach items="${list}" var="vo" begin="0" end="2">
				<tr class="row">
					<td class="foundNo">${vo.foundNo}</td>
					<td>${vo.writer}</td>
					<td>${vo.foundLocation}</td>
					<td><fmt:formatDate value="${vo.preperationTime}"
							pattern="yyyy-MM-dd" /></td>
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
	$("#btnInsert").on("click", function() {
		location.href = "/infoReport/insert";
	});

	$("#pagination a").click(function(e) {
		e.preventDefault();
		var id = $
		{
			id
		}
		;
		var page = $(this).attr("href");
		location.href = "infoList?id=" + id + "&page=" + page;
	});

	$(".row").on("click", function() {
		var foundNo = $(this).find(".foundNo").html();
		location.href = "/infoReport/read2?foundNo=" + foundNo;
	});
</script>
</html>