<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<title>신고글 정보</title>
	<style>
		input[type=file]{visibility:hidden; height:0px;}
		#listFile img{width:900px;}
	</style>
	<link rel="stylesheet" href="/resources/css/style2.css">
	<style>
	html, body {
		display:inline-block;
	}
	
	#Rimage {width:900px;}
	#btnImage {position:absolute; top:810px; left:83.5%; background:#ebecee; width:80px; border:none; outline:none; height:30px; border-radius:20px;}
</style>
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp"/>
	</div>
	<div id="divListImg">
		<jsp:include page="../box.jsp"/>	<!-- 광고 이미지 -->
	</div>
	<div class="missingWrap">
		<form name="frm" action="update" method="post" enctype="multipart/form-data">
			<div class="missingRtitle1">📌 [찾습니다]<input type="text" name="title" value="${read.title}"></div>
			<hr style="opacity:0.5;">
			<div class="missingRidWrap">
				<span class="missingRid">
					<input type="hidden" name="reportNo" value="${read.reportNo}">
					글쓴이: 
					<input type="text" name="writer" value="${read.writer}"  size=6 readonly>
				</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<span class="missingRdate">
					작성 날짜: 	${read.preperationTime}
				</span>
			</div>
			<hr style="opacity:0.5;">
			<table border=1 id="tblMissingRead">
				<tr>
					<td class="missingRtitle">실종날짜</td>
					<td class="missingRcontent"><input type="date" name="missingTime" value="${read.missingTime}"></td>
				
					<td class="missingRtitle">실종위치</td>
					<td class="missingRcontent"><input type="text" name="missingLocation" value="${read.missingLocation}"></td>
				</tr>
				<tr>
					<td class="missingRtitle">사례금</td>
					<td class="missingRcontent"><input type="number" name="reward" value="${read.reward}"></td>
				
					<td class="missingRtitle">연락처</td>
					<td class="missingRcontent"><input type="text" name="tel" value="${read.tel}"></td>
				</tr>
			</table>
			<div class="missingRwrap2">
				<div class="missingRimage">
					<input type="file" name="file">
					<c:if test="${read.dogImage!=null && read.dogImage!=''}">
						<img src="/display?fileName=${read.dogImage}" width=900 height=700 id="Rimage">
					</c:if>
					<c:if test="${read.dogImage==null || read.dogImage==''}">
						<img src="http://placehold.it/150x120" width=900 id="Rimage">
					</c:if>
					<input type="hidden" name="dogImage" value="${read.dogImage}">
					<input type="button" value="upload" id="btnImage">
				</div>
				<div class="missingRwrap3">
					<div class="missingRfeature">
						<textarea cols=50 rows=5 name="feature">${read.feature}</textarea>
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
			<c:if test="${id == read.writer}">
				<input type="submit" value="수정" id="btnMsubmit">
				<input type="reset" value="취소" id="btnMreset">
				<input type="button" value="삭제" id="btnDelete">
			</c:if>
				<input type="button" value="목록" id="btnList">
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
<script>
	//수정버튼(유효성 검사)
	$(frm).submit(function(e){
		e.preventDefault();
		var title=$(frm.title).val();
		var missingTime=$(frm.missingTime).val();
		var missingLocation=$(frm.missingLocation).val();
		var reward=$(frm.reward).val();
		var tel=$(frm.tel).val();
		var writer=$(frm.writer).val();
		var feature=$(frm.feature).val();
		if(!confirm("수정하시겠습니까?")) return;
		if(title=="" || missingTime=="" || missingLocation=="" || reward=="" ||
		tel=="" || writer=="" || feature==""){
			alert("모든정보를 입력하세요!");
			return;
		}else{
			alert("수정되었습니다!");
			frm.submit();
		}
	});
	
	//상품이미지 버튼
	$("#btnImage").on("click",function(){
		$(frm.files).click();
	});

	//삭제버튼
	$("#btnDelete").on("click",function(){
		if(!confirm("삭제하시겠습니까?")) return;
		frm.action="delete";
		frm.submit();
		alert("삭제되었습니다!");
	});

	//목록버튼
	$("#btnList").on("click",function(){
		location.href="/missing/list";
	});

	//이미지 눌렀을때
	$("#Rimage").on("click",function(){	//이미지클릭할때 file클릭한거처럼 됨
		$(frm.file).click();
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
	
	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];	//1번째 input type="file"에서 이미지 1개만
		$("#Rimage").attr("src",URL.createObjectURL(file));
	});
</script>
</html>