<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//요청시 전송데이터 받기
	
	//service 객체가 필요
	
	IMemberService service = MemberServiceImpl.getInstance();
	List<MemberVO> list =service.selectAllMember();
	
	//처리결과를 request에 저장
	
	request.setAttribute("list", list);
	
	//처리결과를 view페이지로 이동시켜 응답데이터를 생성 -json object 배열 객체
	//이동방법
	RequestDispatcher rd = request.getRequestDispatcher("/view/listData.jsp");
	rd.forward(request, response);
%>
</body>
</html>