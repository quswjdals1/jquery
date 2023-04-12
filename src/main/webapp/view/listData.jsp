<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//Controller에서 저장된 처리결과값을 꺼낸다.
List<MemberVO> list = (List<MemberVO>)request.getAttribute("list");
Gson gson = new Gson();
	String json =gson.toJson(list);
	
	out.print(json);
	out.flush();
%>

<%--[
<%
	for(int i=0; i<list.size(); i++){
		if(i>0){
			out.print(",");
		}
%>	
	{
		"name"	: "<%=list.get(i).getMem_name() %>",
		"id"	: "<%=list.get(i).getMem_id()%>",
		"tel"	: "<%=list.get(i).getMem_hp()%>",
		"mail"	: "<%=list.get(i).getMem_mail() %>"
	}	
<%	
	}
%>
] 
--%>