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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<style>
body {
	-ms-overflow-style: none;
}

::-webkit-scrollbar {
	display: none;
}

#image {
	width: 50px;
	height: 50px;
	float: left;
	margin-left: 10px;
}

#subject {
	width: 400px;
	height: 50px;
	margin: auto;
	font-weight: bold;
	padding: 10px;
	text-align: center;
	font-size: 24px;
}

#information {
	border:none;
	margin: auto;
	border-collapse: collapse;
}

.title {
	background: gray;
	color: white;
	text-align: center;
	font-weight: bold;
}

#applicationForm {
	margin: 20px auto;
	margin-left: 10px;
	margin-right: 10px;
}

.subject {
	float: left;
	font-size: 12px;
	font-weight: bold;
	margin-left: 5px;
}

.content {
	margin: auto;
	margin-bottom:10px;
	text-align: center;
	height: 20px;
	font-size: 13px;
}

#buttons {
	padding-bottom: 20px;
	text-align: center;
}

#wholePage {
	
}
</style>
</head>
<body>
	<div id="wholePage">
		<div id="image">
			<img src="/resources/img/logo.png" width="50" height="50">
		</div>
		<div id="subject">똑독 입양 신청서-${vo.applicationNo}</div>
		<div id="management">
			<table id="information" border=1>
				<tr class="title">
					<th colspan=4>INFORMATION</th>
				</tr>
				<tr>
					<td colspan=2 width=280><span class="subject"> 신청인 </span><br>
						<div class="content">${vo.name}</div></td>
					<td colspan=2 width=280><span class="subject"> 유기견 </span><br>
						<div class="content">${vo.species}[${vo.dogCode}]</div></td>
				</tr>
				<tr>
					<td colspan=2><span class="subject"> 연락처 </span><br>
						<div class="content">${vo.tel}</div></td>
					<td colspan=2><span class="subject"> 신청일자 </span><br>
						<div class="content">
							<fmt:formatDate value="${vo.appliedDate}" pattern="yyyy년 MM월 dd일" />
						</div></td>
				</tr>
				<tr>
					<td colspan=4><span class="subject"> 주소 </span><br>
						<div class="content">${vo.address}</div></td>
				</tr>
			</table>
			<div id="applicationForm">
				<div class="title">FORM</div>
				<div>
					<span class="subject">1. 현재 반려동물을 키우고 계시나요?</span><br>
					<div class="content">
						예<input type="checkbox" disabled
							<c:if test="${fvo.q1 eq 'Y'}">checked="checked"</c:if>>
						아니오<input type="checkbox" disabled
							<c:if test="${fvo.q1 eq 'N'}">checked="checked"</c:if>>
					</div>
				</div>
				<hr>
				<div>
					<span class="subject">2. 입양 후 빠를 시일 내에 동물 등록을 하신 후 저희에게 인증하실
						것을 동의하십니까?</span><br>
					<div class="content">
						예<input type="checkbox" disabled
							<c:if test="${fvo.q2 eq 'Y'}">checked="checked"</c:if>>
						아니오<input type="checkbox" disabled
							<c:if test="${fvo.q2 eq 'N'}">checked="checked"</c:if>>
					</div>
				</div>
				<hr>
				<div>
					<span class="subject">3. 거주하고 계신 주택 형태에 표시해 주세요</span><br>
					<div class="content">
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
				</div>
				<hr>
				<div>
					<span class="subject">4. 가족들은 입양에 대해서 모두 찬성합니까?</span><br>
					<div class="content">
						예<input type="checkbox" disabled
							<c:if test="${fvo.q4 eq 'Y'}">checked="checked"</c:if>>
						아니오<input type="checkbox" disabled
							<c:if test="${fvo.q4 eq 'N'}">checked="checked"</c:if>>
					</div>
				</div>
				<hr>
				<div>
					<span class="subject">5. 입양을 원하시는 이유는 무엇인가요?</span><br>
					<div class="content">${fvo.q5 }</div>
				</div>
				<hr>
				<div>
					<span class="subject">6. 입양받을 아이가 평소 집에 혼자있을 예상시간은 어떻게되나요?</span><br>
					<div class="content">${fvo.q6 }</div>
				</div>
				<hr>
				<div>
					<span class="subject">7. 저희 단체에서 귀하의 가정을 방문하는 것에 대해서는 어떻게
						생각하시나요?</span><br>
					<div class="content">${fvo.q7 }</div>
				</div>
				<hr>
				<div>
					<span class="subject">8. 만약 댁에서 새로운 아기가 출생할 경우 입양된 동물을 계속
						키우실 수 있겠습니까?</span><br>
					<div class="content">
						예<input type="checkbox" disabled
							<c:if test="${fvo.q8 eq 'Y'}">checked="checked"</c:if>>
						아니오<input type="checkbox" disabled
							<c:if test="${fvo.q8 eq 'N'}">checked="checked"</c:if>>
					</div>
				</div>
				<hr>
				<div>
					<span class="subject">9. 적어도 하루에 한 번 이상은 산책을 시켜주실 수 있나요?</span><br>
					<div class="content">
						예<input type="checkbox" disabled
							<c:if test="${fvo.q9 eq 'Y'}">checked="checked"</c:if>>
						아니오<input type="checkbox" disabled
							<c:if test="${fvo.q9 eq 'N'}">checked="checked"</c:if>>
					</div>
				</div>
				<hr>
				<div>
					<span class="subject">10. 귀하와 가족의 부재시(여행,명절,휴가 등) 반려동물을 어떻게
						관리하실 예정이신가요?</span><br>
					<div class="content">${fvo.q10 }</div>
				</div>
			</div>
			<div id="buttons">
				<button id="btnConfirm" class="btn btn-primary" value="1">승인</button>
				<button id="btnCancle" class="btn btn-secondary" value="2">거부</button>
			</div>
		</div>
	</div>

</body>
<script>
	var applicationNo = ${vo.applicationNo};

	$("#btnConfirm.btn.btn-primary").click(function() {
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
		Close_Event();
		window.close()
	});

	$("#btnCancle.btn.btn-secondary").click(function() {
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
		Close_Event();
		window.close()
	});

	function Close_Event() {
		opener.document.location.reload();

	}
</script>
</html>