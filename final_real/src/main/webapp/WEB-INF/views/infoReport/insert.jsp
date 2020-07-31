<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
      input[type=file]{visibility:hidden; height:0px;}
      #listFile img{width:100px;margin-left:15px;}
   </style>
<title>게시글 읽기</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<h1>[제보게시물 작성]</h1>
	<form name="frm" action="insert" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="writer" value="user01">
		<table border=1>
			<tr>
				<td>발견시간</td>
				<td><input type="text" name="foundTime" size=50></td>
			</tr>
			<tr>
				<td>발견위치</td>
				<td><input type="text" name="foundLocation" size=50></td>
			</tr>
			<tr>
				<td>보호여부</td>
				<td>
					<input type="radio" name="protection" value=0 <c:out value="${vo.protection=='0'?'checked':''}"/>>보호중&nbsp;&nbsp;
					<input type="radio" name="protection" value=1 <c:out value="${vo.protection=='1'?'checked':''}"/>>미보호중&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>특징</td>
				<td><input type="text" name="feature" size=50></td>
			</tr>
			<tr>
				<th width=100>대표이미지</th>
				<td width=400><input type="file" name="file"> <img
					id="image" src="http://placehold.it/150x120" width=150></td>
			</tr>
			<tr>
				<th width=100><input type="button" value="추가이미지" id="btnImage">
				</th>
				<td width=400 height=150>
					<input type="file" name="files" accept="image/*" multiple>
					<div id="listFile"></div>
				</td>
			</tr>
		</table>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
		<input type="button" value="목록" id="btnList">
	</form>
	<hr>
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
	
	$("#btnImage").on("click", function(){
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