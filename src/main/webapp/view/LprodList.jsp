<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
//controller에서 저장한 데이터 꺼내기
	List<LprodVO> list = (List<LprodVO>)request.getAttribute("list");

	Gson gson = new Gson();
	String json = gson.toJson(list);
	out.print(json);
	out.flush();
%>
<%-- [
	<% 
	for(int i=0; i<list.size(); i++){
		if(i>0){
			out.print(",");
		}
		LprodVO lprodVO = list.get(i);
	%>
		{
			"lprod_id"	:	"<%=lprodVO.getLprod_id() %>",
			"lpgu"	:	"<%=lprodVO.getLprod_gu() %>",
			"nm"	:	"<%=lprodVO.getLprod_nm() %>"
		}
	<%
	}
	%>
] --%>
