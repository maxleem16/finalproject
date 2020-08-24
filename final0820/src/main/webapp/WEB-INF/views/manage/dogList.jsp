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
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

.btnUpdate {
	margin-top: 10px;
}

#management {
	margin-top: 20px;
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
	padding-top: 10px;
	width: 140px;
	height: 140px;
}

.circular--landscape img {
	border-radius: 50%;
}

#indexTitle {
	padding-left: 25px;
	padding-right: 10px;
	margin-left: 0px;
	box-shadow: 0px 5px 12px #d9d9d9;
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
				<li><a href="#">유기견 목록</a></li>
			</ul>
		</div>
		<div id="management">
		<form name="frm" action="/manage/dogList" method="get">
			<input type="hidden" name="adoptStatus">
			<input type="hidden" name="searchType">
			<input type="hidden" name="keyword">
			<input type="hidden" name="sortType">
			<input type="hidden" name="desc">
			<input type="hidden" name="page">
		</form>
			<div id="divSearch">
				<div id="divStatus" style="text-align:center;">
					<button class="button b01_simple_rollover" id="0">입양대기</button>
					<button class="button b01_simple_rollover" id="1">입양완료</button>
				</div>
				<div id="divSize" style="text-align:center; margin:10px">
					<button class="button b01_simple_rollover" id="">All</button>
					<button class="button b01_simple_rollover" id="a">소형견</button>
					<button class="button b01_simple_rollover" id="b">중형견</button>
					<button class="button b01_simple_rollover" id="c">대형견</button>
				</div>
				<div id="divSort" style="text-align:right; margin-right:145px;">
					<select id="sortType">
						<option value="dogCode" <c:out value="${cri.sortType=='dogCode'?'selected':''}"/>>코드</option>
						<option value="age" <c:out value="${cri.sortType=='age'?'selected':''}"/>>나이</option>
						<option value="species" <c:out value="${cri.sortType=='species'?'selected':''}"/>>종</option>
					</select> 
					<select id="desc">
						<option value="asc" <c:out value="${cri.desc=='asc'?'selected':''}"/>>오름차순</option>
						<option value="desc" <c:out value="${cri.desc=='desc'?'selected':''}"/>>내림차순</option>
					</select>
				</div>
			</div>
			<div id="divContent">
				<c:forEach items="${list}" var="vo">
					<div class="m_divListbox">
						<div class="circular--landscape">
							<img src="/display?fileName=${vo.dogImage}"
								style="width: 120px; height: 120px;">
						</div>
						<div id="divDogList">
							<h6 class="card-title">
								<span class="dogCode">${vo.dogCode} </span>
							</h6>
							<p class="card-text">
								<span>${vo.species}</span> <span>${vo.age}살</span> <span>
									<c:if test="${vo.gender == 0}">
                       		남아
                 		</c:if> <c:if test="${vo.gender == 1}">
                    	 	여아
                  		</c:if>
								</span> <br>
							<p class="card-text">
								<span> <c:if test="${vo.adoptStatus == 0}">
                       	 	입양대기
                 		</c:if> <c:if test="${vo.adoptStatus == 1}">
                   	  		입양완료
                 		</c:if>
								</span> <br>
								<button class="btn btn-outline-primary btnUpdate btn-sm">정보수정</button>
							</p>
						</div>
					</div>
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
	var adoptStatus = "${adoptStatus}";
	var keyword="${cri.keyword}";
	var page=1;

	$("#divStatus button").on("click", function() {
		if(keyword!=""){
			$(frm.keyword).val(keyword);
		}
		adoptStatus = $(this).attr("id");
		$(frm.adoptStatus).val(adoptStatus);
		$(frm.page).val(page);
		frm.submit();
	});
	
	$("#sortType").change(function(){
		var sortType=$(this).val();
		$(frm.sortType).val(sortType);
		var desc=$("#desc").val();
		$(frm.desc).val(desc);
		if(keyword!=""){
			$(frm.searchType).val("size");
			$(frm.keyword).val(keyword);
		}
		$(frm.adoptStatus).val(adoptStatus);
		$(frm.page).val(page);
		frm.submit();
	});
	$("#desc").change(function(){
		var sortType=$("#sortType").val();
		$(frm.sortType).val(sortType);
		var desc=$(this).val();
		$(frm.desc).val(desc);
		if(keyword!=""){
			$(frm.searchType).val("size");
			$(frm.keyword).val(keyword);
		}
		$(frm.adoptStatus).val(adoptStatus);
		$(frm.page).val(page);
		frm.submit();
	});

	$(".divPage a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		if(keyword!=""){
			$(frm.searchType).val("size");
			$(frm.keyword).val(keyword);
		}
		$(frm.page).val(page);
		if($(frm.adoptStatus).val==""){
			$(frm.adoptStatus).val("0");
		}
		frm.submit();
	});
	$(".btnUpdate").on("click", function() {
		var dogCode = $(this).parent().parent().find(".dogCode").html();
		location.href = "dogRead?dogCode=" + dogCode;
	});
	$("#divSize button").on("click",function() {
		$(frm.searchType).val("size");
		keyword = $(this).attr("id");
		$(frm.keyword).val(keyword);
		$(frm.adoptStatus).val(adoptStatus);
		$(frm.page).val(page);
		frm.submit();
	});
</script>
</html>