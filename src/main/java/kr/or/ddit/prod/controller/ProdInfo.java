package kr.or.ddit.prod.controller;

import java.io.IOException;

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
 * Servlet implementation class ProdInfo
 */
@WebServlet("/prodInfo")
public class ProdInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProdInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IProdService service2 = ProdServiceImpl.getInstance();
		String id = request.getParameter("id");
		ProdVO prodVO = (ProdVO)service2.selectProdById(id);
		request.setAttribute("prodVO",prodVO);
		RequestDispatcher rd = request.getRequestDispatcher("/view/prodVOData.jsp");
		rd.forward(request, response);
	}

}
