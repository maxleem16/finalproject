<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 읽기</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="/resources/css/style.css">
<style>
	.UDtitle {
		height:50px;
	}
</style>
</head>
<body>
	<jsp:include page="../menu3.jsp" />
	<div class="menuBox">
		<jsp:include page="../menuTop.jsp" />
		<div class="mplistWrap">
			<div class="MPtext2">게시물 읽기</div>
			<form name="frm" action="update" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="page" value="${cri.page}"> <input
					type="hidden" name="postingNo" value="${vo.postingNo}">
				<table border=1 id="readUD">
					<tr>
						<c:if test="${id == vo.writer}">
							<td class="readtitle">글제목</td>
							<td class="readcontent"><input type="text" name="postTitle"
								value="${vo.postTitle}"></td>
						</c:if>
						<c:if test="${id != vo.writer}">
							<td class="readtitle">글 제목</td>
							<td class="readcontent"><input type="text" name="postTitle"
								value="${vo.postTitle}" readonly></td>
						</c:if>
					</tr>
					<tr>
						<td class="readtitle">글쓴이</td>
						<td class="readcontent">${vo.writer}</td>
					</tr>
					<tr>
						<td class="readtitle">글 작성 날짜</td>
						<td class="readcontent">${vo.preperationTime}</td>
					</tr>
					<tr>
						<c:if test="${id == vo.writer}">
							<td class="readtitle">글 내용</td>
							<td class="readcontent">
								<textarea rows="4" cols="100" name="postContent">${vo.postContent}
								</textarea>
							</td>
						</c:if>
						<c:if test="${id != vo.writer}">
							<td class="readtitle">글 내용</td>
							<td class="readcontent">
								<textarea rows="4" cols="100" name="postContent" readonly>${vo.postContent}
								</textarea>
							</td>
						</c:if>
					</tr>
					<tr>
						<td class="readtitle">대표이미지</td>
						<td class="readcontent">
							<input type="file" name="file">
							<c:if test="${vo.image!=null && vo.image!=''}">
								<img src="/display?fileName=${vo.image}" width=70 height=70 id="image">
							</c:if> 
							<c:if test="${vo.image==null || vo.image==''}">
								<img src="http://placehold.it/100x80" width=70 id="image">
							</c:if> 
							<input type="hidden" name="image" value="${vo.image}">
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
	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("수정하시겠습니까?"))
			return;
		frm.submit();
		alert("수정완료!");
	});

	$("#btnDelete").on("click", function() {
		if (!confirm("삭제하시겠습니까?"))
			return;
		var postingNo = "${vo.postingNo}";

		$.ajax({
			type : "get",
			url : "/board/replyCount",
			data : {
				"postingNo" : postingNo
			},
			success : function(data) {
				if (data == 0) {
					frm.action = "delete";
					frm.submit();
					alert("삭제완료!");
				} else {
					alert("리플이" + data + "개 달려있어서 삭제 불가능");
				}
			}
		});
	});

	$("#btnList").on("click", function() {
		var page = $
		{
			cri.page
		}
		;
		location.href = "list?page=" + page;
	});
</script>
</html>