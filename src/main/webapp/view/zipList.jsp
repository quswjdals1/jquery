<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//controller에서 저장된 값 꺼내기
	List<ZipVO> list = (List<ZipVO>)request.getAttribute("list");
	
	Gson gson = new Gson();
	String json = gson.toJson(list);
	out.print(json);
	out.flush();
%>