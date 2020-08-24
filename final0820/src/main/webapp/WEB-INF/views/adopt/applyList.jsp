<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
body{
 -ms-overflow-style: none;
 }

::-webkit-scrollbar {
  display: none;
}

#management {
	margin-top: 50px;
}

#tblApply {
	border-collapse: collapse;
	margin: auto;
	width: 1300px;
}

#tblApply .title {
	font-weight: bold;
	text-align: center;
}

#tblApply .row {
	background: white;
	color: gray;
	border: 2px solid gray;
	text-align: center;
}

#tblApply td {
	padding: 15px;
	padding-right: 40px;
	padding-left: 40px;
}

button:hover {
	cursor: pointer;
}

body {
	margin: 0;
}

#sortMenu{
	margin:auto;
	text-align:right;
	width: 1300px;
}
select {
    width: 100px; /* 원하는 너비설정 */
    padding: .8em .5em; /* 여백으로 높이 설정 */
    font-size:13px;
    font-family: inherit;  /* 폰트 상속 */ /* 네이티브 화살표를 커스텀 화살표로 대체 */
    border: 1px solid #999;
    background: url('https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg') no-repeat 95% 50%;
    border-radius: 0px; /* iOS 둥근모서리 제거 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
}
a{text-decoration: none;}
</style>
</head>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style4manage.css">
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="navBar">
			<ul>
				<li><a href="#">입양신청서 목록</a></li>
			</ul>
		</div>
		<div id="management">
			<div id="sortMenu">
			<select id="keyword">
				<option value="">승인상태</option>
				<option value="0">승인대기</option>
				<option value="1">승인완료</option>
				<option value="2">승인거부</option>
			</select>
			</div>
			<table id="tblApply"></table>
			<script id="temp" type="text/x-handlebars-template">
		<tr class="title">
		<td id="applicationNo">신청번호</td>
		<td id="applicant">신청인</td>
		<td id="dogCode">강아지코드
		</td>
		<td id="appliedDate">신청날짜</td>
		<td id="applicationConfirm">승인상태
		</td>
		<td></td>
		</tr>
	{{#each list}}
		<tr class="row">
		<td class="ano">{{applicationNo}}</td>
		<td>{{applicant}} [{{name}}]</td>
		<td>{{dogCode}} [{{species}}]</td>
		<td>{{appliedDate}}</td>
		<td>{{printChk applicationConfirm}}</td>
		<td><button class="btnRead btn btn-outline-dark btn-sm">상세내역</button></td>
		</tr>
	{{/each}}
	</script>
			<div id="divPage"></div>
		</div>
	</div>
</body>
<script>
	var page = 1;
	var searchType;
	var keyword;

	$("#tblApply").on(
			"click",
			"tr .btnRead",
			function() {
				var applicationNo = $(this).parent().parent().find(".ano")
						.html();
				window.open("read?applicationNo=" + applicationNo,
						"applicationForm",
						"width=600, height=800, top=150, left=530");
			});

	Handlebars.registerHelper('printChk', function(ac) {
		var src;
		if (ac == '2') {
			src = "승인거부";
		} else if (ac == '0') {
			src = "승인대기"
		} else {
			src = "승인완료"
		}
		return src;
	});

	getList(searchType, keyword);

	$("#keyword").change(function() {
		var searchType = "applicationConfirm";
		var keyword = $(this).val();
		getList(searchType, keyword);
	});

	$("#divPage").on("click", "a", function(event) {
		event.preventDefault();
		page = $(this).attr("href");
		getList(searchType, keyword);
	});

	//맨위에 체크누르면 체크다하기
	$("#tblApply").on("click", ".title #chkAll", function() {
		if ($(this).is(":checked")) {
			$(".row .chk").each(function() {
				$(this).prop("checked", true);
			});
		} else {
			$(".row .chk").each(function() {
				$(this).prop("checked", false);
			});
		}
	});
	//각 행에 잇는 체크 버튼
	$("#tblApply").on("click", ".row .chk", function() {
		var isChkAll = true;
		$("#tblApply .row .chk").each(function() {
			if (!$(this).is(":checked"))
				isChkAll = false;
		});

		if (isChkAll) {
			$("#tblApply #chkAll").prop("checked", true);
		} else {
			$("#tblApply #chkAll").prop("checked", false);
		}
	});

	function getList(searchType, keyword) {
		$
				.ajax({
					type : "get",
					url : "/manage/applyList.json",
					dataType : "json",
					data : {
						"page" : page,
						"perPageNum" : '10',
						"searchType" : searchType,
						"keyword" : keyword
					},
					success : function(data) {
						var temp = Handlebars.compile($("#temp").html());
						$("#tblApply").html(temp(data));
						//페이지 리스트 출력
						var str = "";
						str += "<nav aria-label='Page navigation example'><ul class='pagination justify-content-center'>"
						if (data.pm.prev) {
							str += "<li class='page-item'><a class='page-link' href='"
									+ (data.pm.startPage - 1)
									+ "'><span>«</span></a></li>"
						}
						for (var i = data.pm.startPage; i <= data.pm.endPage; i++) {
							if (page == i) {
								str += "<li class='active page-item'><a class='page-link'  href='" + i + "'>"
										+ i + "</a></li>";
							} else {
								str += "<li class='page page-item'><a class='page-link' href='" + i + "'>"
										+ i + "</a></li>";
							}
						}
						if (data.pm.next) {
							str += "<li class='page-item'><a class='page-link'  href='"
									+ (data.pm.endPage + 1)
									+ "'><span>»</span></a></li>"
						}
						str += "</ul></nav>";
						$("#divPage").html(str);
					}
				});
	};
</script>
</html>