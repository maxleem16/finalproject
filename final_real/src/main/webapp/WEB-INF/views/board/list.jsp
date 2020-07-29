<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		a{text-decoration:none;}
		.active{color:red;}

	</style>
</head>
<body>
	<div id="divMenu">
      <jsp:include page="../menu.jsp" />
    </div>
    <div id="divListImg">
    </div>
     <div class="divWrap"></div>
     <div id="listSearch">
      <form action="list" name="frm" id="listfrm" enctype="multipart/form-data">
         <input type="hidden" name="page" value="${cri.page}"> 
         <input type="hidden" name="postingNo"> 
         <select name="searchType">
            <option value="postTitle"
               <c:out value="${cri.searchType=='postTitle'?'selected':''}"/>>제목</option>
            <option value="writer"
               <c:out value="${cri.searchType=='writer'?'selected':''}"/>>작성자</option>
            <option value="postContent"
               <c:out value="${cri.searchType=='postContent'?'selected':''}"/>>내용</option>
         </select> 
         <input type="text" name="keyword" value="${cri.keyword}"> 
         <input type="submit" value="검색">
         검색수: <span>${pm.totalCount}</span>
      </form>
   </div>
	<h1>[게시판 목록]</h1>
	<input id="btnInsert" value="게시물작성 " type="button"></input>
	<input type="hidden" id="page" value="${cri.page}">
	<div class="divBoardList">
      <c:forEach items="${list}" var="vo">
         <div class="row">
            <span class="postingNo">${vo.postingNo}</span>
            
            <div class="divBoardBox">
               <c:if test="${vo.image!=null && vo.image!=''}">
					<img src="/display?fileName=${vo.image}" width=100>
			   </c:if>
			   <c:if test="${vo.image==null || vo.image==''}">
					<img src="http://placehold.it/100x80" width=100>
			   </c:if>
               <div class="divBoardTxt">
                  <p>${vo.writer}</p>
                  <p>${vo.postContent}</p>
				  <p>작성일자<fmt:formatDate value="${vo.preperationTime}" pattern="yyyy-MM-dd"/></p>
               </div>
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

	$(".divBoardList").on("click", ".row", function(){
		var postingNo=$(this).find(".postingNo").html();
		var page=$("#page").val();
		location.href="read?postingNo="+postingNo+"&page="+page;
	});
	
	$("#pagination a").click(function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		location.href="list?page="+page;
	});
</script>
</html>