<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ProdVO p =(ProdVO)request.getAttribute("prodVO");
Gson gson = new Gson();
String json = gson.toJson(p);
out.print(json);
out.flush();
%>
