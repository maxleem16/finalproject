<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<form name="frm" action="/manage/float/messageInsert" method="post">
		<input type="hidden" name="messageNo" value="${messageNo}">
		<table>
			<tr>
				<th>To.</th>
				<td><input type="text" name="receiver"></td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="save"> <input
					type="reset" value="cancle"></td>
			</tr>
		</table>
	</form>
</body>
<script>
	$(frm).submit(function(e) {
		e.preventDefault();
		alert("답변을 등록하시겠습니까?");
		frm.submit();
		refreshAndClose();
	});
	
	 function refreshAndClose() {
	        window.opener.location.reload(true);
	        window.close();
	    }
</script>
</html>