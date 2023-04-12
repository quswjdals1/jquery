<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>



<script src="../js/board.js" type="text/javascript"></script>
<script src="../js/jquery.serializejson.min.js" type="text/javascript"></script>
<style type="text/css">
* {
   box-sizing: border-box;
}

p {
   margin: 1px;
   padding: 3px;
   height: auto;
}

.p1 {
   float : left;
   width : 70%;

}

.p2 {
   float : right;
   width : 28%;
   
}

.p3 {
   clear: both;
}

input[name=reply] {
   height: 50px;
   vertical-align: top;
}

#pagelist {
   margin-left: 10%;

}

nav a {
   /* 화면에 안보이게 하기 */
   /* display: none; 자리를 차지하지 않음 */
   visibility: hidden; /* 자리를 차지함 */
}

#stype {
   width : 90px;
   margin-right: 8px;
}

#sword {
   width : 200px;
}

label {
   display: inline-block;
   width: 80px;
   height: 30px;
}

.reply-body{
   background: #f1faad;
   border: 1px solid gold;
   margin: 1px;
   padding: 5px;
}

#modifyform{
   display: none;
}
</style>


<script type="text/javascript">

currentPage = 1;
mypath = '<%=request.getContextPath()%>'
console.log(mypath);
reply = { } // 객체(스크립트 객체는 동적으로 속성과 기능을 추가 가능함)
// reply.name = "" reply.bnum = 

