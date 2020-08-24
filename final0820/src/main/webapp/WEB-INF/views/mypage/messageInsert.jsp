<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
table {
	margin: 20px auto;
}

th {
	text-align: center;
}

.mplistWrap {
	text-align: center;
	margin-top:20px;
}

.form-control {
	display: block;
	width: 100%;
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out
}

textarea {
	font-family: inherit;
	font-size: inherit;
	line-height: inherit
}

.btn {
	display: inline-block;
	font-weight: 400;
	color: #212529;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: transparent;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out
}

@media ( prefers-reduced-motion :reduce) {
	.btn {
		transition: none
	}
}

.btn:hover {
	color: #212529;
	text-decoration: none
}

.btn-outline-success {
	color: #28a745;
	border-color: #28a745
}

.btn-outline-success:hover {
	color: #fff;
	background-color: #28a745;
	border-color: #28a745
}

.btn-outline-success.focus, .btn-outline-success:focus {
	box-shadow: 0 0 0 .2rem rgba(40, 167, 69, .5)
}

.btn-outline-danger {
	color: #dc3545;
	border-color: #dc3545
}
.btn-sm {
		padding: .25rem .5rem;
		font-size: .875rem;
		line-height: 1.5;
		border-radius: .2rem
	}
.btn-outline-danger:hover {
	color: #fff;
	background-color: #dc3545;
	border-color: #dc3545
}

.btn-outline-danger.focus, .btn-outline-danger:focus {
	box-shadow: 0 0 0 .2rem rgba(220, 53, 69, .5)
}
</style>
<title>문의하기</title>
</head>
<body>
	<jsp:include page="../menu3.jsp" />
	<div class="menuBox">
		<jsp:include page="../menuTop.jsp" />
		<div class="mplistWrap">
			<h1>문의하기</h1>
			<form name="frm" action="/mypage/messageInsert" method="post">
				<table>
					<tr>
						<td><input type="text" name="title" size=55
							class="form-control" placeholder="제목을 입력해 주세요"> <input
							type="hidden" name="sender" value="${id}"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" name="message" cols=3
								rows=20 placeholder="내용을 입력해 주세요"></textarea></td>
					</tr>
				</table>
				<input type="submit" value="문의하기"
					class="btn btn-outline-success btn-sm"> <input type="reset"
					class="btn btn-outline-danger btn-sm" value="취소">
			</form>
		</div>
	</div>
	<jsp:include page="../myPageFooter.jsp" />
</body>
<script>
	$(frm).submit(function(e) {
		e.preventDefault();
		var sender = $(frm.sender).val();
		var title = $(frm.title).val();
		var message = $(frm.message).val();
		if (!confirm("문의하시겠습니까?"))
			return;
		if (sender == "" || title == "" || message == "") {
			alert("모든정보를 입력하세요!");
			return;
		} else {
			alert("문의되었습니다!");
			frm.submit();
		}
	});
</script>
</html>