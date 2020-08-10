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
</head>
<body>
	<h1>아왜안뜨냐리</h1>
	<select id="keyword">
		<option value="">ALL</option>
		<option value="0">대기</option>
		<option value="1">완료</option>
		<option value="2">거부</option>
		</select>
	<table id="tbl" border=1></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr class="title">
		<td><input type="checkbox" id="chkAll"></td>
		<td id="applicationNo">신청번호</td>
		<td id="applicant">신청인</td>
		<td id="dogCode">강아지코드
		</td>
		<td id="appliedDate">신청날짜</td>
		<td id="applicationConfirm">승인상태
		</td>
		</tr>
	{{#each list}}
		<tr class="row">
		<td><input type="checkbox" class="chk"></td>
		<td>{{applicationNo}}</td>
		<td>{{applicant}} [{{name}}]</td>
		<td>{{dogCode}} [{{species}}]</td>
		<td>{{appliedDate}}</td>
		<td>{{printChk applicationConfirm}}</td>
		</tr>
	{{/each}}
	</script>
	<button>승인</button>
	<div id="pagination"></div>
</body>
<script>
	var page=1;
	var searchType;
	var keyword;
	
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
	

	$("#keyword").change(function(){
		var searchType="applicationConfirm";
		var keyword=$(this).val();
		getList(searchType, keyword);
	});
	
	$("#pagination").on("click", "a", function(event) {
		event.preventDefault();
		page = $(this).attr("href");
		getList(searchType, keyword);
	});
	
	
	//맨위에 체크누르면 체크다하기
	$("#tbl").on("click", ".title #chkAll", function() {
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
	$("#tbl").on("click", ".row .chk", function() {
		var isChkAll = true;
		$("#tbl .row .chk").each(function() {
			if (!$(this).is(":checked"))
				isChkAll = false;
		});

		if (isChkAll) {
			$("#tbl #chkAll").prop("checked", true);
		} else {
			$("#tbl #chkAll").prop("checked", false);
		}
	});

	function getList(searchType, keyword) {
		$.ajax({
			type : "get",
			url : "/manage/applyList.json",
			dataType : "json",
			data:{"page":page, "searchType":searchType, "keyword":keyword},
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				//페이지 리스트 출력
				var str = "";
				if (data.pm.prev) {
					str += "<a href='" + (data.pm.startPage - 1) + "'>◀</a>"
				}
				for (var i = data.pm.startPage; i <= data.pm.endPage; i++) {
					if (page == i) {
						str += "<a href='" + i + "' class='active'>[" + i
								+ "]</a>";
					} else {
						str += "<a href='" + i + "'>[" + i + "]</a>";
					}
				}
				if (data.pm.next) {
					str += "<a href='" + (data.pm.endPage + 1) + "'>▶</a>"
				}
				$("#pagination").html(str);
			}
		});
	};

</script>
</html>