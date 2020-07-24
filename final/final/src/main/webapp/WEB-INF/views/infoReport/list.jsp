<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>제보목록</title>
<style>
	.box{padding: 10px; background: gray; width: 500px; margin: auto;}
</style>
</head>
<body>
	<h1>[제보목록]</h1>
	전체글수:${pm.totalCount}
	<form name="frm" action="list">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="bno">
		<select name="searchType">
			<option value="foundLocation" <c:out value="${cri.searchType=='foundLocation'?'selected':''}"/>>발견지역</option>
			<option value="writer" <c:out value="${cri.searchType=='writer'?'selected':''}"/>>작성자</option>
			<option value="feature" <c:out value="${cri.searchType=='feature'?'selected':''}"/>>내용</option>
		</select>
		<input type="text" name="keyword" value="${cri.keyword}"/>
		<input type="submit" value="검색">
	</form>
	<div>
		<input id="btnInsert" value="게시물작성 " type="button"></input>
		<c:forEach items="${list}" var="vo">
			<div class="box">
				<div class="foundNo">${vo.foundNo}</div>
				<c:if test="${vo.dogImage!=null && vo.dogImage!=''}">
					<img src="/display?fileName=${vo.dogImage}" width=100>
				</c:if>
				<c:if test="${vo.dogImage==null || vo.dogImage==''}">
					<img src="http://placehold.it/100x80" width=100>
				</c:if>
				<div>${vo.writer}</div>
				<div><fmt:formatDate value="${vo.foundTime}" pattern="yyyy-MM-dd"/></div>
				<div>작성일자<fmt:formatDate value="${vo.preperationTime}" pattern="yyyy-MM-dd"/></div>
				<div>${vo.foundLocation}</div>
			</div>
		</c:forEach>
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
</body>
<script>
	$("#btnInsert").on("click",function(){
		location.href="insert";
	});

	$("#pagination a").click(function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		location.href="list?page="+page;
	});
	
	$(".foundNo").on("click",function(){
		var foundNo=$(this).html();
		location.href="read?foundNo="+foundNo;
	});
</script>
</html>