<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<ProdVO> list = (List<ProdVO>)request.getAttribute("names");
	Gson gson = new Gson();
	String json = gson.toJson(list);
	out.print(json);
	out.flush();
%>
<%-- [
	<%for(int i=0; i<list.size(); i++){
		if(i>0){out.print(",");}
		%>
		{
			"id": "<%=list.get(i).getProd_id() %>",
			"name": "<%=list.get(i).getProd_name() %>"
		}
	<%} %>
] --%>