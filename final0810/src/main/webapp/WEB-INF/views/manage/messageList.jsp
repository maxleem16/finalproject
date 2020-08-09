<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
.message {
	width:800px;
	background:pink;
	margin:30px auto;
	padding:20px;
}

#scrollDown{
	text-align: center;
}

#downArrow{
	width:50px;
	height: 50px;
	cursor: pointer;
}
.messageNreply {
	margin-top:10px;
	border: 1px solid black; 
	padding:10px;
	background:white;
}
</style>
<link rel="stylesheet" type="text/css" href="/resources/css/style4manage.css">
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
					<span>FROM.<b>${vo.sender}</b></span>
					<span>
					<fmt:formatDate value="${vo.sendDate}" pattern="yyyy년 MM월 dd일"/>
					</span>
					<c:if test="${vo.readDate != null}">답변완료</c:if>
					<hr>
					<span>${vo.title }</span>
					<button class="replyCheck" src="${vo.messageNo}" flag="true">check</button>
					<div class="reply ${vo.messageNo}"></div>
					<script id="temp" type="text/x-handlebars-template">
					<div class="messageNreply">
					<div class="messageContent">
						{{message}}
					</div>
					<hr>
					<span class="receiver">{{printReceiver receiver}}</span><span>{{vo.sendDate}}</span>
					<div class="messageContent">
						{{content}}
					</div>
					</div>
					</script>
					<div class="replyInsert ${vo.messageNo}">
						<button onclick="getInsert(${vo.messageNo})">reply</button>
					</div>
				</div>
			</c:forEach>
			<c:if test="${total  > cri.perPageNum}">
			<div id="scrollDown">
				<img src="/resources/img/down-arrow.png" id="downArrow">
			</div>
			</c:if>
		</div>
	</div>
</body>
<script>
	var perPageNum="${cri.perPageNum}";
	$("#downArrow").click(function(){
		perPageNum=parseInt(perPageNum) + 5;
		location.href="/manage/messageList?perPageNum="+perPageNum;
	});
	
	   Handlebars.registerHelper('printReceiver', function(receiver) {
		      var src;
		      if (receiver == null) {
		         src = "답변을 작성해 주세여";
		      } else {
		         src = "TO."+receiver;
		      };
		      return src;
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
			$(".replyInsert."+messageNo).hide();
			$(this).attr("flag","true");
		}
	});
	
	
	function getInsert(messageNo){
		window.open("/manage/float/messageInsert?messageNo="+messageNo,"messageInsert","width=400, height=500, top=200, left=500");
	}
</script>
</html>