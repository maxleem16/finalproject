<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="management">
			<span id="unchecked">Unchecked Message : ${unchecked}</span>
			<c:forEach items="${list}" var="vo">
				<div class="message">
					<span>${vo.sender}</span><span>${vo.sendDate }</span>
					<hr>
					<span>${vo.title }</span>
					<div class="messageContent">${vo.message}</div>
					<button class="replyCheck" src="${vo.messageNo}" flag="true">check</button>
					<div class="reply ${vo.messageNo}"></div>
					<script id="temp" type="text/x-handlebars-template">
					<span>{{receiver}}</span><span>{{vo.sendDate}}</span>
					<hr>
					<div class="messageContent">
						{{content}}
					</div>
					</script>
					<div class="replyInsert ${vo.messageNo}">
						<button onclick="getInsert(${vo.messageNo})">reply</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script>
	$(".reply ${vo.messageNo}").hide();
	var flag;
	$(".replyInsert ${vo.messageNo}").hide();
	
	$(".message .replyCheck").on("click", function() {
		flag=$(this).attr("flag");
		var messageNo = $(this).attr("src");
		if (flag=='true') {
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
				}
			});
			$(".reply." + messageNo).show();
			$(this).attr("flag","false");
		} else if(flag=='false'){
			$(".reply." + messageNo).hide();
			$(this).attr("flag","true");
		}
	});
	
	
	function getInsert(messageNo){
		window.open("/manage/float/messageInsert?messageNo="+messageNo,"messageInsert","width=400, height=500, top=200, left=500");
	}
</script>
</html>