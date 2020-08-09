<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG read page</title>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<script src="https://kit.fontawesome.com/2594a0d020.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
</head>
<style>
#divReadPage {
	margin:0 0 0 0;
	width:100%;
	height:1000px;
	background-image:url('/resources/img/read_back.jpg');
	background-size: 100% 100%;
	padding-top:100px;
}
</style>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp" />
	</div>
	<div id="divListImg">
		<jsp:include page="../box.jsp"/>		<!-- 광고 이미지 -->
	</div>
	<div id="divReadPage">
		<div id="divReadPageIn">
			<div id="divReadPageSpan">
				<div id="divReadPageSpanIn">
					<div id="divReadAge" style="color:">${vo.species} ${vo.age}살</div>
					<div id="dogCode">${vo.dogCode}</div>
					<div id="divReadPageSpanInfo">
						<p><b>나는 이런 강아지에요</b></p>
						${vo.information}
					</div>
				</div>
				<div id="divReadImg">
					<img src="${vo.dogImage }">
				</div>
				<table id="tblDogInfo" border=1>
					<tr class="tblDogInfoTr">
						<th><i class="fas fa-dog"></i>   견종</th>
						<td>${vo.species }</td>
						<th><i class="fas fa-mars-double"></i>  성별</th>
						<td>
						<c:if test="${vo.gender == 0}">
                 			 남아
						</c:if> 
						<c:if test="${vo.gender == 1}">
						   여아
						</c:if>
						</td>
					</tr>
					<tr class="tblDogInfoTr">
						<th><i class="fas fa-paw"></i>   나이</th>
						<td>${vo.age }살</td>
						<th><i class="fas fa-stethoscope"></i>  중성화</th>
						<td><c:if test="${vo.neutralizationStatus == 0}">
                     O
                  </c:if> <c:if test="${vo.neutralizationStatus == 1}">
                     X
                  </c:if></td>
					</tr>
					<tr class="tblDogInfoTr">
						<th><i class="fas fa-bone"></i>   특징</th>
						<td>${vo.feature }</td>
						<th><i class="fas fa-plus-square"></i>  접종</th>
						<td><c:if test="${vo.inoculationStatus == 0}">
                     O
                  </c:if> <c:if test="${vo.inoculationStatus == 1}">
                     X
                  </c:if></td>
					</tr>
				</table>
				<div id="divReadBtn">
					<button id="btnReadAdopt">입양신청</button>
					<button id="btnBackList" onClick="location.href='list'">돌아가기</button>
					<button id="btnDogUpdate" style="float: right;">관리자수정</button>
				</div>
			</div>
			
		</div>
		
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
<script>
	$("#btnReadAdopt").on("click", function() {
		var dogCode = $("#dogCode").html();
		alert(dogCode);
		location.href = "/adopt/insert?dogCode=" + dogCode;
	});
	
	$("#btnDogUpdate").on("click", function() {
		dogCode = $("#dogCode").html();
		alert(dogCode);
		location.href = "/dog/update?dogCode=" + dogCode;
	});
</script>
</html>