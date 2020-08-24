<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
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
	text-align: center;
}

#tbl .row {
	height:50px;
	text-align:center;
}

</style>
<title>유저목록</title>
</head>
<body>
	  <jsp:include page="../menu3.jsp"/>
      <div class="menuBox">
		<jsp:include page="../menuTop.jsp"/>
		<div class="mplistWrap">
		<div class="MPtext">상담 예약 내역</div>
			<table id="tbl">
				<tr class="title">
					<td class="subject">예약날짜</td>
					<td class="subject">유기견정보</td>
					<td class="subject">상담시간</td>
					<td class="subject">취소여부</td>
					<td class="subject">취소하기</td>
				</tr>
				<c:forEach items="${list}" var="vo">
					<tr class="row">
						<td class="contents date"><fmt:parseDate var="counselingDate"
								value="${vo.counselingDate }" pattern="yyyy-MM-dd" /> <fmt:formatDate
								value="${counselingDate }" pattern="yyyy년 MM월 dd일" /></td>
						<td class="contents dog">${vo.dogCode }
						</td>
						<td class="contents time"><c:if
								test="${vo.counselingTime < 12 && vo.counselingTime >= 9}">
					 오전 ${vo.counselingTime }시
					</c:if> <c:if test="${vo.counselingTime >= 12 || vo.counselingTime < 6}">
					 오후 ${vo.counselingTime }시
					</c:if></td>
						<td class="contents cancle"><fmt:parseDate var="nowDate"
								value="${now}" pattern="yyyy-MM-dd" /> <c:choose>
								<c:when test="${vo.cancleCheck == 0}">
									<c:if test="${counselingDate >= nowDate}">
							상담예정
							</c:if>
									<c:if test="${counselingDate < nowDate }">
						 		상담완료
							</c:if>
								</c:when>
								<c:when test="${vo.cancleCheck == 1}">
							예약취소
						</c:when>
							</c:choose></td>
						<td class="reserveNo" no="${vo.reserveNo}"><input type="button" class="btnCancle" value="취소"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:include page="../myPageFooter.jsp"/>
</body>
<script>
	var id=${id};
	$(".pagination a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "counselingList?page=" + page;
	});
	
	$("#tbl").on("click",".row .btnCancle",function(){
		if(!confirm("취소하시면 상담재예약이 불가합니다. 그래도 취소하시겠습니까?")) return;
		var reserveNo=$(this).parent().parent().find(".reserveNo").attr("no");
		$.ajax({
			type : "post",
			url : "/mypage/counselCancle",
			data : {
				"reserveNo" : reserveNo
			},
			success : function() {
				alert("취소되었습니다.")
				location.href="counselingList?id="+id;
			}
		});
	})

</script>
</html>