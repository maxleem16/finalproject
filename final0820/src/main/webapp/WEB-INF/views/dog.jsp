<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>CRAWLING</title>
</head>
<body>
   <h1>DATA CRAWLING</h1>
   <button id="saveAll">저장쌉가능</button>
   <table id="tbl" border=1></table>
   <script id="temp" type="text/x-handlebars-template">
      {{#each array}}
         <tr class=row>
            <td><img src="{{image}}" width=100 height=100></td>
            <td class="speices">{{speices}}</td>
            <td class="gender">{{{genType gender}}}</td>
            <td><input type="text" class="inoculationStatus" value="{{inoculationStatus}}"></td>
            <td><input type="text" class="age" value="{{age}}"></td>
            <td><input type="text" class="neutralizationStatus" value="{{neutralizationStatus}}"></td>
            <td><button class="save">저장쌉가능</button></td>      
         </tr>
      {{/each}}
   </script>
</body>
<script>
   getList();


   $("#tbl").on("click",".row button",function(){
      var dogCode="D004";
      var row=$(this).parent().parent();
      var species=row.find(".speices").html();
      var gender=row.find(".gender").html();
      var inoculationStatus=row.find(".inoculationStatus").val();
      var age=row.find(".age").val();
      var neutralizationStatus=row.find(".neutralizationStatus").val();
      var dogImage=row.find("img").attr("src");
      $.ajax({
         type :"post",
         url : "insert",
         data : {"species":species, "gender":gender,
             "inoculationStatus":inoculationStatus,
             "age":age, "dogCode":dogCode,
             "dogImage":dogImage, "neutralizationStatus":neutralizationStatus
             },
         success : function(){
         }
      });
   });
   
   Handlebars.registerHelper('genType', function(type) {
	      var src;
	      if (type == "남아") {
	         src = "0";
	      } else if (type == "여아") {
	         src = "1";
	      }
	      ;
	      return src;
	   });

   
   function getList() {
      $.ajax({
         type : "get",
         url : "/dog.json",
         dataType : "json",
         success : function(data) {
            temp = Handlebars.compile($("#temp").html());
            $("#tbl").html(temp(data));
         }
      });
   }
</script>
</html>