<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
img {
    border: 0;
    padding: 0; 
    width:100%;
}
</style>
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp" />
	</div>
	<div id="divListImg">
		<jsp:include page="../box.jsp"/>	<!-- 광고 이미지 -->
	</div>
	<form name="frm" action="insert" method="post" enctype="multipart/form-data">
		<input type="hidden" name="dogCode">
		<table>
			<tr>
				<td>품종</td>
				<td><input type="text" name="species"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>남아<input type="radio" name="gender" value="0"> 여아<input
					type="radio" name="gender" value="1"></td>
			</tr>
			<tr>
				<td>사이즈</td>
				<td>소형견<input type="radio" name="size" value="A"> 
				중형견<input
					type="radio" name="size" value="B">
					대형견<input
					type="radio" name="size" value="C">
					</td>
			</tr>
			<tr>
				<td>모색</td>
				<td><input type="text" name="color"></td>
			</tr>
			<tr>
				<td>접종여부</td>
				<td>O<input type="radio" name="inoculationStatus" value="0">
					X<input type="radio" name="inoculationStatus" value="1"></td>
			</tr>
			<tr>
				<td>중성화여부</td>
				<td>O<input type="radio" name="neutralizationStatus" value="0">
					X<input type="radio" name="neutralizationStatus" value="1"></td>
			</tr>
			<tr>
				<td>특징</td>
				<td><input type="text" name="feature"></td>
			</tr>
			<tr>
				<td>대표이미지</td>
				<td><img src="http://placehold.it/150x120" id="image" width=150 /><input
					type="file" name="file" /></td>
			</tr>
			<tr>
				<td rowspan=2>상세정보</td>
				<td rowspan=2><textarea name="information">
				</textarea> <input type="file" name="files" accept="image/" multiple="multiple">
					<div id="listFile"></div></td>
			</tr>
		</table>
		<input type="submit" value="등록"> <input type="reset"
			value="취소"> <input type="button" value="목록"
			onclick="location.href='list'">
	</form>
	<jsp:include page="../footer.jsp"/>
</body>
<script>	
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("등록하시겠습니까?")) return;
		var num=${total};
		var count=parseInt(num)+1;
		if(count<100){count="0"+count};
		var dogCode=$('input[name="size"]:checked').val()+count;
		$(frm.dogCode).val(dogCode);
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