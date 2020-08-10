<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<title>실종신고 목록</title>
<style>

#MlistSearch {
	background: #ebecee;
	height: 75px;
}

#missingTitle h1{
	margin-left:39%;
	color:#FF607F;
}

#missingTitle p {
	color:#BCAC99;
	position:absolute;
	top:76%;
	left:36%;
}

.divMissingwrap {
	width:100%;
	display:inline-block;

}

.divMissingList {
	width:1200px;
	margin:auto;
}

.missingbox {
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



.missingbox img {
	position:absolute;
	top:9%;
	left:3%;
	width:180px;
	height:200px;
	margin:auto;
	margin:5px;
}

.reportNo, .reportNo a{
	text-decoration: none;
	color:red;
	font-weight:bold;
}

.missingtxt {
	font-size:12px;
	font-family:'나눔스퀘어라운드';
	position:absolute;
	top:80%;
}

.blur {
	position:absolute;
	top:10%;
	left:5%;
	width:180px;
	height:240px;
	background:url(/resources/img/testdog.jpg);		<!-- 수정해야함 -->
	filter: blur(30px);
  	-webkit-filter: blur(30px);
	opacity:0.9;
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
	
	<div id="MlistSearch">
		<form name="frm" action="list" id="listfrm">
			<select name="searchType" class="listSelect">
				<option value="missingLocation" <c:out value="${cri.searchType=='missingLocation'?'selected':''}"/>>
					실종위치
				</option>
				<option value="writer" <c:out value="${cri.searchType=='writer'?'selected':''}"/>>
					작성자
				</option>
				<option value="feature" <c:out value="${cri.searchType=='feature'?'selected':''}"/>>
					특징
				</option>
			</select>
			<input type="text" name="keyword" value="${cri.keyword}">
			<input type="submit" value="SEARCH">
			<span>total: ${pm.totalCount}</span>
		</form>	
	</div>
	<div class="divMissingwrap">
		<div id="missingTitle">
			<h1>우리 강아지를 찾습니다</h1>
			<p>여러분의 도움이 있다면 사라진 우리의 강아지를 찾을 수 있어요!</p>
		</div>
		<input type="button" id="btnInsert" value="게시물작성">
		<div class="divMissingList">
		
		<c:forEach items="${list}" var="vo">
		
			<div class="missingbox">
				 <span class="reportNo">&nbsp; Missing No. <a href="read?reportNo=${vo.reportNo}">${vo.reportNo}</a></span>
				<div class="blur"> </div>
				
				<c:if test="${vo.dogImage!=null && vo.dogImage!=''}">
					<img src="/display?fileName=${vo.dogImage}" width=100 height=80>
				</c:if>
				<c:if test="${vo.dogImage==null || vo.dogImage==''}">
					<img src="http://placehold.it/100x80" width=100>
				</c:if>
				
				<div class="missingtxt">
					<div>&nbsp;&nbsp;<b>작성자</b> : ${vo.writer}</div>
					<div>&nbsp;&nbsp;<b>실종일자 </b>: ${vo.missingTime}</div>
					<div>&nbsp;&nbsp;<b>실종위치 </b>: ${vo.missingLocation}</div>
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
	//페이징
	$("#pagination a").on("click",function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		var searchType=$(frm.searchType).val();
		var keyword=$(frm.keyword).val();
		location.href="/missing/list?page="+page+"&searchType="+searchType+"&keyword="+keyword;
	});
	
	//글쓰러가기 버튼
	$("#btnInsert").on("click",function(){
		location.href="/missing/insert";
	});
</script>
</html>