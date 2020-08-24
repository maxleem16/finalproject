<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
input[type=file] {
	visibility: hidden;
	height: 0px;
}

#listFile img {
	width: 100px;
	margin-left: 15px;
}
</style>
<title>게시글 읽기</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<jsp:include page="../menu3.jsp" />
	<div class="menuBox">
		<jsp:include page="../menuTop.jsp" />
		<div class="mplistWrap">
			<div class="MPtext2">제보 게시물 읽기</div>
			<form name="frm" action="update" method="post"
				enctype="multipart/form-data">
				<input type="hidden" id="page" value="${cri.page}"> <input
					type="hidden" name="foundNo" value="${vo.foundNo}">
				<table border=1 id="readUD">
					<tr>
						<c:if test="${id == vo.writer}">
							<td class="readtitle">발견시간</td>
							<td class="readcontent"><input type="date" name="foundTime" size=50
								value="${vo.foundTime}"></td>
						</c:if>
						<c:if test="${id != vo.writer}">
							<td class="readtitle">발견시간</td>
							<td class="readcontent"><input type="text" name="foundTime" size=50
								value="${vo.foundTime}" readonly></td>
						</c:if>
					</tr>
					<tr>
						<c:if test="${id == vo.writer}">
							<td class="readtitle">발견위치</td>
							<td class="readcontent"><input type="text" name="foundLocation" size=50
								value="${vo.foundLocation}"></td>
						</c:if>
						<c:if test="${id != vo.writer}">
							<td class="readtitle">발견위치</td>
							<td class="readcontent"><input type="text" name="foundLocation" size=50
								value="${vo.foundLocation}" readonly></td>
						</c:if>
					</tr>
					<tr>
						<td class="readtitle">보호여부</td>
						<td class="readcontent">
						<input type="radio" name="protection"
						value=0 <c:out value="${vo.protection=='0'?'checked':''}"/>>보호중&nbsp;&nbsp;
						<input type="radio" name="protection" value=1
						<c:out value="${vo.protection=='1'?'checked':''}"/>>미보호중&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<c:if test="${id == vo.writer}">
							<td class="readtitle">특징</td>
							<td class="readcontent"><input type="text" name="feature" size=50
								value="${vo.feature}"></td>
						</c:if>
						<c:if test="${id != vo.writer}">
							<td class="readtitle">특징</td>
							<td class="readcontent"><input type="text" name="feature" size=50
								value="${vo.feature}" readonly></td>
						</c:if>
					</tr>
					<tr>
						<th class="readtitle">대표이미지</th>
						<td class="readcontent">
							<input type="file" name="file"> 
							<c:if test="${vo.dogImage!=null && vo.dogImage!=''}">
								<img src="/display?fileName=${vo.dogImage}" width=150 id="image">
							</c:if> <c:if test="${vo.dogImage==null || vo.dogImage==''}">
								<img src="http://placehold.it/100x80" width=150 id="image">
							</c:if> <input type="hidden" name="dogImage" value="${vo.dogImage}">
						</td>
					</tr>
					<tr>
						<td class="readtitle">
							<input type="button" value="추가이미지" id="btnImage"></td>
						<td class="readcontent">
							<input type="file" name="files" accept="image/*" multiple>
							<div id="listFile">
								<c:forEach items="${list}" var="dogImage">
									<img src="/display?fileName=${dogImage}">
								</c:forEach>
							</div>
						</td>
					</tr>
				</table>
				<div class="btnread">
					<c:if test="${id == vo.writer}">
						<input type="submit" value="수정">
						<input type="button" value="삭제" id="btnDelete">
					</c:if>
				</div>
			</form>
		</div>

	</div>
	<jsp:include page="../myPageFooter.jsp" />
</body>
<script>
	$("#btnDelete").on("click", function() {
		if (!confirm("삭제하시겠습니까?"))
			return;
		frm.action = "delete";
		frm.submit();
		alert("삭제완료!");
	});

	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("수정하시겠습니까?"))
			return;
		frm.submit();
		alert("수정완료!");
	});

	$("#btnList").on("click", function() {
		var page = $("#page").val();
		location.href = "list?page=" + page;
	});

	$(frm.files).on("change", function() {
		var files = $(frm.files)[0].files;
		var html = "";
		$.each(files, function(index, file) {
			html += "<img src=" + URL.createObjectURL(file) + ">";
			$("#listFile").html(html);
		});
	});

	$("#btnImage").on("click", function() {
		$(frm.files).click();
	});

	$("#image").on("click", function() {
		$(frm.file).click();
	});

	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
</script>
</html>