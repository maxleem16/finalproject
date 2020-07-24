<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>DDOGDOG LIST</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>

</style>
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp"/>
	</div>
	<div id="divListImg">
		<img src="/resources/img/list_ad.jpg">		<!-- 광고 이미지 -->
	</div>
	<div id="listSearch">
		<form name="frm" action="list" id="listfrm">
			<input type="hidden" name="searchType" value="species">
			<input type="text" name="keyword" value="${cri.keyword}" placeholder="  가족이 될 강아지를 찾아보세요!">
			&nbsp;&nbsp;&nbsp;
			<input type="submit" value="SEARCH">
			&nbsp;&nbsp;&nbsp;
			<span style="color:#5a5a5a;">total:  ${pm.totalCount}</span>
		</form>
		<div>
			
		</div>
	</div>
	<div id="divDogList">
		<c:forEach items="${list}" var="vo">
			<div class="divListbox">
				<c:if test="${vo.dogImage == null}">
					<img src="http://placehold.it/300x250">
				</c:if>
				<c:if test="${vo.dogImage != null}">
					<img src="/display?fileName=${vo.dogImage}" width=300 height=250>
				</c:if><br><br>
				&nbsp;&nbsp;&nbsp;# ${vo.species} 
				# ${vo.age}살
				<div class="divDogRead" code="${vo.dogCode}">만나보기</div>
			</div>
		</c:forEach>
	</div>
	<br><br>
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
	<jsp:include page="../footer.jsp"/>
</body>
<script>
	
	$(".divDogRead").click(function(){
		var dogCode=$(this).attr("code");
		alert(dogCode);
		location.href="read?dogCode="+dogCode;
	});
	
	var searchType=$(frm.searchType).val();
	var keyword=$(frm.keyword).val();
	
	$("#pagination a").on("click", function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "list?page="+page +"&searchType="+searchType+"&keyword="+keyword;
	});
	
	$("#divDogRead").on("click", function(){
		alert(",,,,");
	});
</script>
</html>