package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

/**
 * Servlet implementation class ProdNames
 */
@WebServlet("/prodNames")
public class ProdNames extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProdNames() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IProdService service2 = ProdServiceImpl.getInstance();
		String gu = request.getParameter("gu");
		List<ProdVO> names = (List<ProdVO>)service2.selectNameByGu(gu);
		request.setAttribute("names", names);
		RequestDispatcher rd = request.getRequestDispatcher("/view/prodNameList.jsp");
		rd.forward(request, response);
	}

}
