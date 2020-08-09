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
   <jsp:include page="../menu3.jsp"/>
   <h1>[게시판 목록]</h1>
   <input id="btnInsert" value="글쓰기" type="button"></input>
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
    <jsp:include page="../footer.jsp"/>
</body>
<script>

   $("#btnInsert").on("click",function(){
      location.href="/board/insert";
   });

   $(".divBoardList").on("click", ".row", function(){
      var postingNo=$(this).find(".postingNo").html();
      location.href="/board/read?postingNo="+postingNo;
   });
   
   $("#pagination a").click(function(e){
      e.preventDefault();
      var id=${id};
      var page=$(this).attr("href");
      location.href="/boardList?id="+id+"&page="+page;
   });
</script>
</html>