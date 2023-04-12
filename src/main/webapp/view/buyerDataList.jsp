<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



	<% 
	List<BuyerVO> list = (List<BuyerVO>)request.getAttribute("list");
	Gson gson = new Gson();
	String json = gson.toJson(list);
	out.print(json);
	out.flush();
	%>