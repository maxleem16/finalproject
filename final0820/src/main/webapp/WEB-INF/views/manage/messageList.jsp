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
body {
	-ms-overflow-style: none;
}

::-webkit-scrollbar {
	display: none;
}

.message {
	width: 800px;
	background: #E9E8E8;
	margin: 30px auto;
	padding: 20px;
	border-radius: 15px 15px 0px 15px;
}

#scrollDown {
	text-align: center;
}

#downArrow {
	width: 50px;
	height: 50px;
	cursor: pointer;
}

.messageNreply {
	margin-top: 10px;
	margin-bottom: 0px;
	padding: 10px;
	background: white;
	border-radius: 5px 5px 0px 5px;
}

.replyInsert{
	margin-top: 0px;
	margin-bottom: 10px;
	padding: 10px;
	background: white;
	border-radius: 0px 0px 0px 5px;
}

.spanDate {
	float: right;
}

.replyCheck{
	border:none;
	color: #FFFFFF;
    border:none;
    padding: 10px;
    background-color: #E9E8E8;
    text-shadow: 2px 2px 4px gray; 
}

.btnReply {
	background: #1AAB8A;
	color: #fff;
	border: none;
	border-radius: 2px 2px 2px 2px;
	position: relative;
	height: 20x;
	font-size: 12px;
	padding: 5px;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

.btnReply:hover {
	background: #fff;
	color: #1AAB8A;
	border-radius: 2px 2px 2px 2px;
}

.btnReply:before, .btnReply:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
	border-radius: 2px 2px 2px 2px;
}

.btnReply:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
	border-radius: 2px 2px 2px 2px;
}

.btnReply:hover:before, .btnReply:hover:after {
	width: 100%;
	transition: 800ms ease all;
	border-radius: 2px 2px 2px 2px;
}

#unchecked {
	width: 800px;
	text-align: right;
	font-weight: bold;
	margin: auto;
	margin-top:20px;
}
</style>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style4manage.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="navBar">
			<ul>
				<li><a href="#">1:1 상담내역</a></li>
			</ul>
		</div>
		<div id="management">
			<div id="unchecked">미답변 문의내역 : ${unchecked} 개</div>
			<c:forEach items="${list}" var="vo">
				<div class="message">
					<c:if test="${vo.readDate != null}">답변완료</c:if>
					<c:if test="${vo.readDate == null}">미답변</c:if>
					<span class="spanDate"> <fmt:formatDate
							value="${vo.sendDate}" pattern="yyyy년 MM월 dd일" />
					</span>
					<hr>
					<span>FROM.<b>${vo.sender}</b></span> <span>${vo.title }</span>
					<button class="replyCheck" src="${vo.messageNo}" flag="true">▼</button>
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
						<button class="btnReply" onclick="getInsert(${vo.messageNo})">답변을
							입력해 주세요</button>
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
	var flag;
	var perPageNum="${cri.perPageNum}";
	
	$("#downArrow").click(function(){
		perPageNum=parseInt(perPageNum) + 5;
		location.href="/manage/messageList?perPageNum="+perPageNum;
	});
	
	   Handlebars.registerHelper('printReceiver', function(receiver) {
		      var src;
		      if (receiver == null) {
		         src = "";
		      } else {
		         src = "TO."+receiver;
		      };
		      return src;
		   });

	$(".reply ${vo.messageNo}").hide();
	
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
						$(".reply."+messageNo+" .messageNreply").css('border-radius','5px 5px 0px 0px');
						$(".replyInsert."+messageNo).show(200);
					}
				}
			});
			$(this).attr("flag","false");
			$(".reply." + messageNo).show(200);
		} else if(flag=='false'){
			$(".reply." + messageNo).hide(200);
			$(".replyInsert."+messageNo).hide(200);
			$(this).attr("flag","true");
		}
	});
	
	
	function getInsert(messageNo){
		window.open("/manage/float/messageInsert?messageNo="+messageNo,"messageInsert","width=400, height=450, top=200, left=500");
	}
</script>
</html>