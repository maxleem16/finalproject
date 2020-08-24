<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <title>실종신고 목록</title>
   <style>
       .box{padding: 10px; background: gray; width: 500px; margin: auto;}
   </style>
   <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
</head>
<body>
   <jsp:include page="../menu3.jsp"/>
	<div class="menuBox">
	<jsp:include page="../menuTop.jsp"/>
	<div class="mplistWrap">
		<div class="MPtext2">실종신고 내가 쓴 글</div>
		<input type="button" id="btnInsert" value="글쓰기">
		<table border=1 id="mpMissingList">
			<tr class="mpMissingTitle">
				<td>게시물번호</td>
				<td>작성자</td>
				<td>실종위치</td>
				<td>실종일자</td>
				<td>작성일자</td>
			</tr>
			<c:forEach items="${list}" var="vo" begin="0" end="2">
				<tr class="row">
					<td class="reportNo"style="font-size:15px; color:gray;">${vo.reportNo}</td>
					<td>${vo.writer}</td>
					<td>${vo.missingLocation}</td>
					<td>${vo.missingTime}</td>
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
   <jsp:include page="../myPageFooter.jsp"/>
</body>
<script>
	//페이징
	$("#pagination a").on("click", function(e) {
		e.preventDefault();
		var id = $
		{
			id
		}
		;
		var page = $(this).attr("href");
		location.href = "missingList?id=" + id + "&page=" + page;
	});

	//글쓰러가기 버튼
	$("#btnInsert").on("click", function() {
		location.href = "/missing/insert";
	});

	$(".row").on("click", function() {
		var reportNo = $(this).find(".reportNo").html();
		location.href = "/missing/read2?reportNo=" + reportNo;
	});
</script>
</html>