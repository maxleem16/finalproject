<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adopt insert</title>
</head>
<body>
	<h1>adopt insert</h1>
	<form name="frm" action="insert" method="post">
		<table border=1>
			<tr>
				<td colspan=2><img src="${vo.dogImage}" width=100 height=100></td>
			</tr>
			<tr>
				<th>입양 신청자</th>
				<td><input type="text" value="" name="applicant"></td>
			</tr>
			<tr>
				<th>강아지 코드</th>
				<td><input type="text" value="${vo.dogCode}" name="dogCode"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td>1. 현재 반려동물을 키우고 계시나요?</td>
				<td>예<input type="radio" name="q1" value="Y"> 아니오<input type="radio" name="q1" value="N"></td>
			</tr>
			<tr>
				<td>2. 입양 후 빠를 시일 내에 동물 등록을 하신 후 저희에게 인증하실 것을 동의하십니까?</td>
				<td>예<input type="radio" name="q2" value="Y"> 아니오<input type="radio" name="q2" value="Y"></td>
			</tr>
			<tr>
				<td>3. 거주하고 계신 주택 형태에 표시해 주세요</td>
				<td>단독주택 <input type="radio" name="q3" value="주택"> 아파트<input type="radio" name="q3" value="아파트"> 
				빌라<input type="radio" name="q3" value="빌라" >
					원룸<input type="radio" name="q3" value="원룸"> 기타<input type="radio" name="q3" value="기타"><input
					type="text" name="q3ect"></td>
			</tr>
			<tr>
				<td>4. 가족들은 입양에 대해서 모두 찬성합니까?</td>
				<td>예<input type="radio" name="q4" value="Y"> 아니오<input type="radio" name="q4" value="N"></td>
			</tr>
			<tr>
				<td>5. 입양을 원하시는 이유는 무엇인가요?</td>
				<td><input type="text" name="q5"></td>
			</tr>
			<tr>
				<td>6. 입양받을 아이가 평소 집에 혼자있을 예상시간은 어떻게되나요?</td>
				<td><input type="text" name="q6"></td>
			</tr>
			<tr>
				<td>7. 저희 단체에서 귀하의 가정을 방문하는 것에 대해서는 어떻게 생각하시나요?</td>
				<td><input type="text" name="q7"></td>
			</tr>
			<tr>
				<td>8. 만약 댁에서 새로운 아기가 출생할 경우 입양된 동물을 계속 키우실 수 있겠습니까?</td>
				<td>예<input type="radio"  name="q8" value="Y"> 아니오<input type="radio" name="q8" value="N"></td>
			</tr>
			<tr>
				<td>9. 적어도 하루에 한 번 이상은 산책을 시켜주실 수 있나요?</td>
				<td>예<input type="radio"  name="q9" value="Y"> 아니오<input type="radio"  name="q9" value="N"></td>
			</tr>
			<tr>
				<td>10. 귀하와 가족의 부재시(여행,명절,휴가 등) 반려동물을 어떻게 관리하실 예정이신가요?</td>
				<td><input type="text" name="q10"></td>
			</tr>
		</table>
		<input type="submit" value="등록">
		<input type="button" value="임시저장">
		<input type="reset"
			value="취소"> <input type="button" value="목록"
			onClick="location.href='/dog/list'">
	</form>
</body>
<script>
	$(frm_form).submit(function() {
		if (!confirm("입양 신청 하시겠습니까?")) return;
		var q3=$('input[name="q3"]:checked').val();
		if(q3=="기타"){
			var q3ect=$(frm.q3ect).val();
			$('input[name="q3"]:checked').val(q3ect);
		}
		frm.submit();
		frm_form.submit();
	});
</script>
</html>