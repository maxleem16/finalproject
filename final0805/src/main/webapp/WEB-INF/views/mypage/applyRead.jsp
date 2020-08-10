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
	<form name="frm" action="counselReserve" method="post">
	<input type="hidden" name="applicationNo" value="${applicationNo}">
		<input type="hidden" name="applicant" value="${vo.applicant}">
		<input type="hidden" name="dogCode" value="${vo.dogCode}"> <input
			type="hidden" name="species" value="${vo.species}"> <input
			type="hidden" name="name" value="${vo.name}">
	</form>
	<table>
		<tr>
			<th>신청인</th>
			<td>${vo.name}</td>
			<th>신청일자</th>
			<td><fmt:formatDate value="${vo.appliedDate}"
					pattern="yyyy년 MM월 dd일" /></td>
		</tr>
		
		<tr>
			<th>상담견종</th>
			<td>${vo.species}[${vo.dogCode}]</td>
			<th>나이</th>
			<td>${vo.age}살</td>
		</tr>
		<tr>
			<th>성별</th>
			<td><c:if test="${vo.gender == 0}">
				남아
			</c:if> <c:if test="${vo.gender == 1}">
				여아
			</c:if></td>
			<th>특징</th>
			<td>${vo.feature}</td>
		</tr>
		<tr>
			<th>접종여부</th>
			<td><c:if test="${vo.inoculationStatus == 0}">
				O
			</c:if> <c:if test="${vo.inoculationStatus == 1}">
				X
			</c:if></td>
			<th>중성화여부</th>
			<td><c:if test="${vo.neutralizationStatus == 0}">
				O
			</c:if> <c:if test="${vo.neutralizationStatus == 1}">
				X
			</c:if></td>
		</tr>
	</table>

	<div>
		<div>
			1. 현재 반려동물을 키우고 계시나요?
			<c:if test="${vo.q1=='Y'}">예</c:if>
			<c:if test="${vo.q1=='N'}">아니오</c:if>
		</div>
		<hr>
		<div>
			2. 입양 후 빠를 시일 내에 동물 등록을 하신 후 저희에게 인증하실 것을 동의하십니까?
			<c:if test="${vo.q2=='Y'}">예</c:if>
			<c:if test="${vo.q2=='N'}">아니오</c:if>
		</div>
		<hr>
		<div>
			3. 거주하고 계신 주택 형태에 표시해 주세요
			<c:choose>
				<c:when test="${vo.q3 eq '주택'}">
			       단독주택
			    </c:when>
				<c:when test="${vo.q3 eq '아파트'}">
			       아파트
			    </c:when>
				<c:when test="${vo.q3 eq '빌라'}">
			       빌라
			    </c:when>
				<c:otherwise>
			        ${vo.q3 }
			    </c:otherwise>
			</c:choose>
		</div>
		<hr>
		<div>
			4. 가족들은 입양에 대해서 모두 찬성합니까?
			<c:if test="${vo.q4=='Y'}">예</c:if>
			<c:if test="${vo.q4=='N'}">아니오</c:if>
		</div>
		<hr>
		<div>5. 입양을 원하시는 이유는 무엇인가요? ${vo.q5 }</div>
		<hr>
		<div>6. 입양받을 아이가 평소 집에 혼자있을 예상시간은 어떻게되나요? ${vo.q6 }</div>
		<hr>
		<div>7. 저희 단체에서 귀하의 가정을 방문하는 것에 대해서는 어떻게 생각하시나요? ${fvo.q7 }</div>
		<hr>
		<div>
			8. 만약 댁에서 새로운 아기가 출생할 경우 입양된 동물을 계속 키우실 수 있겠습니까?
			<c:if test="${vo.q4=='Y'}">예</c:if>
			<c:if test="${vo.q4=='N'}">아니오</c:if>
		</div>
		<hr>
		<div>
			9. 적어도 하루에 한 번 이상은 산책을 시켜주실 수 있나요?
			<c:if test="${vo.q4=='Y'}">예</c:if>
			<c:if test="${vo.q4=='N'}">아니오</c:if>
		</div>
		<hr>
		<div>10. 귀하와 가족의 부재시(여행,명절,휴가 등) 반려동물을 어떻게 관리하실 예정이신가요? ${vo.q10 }</div>
	</div>
	<button id="btnCancle">입양취소</button>
	<button id="btnCounsel">상담예약</button>
	<jsp:include page="../footer.jsp"/>
</body>
<script>
	var appconfirm = "${vo.applicationConfirm}";
	var id="${vo.applicant}";
	var cancleCheck=1;
	var applicationNo="${applicationNo}";

	$("#btnCounsel").click(function() {
		if (appconfirm == "1") {
			$(frm).submit();
		} else {
			alert("신청서가 승인되지 않았습니다.");
		}
	});

	$("#btnCancle").click(function() {
		if (!confirm("입양 신청을 취소하시겠습니까?"))
			return;
		$.ajax({
			type : "post",
			url : "/mypage/applyCancle",
			data : {
				"applicationNo" : applicationNo,
				"cancleCheck" : cancleCheck
			},
			success : function() {
				location.href="/mypage/applyList?id="+id;
			}
		});
	});
</script>
</html>