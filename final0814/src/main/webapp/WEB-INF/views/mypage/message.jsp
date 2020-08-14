<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의 내역</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<input type="button" value="문의하기" id="goInsert"><br><br><hr>
	<div id="wholePage">
		<div id="management">
			<c:forEach items="${li}" var="vo">
				<div class="message">
					<span>${vo.sender}</span><span>${vo.sendDate}</span>
					<span>${vo.title}</span>
					<button class="replyCheck" src="${vo.messageNo}" flag="true">check</button>
					<hr>
					<div class="reply ${vo.messageNo}"></div>
					<script id="temp" type="text/x-handlebars-template">
					<div class="messageContent">
						<span style="color:red">유저가 관리자한테 보낸 내용 :</span>
						{{message}}
					</div><br>
					<span>{{receiver}}</span><span>{{vo.sendDate}}</span>
					<div class="messageContent">
						<span style="color:red">관리자가 유저에게 답변한 내용 :</span>
						{{content}}
					</div>
					<hr><br>
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
	$("#goInsert").on("click",function(){
		location.href="/mypage/messageInsert";
	});

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
					if(data.content==null){
						$(".replyInsert."+messageNo).show();
					}
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