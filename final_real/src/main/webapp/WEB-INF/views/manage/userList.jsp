<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<title>유저목록</title>
	<style>
		.title{background:skyblue;text-align:center;font-weight:bold;color:white;}
		.info{text-align:center;}
	</style>
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
</head>
<body>
	<div id="divMenu"><jsp:include page="../menu.jsp"/></div>
	<h1>[유저 목록]</h1>
	<div>
		<form name="frm" action="userList">
			<input type="hidden" name="searchType" value="position">
			<select name="keyword" onchange="this.form.submit()">
				<option value=""
					<c:out value="${cri.keyword==''?'selected':''}"/>>모든회원
				</option>
				<option value="0"
					<c:out value="${cri.keyword=='0'?'selected':''}"/>>일반회원
				</option>
				<option value="1"
					<c:out value="${cri.keyword=='1'?'selected':''}"/>>관리자
				</option>
				<option value="2"
					<c:out value="${cri.keyword=='2'?'selected':''}"/>>블랙리스트
				</option>
			</select>
		</form>
	</div>
	[회원: <span>${pm.totalCount}</span>명]
	<table border=1 id="tbl">
		<tr class=title>
			<td width=200>ID</td>
			<td width=200>이름</td>
			<td width=100>상태</td>
			<td width=50>Info</td>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr class="row">
			<td class="id">${vo.id}</td>
			<td>${vo.name}</td>
			<td>
				<c:if test="${vo.position==0}">일반회원</c:if>
				<c:if test="${vo.position==1}">관리자</c:if>
				<c:if test="${vo.position==2}">블랙리스트</c:if>
			</td>
			<td class="info"><input type="button" class="btnInfo" value="ℹ️"></td>
		</tr>
		</c:forEach>
	</table>
	<div id="pagination">
      <c:if test="${pm.prev}">
         <a href="${pm.startPage-1}">◀</a>
      </c:if>
      <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
         <c:if test="${pm.cri.page == i }">
                [<a href="${i}" class='active' style="color:red;">${i}</a>]
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
	//

	//btnInfo버튼 눌렀을때 userRead페이지로 이동
	$("#tbl").on("click",".row .btnInfo",function(){
		var id=$(this).parent().parent().find(".id").html();
		location.href="/manage/userRead?id="+id;	
	});
	
	//페이징
	$("#pagination a").on("click",function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		var searchType=$(frm.searchType).val();
		var keyword=$(frm.keyword).val();
		location.href="/manage/userList?page="+page+"&searchType="+searchType+"&keyword="+keyword;
	});
</script>
</html>