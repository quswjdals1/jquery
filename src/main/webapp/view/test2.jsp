<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ page session="true"%>
 
<body>
    <!-- 로그인한 상태일 경우와 비로그인 상태일 경우의 chat_id설정 -->
	<button onclick="test()">확인</button>
       내id <input type="text" value='${login.id }' id='chat_id' />
      상대방 id<input type="text"  id='other_id' />
        <input type="text" value='<%=session.getId().substring(0, 6)%>'
            id='chat_id' />
    
    <!--     채팅창 -->
    <div id="_chatbox" >
        <fieldset>
            <div id="messageWindow"></div>
            <br /> <input id="inputMessage" type="text" onkeyup="enterkey()" />
            <input type="submit" value="send" onclick="send()" />
        </fieldset>
    </div>
    <img class="chat" src="./img/chat.png" />
</body>
<!-- 말풍선아이콘 클릭시 채팅창 열고 닫기 -->
<script src="../js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script>
    $(".chat").on({
        "click" : function() {
            if ($(this).attr("src") == "./img/chat.png") {
                $(".chat").attr("src", "./img/chathide.png");
                $("#_chatbox").css("display", "block");
            } else if ($(this).attr("src") == "./img/chathide.png") {
                $(".chat").attr("src", "./img/chat.png");
                $("#_chatbox").css("display", "none");
            }
        }
    });
</script>
<script type="text/javascript">
function test(){

    textarea = document.getElementById("messageWindow");
    otheruser = document.getElementById("other_id").value;
    user = document.getElementById("chat_id").value;
    
    webSocket = new WebSocket('ws://localhost:80/jqpro/broadcasting?id='+user+"&oid="+otheruser);
    inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
        onError(event)
    };
    webSocket.onopen = function(event) {

        onOpen(event)
    };
    webSocket.onmessage = function(event) {
    	
        onMessage(event)
        
    };
}
    function onMessage(event) {
    	
        var message = JSON.parse(event.data)
        
        var sender =  message["sender"];
        var content = message["message"];
        if (content == "") {
            
        } else {
            if (content.match("/")) {
                if (content.match(("/" + $("#chat_id").val()))) {
                    var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
                    if (temp[1].trim() == "") {
                    } else {
                        $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
                            + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "</p>");
                    }
                } else {
                }
            } else {
                if (content.match("!")) {
                    $("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'><b class='impress'>" + sender + " : " + content + "</b></p>");
                } else {
                    $("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'>" + sender + " : " + content + "</p>");
                }
            }
        }
    }
    function onOpen(event) {
        $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
    }
    function onError(event) {
        alert(event.data);
    }
    function send() {
        if (inputMessage.value == "") {
        } else {
            $("#messageWindow").html($("#messageWindow").html()
                + "<p class='chat_content'>나 : " + inputMessage.value + "</p>");
        }
        
        message={
        			"sender" : $("#chat_id").val() ,
        			"reciever" : $("#other_id").val(),
        			"message" : inputMessage.value
        		}
        webSocket.send(JSON.stringify(message));
        inputMessage.value = "";
    }
    //     엔터키를 통해 send함
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
    //     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);

</script>

</html>