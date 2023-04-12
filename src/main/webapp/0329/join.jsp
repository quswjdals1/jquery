<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/jquery.serializejson.min.js" type="text/javascript"></script>
<title>Insert title here</title>
<style type="text/css">
#idspan{
	color: red;
}
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

#result1{
	border: 1px solid black;
	height: 150px;
	overflow: auto;
}
#result1 .tr:hover{
	background: skyblue;
}
#resut1 .tr:active{
	background: red;
}
.borderstyle{
	border: 2px solid red;
	box-shadow: none;
}
</style>
<script type="text/javascript">

$(()=>{
	//데이터 유효성 체크
	//id
	$("#uid").on("keyup",function(){
		idvalue=$(this).val().trim()
		
		idreg=/^[a-z][a-z0-9]{3,14}$/;
		
		if(!(idreg.test(idvalue))){
			$("#idCheck").prop("disabled",true)
		}else{
			$("#idCheck").prop("disabled",false)
		}
		regcheck(idreg,idvalue,this);
	})
	
	
	$("#uname").on("keyup",function(){
		namevalue=$(this).val().trim()
		
		namereg=/^[가-힣]{2,5}$/;
		regcheck(namereg,namevalue,this);
	/* 	if(!(idreg.test(idvalue))){
			$(this).addClass("borderstyle")
			$("#idCheck").prop("disabled",true)
		}else{
			$(this).removeClass("borderstyle")
			$("#idCheck").prop("disabled",false)
		} */
	})
	
	
	$("#pwd").on("keyup",function(){
		passvalue=$(this).val().trim()
		//(?=.*[]): []안에 요소의 앞부분에 어떤글자든 0개이상 존재한다.
		passreg=/^(?=.*[A-Z])(?=.*[A-Z])(?=.*[0-9])(?=.*[~!@#$%^&*?]).{5,12}$/;
		regcheck(passreg,passvalue,this);
		
		/* //전방탐색
		str = ["1000원","2000원","원","5000원"]
		reg = /.+(?=원)/; */
	})
	
	$("#umail").on("keyup",function(){
		mailvalue=$(this).val().trim()
		mailreg=/^[a-zA-Z0-9]+@[a-z][0-9a-zA-Z]+(\.[a-zA-Z]+){1,2}$/;
		regcheck(mailreg,mailvalue,this);
	})
	
	$("#uhp").on("keyup",function(){
		hpvalue=$(this).val().trim()
		hpreg=/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
		regcheck(hpreg,hpvalue,this);
	})
	
	regcheck = function(reg,value,ele){
		
		if(!(reg.test(value))){
			$(ele).addClass("borderstyle")
		}else{
			$(ele).removeClass("borderstyle")
		} 
	}
	
	
	
	$("#idCheck").on("click", function(){
		idvalue=$('#uid').val().trim();
		if(idvalue.length<1){
			alert("아이디를 입력 하세요")
			return false;
		}
		
		$.ajax({
			url : '<%=request.getContextPath()%>/idCheck.do',
			type : 'get',
			data : {"id":idvalue},
			success : function(res){
				
				$("#idspan").text(res["flag"])
			},
			error : function(xhr){
				alert("상태: "+xhr.status);
			},
			dataType : 'json'
		})
		
	})
	
	$('#zipsearch').on("click",function(){
		var popupX = (document.body.offsetWidth / 2) - (500 / 2);

		var popupY= (window.screen.height / 2) - (500 / 2);
		
		window.open("<%=request.getContextPath()%>/view/zipsearch.jsp","우편번호찾기","status=no, width=500, height=500, left="+popupX+" top="+popupY);
	})
	
	
	
	
	
	
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
		
		$("#uzip").val(zip);
		$("#add1").val(addr);
		$("#zipModal").modal("hide");
		
		$("#result1").empty();
		$("#dong").val("");
	})
	
	
	$("#send").on("click",function(){
/* 		idval = $("#uid").val().trim();
		nameval = $("#uname").val().trim();
		pwdval = $("#pwd").val().trim();
		ubirval = $("#ubir").val().trim();
		uhp=$("#uhp").val().trim();
		umail=$("#umail").val().trim();
		uzip = $("#uzip").val().trim();
		add1 = $("#add1").val().trim();
		add2 = $("#add2").val().trim();
		
		fdata={
				"id":idval, 
				"name":nameval, 
				"pass":pwdval, 
				"bir" : ubirval,
				"hp" : uhp,
				"mail":umail,
				"zip":uzip,
				"add1" : add1,
				"add2" : add2
		}
		 */
		fdata=$("form").serializeJSON();
		 

 		$.ajax({
			url : "<%=request.getContextPath()%>/insert.do",
			data : fdata,
			type : 'post',
			success : function(res){
				$("#joinspan").html(res.flag).css("color","red");
			},
			error : function(xhr){
				alert("상태: "+xhr.status)
			},
			dataType : "json"
		}) 
		
	})
	

})

</script>
</head>
<body>
<div class="container">
  <h2>회원가입</h2>
  <form  class="needs-validation" novalidate>
  	<div class="form-group">
      <label for="uid">Id:</label>
      <button type="button" id="idCheck" class="btn btn-success btn-sm">중복검사</button>
      <span id="idspan"></span>
      <input type="text" class="form-control" id="uid" placeholder="Enter username" name="mem_id" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="uname">Username:</label>
      <input type="text" class="form-control" id="uname" placeholder="Enter username" name="mem_name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="mem_pass" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
     <div class="form-group">
      <label for="ubir">생년월일:</label>
      <input type="date" class="form-control" id="ubir" placeholder="Enter password" name="mem_bir" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
     <div class="form-group">
      <label for="uhp">전화번호:</label>
      <input type="text" class="form-control" id="uhp" placeholder="Enter password" name="mem_hp" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
     <div class="form-group">
      <label for="umail">이메일:</label>
      <input type="text" class="form-control" id="umail" placeholder="Enter password" name="mem_mail" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
     <div class="form-group">
      <label for="uzip">우편번호:</label>
       <button type="button" id="zipsearch" class="btn btn-success btn-sm">번호검색</button>
       <button type="button" data-toggle="modal" data-target="#zipModal" class="btn btn-success btn-sm">번호검색modal</button>
      <input type="text" class="form-control" id="uzip" placeholder="Enter password" name="mem_zip" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
     <div class="form-group">
      <label for="add1">주소:</label>
      <input type="text" class="form-control" id="add1" placeholder="Enter password" name="mem_add1" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
     <div class="form-group">
      <label for="add2">상세주소:</label>
      <input type="text" class="form-control" id="add2" placeholder="Enter password" name="mem_add2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>

    <button type="button" class="btn btn-light btn-lg" id="send">Submit</button>
    <span id="joinspan"></span>
  </form>
</div>






<div class="modal" id="zipModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">우편번호 찾기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        
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
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal" id="modalclose">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>