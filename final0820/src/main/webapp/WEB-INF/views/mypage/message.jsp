<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG MYPAGE</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<jsp:include page="../menu3.jsp" />
	<div class="menuBox">
		<jsp:include page="../menuTop.jsp" />
		<div class="mplistWrap">
			<input type="button" value="문의하기" id="goInsert"><br> <br>
			
			<div id="wholePage">
				<div id="management">
					<c:forEach items="${li}" var="vo">
						<div class="message">
							<span style="font-weight:700;">문의글 : ${vo.title}</span>
							<span style="float:right; font-size:12px; color:#525254;">
							<fmt:formatDate value="${vo.sendDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
							<button class="replyCheck" src="${vo.messageNo}" flag="true">check</button>
							<hr style="border:1.5px solid gray;">
							<div class="reply ${vo.messageNo}"></div>
							<script id="temp" type="text/x-handlebars-template">
					<div class="messageContent1" style="float:right;">
						<span style="color:red; font-weight:500;">유저의 문의글</span><br>
						{{message}}
					</div><br>
					<div class="messageContent2">
						<span style="font-size:11px;"><fmt:formatDate value="${vo.readDate}" pattern="yyyy-MM-dd HH:mm" /></span><br>
						<span style="color:red; font-weight:500;">관리자의 답변 </span><br>
						{{content}}
					</div>
					</script>

					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../myPageFooter.jsp" />
</body>
<script>
	$("#goInsert").on("click", function() {
		location.href = "/mypage/messageInsert";
	});

	$(".reply ${vo.messageNo}").hide();
	var flag;
	$(".replyInsert ${vo.messageNo}").hide();

	$(".message .replyCheck").on("click", function() {
		flag = $(this).attr("flag");
		var messageNo = $(this).attr("src");
		if (flag == 'true') {
			$.ajax({
				type : "get",
				url : "/manage/qnaReply.json",
				dataType : "json",
				data : {
					"messageNo" : messageNo
				},
				success : function(data) {
					var temp = Handlebars.compile($("#temp").html());
					$(".reply." + messageNo).html(temp(data));
					if (data.content == null) {
						$(".replyInsert." + messageNo).show();
					}
				}
			});
			$(".reply." + messageNo).show();
			$(this).attr("flag", "false");
		} else if (flag == 'false') {
			$(".reply." + messageNo).hide();
			$(this).attr("flag", "true");
		}
	});

	function getInsert(messageNo) {
		window.open("/manage/float/messageInsert?messageNo=" + messageNo,
				"messageInsert", "width=400, height=500, top=200, left=500");
	}
</script>
</html>