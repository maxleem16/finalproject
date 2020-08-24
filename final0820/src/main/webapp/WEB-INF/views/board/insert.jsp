<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
	<title>DDOGDOG BOARD INSERT</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/style2.css">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		#tblBinsert {
			margin: auto;
			border-collapse: collapse;
		}
	</style>
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp"/>
	</div>
	<div id="divListImg">
		<jsp:include page="../box.jsp"/>	<!-- 광고 이미지 -->
	</div>
	<div id="boardH1"><h1>자유게시판 작성</h1></div>
	<form name="frm" action="insert" method="post" 
	enctype="multipart/form-data" class="frmBinsert">
		<input type="hidden" value="${id}" name="writer">
		<table border=1 id="tblBinsert">
			<tr>
				<td class="title">제목</td>
				<td class="content"><input type="text" name="postTitle" size=50></td>
			</tr>
			<tr>
				<td colspan=2 class="Bcontent">
					<textarea rows="10" cols="120" name="postContent"></textarea>
				</td>
			</tr>
			<tr>
				<td width=100  class="title">대표이미지</td>
				<td width=400><input type="file" name="file"> 
					<img id="image" src="http://placehold.it/150x120" width=150>
				</td>
			</tr>

		</table>
		<div class="btnBinsert">
			<input type="submit" value="저장" class="MIsubmit">
			<input type="reset" value="취소" class="MIreset">
			<input type="button" value="목록" id="btnList">
		</div>
	</form><hr>
	<jsp:include page="../footer.jsp"/>
</body>
<script>

	
	$("#image").on("click", function(){
		$(frm.file).click();
	});
	
	$(frm.file).on("change", function(){
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});

	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("저장하시겠습니까?"))return;
		frm.submit();
	});
	
	$("#btnList").on("click", function(){
		location.href="list";
	});
</script>
</html>