<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
.box {
	width: 100px;
	height: 150px;
	padding: 5px;
	margin: 5px;
	background: #C66D6D;
	color: white;
	float: left;
	font-size: 15px;
}
</style>
</head>
<body>
	<div>
		<form name="frm" action="list">
			<input type="hidden" name="searchType" value="species">
			<input type="text" name="keyword" value="${cri.keyword}">
			<input type="submit" value="검색">
		</form>
	</div>
	<div style="width:500px">
		<c:forEach items="${list}" var="vo">
			<div class="box">
				<c:if test="${vo.dogImage == null}">
					<img src="http://placehold.it/100x100" width=100>
				</c:if>
				<c:if test="${vo.dogImage != null}">
					<img src="${vo.dogImage}" width=100>
				</c:if>
				${vo.dogCode}
				${vo.species}
			</div>
		</c:forEach>
	</div>
	<div style="width: 490px;">
		<span style="float: left">total:${pm.totalCount}</span>
	</div>
	<div id="pagination">
		<c:if test="${pm.prev}">
			<a href="${pm.startPage-1}">◀</a>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:if test="${pm.cri.page==i}">
				<a href="${i}" class="active">[${i}]</a>
			</c:if>
			<c:if test="${pm.cri.page!=i}">
				<a href="${i}">[${i}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${pm.next}">
			<a href="${pm.endPage+1}">▶</a>
		</c:if>
	</div>
</body>
<script>
	var searchType=$(frm.searchType).val();
	var keyword=$(frm.keyword).val();
	$("#pagination a").on("click", function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "list?page="+page +"&searchType="+searchType+"&keyword="+keyword;
	});
</script>
</html>