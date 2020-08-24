<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" href="/resources/css/style.css">
<title>신고글 정보</title>
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
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<jsp:include page="../menu3.jsp" />
	<div class="menuBox">
		<jsp:include page="../menuTop.jsp" />
		<div class="mplistWrap">
			<div class="MPtext2">실종 게시물 읽기</div>
			<form name="frm" action="update" method="post"
				enctype="multipart/form-data">
				<table border=1 id="readUD">
					<tr>
						<td class="readtitle">제목</td>
						<td class="readcontent" colspan=3><input type="text" name="title"
							value="${read.title}"></td>
					</tr>
					<tr>
						<td class="readtitle">실종날짜</td>
						<td class="readcontent"><input type="date" name="missingTime"
							value="${read.missingTime}"></td>
						<td class="readtitle">실종위치</td>
						<td class="readcontent"><input type="text" name="missingLocation"
							value="${read.missingLocation}"></td>
					</tr>
					<tr>
						<td class="readtitle">사례금</td>
						<td class="readcontent"><input type="number" name="reward"
							value="${read.reward}"></td>
						<td class="readtitle">전화번호</td>
						<td class="readcontent"><input type="text" name="tel"
							value="${read.tel}"></td>
					</tr>
					<tr>
						<td class="readtitle">특징</td>
						<td class="readcontent" colspan=3><textarea cols=50 rows=5 name="feature">${read.feature}</textarea></td>
					</tr>
					<tr>
						<td class="readtitle">대표이미지</td>
						<td class="readcontent" colspan=3>
							<input type="file" name="file"> 
							<c:if test="${read.dogImage!=null && read.dogImage!=''}">
								<img src="/display?fileName=${read.dogImage}" width=150
									height=120 id="image">
							</c:if> 
							<c:if test="${read.dogImage==null || read.dogImage==''}">
								<img src="http://placehold.it/150x120" width=150 id="image">
							</c:if> <input type="hidden" name="dogImage" value="${read.dogImage}">
						</td>
					</tr>
					<tr>
						<td class="readtitle">
							<input type="button" value="추가이미지" id="btnImage"
							 style="border:none;outline:none; font-weight:700;"></td>
						<td  class="readcontent" colspan=3>
							<input type="file" name="files" accept="image/*" multiple>
							<div id="listFile">
								<c:forEach items="${list}" var="dogImage">
									<img src="/display?fileName=${dogImage}">
								</c:forEach>
							</div></td>
					</tr>
				</table>
				<div class="btnread">
					<input type="submit" value="수정"> 
					<input type="reset" value="취소"> 
					<input type="button" value="삭제" id="btnDelete">
					<input type="button" value="목록" id="btnList">
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../myPageFooter.jsp" />
</body>
<script>
	//수정버튼(유효성 검사)
	$(frm).submit(
			function(e) {
				e.preventDefault();
				var title = $(frm.title).val();
				var missingTime = $(frm.missingTime).val();
				var missingLocation = $(frm.missingLocation).val();
				var reward = $(frm.reward).val();
				var tel = $(frm.tel).val();
				var writer = $(frm.writer).val();
				var feature = $(frm.feature).val();
				if (!confirm("수정하시겠습니까?"))
					return;
				if (title == "" || missingTime == "" || missingLocation == ""
						|| reward == "" || tel == "" || writer == ""
						|| feature == "") {
					alert("모든정보를 입력하세요!");
					return;
				} else {
					alert("수정되었습니다!");
					frm.submit();
				}
			});

	//상품이미지 버튼
	$("#btnImage").on("click", function() {
		$(frm.files).click();
	});

	//삭제버튼
	$("#btnDelete").on("click", function() {
		if (!confirm("삭제하시겠습니까?"))
			return;
		frm.action = "delete";
		frm.submit();
		alert("삭제되었습니다!");
	});

	//목록버튼
	$("#btnList").on("click", function() {
		location.href = "/missing/list";
	});

	//이미지 눌렀을때
	$("#image").on("click", function() { //이미지클릭할때 file클릭한거처럼 됨
		$(frm.file).click();
	});

	//파일업로드(여러개)
	$(frm.files).on("change", function() {
		var files = $(frm.files)[0].files;
		var html = "";
		$.each(files, function(index, file) {
			html += "<img src='" + URL.createObjectURL(file) + "'>";
		});
		$("#listFile").html(html);
	});

	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0]; //1번째 input type="file"에서 이미지 1개만
		$("#image").attr("src", URL.createObjectURL(file));
	});
</script>
</html>