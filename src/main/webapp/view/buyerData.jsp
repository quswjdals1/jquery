<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BuyerVO b = (BuyerVO)request.getAttribute("buyerVO");
Gson gson = new Gson();
String json = gson.toJson(b);
out.print(json);
out.flush();
%>

