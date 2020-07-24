<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>[회원가입]</h1>
		<table border=1 width=400>
			<tr>
				<td width=150>아이디</td>
				<td><input type="text" size=16 id="id"> <a href="#" id="btnCheck">[중복확인]</a></td>
			</tr>
			<tr>
				<td width=150>비밀번호</td>
				<td><input type="password" size=16 id="password"></td>
			</tr>
			<tr>
				<td width=150>이름</td>
				<td><input type="text" size=16 id="name"></td>
			</tr>
			<tr>
				<td width=150>생년월일</td>
				<td><input type="text" size=16 id="birthday"></td>
			</tr>
			<tr>
				<td width=150>주소</td>
				<td>
					<form name="form" id="form" method="post">
						<input type="hidden" id="roadAddrPart1" name="roadAddrPart1" /><br>
						<input type="button" onClick="goPopup();" value="주소검색" />
						우편번호: <input type="text" id="zipNo" name="zipNo" />
						<input type="hidden" id="addrDetail" name="addrDetail" /><br>
						 주소: <input type="text" id="roadFullAddr" name="roadFullAddr" /><br> 
						<input type="hidden" id="roadAddrPart2" name="roadAddrPart2" /><br>	
					</form>
				</td>
			</tr>
			<tr>
				<td width=150>전화번호</td>
				<td><input type="text" size=16 id="tel"></td>
			</tr>
			<tr>
				<td width=150>이메일</td>
				<td><input type="text" size=16 id="email"></td>		
			</tr>
		</table>
		<input type="submit" value="가입" id="btnInsert"> 
		<input type="reset" value="취소">
</body>
<script>
	var check = false;

	$("#btnInsert").on("click",function(){
		var id=$("#id").val();
		var password=$("#password").val();
		var name=$("#name").val();
		var birthday=$("#birthday").val();
		var address=$("#address").val();
		var tel=$("#tel").val();
		var email=$("#email").val();
		if (!check) {
			alert("아이디 중복체크를 해주세요.");
		} else {
			$.ajax({
				type:"post",
				url:"/user/insert",
				data:{"id":id,"password":password,"name":name,"birthday":birthday,"address":address,"tel":tel,"email":email,},
				success:function(){
					alert("회원가입이 완료되었습니다.");
				}
			});
		}
	});

	$("#id").change(function() {
		check = false;
	});

	$("#btnCheck").on("click", function(e) {
		var id = $(frm.id).val();
		e.preventDefault();
		$.ajax({
			type : "post",
			url : "/user/login2",
			data : {
				"id" : id
			},
			success : function(data) {
				if (data != 0) {
					alert("이미 존재하는 아이디입니다.");
					$(frm.id).focus();
				} else {
					alert("사용할 수 있는 아이디입니다.");
					check = true;
				}
			}
		});
	});
	
	//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다.
	// (＂팝업 API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "http://localhost:8088";
	function goPopup() {
		//경로는 시스템에 맞게 수정하여 사용 
		//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를
		//호출하게 됩니다.
		var pop = window.open("/user/addressAPI", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/ 
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 
		// 실제 주소검색 URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다. 
		// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
	}
</script>
</html>