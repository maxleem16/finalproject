<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<!-- JSTL c for each �� fn ��¥ -->
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="EUC-KR">
<title>DDOGDOG Vaccination</title>
	<!-- jQuery -->
	<script src="http://codea.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- handlebars -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<br><br>
	<div id="divMenu">
		<jsp:include page="../menu.jsp" />
	</div>
	<div>

	</div>
<h1>��������Ʈ</h1>
		<jsp:include page="local.jsp" />
	<br>
		<jsp:include page="API.jsp" />
	<br>	
<h1>�������� ���</h1>
<h2>���� ����Ʈ</h2>
<p><b>�ںκ��� [�ʼ�] �κ��Դϴ�</b></p>
		<table id="tbl1" border=1 width=400px style="text-align:center;">
				<tr class="title">
					<th width=20><input type="checkbox" id="chkAll"></th>
					<th width=200>�����̸�</th>
					<th width=100>����</th>
				</tr>
			<c:forEach items="${list}" var="vo">
				<tr class="row">
					<td><input type="checkbox" class="chk" value="${vo.price}"></td>
					<td class="inoculationName" width=200>${vo.inoculationName}</td>
					<td class="price" width=100 style=text-align:right;><fmt:formatNumber value="${vo.price}" pattern="#,###��"/></td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" value="�հ�" id="totalPrice">
		<span id="totalPricePage">
			<span id="sum"></span>��
		</span>
</body>
<script>
$("#totalPricePage").hide();

//�����հ�
$("#totalPrice").on("click",function(){
	var totSum=0;
	if($(".chk:checked").length>0){
		$(".chk:checked").each(function(){
	    	var row=$(this).parent().parent();
	    	var price=row.find(".chk").val();
	    	totSum=totSum+parseInt(price);
	    });
	    $("#sum").html(totSum);
	    $("#totalPricePage").show();
	}
});

//��ü���ù�ư�� Ŭ���� ��� (B���)
$("#tbl1").on("click","#chkAll",function(){
    if($(this).prop("checked")){
       $(".chk").each(function(){
          $(this).prop("checked",true);
       });
    }else{
       $(".chk").each(function(){
          $(this).prop("checked",false);
       });
    }
 });
 
//������ üũ��ư�� Ŭ���� ��� ��üüũ �κ��� �������
$("#tbl1").on("click", ".row .chk", function(){
	var sum=0;
	var isChkAll=true;
    $("#tbl1 .row .chk").each(function(){
       if(!$(this).is(":checked")) isChkAll=false;
    });
    if(isChkAll){
       $("#tbl1 #chkAll").prop("checked", true);
    }else{
       $("#tbl1 #chkAll").prop("checked", false);
    }   
});

</script>
<jsp:include page="../footer.jsp" />
</html>