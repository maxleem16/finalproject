<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/resources/css/style2.css">
	<meta charset="UTF-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<title>DDOGDOG MISSING INSERT</title>
	<style>
		#tblminsert {
			margin: auto;
			border-collapse: collapse;
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
	<div id="missingH1"><h1>실종신고 등록</h1></div>
	<form name="frm" action="insert" method="post" enctype="multipart/form-data" class="frmMinsert">
		<table border=1 id="tblminsert">
			<tr>
				<td width=100 class="title">작성자</td>
				<td width=400 class="content"><input type="text" name="writer" value="${id}" readonly></td>
			</tr>
			<tr>
				<td width=100 class="title">제목</td>
				<td class="content"><input type="text" name="title" size=70></td>
			</tr>
			<tr>
				<td width=100 class="title">실종날짜</td>
				<td width=400 class="content"><input type="date" name="missingTime"></td>
			</tr>
			<tr>
				<td width=100 class="title">실종위치</td>
				<td width=400 class="content"><input type="text" name="missingLocation"></td>
			</tr>
			<tr>
				<td width=100 class="title">사례금</td>
				<td width=400 class="content"><input type="number" name="reward"></td>
			</tr>
			<tr>
				<td width=100 class="title">전화번호</td>
				<td width=400 class="content"><input type="text" name="tel"></td>
			</tr>
			<tr>
				<td width=100 class="title">특징</td>
				<td class="content"><textarea cols=75 rows=5 name="feature"  style="resize:none;"></textarea></td>
			</tr>
			<tr>
				<td width=100 class="title">대표이미지</td>
				<td width=400>
					<input type="file" name="file">
					<img id="image" src="http://placehold.it/150x120" width=150>
				</td>
			</tr>
			<tr>
				<td width=100 class="title">
					추가 이미지
				</td>
				<td width=400 height=150>
					<input type="button" value="추가 이미지 등록" id="btnMImage">
					<input type="file" name="files" accept="image/*" multiple>
					<div id="listFile"></div>
				</td>
			</tr>
		</table>
		<div class="btnMInsert">
			<input type="submit" value="등록" class="MIsubmit">
			<input type="reset" value="취소" class="MIreset">
			<input type="button" value="목록" id="btnList">
		</div>
	</form>
	<jsp:include page="../footer.jsp"/>
</body>
<script>
	//유효성 검사
	$(frm).submit(function(e){
		e.preventDefault();
		var title=$(frm.title).val();
		var missingTime=$(frm.missingTime).val();
		var missingLocation=$(frm.missingLocation).val();
		var reward=$(frm.reward).val();
		var tel=$(frm.tel).val();
		var writer=$(frm.writer).val();
		var feature=$(frm.feature).val();
		if(!confirm("등록하시겠습니까?")) return;
		if(title=="" || missingTime=="" || missingLocation=="" || reward=="" ||
		tel=="" || writer=="" || feature==""){
			alert("모든정보를 입력하세요!");
			return;
		}else{
			alert("등록되었습니다!");
			frm.submit();
		}
	});

	//이미지버튼
	$("#btnMImage").on("click",function(){
		$(frm.files).click();
	});
	
	//목록버튼
	$("#btnList").on("click",function(){
		location.href="/missing/list";
	});
	
	//대표이미지 클릭했을떄
	$("#image").on("click",function(){	//이미지클릭할때 file클릭한거처럼 됨
		$(frm.file).click();
	});
	
	//파일업로드
	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];	//1번째 input type="file"에서 이미지 1개만
		$("#image").attr("src",URL.createObjectURL(file));
	});
	
	//파일업로드(여러개)
	$(frm.files).on("change",function(){
		var files=$(frm.files)[0].files;
		var html="";
		$.each(files, function(index, file){
			html+="<img src='" + URL.createObjectURL(file) + "'>";
		});
		$("#listFile").html(html);
	});
</script>
</html>