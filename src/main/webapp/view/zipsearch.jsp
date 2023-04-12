<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.box{
	text-align: center;
	padding: 30px;
}
#dong{
	display: inline-block;
	width: 70%;
}
#zip{
	display: inline-block;
}
label{
	display: block;
}
#result1{
	border: 1px solid black;
	height: 150px;
	overflow: auto;
}
#result1 .tr:hover{
	background: skyblue;
}
</style>
<script type="text/javascript">
$(()=>{
	$("#zip").on("click",function(){
		dong = $("#dong").val().trim()
		$.ajax({
			url : "<%=request.getContextPath()%>/zipSearch.do",
			data : {"dong":dong},
			type : "post",
			dataType : "json",
			success : function(res){
				table = "<table>";
				table += "<tr><td>우편번호</td><td>주소</td><td>번지</td></tr>";
				$.each(res,function(i,v){
					bunji = v["bunji"];
					if(typeof bunji=="undefined"){
						bunji=""
					}
					
					table += `<tr class="tr"><td>\${v["zipcode"]}</td>`
					table += `<td>\${v["sido"]} \${v["gugun"]} \${v["dong"]}</td>`
					table += `<td>\${bunji}</td><tr>`
				})
				table +="</table>"
				$("#result1").html(table);
			},
			error : function(xhr){
				alert("상태: "+xhr.status)
			}
		})
	})
	
	$(document).on("click","#result1 .tr",function(){
		zip=$("td:eq(0)",this).text();
		addr= $("td:eq(1)",this).text();
		
		$("#uzip",opener.document).val(zip);
		$("#add1",opener.document).val(addr);
		
		window.close();
	})
	
})
</script>
</head>
<body>
<div class="box">
	 <div class="form-group">
      <label for="dong">찾는동을 입력하세요</label><br>
      <input type="text" class="form-control" id="dong" placeholder="Enter dong" name="dong" required>
      <div class="invalid-feedback">Please fill out this field.</div>
      <input type="button" value="검색" id="zip" class="btn btn-success btn-sm">
    </div>
	
	<br><br>
	<div class="result" id="result1"></div>
</div>
</body>
</html>