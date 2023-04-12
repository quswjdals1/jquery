<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid blue;
	
}
td{
	width: 300px;
	height: 40px;
	text-align: center;
}
</style>
</head>
<body>
<%
	//요청시 전송데이터 받기
	
	//데이터로 처리 수행, 대부분 DB와 연결해서 crud처리
	
	//처리결과로 응답데이터를 생성 -json object 배열 객체
	
	String sid = "a001";
%>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>이메일</td>
	</tr>

	<tr>
		<td><%=sid %></td>
		<td>이름</td>
		<td>전화번호</td>
		<td>이메일</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>이메일</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>이메일</td>
	</tr>

</table>
</body>
</html>