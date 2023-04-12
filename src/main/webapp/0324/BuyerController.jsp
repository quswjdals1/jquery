<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="kr.or.ddit.buyer.service.BuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
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
//service객체를 얻어오기
IBuyerService service = BuyerServiceImpl.getInstance();

	if(request.getParameter("id")!=null){
		String id = request.getParameter("id");
		BuyerVO buyerVO = service.selectById(id);
		request.setAttribute("buyerVO",buyerVO);
		RequestDispatcher rd = request.getRequestDispatcher("/view/buyerData.jsp");
		rd.forward(request, response);
	}
	else{
		
		//service메소드 호출 -결과값 받기
		List<BuyerVO> list = service.selectIdName();
		
		//결과값을 request에 저장
		request.setAttribute("list", list);
		
		//view페이지로 이동
		RequestDispatcher rd = request.getRequestDispatcher("/view/buyerDataList.jsp");
		rd.forward(request, response);
	}
%>

</body>
</html>