<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.board.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReplyVO> list = (List<ReplyVO>)request.getAttribute("list");

	Gson gson = new Gson();
	
	String json = gson.toJson(list);
	out.print(json);
	out.flush();
%>