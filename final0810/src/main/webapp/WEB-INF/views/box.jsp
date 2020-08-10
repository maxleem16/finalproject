<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>
* {box-sizing: border-box;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
	border: 0;
	padding: 0;
	width: 100%;
	min-height: 100%;
	margin: 0 0 0 0;
}
</style>
</head>
<body>

	
	<div class="slideshow-container">

	<div class="mySlides fade">
	  <img src="/resources/img/list_ad.jpg" style="width:100%">
	</div>
	
	<div class="mySlides fade">
	  <img src="/resources/img/list_ad2.jpg" style="width:100%">
	</div>
	
	<div class="mySlides fade">
	  <img src="/resources/img/list_ad3.jpg" style="width:100%">
	</div>
	
	<div class="mySlides fade">
	  <img src="/resources/img/list_ad4.jpg" style="width:100%">
	</div>

	<div class="mySlides fade">
		<img src="/resources/img/list_ad5.jpg" style="width: 100%">
	</div>
	</div>

	
	<div style="text-align:center">
	  <span class="dot"></span> 
	  <span class="dot"></span> 
	  <span class="dot"></span> 
	  <span class="dot"></span> 
	  <span class="dot"></span> 
	</div>
</body>

<script>
  $(document).ready(function(){
    $('.slider').bxSlider();
  });
  
  var slideIndex = 0;
  showSlides();

  function showSlides() {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dot");
      for (i = 0; i < slides.length; i++) {
         slides[i].style.display = "none";  
      }
      slideIndex++;
      if (slideIndex > slides.length) {slideIndex = 1}    
      for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex-1].style.display = "block";  
      dots[slideIndex-1].className += " active";
      setTimeout(showSlides, 2000); // Change image every 2 seconds
  }
</script>
</html>