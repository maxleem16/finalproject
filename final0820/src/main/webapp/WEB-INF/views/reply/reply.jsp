<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>댓글목록</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <script src="https://kit.fontawesome.com/2594a0d020.js" crossorigin="anonymous"></script>
   <style>
      .divContent{width:270px;padding:10px;margin-top:10px;background:#ebecee;border:none;font-size:12px;}
      .replydate, .replyer{float:right;}
      .replyDelete {float:right;}
      #pagination a {color:black; text-decoration: none;}
   </style>
</head>
<body>
   <input type="hidden" id="readPostNo" value="${postingNo}">

   <div id="divInput">
      <input type="text" id="txtReply" size=29>
      <button id="btnInsert">입력</button>
   </div>
   <div id="tbl"></div>
   <script id="temp" type="text/x-handlebars-template">
   {{#each list}}
      <div class="divContent">
         <div class="preperationTime">작성일 : {{preperationTime}}</div> 
       <span class="replyDelete" commentNo={{commentNo}} style="{{printStyle writer}}"><i class="fas fa-trash-alt"></i></span>
       <div class="writer">작성자 : {{writer}}</div>
         <div class="commentContent">내용 : {{commentContent}}</div>
      </div>
   {{/each}}
   </script>
   <div id="pagination" style="text-align:center;">
    </div>
</body>
<script>
   var replyer="${id}";
   var postingNo=$("#readPostNo").val();
   var page=1;
   getReplyList();
   
   function getReplyList() {
         $.ajax({
            type : "get",
            url : "/reply/list",
            dataType : "json",
            data : {
               "postingNo" : postingNo, "page":page
            },
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
      }
   $("#pagination").on("click", "a", function(event) {
         event.preventDefault();
         page = $(this).attr("href");
         getReplyList();
      });
   Handlebars.registerHelper("printStyle",function(writer){
         var src;
         if(replyer!=writer)src="display:none;";
         return src;
      });
   
   $("#tbl").on("click", ".divContent .replyDelete", function(){
      var commentNo=$(this).attr("commentNo");
      if(!confirm(commentNo+" 댓글을 삭제하시겠습니까?"))return;
      
      $.ajax({
         type:"post",
         url:"/reply/delete",
         data:{"commentNo":commentNo},
         success:function(){
            alert("삭제완료!");
            getReplyList();
         }
      });
   });
   
   $("#txtReply").keydown(function(key){
      if(key.keyCode==13){
         $("#btnInsert").click();
      }
   });
   
   $("#btnInsert").on("click", function(){
      var commentContent=$("#txtReply").val();
      if(commentContent==""){
         alert("내용을 입력하세요!");
         return;
      }
      $.ajax({
         type:"post",
         url:"/reply/insert",
         data:{"postingNo":postingNo, "commentContent":commentContent, "writer":replyer},
         success:function(){
            $("#txtReply").val("");
            getReplyList();
         }
      });
   });

</script>
</html>