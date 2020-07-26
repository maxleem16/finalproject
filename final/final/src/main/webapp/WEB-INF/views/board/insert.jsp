<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DDOGDOG BoardInsert</title>
<style>
input[type='file'] {
	visibility: hidden;
	height: 0px;
}

#listFile img {
	width: 150px;
	margin-left: 20px;
}

body, html {
	margin: 0;
	padding: 0;
	height: 100%;
}
</style>
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp" />
	</div>
	<div class="divWrap"></div>
	<h1>게시판 글쓰기</h1>
	<form name="frm" action="insert" method="post" enctype="multipart/form-data">
		<table class="tbl" border=1>
			<tr>
				<td width=100>카테고리</td>
				<td><input type="text" name="category" size=50></td>
			</tr>
			<tr>
				<th width=100>사진</th>
				<td width=400><input type="file" name="file"> 
				<c:if test="${vo.image!=null && vo.image!=''}">
					<img src="/display?fileName=${vo.image}" width=100>
				</c:if> 
				<c:if test="${vo.image==null || vo.image==''}">
					<img src="http://placehold.it/150x120" id="image" width=150>
			  	</c:if>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" size=10></td>
			</tr>
			<tr>
				<td width=100>제목</td>
				<td><input type="text" name="postTitle" size=50></td>
			</tr>
			<tr>
				<td width=100>내용</td>
				<td><textarea rows="10" cols="52" name=postContent></textarea></td>
			</tr>
			<tr>
				<td width=100><input type="button" value="추가이미지" id="btnImage">
				</td>
				<td width=400 height=150><input type="file" name="files"
					accept="image/*" multiple>
					<div id="listFile"></div></td>
			</tr>
		</table>
		<input type="submit" value="저장"> <input type="reset"
			value="취소"> <input type="button" value="목록"
			onClick="location.href='list'">
	</form>
	<jsp:include page="../footer.jsp" />
</body>
<script>
	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("저장하시겠습니까?"))
			return;
		frm.submit();
	});

	$("#btnImage").on("click", function() {
		$(frm.files).click();
	});

	$(frm.files).change(function() {
		var files = $(frm.files)[0].files;
		var html = "";
		$.each(files, function(index, file) {
			html += "<img src='" + URL.createObjectURL(file) + "'>";
		});
		$("#listFile").html(html);
	});

	$("#image").click(function() {
		$(frm.file).click();
	});

	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
</script>
</html>