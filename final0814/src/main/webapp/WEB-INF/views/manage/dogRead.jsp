<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style4manage.css">
<style>
#dogInsert {
	width: 500px;
	margin: auto;
}

h2 {
	text-align: center;
}

#divDogInsert {
	margin-top: 20px;
	padding: 20px;
	width: 800px;
	margin: auto;
	border-radius: 20px;
	box-shadow: 6px 6px 12px #2E2E2E;
	background-color: rgba(255, 255, 255, 0.2);
}

#divDogInsert td {
	padding: 10px;
}

/*---------------------------------------------*/
button {
	outline: none !important;
	border: none;
	background: transparent;
}

button:hover {
	cursor: pointer;
}

#management {
	margin-top: 0px;
	height: 1000px;
	background-size: cover;
	height: 1000px;
}

#dogInsert .diTitle {
	text-align: center;
	font-weight: bold;
	font-size: 15px;
}
</style>
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="management">
			<div id="divDogInsert">
				<h2>${vo.dogCode}</h2>
				<form name="frm" action="dogUpdate" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="dogCode" value="${vo.dogCode}">
					<table id="dogInsert">
							<tr>
							<td class="diTitle" width=100>품종</td>
							<td><input class="form-control form-control-sm" type="text"
								name="species" value="${vo.species}"></td>
						</tr>
						<tr>
							<td class="diTitle">나이</td>
							<td><input class="form-control form-control-sm" type="text"
								name="age" value="${vo.age}"></td>
						</tr>
						<tr>
							<td class="diTitle">성별</td>
							<td>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="inlineRadio1" value="1" required <c:if test="${vo.gender eq '0'}">checked="checked"</c:if>> <label
										class="form-check-label" for="inlineRadio1">남아</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="inlineRadio2" value="2" required <c:if test="${vo.gender eq '1'}">checked="checked"</c:if>> <label
										class="form-check-label" for="inlineRadio2">여아</label>
								</div>
							</td>
						</tr>
						<tr>
							<td class="diTitle">사이즈</td>
							<td><div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="size"
										id="inlineRadio1" value="A" <c:if test="${vo.size eq 'A'}">checked="checked"</c:if>> <label
										class="form-check-label" for="inlineRadio1">소형견</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="size"
										id="inlineRadio2" value="B" <c:if test="${vo.size eq 'B'}">checked="checked"</c:if>> <label
										class="form-check-label" for="inlineRadio2">중형견</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="size"
										id="inlineRadio3" value="C" <c:if test="${vo.size eq 'C'}">checked="checked"</c:if>> <label
										class="form-check-label" for="inlineRadio3">대형견</label>
								</div></td>
						</tr>
						<tr>
							<td class="diTitle">모색</td>
							<td><input class="form-control form-control-sm" type="text"
								name="color" value="${vo.color}"></td>
						</tr>
						<tr>
							<td class="diTitle">접종여부</td>
							<td><div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" <c:if test="${vo.inoculationStatus eq '0'}">checked="checked"</c:if>
										name="inoculationStatus" id="inlineRadio1" value="0">
									<label class="form-check-label" for="inlineRadio1">O</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" <c:if test="${vo.inoculationStatus eq '1'}">checked="checked"</c:if>
										name="inoculationStatus" id="inlineRadio2" value="1">
									<label class="form-check-label" for="inlineRadio2">X</label>
								</div></td>
						</tr>
						<tr>
							<td class="diTitle">중성화여부</td>
							<td><div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" <c:if test="${vo.neutralizationStatus eq '0'}">checked="checked"</c:if>
										name="neutralizationStatus" id="inlineRadio1" value="0">
									<label class="form-check-label" for="inlineRadio1">O</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" <c:if test="${vo.neutralizationStatus eq '1'}">checked="checked"</c:if>
										name="neutralizationStatus" id="inlineRadio2" value="1">
									<label class="form-check-label" for="inlineRadio2">X</label>
								</div></td>
						</tr>
						<tr>
							<td class="diTitle">입양여부</td>
							<td><div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="adoptStatus" value="1"
								<c:if test="${vo.adoptStatus eq '1'}">checked="checked"</c:if> id="inlineRadio1">
									<label class="form-check-label" for="inlineRadio1">O</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"  name="adoptStatus" value="0"
								<c:if test="${vo.adoptStatus eq '0'}">checked="checked"</c:if> id="inlineRadio2">
									<label class="form-check-label" for="inlineRadio2">X</label>
								</div></td>
						</tr>
						<tr>
							<td class="diTitle">특징</td>
							<td><input class="form-control form-control-sm" type="text"
								name="feature" size=50  value="${vo.feature}"></td>
						</tr>
						<tr>
							<td class="diTitle">대표이미지</td>
							<td><c:if test="${vo.dogImage!=null && vo.dogImage!=''}">
									<img src="/display?fileName=${vo.dogImage}" id="image"
										width=150>
								</c:if> <c:if test="${vo.dogImage==null || vo.dogImage==''}">
									<img src="http://placehold.it/150x120" id="image" width=150>
								</c:if> 

								<div class="custom-file">
									<input type="file" class="custom-file-input" id="customFile"
										name="file"> <label class="custom-file-label"
										for="customFile">Choose file</label>
								</div> <input type="hidden"
								value="${vo.dogImage }" name="dogImage"></td>
						</tr>
						<tr>
							<td class="diTitle">상세정보</td>
							<td>
								<div class="form-group">
									<textarea name="information" class="form-control"
										id="exampleFormControlTextarea1" cols="47" rows="13">${vo.information}</textarea>
								</div>

								<div class="custom-file">
									<input type="file" class="custom-file-input" id="customFile"
										name="files" accept="image/" multiple="multiple"> <label
										class="custom-file-label" for="customFile">Choose
										files</label>
								</div>
								<div id="listFile">
									<c:forEach items="${list}" var="img">
										<img src="/display?fileName=${img}" width=150>
									</c:forEach>
								</div>
							</td>
						</tr>

						<tr>
							<td class="diTitle" colspan=2><input type="submit"
								value="수정"> <input type="reset" value="취소"> <input
								type="button" value="목록" onclick="location.href='dogList'"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

</body>
<script>
	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("수정하시겠습니까?"))
			return;
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