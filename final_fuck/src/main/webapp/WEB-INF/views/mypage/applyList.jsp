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
	<h2>그 마이페이지 들어가서 자기가 입양신청한내역보는거</h2>

	<table id="tbl">
		<tr>
			<th>신청번호</th>
			<th>사진</th>
			<th>강아지품종</th>
			<th>신청날짜</th>
			<th>승인상태</th>
			<th>상세내역</th>
		</tr>
		<c:forEach items="${list}" var="vo">
		<c:if test="${vo.cancleCheck eq 0}">
			<tr>
				<td>${vo.applicationNo}</td>
				<td><c:if test="${vo.dogImage == null}">
						<img src="http://placehold.it/150x150">
					</c:if> <c:if test="${vo.dogImage != null}">
						<img src="${vo.dogImage}" width=150 height=150>
					</c:if></td>
				<td>${vo.species}[${vo.dogCode}]</td>
				<td><fmt:formatDate value="${vo.appliedDate}"
						pattern="yyyy년 MM월 dd일" /></td>
				<td><c:if test="${vo.applicationConfirm == 0}">
          		 승인 대기중
       		 	 </c:if> <c:if test="${vo.applicationConfirm == 1}">
           		 승인 완료
         		</c:if> <c:if test="${vo.applicationConfirm == 2}">
          		 승인 거부
        		</c:if></td>
				<td>
					<button class="btnRead" ano="${vo.applicationNo}">상세내역</button>
				</td>
			</tr>
		</c:if>
		</c:forEach>
	</table>
</body>
<script>
	$("#tbl").on("click", "tr .btnRead", function() {
		var applicationNo = $(this).attr("ano");
		location.href = "applyRead?applicationNo=" + applicationNo;
	});
</script>
</html>