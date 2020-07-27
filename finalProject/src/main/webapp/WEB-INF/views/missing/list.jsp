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
	<jsp:include page="../menu.jsp"/>
	<h1>[실종신고 목록]</h1>
	<div>
		<form name="frm" action="list">
			<select name="searchType">
				<option value="missingLocation" <c:out value="${cri.searchType=='missingLocation'?'selected':''}"/>>실종위치</option>
				<option value="writer" <c:out value="${cri.searchType=='writer'?'selected':''}"/>>작성자</option>
				<option value="feature" <c:out value="${cri.searchType=='feature'?'selected':''}"/>>특징</option>
			</select>
			<input type="text" name="keyword" value="${cri.keyword}">
			<input type="submit" value="검색">
		</form>	
	</div>
	[게시글 수: <span>${pm.totalCount}</span>건]
	<input type="button" id="btnInsert" value="글쓰러가기">
	<%-- <table border=1>
		<tr>
			<td>No</td>
			<td>Image</td>
			<td>작성자</td>
			<td>제목</td>
			<td>특징</td>
			<td>작성날짜</td>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr>
			<td>				
				<a href="read?reportNo=${vo.reportNo}">${vo.reportNo}</a>
			</td>
			<td>
				<c:if test="${vo.dogImage!=null && vo.dogImage!=''}">
					<img src="/display?fileName=${vo.dogImage}" width=100 height=80>
				</c:if>
				<c:if test="${vo.dogImage==null || vo.dogImage==''}">
					<img src="http://placehold.it/100x80" width=100>
				</c:if>
			</td>
			<td>${vo.writer}</td>
			<td>${vo.title}</td>
			<td>${vo.feature}</td>
			<td>${vo.preperationTime}</td>
		</tr>
		</c:forEach>
	</table> --%>
	<c:forEach items="${list}" var="vo">
		<div class="box">
			<div class="reportNo"><a href="read?reportNo=${vo.reportNo}">${vo.reportNo}</a></div>
			<c:if test="${vo.dogImage!=null && vo.dogImage!=''}">
				<img src="/display?fileName=${vo.dogImage}" width=100 height=80>
			</c:if>
			<c:if test="${vo.dogImage==null || vo.dogImage==''}">
				<img src="http://placehold.it/100x80" width=100>
			</c:if>
			<div>작성자 : ${vo.writer}</div>
			<div>실종일자 : ${vo.missingTime}</div>
			<div>작성일자 : <fmt:formatDate value="${vo.preperationTime}" pattern="yyyy-MM-dd" /></div>
			<div>실종위치 : ${vo.missingLocation}</div>
		</div>
	</c:forEach>
	
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