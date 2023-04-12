<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//controller에서 저장한 값 꺼내기

String res = (String)request.getAttribute("idCheck");
if(res!=null){
%>
	{
		"flag" : "사용불가능 id 입니다."
	}
<%
}else{
%>
	{
		"flag" : "사용가능 id 입니다."
	}
<%
}
%>