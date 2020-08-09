<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style4manage.css">
</head>
<body>
<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="management">
		
	<form name="frm" action="dogUpdate" method="post" enctype="multipart/form-data">
		<input type="hidden" name="dogCode" value="${vo.dogCode}">
		<table>
			<tr>
				<td>품종</td>
				<td><input type="text" name="species" value="${vo.species}"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" value="${vo.age}"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>남아<input type="radio" name="gender" value="0"
				<c:if test="${vo.gender eq '0'}">checked="checked"</c:if>> 여아<input
					type="radio" name="gender" value="1"
				<c:if test="${vo.gender eq '1'}">checked="checked"</c:if>></td>
			</tr>
			<tr>
				<td>사이즈</td>
				<td>소형견<input type="radio" name="size" value="A"
				<c:if test="${vo.size eq 'A'}">checked="checked"</c:if>> 
				중형견<input
					type="radio" name="size" value="B"
				<c:if test="${vo.size eq 'B'}">checked="checked"</c:if>>
					대형견<input
					type="radio" name="size" value="C"
				<c:if test="${vo.size eq 'C'}">checked="checked"</c:if>>
					</td>
			</tr>
			<tr>
				<td>모색</td>
				<td><input type="text" name="color" value="${vo.color}"></td>
			</tr>
			<tr>
				<td>접종여부</td>
				<td>O<input type="radio" name="inoculationStatus" value="0"
				<c:if test="${vo.inoculationStatus eq '0'}">checked="checked"</c:if>>
					X<input type="radio" name="inoculationStatus" value="1"
				<c:if test="${vo.inoculationStatus eq '1'}">checked="checked"</c:if>></td>
			</tr>
			<tr>
				<td>중성화여부</td>
				<td>O<input type="radio" name="neutralizationStatus" value="0"
				<c:if test="${vo.neutralizationStatus eq '0'}">checked="checked"</c:if>>
					X<input type="radio" name="neutralizationStatus" value="1"
				<c:if test="${vo.neutralizationStatus eq '1'}">checked="checked"</c:if>></td>
			</tr>
			<tr>
				<td>입양여부</td>
				<td>O<input type="radio" name="adoptStatus" value="1"
				<c:if test="${vo.adoptStatus eq '1'}">checked="checked"</c:if>>
					X<input type="radio" name="adoptStatus" value="0"
				<c:if test="${vo.adoptStatus eq '0'}">checked="checked"</c:if>></td>
			</tr>
			<tr>
				<td>특징</td>
				<td><input type="text" name="feature" value="${vo.feature}"></td>
			</tr>
			<tr>
				<td>대표이미지</td>
				<td><c:if test="${vo.dogImage!=null && vo.dogImage!=''}">
						<img src="${vo.dogImage}" id="image" width=150>
					</c:if> <c:if test="${vo.dogImage==null || vo.dogImage==''}">
						<img src="http://placehold.it/150x120" id="image" width=150>
					</c:if> <input type="file" name="file" /> <input type="hidden"
					value="${vo.dogImage }" name="dogImage"></td>
			</tr>
			<tr>
				<td rowspan=2>상세정보</td>
				<td rowspan=2><textarea name="information">
				</textarea> <input type="file" name="files"
					accept="image/" multiple="multiple">
					<div id="listFile">
						<c:forEach items="${list}" var="img">
							<img src="/display?fileName=${img}" width=150>
						</c:forEach>
					</div></td>
			</tr>
		</table>
		<input type="submit" value="등록"> <input type="reset"
			value="취소"> <input type="button" value="목록"
			onclick="location.href='list'">
	</form>
		</div>
		
	</div>
	
</body>
<script>	
	
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("수정하시겠습니까?")) return;
		frm.submit();
	});
	
	$("#image").click(function() {
		$(frm.file).click();
	});
	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
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
		$('#listFile').html(html);
	});
</script>
</html>