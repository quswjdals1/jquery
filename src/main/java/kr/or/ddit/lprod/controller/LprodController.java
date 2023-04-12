package kr.or.ddit.lprod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.lprod.service.ILprodService;
import kr.or.ddit.lprod.service.LprodServiceImpl;
import kr.or.ddit.lprod.vo.LprodVO;

/**
 * Servlet implementation class LprodController
 */
@WebServlet("/lprodController")
public class LprodController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//service객체를 얻어오기
		ILprodService service = LprodServiceImpl.getInstance();

		//service메소드 호출 -결과값 받기
		List<LprodVO> list = service.selectAll();
		
		//결과값을 request에 저장
		request.setAttribute("list", list);
		
		//view페이지로 이동
		RequestDispatcher rd = request.getRequestDispatcher("/view/LprodList.jsp");
		rd.forward(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
