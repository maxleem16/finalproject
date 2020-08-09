<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<title>DDOGDOG REPORT LIST</title>
<style>
#listSearch {
   width: 100%;
   height: 60px;
   margin:0 0 0 0;
   background: #ebecee;
   text-align: center;
}

#listfrm {
   vertical-align: middle;
}

.like {
   font-size:28px;
   position:absolute;
   top:85%;
   right:5%;
   left:86%;
   text-decoration:none;
   color:#00000030;
   cursor:pointer;
}

.heart i.fa-heart{
   color: #f44336;
}

.heart {
   animation: heart 0.5s linear;
}
@keyframes heart {
   0%{
      transform:rotate(0deg) scale(1.7);
   }
   40%{
      transform:rotate(0deg) scale(1);
   }
   41%{
      transform:rotate(360deg) scale(1);
   }
   100%{
      transform:rotate(0deg) scale(1.7);
   }
}

</style>
</head>
<body>
   <div class="divReportwrap">
      <div class="divReportList">
      <c:forEach items="${list}" var="vo">
         <div class="divListbox" code="${vo.dogCode}">
            <div class="divListImg">
               <c:if test="${vo.dogImage == null}">
                  <img src="http://placehold.it/300x250">
               </c:if>
               <c:if test="${vo.dogImage != null}">
                  <img src="/display?fileName=${vo.dogImage}" width=250 height=230>
               </c:if>
               <br>
            </div>
            <span id="divListBoxInfo"> &nbsp;&nbsp;&nbsp;<b>#
                  ${vo.species} # ${vo.age}살</b>
            </span> <span class="like"> <i class="fas fa-heart"></i>
            </span>
         </div>
      </c:forEach>
      </div>
   </div>
    <jsp:include page="../footer.jsp"/>
</body>
<script>
   
   $(document).ready(function(){
      $(".like").click(function(){
         $(this).toggleClass("heart");
         var id="${id}";
         var heart=1;
         var dogCode=$(this).parent().attr("code");
         if(id!=""){
            $.ajax({
               type:"post",
               url:"/mypage/dogLikeInsert",
               data:{"id":id, "dogCode":dogCode, "heart":heart},
               success:function(data){
                  if(data==0){
                     alert("해당 강아지 찜><");
                  }else{
                     $.ajax({
                        type:"post",
                        url:"/mypage/dogLikeDelete",
                        data:{"id":id, "dogCode":dogCode},
                        success:function(){
                           alert("찜에서 삭제했습니다......");
                        }
                     });
                  }
                  
               }
            });
         }else{
            alert("로그인 후 이용가능합니다.");
            location.href="/user/login";
         }   
      });
   });

   $(".divListImg").click(function(){
      dogCode=$(this).parent().attr("code");
      alert(dogCode);
      location.href="read?dogCode="+dogCode;
   });
</script>
</html>