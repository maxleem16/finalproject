<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG MYPAGE</title>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
</head>
<body>
	<jsp:include page="../menu3.jsp"/>
  	<div class="menuBox">
		<jsp:include page="../menuTop.jsp"/>
		<div id="crWrap">
			<input type="hidden" id="applicationNo" value="${vo.applicationNo}">
			<table>
				<tr>
					<th>강아지</th>
					<td id="${vo.dogCode}">${vo.species}[${vo.dogCode}]</td>
					<th>신청인</th>
					<td id="${vo.applicant}">${vo.name}[${vo.applicant}]</td>
				</tr>
			</table>
			<hr>
			<div>
				<input type="date" id="counselingDate"> 
				<select id="counselingTime">
					<option value="10">10시</option>
					<option value="11">11시</option>
					<option value="12">12시</option>
					<option value="1">1시</option>
					<option value="2">2시</option>
					<option value="3">3시</option>
					<option value="4">4시</option>
				</select>
			</div>
			<span><button id="btnReserve">예약</button></span>
		</div>
	</div>
	<jsp:include page="../myPageFooter.jsp"/>
</body>
<script>
	$("#btnReserve").on("click",function(){
		var dogCode=$("td:nth-child(2)").attr("id");
		var applicant=$("td:nth-child(4)").attr("id");
		var date=$("#counselingDate").val();
		var time=$("#counselingTime option:selected").val();
		var no=$("#applicationNo").val();
		var id="${id}";
		$.ajax({
			type:"post",
			url:"/mypage/counselInsert",
			data:{"applicationNo":no,
				"dogCode":dogCode, "applicant":applicant,
				"counselingDate":date, "counselingTime":time},
			success:function(){
				alert("예약이 완료되었습니다.");
				location.href="/mypage/applyList?id="+id;
			}
		});
	});
</script>
</html>