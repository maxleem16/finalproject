<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 	
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style>

</style>
<div id="divItem">
	<span class="mitems"><img src="/resources/img/logo.png" align=middle ></span>
	<div class="dropdown">
		<button class="dropbtn">�����</button>
		<div class="dropdown-content">
			<a href="#">�Ծ�����</a> 
			<a href="#">����� ���</a> 
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn">��������</button>
		<div class="dropdown-content">
			<a href="#">���� �Ű�</a> 
			<a href="#">���� ����</a> 
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn">����������</button>
		<div class="dropdown-content">
			<a href="#">���� ��� Ȯ��</a> 
			<a href="#">�� �ֺ� ���� ã��</a> 
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn">Ŀ�´�Ƽ</button>
		<div class="dropdown-content">
			<a href="#">�����Խ���</a> 
			<a href="#">�Ŀ���</a> 
		</div>
	</div>
	<span class="itemSearch"> 
		<input type="text"	placeholder="     �˻�� �Է��ϼ���"> &nbsp;&nbsp;&nbsp; 
		<input	type="button" class="wordSearch" value=" SEARCH ">
	</span>
	<c:if test="${id!=null}">
		<span class="items" id="logout">
			<a href="/user/logout">�α׾ƿ�</a>
		</span>
	</c:if>
		<c:if test="${id==null}">
		<span class="items">
			<a href="/user/login">�α���</a>
		</span>
	</c:if>
</div>
<script>
	$("#logout").on("click",function(){
		alert("�α׾ƿ� �Ǿ����ϴ�.");
	});
</script>



