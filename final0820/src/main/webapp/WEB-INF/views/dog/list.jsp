<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>DDOGDOG LIST</title>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/fontello-embedded.css">

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

.heart i.icon-heart{
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
.pagination {
   text-align:center;
   margin-bottom:50px;
}
.pagination li {
   display:inline;
   vertical-align:middle;
}
.pagination li a {
   display:-moz-inline-stack;   /*FF2*/
   margin-right:3px;
   padding:5px 10px 5px 10px;
   width:20px ;
   height:15px;
   font-weight:700;
   font-size:13px;
   color:#000;
   border:1px solid #c8c8c8;
   border-radius:100%;
   text-align:center;
   text-decoration:none;

}
.pagination li a.now {
   color:#fff;
   background-color:#F2BB13;
   border:1px solid #F2BB13;
}
.pagination li a:hover, .pagination li a:focus {
   color:#fff;
   border:1px solid #F2BB13;
   background-color:#F2BB13;
}
</style>
</head>
<body>
   <div id="divMenu">
      <jsp:include page="../menu.jsp"/>
   </div>
   <div id="divListImg">
      <jsp:include page="../box.jsp"/>   <!-- 광고 이미지 -->
   </div>
   <div id="listSearch">
      <form name="frm" action="list" id="listfrm">
         <input type="hidden" name="searchType" value="species">
         <input type="text" name="keyword" value="${cri.keyword}" placeholder="  가족이 될 강아지를 찾아보세요!">
         &nbsp;&nbsp;&nbsp;
         <input type="submit" value="SEARCH">
         &nbsp;&nbsp;&nbsp;
         <span style="color:#5a5a5a;">total:  ${pm.totalCount}</span>
      </form>
      <div>
         
      </div>
   </div>
   <div id="divDogList">
      <c:forEach items="${list}" var="vo">
         <div class="divListbox"  code="${vo.dogCode}">
            <div class="divListImg">
               <c:if test="${vo.dogImage == null}">
                  <img src="http://placehold.it/300x250">
               </c:if>
               <c:if test="${vo.dogImage != null}">
                  <img src="/display?fileName=${vo.dogImage}" width=250 height=230>
               </c:if><br>
            </div>
            <span id="divListBoxInfo">
               &nbsp;&nbsp;&nbsp;<b># ${vo.species} 
               # ${vo.age}살</b>
            </span>
            <span class="like">
                  <i class="icon-heart"></i>
            </span>
         </div>
      </c:forEach>
   </div>
   <br><br>

	<ul class="pagination">
         <c:if test="${pm.prev}">
            <li><a href="${pm.startPage-1}"> <span>«</span></a></li>
         </c:if>
         <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
            <c:if test="${pm.cri.page == i }">
               <li class="active"><a href="${i}">${i}</a></li>
            </c:if>
            <c:if test="${pm.cri.page != i }">
               <li class="page"><a href="${i}">${i}</a></li>
            </c:if>
         </c:forEach>
         <c:if test="${pm.next}">
            <li><a href="${pm.endPage+1}"> <span>»</span></a></li>
         </c:if>
      </ul>
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
      location.href="read?dogCode="+dogCode;
   });
   
   var searchType=$(frm.searchType).val();
   var keyword=$(frm.keyword).val();
   

   
   $(".pagination a").on("click", function(e) {
	      e.preventDefault();
	      var page = $(this).attr("href");
	      location.href = "list?page="+page +"&searchType="+searchType+"&keyword="+keyword;
	   });

</script>
</html>