<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<title>DDOGDOG REPORT LIST</title>
<style>
	
#RlistSearch {
	background: #ebecee;
	height: 75px;
}

#ReportTitle h1{
	margin-left:43%;
	color:#FF8C0A;
}

#ReportTitle p {
	color:#BCAC99;
	position:absolute;
	top:76%;
	left:33%;
}

.divReportwrap {
	width:100%;
	display:inline-block;

}

.divReportList {
	width:1200px;
	margin:auto;
}

.Reportbox {
	width:200px;
	margin:30px;
	height:300px;
	background:url(/resources/img/testdog.jpg)
	z-index:1;
    background-size: cover;
	float:left;
	position:relative;
	top:10%;
	left:5%;
	box-shadow: 0px 10px 10px 0px rgba(0, 0, 0, 0.3);
	background-color: rgba( 255, 255, 255, 0.5 );
	border-radius: 10px 10px 10px 10px;
	padding:5px;
}



.Reportbox img {
	position:absolute;
	top:9%;
	left:3%;
	width:180px;
	height:200px;
	margin:auto;
	margin:5px;
}

.foundNo, .foundNo a{
	text-decoration: none;
	color:red;
	font-weight:bold;
}

.Reporttxt {
	font-size:12px;
	font-family:'나눔스퀘어라운드';
	position:absolute;
	top:80%;
}

#btnInsert {
	margin-left:1320px;
	cursor:pointer;
	background:#F2BB13;		
	height:36px;
	width:100px;
	border-radius: 5px 5px 5px 5px;
	font-size:14px;
	border: none;
	outline: none;
}

</style>
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp"/>
	</div>
	<div id="divListImg">
		<jsp:include page="../box.jsp"/>	<!-- 광고 이미지 -->
	</div>
	<div id="RlistSearch">
		<form name="frm" action="list" id="listfrm">
			<input type="hidden" id="page" name="page" value="${cri.page}">
			<input type="hidden" name="bno">
			<select name="searchType" class="listSelect">
				<option value="foundLocation" <c:out value="${cri.searchType=='foundLocation'?'selected':''}"/>>발견지역</option>
				<option value="writer" <c:out value="${cri.searchType=='writer'?'selected':''}"/>>작성자</option>
				<option value="feature" <c:out value="${cri.searchType=='feature'?'selected':''}"/>>내용</option>
			</select>
			<input type="text" name="keyword" value="${cri.keyword}"/>
			<input type="submit" value="SEARCH">
			<span>total:${pm.totalCount}</span>
		</form>
	</div>
	<div class="divReportwrap">
		<div id="ReportTitle">
			<h1>제보합니다</h1>
			<p>길 잃은 우리 아이들이 하루 빨리 따듯한 집으로 돌아갈 수 있게 도와주세요!</p>
		</div>
		<input id="btnInsert" value="게시물작성 " type="button"></input>
		<div class="divReportList">
		<c:forEach items="${list}" var="vo">
			<div class="Reportbox">
				<div class="foundNo">${vo.foundNo}</div>
				<c:if test="${vo.dogImage!=null && vo.dogImage!=''}">
					<img src="/display?fileName=${vo.dogImage}" width=100>
				</c:if>
				<c:if test="${vo.dogImage==null || vo.dogImage==''}">
					<img src="http://placehold.it/100x80" width=100>
				</c:if>
				<div class="reporttxt">
					<div>${vo.writer}</div>
					<div><fmt:formatDate value="${vo.foundTime}" pattern="yyyy-MM-dd"/></div>
					<div>작성일자<fmt:formatDate value="${vo.preperationTime}" pattern="yyyy-MM-dd"/></div>
					<div>${vo.foundLocation}</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
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
    <jsp:include page="../footer.jsp"/>
</body>
<script>
	$("#btnInsert").on("click",function(){
	    var id="${id}";
	    if(id==""){
	       alert("로그인 후 이용하세요.");
	       location.href="/user/login";
	    }else{
	       location.href="insert";
	    }   
	 });

	$("#pagination a").click(function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		location.href="list?page="+page;
	});
	
	$(".divReportList").on("click",".Reportbox",function(){
		var foundNo=$(this).find(".foundNo").html();
		var page=$("#page").val();
		location.href="read?foundNo="+foundNo+"&page="+page;
	});
</script>
</html>