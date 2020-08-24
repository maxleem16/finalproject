<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
table {
	margin:20px auto;
}
th{
	text-align: center;
}
</style>
</head>
<body>
	<form name="frm" action="/manage/float/messageInsert" method="post">
		<input type="hidden" name="messageNo" value="${vo.messageNo}">
		<table>
			<tr>
				<th>To.</th>
				<td width="300"><input class="form-control" type="text" name="receiver"
					value="${vo.sender}" readonly></td>
			</tr>
			<tr>
				<th>Content</th>
				<td>
					<div class="form-group">
						<textarea class="form-control" name="content"
							id="exampleFormControlTextarea1" rows="12" cols="20"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<th colspan=2><input type="submit" value="save"> <input
					type="reset" value="cancle"></th>
			</tr>
		</table>
	</form>
</body>
<script>
	$(frm).submit(function(e) {
		e.preventDefault();
		var no=$(frm.messageNo).val();
		var name=$(frm.receiver).val();
		var con=$(frm.content).val();
		if(!confirm("답변을 등록하시겠습니까?")) return;
		
		$.ajax({
				type : "post",
				url : "/manage/float/messageInsert",
				data : {
					"messageNo" : no,
					"receiver" : name,
					"content":con
				},
				success : function() {
				}
		});
		alert("답변이 등록되었습니다.");
		Close_Event();
		window.close();
	});	

	function Close_Event() {
		opener.document.location.reload();

	}
</script>
</html>