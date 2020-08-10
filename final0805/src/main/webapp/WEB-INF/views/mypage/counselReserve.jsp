<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<jsp:include page="../menu3.jsp"/>
	<h1>상담예약,,, ㄱㄱ.... ㅍ</h1>
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
		<br>
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
	<button id="btnReserve">예약</button>
	<jsp:include page="../footer.jsp"/>
</body>
<script>
	$("#btnReserve").on("click",function(){
		var dogCode=$("td:nth-child(2)").attr("id");
		var applicant=$("td:nth-child(4)").attr("id");
		var date=$("#counselingDate").val();
		var time=$("#counselingTime option:selected").val();
		var no=$("#applicationNo").val();
		
		alert(no+dogCode+applicant+date+time);
		$.ajax({
			type:"post",
			url:"/mypage/counselInsert",
			data:{"applicationNo":no,
				"dogCode":dogCode, "applicant":applicant,
				"counselingDate":date, "counselingTime":time},
			success:function(){
				alert("예약성공쓰");
			}
		});
	});
</script>
</html>