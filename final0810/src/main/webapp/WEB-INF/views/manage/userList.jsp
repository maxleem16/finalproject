<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style4manage.css">
<title>유저목록</title>
<style>
.m_divListbox {
	width: 300px;
	height: 100px;
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

.userProfile{
	width:170px;
	float:right;
	background-color: red;
}

.circular--landscape {
	text-align:center;
	float:left;
	background-color: blue;
	padding-top:10px;
	width:110px;
	height:100px;
}

.circular--landscape img {
	border-radius: 50%;
}

.info {
	text-align: center;
}
</style>
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="management">
			<form name="frm" action="userList">
				<input type="hidden" name="searchType" value="position"> <select
					name="keyword" onchange="this.form.submit()">
					<option value="" <c:out value="${cri.keyword==''?'selected':''}"/>>모든회원
					</option>
					<option value="0"
						<c:out value="${cri.keyword=='0'?'selected':''}"/>>일반회원</option>
					<option value="1"
						<c:out value="${cri.keyword=='1'?'selected':''}"/>>관리자</option>
					<option value="2"
						<c:out value="${cri.keyword=='2'?'selected':''}"/>>블랙리스트
					</option>
				</select>
			</form>
			<div id="divUserList">
				<c:forEach items="${list}" var="vo">
					<div class="m_divListbox">
						<div class="circular--landscape">
							<img src="http://placehold.it/80x80">
						</div>
						<div class="userProfile">
							<span class="id">${vo.id}</span><br> <span>${vo.name}</span><br>
							<span><c:if test="${vo.position==0}">일반회원</c:if> <c:if
									test="${vo.position==1}">관리자</c:if> <c:if
									test="${vo.position==2}">블랙리스트</c:if></span><br> <span
								class="info"><input type="button" class="btnInfo"
								value="ℹ️"></span>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="pagination">
				<c:if test="${pm.prev}">
					<a href="${pm.startPage-1}">◀</a>
				</c:if>
				<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
					<c:if test="${pm.cri.page == i }">
                [<a href="${i}" class='active' style="color: red;">${i}</a>]
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
</body>
<script>
	//btnInfo버튼 눌렀을때 userRead페이지로 이동
	$(".btnInfo").on("click", function() {
		var id = $(this).parent().parent().find(".id").html();
		location.href = "/manage/userRead?id=" + id;
	});

	//페이징
	$("#pagination a").on(
			"click",
			function(e) {
				e.preventDefault();
				var page = $(this).attr("href");
				var searchType = $(frm.searchType).val();
				var keyword = $(frm.keyword).val();
				location.href = "/manage/userList?page=" + page
						+ "&searchType=" + searchType + "&keyword=" + keyword;
			});
</script>
</html>