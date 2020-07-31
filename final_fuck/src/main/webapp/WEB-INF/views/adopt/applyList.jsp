<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG ADMIN PAGE</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
   <div id="divMenu">
      <jsp:include page="../menu.jsp"/>
   </div>
   <h1>입양 신청 목록(관리자용)</h1>
   <table id="tbl" border=1>
   <tr>
      <th>신청번호</th>
      <th>신청한 유저</th>
      <th>신청 강아지 코드</th>
      <th>신청확인</th>
      <th>상세내역</th>
   </tr>
   <c:forEach items="${list}" var="vo">
   <tr>
      <td>${vo.applicationNo}</td>
      <td>${vo.applicant}</td>
      <td>${vo.dogCode}</td>
      <td>
         <c:if test="${vo.applicationConfirm == 0}">
            승인 대기중
         </c:if> 
         <c:if test="${vo.applicationConfirm == 1}">
            승인 완료
         </c:if>
          <c:if test="${vo.applicationConfirm == 2}">
            승인 거부
         </c:if>
      </td>
      <td>
      	<button class="btnRead" ano="${vo.applicationNo}">상세내역</button>
      </td>
   </tr>
   </c:forEach>
   </table>
   <div id="pagination">
      <c:if test="${pm.prev}">
         <a href="${pm.startPage-1}">◀</a>
      </c:if>
      <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
         <c:if test="${cri.page==i}">
            <a href="${i}" class="active">[${i}]</a>
         </c:if>
         <c:if test="${cri.page!=i}">
            <a href="${i}">[${i}]</a>
         </c:if>
      </c:forEach>
      <c:if test="${pm.next}">
         <a href="${pm.endPage+1}">▶</a>
      </c:if>
   </div>
</body>
<script>
	
	$("#tbl").on("click","tr .btnRead",function(){
		var applicationNo=$(this).attr("ano");
		location.href="read?applicationNo="+applicationNo;
	});
	
   $("#pagination").on("click", "a", function(e){
      e.preventDefault();
      var page=$(this).attr("href");
      location.href="applyList?page="+ page;
   });
</script>
</html>