$(function() {
   $.listPageServer(1);
   
   // 이벤트
   // 페이지번호 클릭
   
   // 다음버튼 클릭
   $(document).on('click','#next', function() {
      currentPage = parseInt($('.pageno').last().text().trim()) + 1;
      //alert(currentPage);
      
      $.listPageServer(currentPage)
      if($('#modifyform').css('display') != "none"){
         // 열려있다.
         replyReset();
      }
   })
   
   // 이전버튼 클릭
   $(document).on('click','#prev', function() {
      currentPage = parseInt($('.pageno').first().text().trim()) - 1;
      $.listPageServer(currentPage);
      if($('#modifyform').css('display') != "none"){
         // 열려있다.
         replyReset();
      }
   })
   
   // 페이지번호 클릭
   $(document).on('click', '.pageno', function() {
      currentPage = $(this).text().trim();
      $.listPageServer(currentPage);
      if($('#modifyform').css('display') != "none"){
         // 열려있다.
         replyReset();
      }
   })
   
   // 검색 search클릭
   $('#search').on('click', function() {
      // 처음부터 search는 body태그에 존재했기 때문해 정적, 동적방식 모두 사용가능
      currentPage = 1;
      $.listPageServer(currentPage);
      if($('#modifyform').css('display') != "none"){
         // 열려있다.
         replyReset();
      }
      
   })
   
   // 글쓰기 : 버튼에서 설정 - data-bs-toggle="modal" data-bs-target="#wModal"
   /* $('#write').on('click', function() {
      $('#wModal').modal('show');
   }) */
   
   // 글쓰기 모달창에서 send전송 버튼 클릭
   $('#send').on('click', function() {
      // 입력한 모든 값을 가져온다
      fdata = $('#wform').serializeJSON();
      console.log(fdata);
      
      $('#wform .text').val("");
      $('#wModal').modal('hide');
      
      // 서버로 전송하기
      $.boardWriteServer();
      
      if($('#modifyform').css('display') != "none"){
         // 열려있다.
         replyReset();
      }
      
   })
   
   // 수정 삭제 등록 댓글수정 댓글삭제 -- 이벤트
   $(document).on('click', '.action', function() {
      if($('#modifyform').css('display') != "none"){
         // 열려있다.
         replyReset();
      }
      
      vaction = $(this).attr('name');
      vidx = $(this).attr('idx');
      
      
      if(vaction == "modify"){
         
    	 vmodify=this;
    	  
         // 수정할 본문의 내용을 가져온다.
         vparents = $(this).parents('.card')
         vtitle = $(vparents).find('a').text().trim();
         vname = $(vparents).find('#wr').text().trim();
         vmail = $(vparents).find('#em').text().trim();
         vp3 = $(vparents).find('.p3').html().trim();
         
         cont = vp3.replace(/<br>/g,"\n");
         $("#mform #writer").val(vname);
         $("#mform #subject").val(vtitle);
         $("#mform #mail").val(vmail);
         $("#mform #content").val(cont);
         $("#mform #num").val(vidx);
         
         // model창에 출력한다.
         
         
         $('#mModal').modal('show');
         
         $("#mform #writer").prop("disabled",true)
         
         
      } else if(vaction == "delete"){
         alert(vidx + "번 글 삭제");
         
         $.boardDeleteServer();
         
      } else if(vaction == "list"){
         // alert(vidx + "번 게시판과 댓글을 모두 보기");
         $.replyListServer(this);
         
         
         // 조회수 증가
         vshow = $(this).attr('aria-expanded')
         
         if(vshow=="true"){
        	$.hitUpdateServer(this);
         }
         
         
      } else if(vaction == "reply"){
         // alert(vidx + "번 글에 댓글을 씁니다");
         console.log($(this).prev().val())
         cont = $(this).prev().val();
         
         name1 = String.fromCharCode(parseInt(Math.random()*26+65)); // A~Z
         name2 = String.fromCharCode(parseInt(Math.random()*26+97)); // a~z
         name3 = parseInt(Math.random()*100+1); // 1~100
         
         reply.name = name1 + name2 + name3;
         reply.cont = cont;
         reply.bonum = vidx;
         
         // 댓글을 입력하면 내용이 지워짐
         $(this).prev().val(""); // 세터랑 게터??
         
         // 서버로 전송 
         $.replyWriteServer(this); // 이 때 this는 등록버튼임
         
         
         // 댓글 리스트를 출력 - 서버로 전송을 성공한 다음 리스트를 출력해야 함
         
         // $.replyListServer() 
         // 이 경우 서버로 전송이 성공했는지 실패했는지 상관없이 리스트를 출력하기 때문에 이렇게 하면 안됨
      } else if(vaction == "r_modify"){
         // alert(vidx + "번 댓글을 수정")
         
         // modifyform이 열려있는지 비교
         if($('#modifyform').css('display') != "none"){
            // 열려있다.
            replyReset();
         }
         
         // 수정할 내용(원래 내용을 가져온다)
         modifycont = $(this).parents('.reply-body').find('.p3').html().trim(); // trim()으로 앞뒤공백제거
         
         // 원래 내용의 <br>태그를 \n으로 변경 - modifyform (수정폼)에 출력
         mcont = modifycont.replace(/<br>/g, "\n");
         $('#modifyform textarea').val(mcont);
         
         // 수정폼을 <p3>으로 이동
         $(this).parents('.reply-body').find('.p3').empty().append($('#modifyform'));
         
         // 수정폼을 보여지게 하기
         //$('#modifyform').css('display', 'block')
         
         $('#modifyform').show();
      } else if(vaction == "r_delete"){
         // alert(vidx + "번 댓글을 삭제")
         $.deleteReplyServer(this);
      } 
      
      
   }) // 이벤트
   
   replyReset = function() {
      // p3을 찾는다
      vp3 = $('#modifyform').parent();
      
      // 수정폼을 바디로 이동시킨다
      $('body').append($('#modifyform'));
      $('#modifyform').hide();
      
      // 원래 내용을 p3으로 다시 출력
      $(vp3).html(modifycont);
      
   }
   // 댓글 수정창에서 확인버튼
   $('#btnok').on('click', function() {
      // 입력한 내용을 가져온다. - 엔터기호가 포함
      modicont = $('#modifyform textarea').val();
      
      // 엔터기호를 <br>태그로 변경
      modiout = modicont.replace(/\n/g, "<br>");
      
      // p3을 찾는다
      // vp3 = $(this).parents($('.p3'));
      vp3 = $('#modifyform').parent();
      
      // modifyform을 body로 이동 - 안보이도록 설정
      $('#modifyform').appendTo($('body'));
      $('#modifyform').hide();
      
      // p3에 입력한 내용(<br>태그로 변경한)을 출력 - DB수정 후에 실행
      //$(vp3).html(modiout);
      
      reply.cont = modicont;
      reply.renum = vidx;
      $.replyUpdateServer();
   })
   
   
   
   // 댓글 수정창에서 취소버튼
   $('#btnreset').on('click', function() {
      replyReset();
   })
   
   
   	$("#msend").on("click",function(){
   		fdata = $("#mform").serialize()+"&num="+vidx;
   		console.log(fdata)
   		
   		$.boardUpdate(); 
   		
   		
   		vmw = $("#mform #writer").val();
        vms = $("#mform #subject").val();
        vmm = $("#mform #mail").val();
        vmc = $("#mform #content").val();
        
       
        vmc = vmc.replaceAll(/\n/g,"<br>");
        
        $('#mModal').modal('hide');
        
       
   		
   	})
   
}) // $function


