<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DDOGDOG BoardRead</title>
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
	<h1>게시판 글읽기</h1>
	<form name="frm1" action="list">
		<input type="hidden" name="page" value="${cri.page}"> <input
			type="hidden" name="searchType" value="${cri.searchType}"> <input
			type="hidden" name="keyword" value="${cri.keyword}">
	</form>
	<form name="frm" action="update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${cri.page}"> <input
			type="hidden" name="searchType" value="${cri.searchType}"> <input
			type="hidden" name="keyword" value="${cri.keyword}"> <input
			type="hidden" name="postingNo" value="${vo.postingNo}">
		<table class="tbl" border=1 width=500>
			<tr>
				<th width=100>사진</th>
				<td width=400><input type="file" name="file"> 
					<c:if test="${vo.image==null || vo.image==''}">
					<img src="http://placehold.it/150x120" id="image" width=150>
				</c:if>
				<c:if test="${vo.image!=null && vo.image!=''}">
					<img src="/display?fileName=${vo.image}" id="image" width=150>
				</c:if>
				<input type="hidden" name="image" value="${vo.image}">
				</td>
			</tr>
			<tr>
				<td width=100>제목</td>
				<td><input type="text" value="${vo.postTitle}" name="postTitle"></td>
			</tr>
			<tr>
				<td width=100>내용</td>
				<td><textarea rows="10" cols="52" name="postContent">${vo.postContent}</textarea></td>
			</tr>
			<tr>
				<td width=100><input type="button" value="추가이미지" id="btnImage">
				</td>
				<td width=400 height=150><input type="file" name="files"
					accept="image/*" multiple>
					<div id="listFile">
					<c:forEach items="${list}" var="image">
						<img src="/display?fileName=${image}">
					</c:forEach>
					</div>
					</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" size=10
					value="${vo.writer}"></td>
			</tr>
		</table>
		<input type="submit" value="수정"> <input type="reset"
			value="취소"> <input type="button" value="삭제" id="btnDelete">
		<input type="button" value="목록" id="btnList">
	</form>
		<jsp:include page="../reply/reply.jsp"></jsp:include>
	<jsp:include page="../footer.jsp" />
</body>
<script>
	$("#btnList").on("click", function() {
		location.href="/board/list";
	});

	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("수정하시겠습니까?"))
			return;
		frm.submit();
	});

	$("#btnDelete").on("click", function() {
		if (!confirm("삭제하시겠습니까?")) return;
		
var postingNo=$("#postingNo").val();
		$.ajax({
			type:"get",
			url:"/replyCount",
			data:{"postingNo":postingNo},
			dataType:"json",
			success:function(data){
				if(data==0){
					frm.action="delete";
					frm.submit();
				}else{
					alert(data+"의 댓글이 남았습니다.");
				}
			}
		});	
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