<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1{
		
	}
	p{
		font-size: 2.0em;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String stxt=request.getParameter("txt");
%>
<h1>jsp: java server page</h1>
<p><%= stxt %></p>
</body>
</html>