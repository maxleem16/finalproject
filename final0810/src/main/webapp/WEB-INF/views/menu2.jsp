
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<style>
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
* { font-family:"Nanum Gothic" !important }
	#divItem {
		width:1500px;
		margin-top:20px;
		position: fixed;	
		top: 0;
		/* width: 100% */
		left: 0;
		right: 0;
		
	}

	#divItem img{
		width:130px;
		margin-left:115px;
		cursor:pointer;	
		
	}

	.items {
		margin-left:50px;
		font-size: 20px;
		font-weight:bold;
		cursor:pointer;
	}
	
	.items a {
		text-decoration:none;
		color:black;
	}
	
	.itemSearch {
		margin-left:40px;
		
	}
	
	.itemSearch input[type='text'] {
	   height: 37px; 
	   width:250px;
	   background-color: #ebecee;
	   border-radius: 30px 30px 30px 30px;
	   border: none;
	   outline: none;
	
	}
	
	.wordSearch {
		background: #F2BB13;
		border-radius: 5px 5px 5px 5px;
		cursor:pointer;	
		font-weight:bold;
		height:35px;
		border: none;
		outline: none;
	}
</style>
<div id="divItem">
	<span class="mitems"><img src="/resources/img/logo.png" align=middle ></span>
	<span class="items"><a href="">�����</a>
		<a href="#">�Ծ� ����</a>
		<a href="#">����� ���</a>
	</span>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
	<span class="items"><a href="">��������</a>
		<a href="#">���� �Ű�</a>
		<a href="#">���� ����</a>
	</span>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
	<span class="items"><a href="">����������</a>
		<a href="#">���� ��� üũ</a>
		<a href="#">�� �ֺ� ���� ã��</a>
	</span>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
	<span class="items"><a href="">Ŀ�´�Ƽ</a>
		<a href="#">�����Խ���</a>
		<a href="#">�Ŀ��ϱ�</a>
	</span>
	<span class="itemSearch">
		<input type="text" placeholder="     �˻�� �Է��ϼ���">
		&nbsp;&nbsp;&nbsp;
		<input type="button" class="wordSearch" value="SEARCH">
	</span>
	<span class="items"><a href="">LOGIN</a></span>
</div>