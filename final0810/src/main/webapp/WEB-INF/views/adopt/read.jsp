<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG DOG ADOPT INFORMATION</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style4manage.css">
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="management">
			<table>
				<tr>
					<th>신청인</th>
					<td>${vo.name}</td>
					<th>상담견종</th>
					<td>${vo.species}[${vo.dogCode}]</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${vo.email}</td>
					<th>신청일자</th>
					<td><fmt:formatDate value="${vo.appliedDate}"
							pattern="yyyy년 MM월 dd일" /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan=3>${vo.address}</td>
				</tr>
			</table>
			<div>
				<div>
					1. 현재 반려동물을 키우고 계시나요?
					<c:if test="${fvo.q1=='Y'}">예</c:if>
					<c:if test="${fvo.q1=='N'}">아니오</c:if>
				</div>
				<hr>
				<div>
					2. 입양 후 빠를 시일 내에 동물 등록을 하신 후 저희에게 인증하실 것을 동의하십니까?
					<c:if test="${fvo.q2=='Y'}">예</c:if>
					<c:if test="${fvo.q2=='N'}">아니오</c:if>
				</div>
				<hr>
				<div>
					3. 거주하고 계신 주택 형태에 표시해 주세요
					<c:choose>
						<c:when test="${fvo.q3 eq '주택'}">
			       단독주택
			    </c:when>
						<c:when test="${fvo.q3 eq '아파트'}">
			       아파트
			    </c:when>
						<c:when test="${fvo.q3 eq '빌라'}">
			       빌라
			    </c:when>
						<c:otherwise>
			        ${fvo.q3 }
			    </c:otherwise>
					</c:choose>
				</div>
				<hr>
				<div>
					4. 가족들은 입양에 대해서 모두 찬성합니까?
					<c:if test="${fvo.q4=='Y'}">예</c:if>
					<c:if test="${fvo.q4=='N'}">아니오</c:if>
				</div>
				<hr>
				<div>5. 입양을 원하시는 이유는 무엇인가요? ${fvo.q5 }</div>
				<hr>
				<div>6. 입양받을 아이가 평소 집에 혼자있을 예상시간은 어떻게되나요? ${fvo.q6 }</div>
				<hr>
				<div>7. 저희 단체에서 귀하의 가정을 방문하는 것에 대해서는 어떻게 생각하시나요? ${fvo.q7 }</div>
				<hr>
				<div>
					8. 만약 댁에서 새로운 아기가 출생할 경우 입양된 동물을 계속 키우실 수 있겠습니까?
					<c:if test="${fvo.q4=='Y'}">예</c:if>
					<c:if test="${fvo.q4=='N'}">아니오</c:if>
				</div>
				<hr>
				<div>
					9. 적어도 하루에 한 번 이상은 산책을 시켜주실 수 있나요?
					<c:if test="${fvo.q4=='Y'}">예</c:if>
					<c:if test="${fvo.q4=='N'}">아니오</c:if>
				</div>
				<hr>
				<div>10. 귀하와 가족의 부재시(여행,명절,휴가 등) 반려동물을 어떻게 관리하실 예정이신가요?
					${fvo.q10 }</div>
			</div>
			<button id="btnConfirm" value="1">승인</button>
			<button id="btnCancle" value="2">거부</button>
		</div>
	</div>

</body>
<script>
	var applicationNo = $
	{
		vo.applicationNo
	};

	$("#btnConfirm").click(function() {
		var applicationConfirm = $(this).val();
		$.ajax({
			type : "post",
			url : "/adopt/confirm",
			data : {
				"applicationNo" : applicationNo,
				"applicationConfirm" : applicationConfirm
			},
			success : function() {
			}
		});
		alert("승인되었습니다.");
		location.href = "applyList";
	});

	$("#btnCancle").click(function() {
		var applicationConfirm = $(this).val();
		$.ajax({
			type : "post",
			url : "/adopt/confirm",
			data : {
				"applicationNo" : applicationNo,
				"applicationConfirm" : applicationConfirm
			},
			success : function() {
			}
		});
		alert("승인거부되었습니다.");
		location.href = "applyList";
	});
</script>
</html>