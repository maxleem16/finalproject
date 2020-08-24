<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<title>DDOGDOG INFO REPORT INSERT</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style2.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<style>
      #tblRinsert {
			margin: auto;
			border-collapse: collapse;
		}
  </style>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp" />
	</div>
	<div id="divListImg">
		<jsp:include page="../box.jsp"/>	<!-- 광고 이미지 -->
	</div>
	<div id="reportH1"><h1>제보 게시물 작성</h1></div>
	<form name="frm" action="insert" method="post"
		enctype="multipart/form-data" class="frmRinsert">
		<input type="hidden" name="writer" value="user01">
		<table border=1 id="tblRinsert">
			<tr>
				<td class="title">발견시간</td>
				<td class="content"><input type="date" name="foundTime"></td>
			</tr>
			<tr>
				<td class="title">발견위치</td>
				<td class="content"><input type="text" name="foundLocation" size=50></td>
			</tr>
			<tr>
				<td  class="title">보호여부</td>
				<td class="Rcontent">
					<input type="radio" name="protection" value=0 <c:out value="${vo.protection=='0'?'checked':''}"/>>&nbsp;보호중&nbsp;&nbsp;
					<input type="radio" name="protection" value=1 <c:out value="${vo.protection=='1'?'checked':''}"/>>&nbsp;미보호중&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td class="title">특징</td>
				<td class="content"><input type="text" name="feature" size=50></td>
			</tr>
			<tr>
				<td class="title">대표이미지</td>
				<td ><input type="file" name="file"> 
				<img id="image" src="http://placehold.it/150x120" width=150></td>
			</tr>
			<tr>
				<td width=100 class="title">
					추가 이미지
				</td>
				<td width=400 height=150>
					<input type="button" value="추가 이미지 등록" id="btnRImage">
					<input type="file" name="files" accept="image/*" multiple>
					<div id="listFile"></div>
				</td>
			</tr>
		</table>
		<div class="btnRinsert">
			<input type="submit" value="저장" id="btnRsubmit">
			<input type="reset" value="취소" id="btnRreset">
			<input type="button" value="목록" id="btnList">
		</div>
	</form>
	<jsp:include page="../footer.jsp"/>
</body>
<script>

	$(frm.files).on("change", function(){
		var files=$(frm.files)[0].files;
		var html="";
		$.each(files, function(index, file){
			html += "<img src=" + URL.createObjectURL(file) + ">";
			$("#listFile").html(html);
		});
	});
	
	$("#btnRImage").on("click", function(){
		$(frm.files).click();
	});
	
	$("#image").on("click", function(){
		$(frm.file).click();
	});
	
	$(frm.file).on("change", function(){
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
	
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("저장하시겠습니까?")) return;
		frm.submit();
	});

	$("#btnList").on("click", function(){
		location.href="list";
	});

</script>
</html>