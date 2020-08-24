<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <style>
      body{
         font-family: tahoma;
         overflow-x: hidden;
         background-image: url(ur.jpg);
      }
      
      .hi-slide{
         position: relative;
         width: 1600px;
         height: 400px;
         margin: 115px auto 0;
         margin-top: 0px;
      }
      
      .hi-slide .hi-prev,
      .hi-slide .hi-next{
         position: absolute;
         top: 70%;
         width: 40px;
         height: 40px;
         margin-top: -20px;
         border-radius: 50px;
         line-height: 40px;
         text-align:center;
         cursor: pointer;
         background-color: white;
         color: black;
         transition: all 0.3s;
         font-size: 20px;
         font-weight: bold;
      }
      
      .hi-slide .hi-prev:hover,
      .hi-slide .hi-next:hover{
         opacity: 1;
         background-color:white;
      }
      
      .hi-slide .hi-prev{
         left: -70px;
      }
      
      .hi-slide .hi-prev::before{
         content: '<';
      }
      
      .hi-slide .hi-next{
         right: -90px;
      }
      
      .hi-slide .hi-next::before{
         content: '>';
      }
      
      .hi-slide > ul{
         list-style: none;
         position: relative;
         width: 1700px;
         height: 400px;
         margin-left: 30px;
         pading: 0;
      }
      
      .hi-slide > ul > li{
         overflow: hidden;
         position: absolute;
         z-index: 0;
         left: 377px;
         top: 147px;
         width: 0;
         height: 0;
         margin: 0;
         padding: 0;
         background-color: #333;
         cursor: pointer;
      }
      
      .hi-slide > ul > li > img{
         width: 100%;
         height: 100%;
         background-position: center;
      }
   </style>
</head>
<body>
   <div class="slide hi-slide">
      <div class="hi-prev"></div>
      <div class="hi-next"></div>
      <ul>
         <li><img src="/resources/img/indexslide/1.jpg" alt=""></li>
         <li><img src="/resources/img/indexslide/2.jpg" alt=""></li>
         <li><img src="/resources/img/indexslide/3.jpg" alt=""></li>
         <li><img src="/resources/img/indexslide/4.jpg" alt=""></li>
         <li><img src="/resources/img/indexslide/5.jpg" alt=""></li>
         <li><img src="/resources/img/indexslide/6.jpg" alt=""></li>
         <li><img src="/resources/img/indexslide/7.jpg" alt=""></li>
         <li><img src="/resources/img/indexslide/8.jpg" alt=""></li>
         <li><img src="/resources/img/indexslide/9.jpg" alt=""></li>
      </ul>
   </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/resources/js/jquery.hislide.js"></script>
<script>
   $(".slide").hiSlide();
</script>
</html>