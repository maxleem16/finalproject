<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	width: 900px;
}

html, body {
	display: inline-block;
}

#Rimage {
	width: 900px;
}

#btnImage {
	position: absolute;
	top: 810px;
	left: 83.5%;
	background: #ebecee;
	width: 80px;
	border: none;
	outline: none;
	height: 30px;
	border-radius: 20px;
}
</style>
<title>게시글 읽기</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" href="/resources/css/style2.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp" />
	</div>
	<div id="divListImg">
		<jsp:include page="../box.jsp" />
		<!-- 광고 이미지 -->
	</div>
	<div class="missingWrap">
		<form name="frm" action="update" method="post" 	enctype="multipart/form-data">
			<input type="hidden" id="page" value="${cri.page}"> 
			<input type="hidden" name="foundNo" value="${vo.foundNo}">
			<div class="missingRtitle1">
				📌 [제보]<input type="text" name="title" value="${vo.foundLocation}에서 발견한 강아지를 제보합니다.">
			</div>
			<hr style="opacity: 0.5;">
			<div class="missingRidWrap">
				<span class="missingRid"> 
				<input type="hidden" name="foundNo" value="${vo.foundNo}"> 글쓴이: 
				<input type="text" name="writer" value="${vo.writer}" size=6 readonly>
				</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span class="missingRdate">
					작성 날짜: <fmt:formatDate value="${vo.preperationTime}" pattern="yyyy-MM-dd"/></span>
			</div>
			<hr style="opacity: 0.5;">
			<table border=1 id="tblMissingRead">
				<tr>
					<c:if test="${id == vo.writer}">
						<td class="missingRtitle">발견날짜</td>
						<td class="missingRcontent" style="width:600px;"><input type="date" name="foundTime"
							value="${vo.foundTime}"></td>
					</c:if>
					<c:if test="${id != vo.writer}">
						<td class="missingRtitle">발견날짜</td>
						<td class="missingRcontent"><input type="date" name="foundTime"
							value="${vo.foundTime}" readonly></td>
					</c:if>
				
					<c:if test="${id == vo.writer}">
						<td class="missingRtitle">발견위치</td>
						<td class="missingRcontent"><input type="text"
							name="foundLocation" size=50 value="${vo.foundLocation}"></td>
					</c:if>
					<c:if test="${id != vo.writer}">
						<td class="missingRtitle">발견위치</td>
						<td class="missingRcontent"><input type="text"
							name="foundLocation" size=50 value="${vo.foundLocation}" readonly></td>
					</c:if>
				</tr>
				<tr>
					<td class="missingRtitle">보호여부</td>
					<td class="missingRcontent"><input type="radio" name="protection"
						value=0 <c:out value="${vo.protection=='0'?'checked':''}"/>>보호중&nbsp;&nbsp;
						<input type="radio" name="protection" value=1
						<c:out value="${vo.protection=='1'?'checked':''}"/>>미보호중&nbsp;&nbsp;
					</td>
					<td class="missingRtitle">작성자</td>
					<td class="missingRcontent">${vo.writer}</td>
				</tr>
				</table>
					
				
				<div class="missingRwrap2">
					<div class="missingRimage">
					<input type="file" name="file">
						<c:if test="${vo.dogImage!=null && vo.dogImage!=''}">
							<img src="/display?fileName=${vo.dogImage}" width=150 id="Rimage">
						</c:if> <c:if test="${vo.dogImage==null || vo.dogImage==''}">
							<img src="http://placehold.it/100x80" width=150 id="Rimage">
						</c:if> 
						<input type="hidden" name="dogImage" value="${vo.dogImage}">
						<input type="button" value="upload" id="btnImage">
					</div>
					<div class="missingRwrap3">
						<div class="missingRfeature">
							<textarea cols=50 rows=5 name="feature">${vo.feature}</textarea>
						</div>
					<div class="missingRimage2">
						<input type="file" name="files" accept="image/*" multiple>
						<div id="listFile">
							<c:forEach items="${list}" var="dogImage">
								<img src="/display?fileName=${dogImage}">
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
				<div class="btnMwrap">
				<c:if test="${id == vo.writer}">
					<input type="submit" value="저장" id="btnMsubmit"> 
					<input type="reset" value="취소" id="btnMreset"> 
					<input type="button" value="삭제" id="btnDelete">
				</c:if>
					<input type="button" value="목록" id="btnList"> 
				</div>
			
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
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

	$("#Rimage").on("click", function() {
		$(frm.file).click();
	});

	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0];
		$("#Rimage").attr("src", URL.createObjectURL(file));
	});
</script>
</html>