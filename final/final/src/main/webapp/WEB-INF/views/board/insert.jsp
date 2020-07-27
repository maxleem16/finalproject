<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시글 읽기</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<h1>[게시글 읽기]</h1>
	<form name="frm" action="insert" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${id}" name="writer">
		<table border=1>
			<tr>
				<td>Title</td>
				<td><input type="text" name="postTitle" size=50></td>
			</tr>
			<tr>
				<td colspan=2>
					<textarea rows="10" cols="80" name="postContent"></textarea>
				</td>
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
	</form><hr>
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
		if(!confirm("저장하시겠습니까?"))return;
		frm.submit();
	});
	
	$("#btnList").on("click", function(){
		location.href="list";
	});
</script>
</html>