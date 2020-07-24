<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>DDOGDOG Board</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style>
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
}
</style>
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp" />
	</div>
	<div class="divWrap"></div>
	<h1>자유게시판</h1>
	검색수:
	<span>${pm.totalCount}</span>
	<form action="list" name="frm" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${cri.page}"> <input
			type="hidden" name="postingNo"> <select name="searchType">
			<option value="postTitle"
				<c:out value="${cri.searchType=='postTitle'?'selected':''}"/>>제목</option>
			<option value="writer"
				<c:out value="${cri.searchType=='writer'?'selected':''}"/>>작성자</option>
			<option value="postContent"
				<c:out value="${cri.searchType=='postContent'?'selected':''}"/>>내용</option>
		</select> <input type="text" name="keyword" value="${cri.keyword}"> <input
			type="submit" value="검색">
	</form>
	<table class="tbl" border=1>
		<tr>
			<td width=50>번호</td>
			<td width=450>제목</td>
			<td width=200>이미지</td>
			<td width=100>작성자</td>
			<td width=100>작성일</td>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr class="row">
				<td class="postingNo">${vo.postingNo}</td>
				<td>${vo.postTitle}</td>
				<td><c:if test="${vo.image!=null && vo.image!=''}">
						<img src="/display?fileName=${vo.image}" width=100>
					</c:if> <c:if test="${vo.image==null || vo.image==''}">
						<img src="http://placehold.it/100x80" width=100>
					</c:if></td>
				<td>${vo.writer}</td>
				<td><fmt:formatDate value="${vo.preperationTime}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
	</table>
	<button onclick="location.href='insert'">등록</button>
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
		<a href="#" id="aTop">
			<img src="/resources/img/top.jpg" >
		</a>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
<script>

	$("#aTop").click(function() {
		$('body,html').animate({
			scrollTop : 0
		}, 400);
		return false;
	});

	$(frm).submit(function() {
		$(frm.page).val(1);
	});

	$("#pagination").on("click", "a", function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		$(frm.page).val(page);
		frm.submit();
	});

	$(".row").on("click", function() {
		var postingNo = $(this).find(".postingNo").html();
		$(frm.postingNo).val(postingNo);
		frm.action = "read";
		frm.submit();
	});
</script>
</html>