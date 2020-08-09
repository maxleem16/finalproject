<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
   <h1>입양 신청내역</h1>
   취소건수:<span>${count}</span>
   <table id="tbl" border=1 width=825>
      <tr>
         <th width=75>신청번호</th>
         <th width=150>사진</th>
         <th width=150>강아지품종</th>
         <th width=150>신청날짜</th>
         <th width=100>승인상태</th>
         <th width=100>상세내역</th>
         <th width=100>State</th>
      </tr>
      <c:forEach items="${list}" var="vo">
      <tr>
         <td>${vo.applicationNo}</td>
         <td>
            <c:if test="${vo.dogImage == null}">
               <img src="http://placehold.it/150x150">
            </c:if>
            <c:if test="${vo.dogImage != null}">
               <img src="${vo.dogImage}" width=150 height=150>
            </c:if>
         </td>
         <td>${vo.species}[${vo.dogCode}]</td>
         <td><fmt:formatDate value="${vo.appliedDate}" pattern="yyyy년 MM월 dd일" /></td>
         <td>
            <c:if test="${vo.applicationConfirm == 0}">승인 대기중</c:if>
            <c:if test="${vo.applicationConfirm == 1}">승인 완료</c:if>
            <c:if test="${vo.applicationConfirm == 2}">승인 거부</c:if>
         </td>
         <td style="text-align:center;">
            <button class="btnRead" ano="${vo.applicationNo}">상세내역</button>
         </td>
         <td>
            <c:if test="${vo.cancleCheck== 0}"><b style="color:blue;">진행중..</b></c:if>
            <c:if test="${vo.cancleCheck== 1}"><b style="color:red;">취소</b></c:if>
         </td>
      </tr>
      </c:forEach>
   </table>
</body>
<script>
   $("#tbl").on("click", "tr .btnRead", function() {
      var applicationNo = $(this).attr("ano");
      location.href = "/mypage/applyRead?applicationNo=" + applicationNo;
   });
</script>
</html>