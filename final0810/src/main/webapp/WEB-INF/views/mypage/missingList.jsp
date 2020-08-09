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
   <div id="divMenu">
      <jsp:include page="../menu.jsp"/>
   </div>
   <div id="divListImg">
      <img src="/resources/img/list_ad.jpg">      <!-- 광고 이미지 -->
   </div>
   <jsp:include page="../menu3.jsp"/>
   <h1>[실종신고 목록]</h1>
   <input type="button" id="btnInsert" value="글쓰기">
   <c:forEach items="${list}" var="vo">
   <div class="divMissingList">
      <div class="box">
         <div class="reportNo">${vo.reportNo}</div>
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
      var id=${id};
      var page=$(this).attr("href");
      location.href="missingList?id="+id+"&page="+page;
   });
   
   //글쓰러가기 버튼
   $("#btnInsert").on("click",function(){
      location.href="/missing/insert";
   });
   
   $(".divMissingList").on("click",".box",function(){
      var reportNo=$(this).find(".reportNo").html();
      var page=$("#page").val();
      location.href="/missing/read?reportNo="+reportNo;
   });
</script>
</html>