</script>
</head>
<body>
<div id="modifyform">
   <textarea rows="5" cols="50"></textarea>
   <input type="button" value="확인" id="btnok">
   <input type="button" value="취소" id="btnreset">
</div>



   <input type="button" value="글쓰기" id="write" data-bs-toggle="modal" data-bs-target="#wModal">
   <br><br>
   <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
     <div class="container-fluid">
       <!-- <a class="navbar-brand" href="javascript:void(0)">Logo</a> -->
       <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
         <span class="navbar-toggler-icon"></span>
       </button>
       <div class="collapse navbar-collapse" id="mynavbar">
         <ul class="navbar-nav me-auto">
           <li class="nav-item">
             <a class="nav-link" href="javascript:void(0)">Link</a>
           </li>
           
         </ul>
         <form class="d-flex">
            <select class="form-select" id="stype">
           <option value="">전체</option>
           <option value="writer">이름</option>
           <option value="subject">제목</option>
           <option value="content">내용</option>
         </select>
           <input class="form-control me-2" type="text" placeholder="Search" id="sword">
           <button class="btn btn-primary" type="button" id="search">Search</button>
         </form>
       </div>
     </div>
   </nav>
   <br><br>
   <div id="result"></div>
   <br><br>
   <div id="pagelist"></div>
   
   
   <!-- The Modal -->
   <div class="modal" id="wModal">
     <div class="modal-dialog">
       <div class="modal-content">
   
         <!-- Modal Header -->
         <div class="modal-header">
           <h4 class="modal-title">Modal Heading</h4>
           <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
         </div>
   
         <!-- Modal body -->
         <div class="modal-body">
           <form name="wform" id="wform">
              <label>이름</label>
              <input type="text" name="writer" class="text"><br>
              
              <label>제목</label>
              <input type="text" name="subject" class="text"><br>
              
              <label>메일</label>
              <input type="text" name="mail" class="text"><br>
              
              <label>비밀번호</label>
              <input type="password" name="password" class="text"><br>
              
              <label>내용</label>
              <br>
              <textarea rows="5" cols="40" name="content" class="text"></textarea> <br><br>
              <input type="button" value="전송" id="send">
              
              
           </form>
         </div>
   
         <!-- Modal footer -->
         <div class="modal-footer">
           <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
         </div>
   
       </div>
     </div>
   </div>
   
   
   <!-- 글 수정 The Modal -->
   <div class="modal" id="mModal">
     <div class="modal-dialog">
       <div class="modal-content">
   
         <!-- Modal Header -->
         <div class="modal-header">
           <h4 class="modal-title">Modal Heading</h4>
           <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
         </div>
   
         <!-- Modal body -->
         <div class="modal-body">
           <form name="mform" id="mform">
              <input type="hidden" id="num">
              <label>이름</label>
              <input type="text" name="writer" class="text" id="writer"><br>
              
              <label>제목</label>
              <input type="text" name="subject" class="text" id="subject"><br>
              
              <label>메일</label>
              <input type="text" name="mail" class="text" id="mail"><br>
              
              <label>비밀번호</label>
              <input type="password" name="password" class="text" id="password"><br>
              
              <label>내용</label>
              <br>
              <textarea id="content" rows="5" cols="40" name="content" class="text"></textarea> <br><br>
              <input type="button" value="전송" id="msend">
              
              
           </form>
         </div>
   
         <!-- Modal footer -->
         <div class="modal-footer">
           <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
         </div>
   
       </div>
     </div>
   </div>
</body>
</html>