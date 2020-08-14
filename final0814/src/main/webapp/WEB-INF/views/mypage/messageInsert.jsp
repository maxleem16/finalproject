<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<title>문의하기</title>
</head>
<body>
	<h1>문의하기 form</h1>
	<form name="frm" action="/mypage/messageInsert" method="post">
		<table>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title">
					<input type="hidden" name="sender" value="${id}">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="message" rows=4 cols=50></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="문의하기">
		<input type="reset" value="취소">
	</form>
</body>
<script>
	$(frm).submit(function(e){
		e.preventDefault();
		var sender=$(frm.sender).val();
		var title=$(frm.title).val();
		var message=$(frm.message).val();
		if(!confirm("문의하시겠습니까?")) return;
		alert(sender+title+message);
		if(sender=="" || title=="" || message==""){
			alert("모든정보를 입력하세요!");
			return;
		}else{
			alert("문의되었습니다!");
			frm.submit();
		}
	});
</script>
</html>