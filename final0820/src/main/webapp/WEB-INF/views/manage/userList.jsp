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
	width: 320px;
	height: 140px;
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
	text-align: right;
	margin: auto;
	width: 1460px;
	overflow: hidden;
}

.userProfile {
	width: 170px;
	padding-left:15px;
	text-align:left;
	float: right;
}

.circular--landscape {
	text-align: center;
	float: left;
	padding-top: 10px;
	width: 110px;
	height: 100px;
}

.circular--landscape img {
	border-radius: 50%;
}

.info {
	text-align: center;
}
select {
    width: 100px; /* 원하는 너비설정 */
    padding: .8em .5em; /* 여백으로 높이 설정 */
    font-size:13px;
    font-family: inherit;  /* 폰트 상속 */ /* 네이티브 화살표를 커스텀 화살표로 대체 */
    border: 1px solid #999;
    background: url('https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg') no-repeat 95% 50%;
    border-radius: 0px; /* iOS 둥근모서리 제거 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
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
				<li><a href="#">회원목록</a></li>
			</ul>
		</div>
		<div id="management">
			<div id="divContent">
				<form name="frm" action="userList">
					<input type="hidden" name="searchType" value="position"> <select
						name="keyword" onchange="this.form.submit()" style="margin-top:10px; margin-left:100px;">
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
							<c:if test="${vo.image == null }">
								<img src="http://placehold.it/80x80">
							</c:if>
							<c:if test="${vo.image != null }">
								<img src="/display?fileName=${vo.image}"
								style="width: 80px; height: 80px;">
							</c:if>
							</div>
							<div class="userProfile">
								ID:<span class="id">${vo.id}</span><br> 이름:<span>${vo.name}</span><br>
								<span><c:if test="${vo.position==0}">일반회원</c:if> <c:if
										test="${vo.position==1}">관리자</c:if> <c:if
										test="${vo.position==2}">블랙리스트</c:if></span><br> <span
									class="info"></span><br>
									<input type="button" class="btnInfo btn btn-outline-info btn-sm"
									value="상세정보">
							</div>
						</div>
					</c:forEach>
				</div>
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
	//btnInfo버튼 눌렀을때 userRead페이지로 이동
	$(".btnInfo").on("click", function() {
		var id = $(this).parent().parent().find(".id").html();
		location.href = "/manage/userRead?id=" + id;
	});

	//페이징
	$(".page-link").on("click",function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		var searchType = $(frm.searchType).val();
		var keyword = $(frm.keyword).val();
		location.href = "/manage/userList?page=" + page
				+ "&searchType=" + searchType + "&keyword=" + keyword;
	});
</script>
</html>