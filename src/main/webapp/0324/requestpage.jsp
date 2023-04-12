<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">	
#result,#result1{
	margin-top: 20px;	
}
table {
	border: 1px solid;
	border-collapse: collapse;	
}
td{
	width: 200px;
	height: 50px;
	text-align: center;
}
</style>

<script src="../js/jquery-3.6.4.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(()=>{
	$.ajax({
		url : "http://localhost/jqpro/lprodController",
		type : "get",
		success : function(res){
			
			select = "<select id='sel'>"
			
			$.each(res,function(i,v){
				select+="<option value="+v["lprod_gu"]+">"+v["lprod_nm"]+"</option>"
	
			})
			select +="</select> <select id='sel2'></select>";
			$("#result1").html(select);
		},
		error : function(xhr){
			alert("상태: "+xhr.status);
		},
		dataType : "json"
	})
	
	$(document).on("change","#sel",function(){
		
		$.ajax({
			url : "http://localhost/jqpro/prodNames",
			type : "post",
			data : "gu="+$(this).val() ,
			success : function(res){
				opt="";
				$.each(res, function(i,v){
					opt+="<option value="+v["prod_id"]+">"+v["prod_name"]+"</option>"
				})
				
				$("#sel2").html(opt);
			},
			error : function(xhr){
				alert("상태: "+xhr.status);
			},
			dataType : "json"
		})
	})
	
	
	
	
	$(document).on("change","#sel2",function(){
		$.ajax({
			url : "http://localhost/jqpro/prodInfo",
			type : "post",
			data : "id="+$(this).val(),
			success : function(res){
				table="<table border='1'>"
				table+="<tr><td>항목</td><td>내용</td></tr>"
				$.each(res, function(i,v){
					table+="<tr><td>"+i+"</td><td>"+v+"</td></tr>";
				})
				table+="</table>";
				$("#result").html(table);
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


	<div id="result1">
		
	</div><br><br>
	<div id="result">
		
	</div>
</div>
</body>
</html>