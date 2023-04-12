<%@page import="kr.or.ddit.prod.service.ProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.lprod.service.LprodServiceImpl"%>
<%@page import="kr.or.ddit.lprod.service.ILprodService"%>
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
ILprodService service = LprodServiceImpl.getInstance();
IProdService service2 = ProdServiceImpl.getInstance();
if(request.getParameter("gu")!=null){
	String gu = request.getParameter("gu");
	List<ProdVO> names = (List<ProdVO>)service2.selectNameByGu(gu);
	request.setAttribute("names", names);
	RequestDispatcher rd = request.getRequestDispatcher("/view/prodNameList.jsp");
	rd.forward(request, response);
}else if(request.getParameter("id")!=null){
	String id = request.getParameter("id");
	ProdVO prodVO = (ProdVO)service2.selectProdById(id);
	request.setAttribute("prodVO",prodVO);
	RequestDispatcher rd = request.getRequestDispatcher("/view/prodVOData.jsp");
	rd.forward(request, response);
}
else{
	//service객체를 얻어오기


	//service메소드 호출 -결과값 받기
	List<LprodVO> list = service.selectAll();
	
	//결과값을 request에 저장
	request.setAttribute("list", list);
	
	//view페이지로 이동
	RequestDispatcher rd = request.getRequestDispatcher("/view/LprodList.jsp");
	rd.forward(request, response);
}
%>

</body>
</html>