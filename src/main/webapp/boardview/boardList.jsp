<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//controller에서 저장한 데이터 꺼내기

List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");

JsonObject obj = new  JsonObject();
int sp = (int)request.getAttribute("startPage");
int ep = (int)request.getAttribute("endPage");
int tp = (int)request.getAttribute("totalPage");

obj.addProperty("sp",sp );
obj.addProperty("ep",ep);
obj.addProperty("tp",tp);




Gson gson= new Gson();

JsonElement json = gson.toJsonTree(list);
obj.add("datas", json);

out.print(obj);
out.flush();
%>