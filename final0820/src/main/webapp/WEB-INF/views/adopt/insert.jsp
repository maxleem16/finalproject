<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<title>adopt insert</title>
<style>
.divRwrap {
	position: relative;
	height: 2000px;
}

body {
	background-image: url('/resources/img/adoptBack.jpg');
	background-size: cover;
}

img {
	border: 0;
	padding: 0;
	width: 100%;
}

#daum {
	margin-top: -125px;
}

#tblQ input[type='text'] {
	outline: none;
	border: 1px solid #BCAC99;
}

textarea{
	resize: none;
	border: none;
	padding:5px;
}
</style>
</head>
<body>
	<div class="divRwrap">
		<div id="divMenu">
			<jsp:include page="../menu.jsp" />
		</div>
		<div id="divAdopt">
			<div id="adoptH1">
				<h2>강아지 정보</h2>
			</div>
			<form name="frm" action="insert" method="post">
				<input type="hidden" value="${vo.dogCode}" name="dogCode">
				<div id="divAdoptPet">
					<div id="adoptImg">
						<img src="/display?fileName=${vo.dogImage}">
					</div>
					<div id="adopt2">${vo.species} ${vo.age}살</div>
					<div id="adopt3">
						<input type="text" value="${vo.information}">
					</div>
					<div id="adopt4">
						<input type="text" value="${id}" name="applicant"
							placeholder="입양 신청 아이디">
					</div>
				</div>
				<table id="tblQ">
					<tr>
						<th>1. 현재 반려동물을 키우고 계시나요?</th>
					</tr>
					<tr>
						<td>예<input type="radio" name="q1" value="Y"> 아니오<input
							type="radio" name="q1" value="N">
						</td>
					</tr>
					<tr>
						<th>2. 입양 후 빠를 시일 내에 동물 등록을 하신 후 저희에게 인증하실 것을 동의하십니까?</th>
					</tr>
					<tr>
						<td>예<input type="radio" name="q2" value="Y"> 아니오<input
							type="radio" name="q2" value="N">
						</td>
					</tr>
					<tr>
						<th>3. 거주하고 계신 주택 형태에 표시해 주세요</th>
					</tr>
					<tr>
						<td>단독주택아파트<input type="radio" name="q3" value="단독주택">
							아파트<input type="radio" name="q3" value="아파트"> 빌라<input
							type="radio" name="q3" value="빌라"> 원룸<input type="radio"
							name="q3" value="원룸"> 기타<input type="radio" name="q3"
							value="기타"><input type="text" name="q3ect"></td>
					</tr>
					<tr>
						<th>4. 가족들은 입양에 대해서 모두 찬성합니까?</th>
					</tr>
					<tr>
						<td>예<input type="radio" name="q4" value="Y"> 아니오<input
							type="radio" name="q4" value="N"></td>
					</tr>
					<tr>
						<th>5. 입양을 원하시는 이유는 무엇인가요?</th>
					</tr>
					<tr>
						<td><textarea name="q5" cols="70" rows="5"></textarea></td>
					</tr>
					<tr>
						<th>6. 입양받을 아이가 평소 집에 혼자있을 예상시간은 어떻게되나요?</th>
					</tr>
					<tr>
						<td><textarea name="q6" cols="70" rows="5"></textarea></td>
					</tr>
					<tr>
						<th>7. 저희 단체에서 귀하의 가정을 방문하는 것에 대해서는 어떻게 생각하시나요?</th>
					</tr>
					<tr>
						<td><textarea name="q7" cols="70" rows="5"></textarea></td>
					</tr>
					<tr>
						<th>8. 만약 댁에서 새로운 아기가 출생할 경우 입양된 동물을 계속 키우실 수 있겠습니까?</th>
					</tr>
					<tr>
						<td>예<input type="radio" name="q8" value="Y"> 아니오<input
							type="radio" name="q8" value="N"></td>
					</tr>
					<tr>
						<th>9. 적어도 하루에 한 번 이상은 산책을 시켜주실 수 있나요?</th>
					</tr>
					<tr>
						<td>예<input type="radio" name="q9" value="Y"> 아니오<input
							type="radio" name="q9" value="N"></td>
					</tr>
					<tr>
						<th>10. 귀하와 가족의 부재시(여행,명절,휴가 등) 반려동물을 어떻게 관리하실 예정이신가요?</th>
					</tr>
					<tr>
						<td><textarea name="q10" cols="70" rows="5"></textarea></td>
					</tr>
				</table>
				<div id="divAdoptBtn">
					<input type="submit" value="저장" id="divAdoptBtn1"> <input
						type="reset" value="취소" id="divAdoptBtn2"> <input
						type="button" value="목록" id="divAdoptBtn3"
						onClick="location.href='/dog/list'">
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>

<script>
	$(frm).submit(function(e) {
		e.preventDefault();
		var q1 = $(frm.q1).val();
		var q2 = $(frm.q2).val();
		var q3 = $('input[name="q3"]:checked').val();
		if (q3 == "기타") {
			var q3ect = $(frm.q3ect).val();
			$('input[name="q3"]:checked').val(q3ect);
		}
		var q4 = $(frm.q4).val();
		var q5 = $(frm.q5).val();
		var q6 = $(frm.q6).val();
		var q7 = $(frm.q7).val();
		var q8 = $(frm.q8).val();
		var q9 = $(frm.q9).val();
		var q10 = $(frm.q10).val();
		if (q1 == "" || q2 == "" || q3 == "" || q4 == "" || q5 == ""
				|| q6 == "" || q7 == "" || q8 == "" || q9 == ""
				|| q10 == "") {
			alert("모든 질문에 답변해주세요!");
			return;
		} else {
			frm.submit();
		}
	});
</script>
</html>