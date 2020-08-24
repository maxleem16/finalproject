<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG MYPAGE</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
#tbl {
	border-collapse:collapse;
	width:1000px;
	margin:auto;
	border:1px solid #e3e4e6;
}

#tbl .title {
	background:#ebecee;
	height:60px;
	
}

#tbl .row {
	height:50px;
	text-align:center;
}

.btnRead {background:#0069d9;outline:none;border:none; cursor:pointer;
		border-radius:20px; padding:5px 10px 5px 10px; color:white;}
</style>
</head>
<body>
   <jsp:include page="../menu3.jsp"/>
      <div class="menuBox">
		<jsp:include page="../menuTop.jsp"/>
		<div class="mplistWrap">
		<div class="MPtext">입양 신청 내역</div>
			
			<table id="tbl" border=1>
				<tr class="title">
					<th>신청번호</th>
					<th>사진</th>
					<th>강아지품종</th>
					<th>신청날짜</th>
					<th>승인상태</th>
					<th>상세내역</th>
				</tr>
				<c:forEach items="${list}" var="vo">
				<c:if test="${vo.cancleCheck eq 0}">
				<tr class="row">
					<td style="text-align:center; font-size:17px;">${vo.applicationNo}</td>
					<td><c:if test="${vo.dogImage == null}">
							<img src="http://placehold.it/150x150">
						</c:if> <c:if test="${vo.dogImage != null}">
							<img src="/display?fileName=${vo.dogImage}" width=150 height=150>
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
		</div>
	</div>
	<jsp:include page="../myPageFooter.jsp"/>
</body>
<script>
	$("#tbl").on("click", "tr .btnRead", function() {
		var applicationNo = $(this).attr("ano");
		location.href = "applyRead?applicationNo=" + applicationNo;
	});
</script>
</html>