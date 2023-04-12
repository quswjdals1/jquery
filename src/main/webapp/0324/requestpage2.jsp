<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">	
#par {
	border: 1px solid;
	border-collapse: collapse;	
	width: 80%;
}
#par td{
	width: 200px;
	height: 50px;
	text-align: center;
	border: 1px solid;
}
#info{
	width: 400px;
}
.active{
	background: green;
}
#con{
	border: none;
}
#con td{
	border: none;
}
</style>

<script src="../js/jquery-3.6.4.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(()=>{
	$("#lprod").on("click",function(){
		$.ajax({
			url : "http://localhost/jqpro/0324/BuyerController.jsp",
			type : "get",
			success : function(res){
	
				p="";
				$.each(res,function(i,v){
					
					p+="<p class='names' id="+v["buyer_id"]+">"+v["buyer_name"]+"</p>";
				})
	
				$("#name").html(p);
			},
			error : function(xhr){
				alert("상태: "+xhr.status);
			},
			dataType : "json"
		})
	})
	
	$(document).on("click",".names",function(){
		$(".names").removeClass("active");
		$(this).addClass("active");

		$.ajax({
			url : "http://localhost/jqpro/0324/BuyerController.jsp",
			type : "get",
			data : "id="+$(this).attr("id"),
			success : function(res){
				
				content="<table id='con' class='table table-dark table-hover'>";
				
				$.each(res,function(i,v){
					content+="<tr><td>"+i+"</td><td>"+v+"</td></tr>"
				})
				content+="</table>";
				
				$("#info").html(content);
			},
			error : function(xhr){
				alert("상태: "+xhr.status);
			},
			dataType : "json"
		})
	})
})
</script>
</head>
<body>
<div class="box">
	<p>

	</p>	
	<input type="button" value="LPROD리스트" id="lprod">

	<div id="result">
		<table id="par" border="1" class="table table-dark">
			<tr><td>거래처이름</td><td>거래처상세정보</td></tr>
			<tr><td id='name'></td><td id='info'></td></tr>
		</table>
	</div>
</div>
</body>
</html>