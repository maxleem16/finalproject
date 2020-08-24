<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pagination part</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>

ul {
   text-align:center;
}
ul li {
   display:inline;
   vertical-align:middle;
}
ul li a {
   display:-moz-inline-stack;   /*FF2*/
   margin-right:3px;
   padding:10px 15px 10px 15px;
   width:30px ;
   height:15px;
   font-weight:700;
   color:#000;
   border:1px solid #c8c8c8;
   border-radius:100%;
   text-align:center;
   text-decoration:none;

}
ul li a.now {
   color:#fff;
   background-color:#F2BB13;
   border:1px solid #F2BB13;
}
ul li a:hover, ul li a:focus {
   color:#fff;
   border:1px solid #F2BB13;
   background-color:#F2BB13;
}
</style>
</head>
<body>
	<ul class="pagination">
         <c:if test="${pm.prev}">
            <li><a href="${pm.startPage-1}"> <span>«</span></a></li>
         </c:if>
         <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
            <c:if test="${pm.cri.page == i }">
               <li class="active"><a href="${i}">${i}</a></li>
            </c:if>
            <c:if test="${pm.cri.page != i }">
               <li class="page"><a href="${i}">${i}</a></li>
            </c:if>
         </c:forEach>
         <c:if test="${pm.next}">
            <li><a href="${pm.endPage+1}"> <span>»</span></a></li>
         </c:if>
      </ul>
</body>
<script>
$("#pagination a").click(function(e){
	e.preventDefault();
	var page=$(this).attr("href");
	location.href="list?page="+page;
});
</script>
</html>