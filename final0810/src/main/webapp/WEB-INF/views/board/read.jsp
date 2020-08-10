<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시글 읽기</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>

	<h1>[게시글 읽기]</h1>
	<form name="frm" action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="postingNo" value="${vo.postingNo}">
		<table border=1>
			<tr>
				<c:if test="${id == vo.writer}">
					<td>Title</td>
					<td><input type="text" name="postTitle" value="${vo.postTitle}"></td>
				</c:if>	
				<c:if test="${id != vo.writer}">
					<td>Title</td>
					<td><input type="text" name="postTitle" value="${vo.postTitle}" readonly></td>
				</c:if>	
			</tr>
			<tr>
				<td>Writer</td>
				<td>${vo.writer}</td>
			</tr>
			<tr>
				<td>Date</td>
				<td>${vo.preperationTime}</td>
			</tr>
			<tr>
				<c:if test="${id == vo.writer}">
					<td colspan=2>
						<textarea rows="10" cols="80" name="postContent">${vo.postContent}</textarea>
					</td>
				</c:if>		
				<c:if test="${id != vo.writer}">
					<td colspan=2>
						<textarea rows="10" cols="80" name="postContent" readonly>${vo.postContent}</textarea>
					</td>
				</c:if>	
			</tr>
			<tr>
				<th width=100>대표이미지</th>
				<td width=400>
					<input type="file" name="file">
					<c:if test="${vo.image!=null && vo.image!=''}">
						<img src="/display?fileName=${vo.image}" width=150 id="image">
					</c:if>
					<c:if test="${vo.image==null || vo.image==''}">
						<img src="http://placehold.it/100x80" width=150 id="image">
					</c:if>
					<input type="hidden" name="image" value="${vo.image}">
				</td>
			</tr>

		</table>
		<c:if test="${id == vo.writer}">
			<input type="submit" value="수정">
			<input type="reset" value="취소">
			<input type="button" value="삭제" id="btnDelete">
			<input type="button" value="목록" id="btnList">
		</c:if>
		<c:if test="${id != vo.writer}">
			<input type="button" value="목록" id="btnList">
		</c:if>
	</form><hr>
	<jsp:include page="../reply/reply.jsp"></jsp:include>
</body>
<script>
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("수정하시겠습니까?"))return;
		frm.submit();
		alert("수정완료!");
	});
	
	$("#btnDelete").on("click", function(){
		if(!confirm("삭제하시겠습니까?"))return;
		var postingNo="${vo.postingNo}";
		
		$.ajax({
			type:"get",
			url:"/board/replyCount",
			data:{"postingNo":postingNo},
			success:function(data){
				if(data==0){
					frm.action="delete";
					frm.submit();
					alert("삭제완료!");
				}else{
					alert("리플이" + data + "개 달려있어서 삭제 불가능");
				}
			}
		});
	});
	
	$("#btnList").on("click", function(){
		var page=${cri.page};
		location.href="list?page="+page;
	});

</script>
</html>