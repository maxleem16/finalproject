<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/fontello-embedded.css">
<title>Insert title here</title>
<style>
	* {
		margin:0;
		padding:0;
	}
	li {
		list-style:none;
	}
	.slide_wrapper {
		position: relative;
		width: 960px;
		margin:0 auto;
		height:300px;
		overflow:hidden;
	}
	
	.slides {
		position:absolute;
		left:0; top:0;
		transition:left 0.5s ease-out;
	}
	
	.slides img {
		width:300px;
		height:300px;
	}
	
	.slides li:not(:last-child) {
		float:left;
		margin-right:30px;
	}
	
	.controls {
		text-align:center;
		margin-top:50px;
	}
	
	.controls span {
		color:#F25F29;
		font-size:100px;
		padding: 10px 20px;
		margin:0 10px;
	}
	
	.prev {
		position:absolute;
		top:80px;
		left:0%;
	}
	
	.next {
		position:absolute;
		top:80px;
		left:83%;
	}
	
	#body {
		width:1300px;
		position:absolute;
	}
</style>

</head>
<body>
	<div id="body">
		<div class="slide_wrapper">
			<ul class="slides">
				<li><img src="/resources/img/indexslide/4.jpg" alt=""></li>
				<li><img src="/resources/img/indexslide/3.jpg" alt=""></li>
				<li><img src="/resources/img/indexslide/7.jpg" alt=""></li>
				<li><img src="/resources/img/indexslide/6.jpg" alt=""></li>
				<li><img src="/resources/img/indexslide/5.jpg" alt=""></li>
				<li><img src="/resources/img/indexslide/1.jpg" alt=""></li>
				<li><img src="/resources/img/indexslide/2.jpg" alt=""></li>
				<li><img src="/resources/img/indexslide/8.jpg" alt=""></li>
				<li><img src="/resources/img/indexslide/9.jpg" alt=""></li>
			</ul>
	
		</div>
		<div class="controls">
			<span class="prev"><i class="icon-left-open"></i></span>
			<span class="next"><i class="icon-right-open"></i></span>
		</div>
	</div>
</body>
<script>
	var slides=document.querySelector('.slides'),
		slide = document.querySelectorAll('.slides li'),
		currentIdx = 0,
		slideCount = slide.length,
		prevBtn = document.querySelector('.prev'),
		slideWidth = 300,
		slideMargin = 30,
		nextBtn = document.querySelector('.next');
	
		slides.style.width = (slideWidth + slideMargin)*slideCount - slideMargin + 'px';
		
		function moveSlide(num){
			slides.style.left = -num * 330 + 'px';
			currentIdx = num;
		}
		
		nextBtn.addEventListener('click', function(){
			if(currentIdx < slideCount -3){
				moveSlide(currentIdx + 1);
				console.log(currentIdx);
			}else{
				moveSlide(0);
			}
			
		});
		
		prevBtn.addEventListener('click', function(){
			if(currentIdx > 0){
				moveSlide(currentIdx - 1);
			}else{
				moveSlide(slideCount -3);
			}
			
		});
</script>
</html>