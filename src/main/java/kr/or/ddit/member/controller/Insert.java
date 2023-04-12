package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;


@WebServlet("/insert.do")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("mem_id");
		String name = request.getParameter("mem_name");
		String pass = request.getParameter("mem_pass");
		String bir = request.getParameter("mem_bir");
		String hp = request.getParameter("mem_hp");
		String mail = request.getParameter("mem_mail");
		String zip = request.getParameter("mem_zip");
		String add1 = request.getParameter("mem_add1");
		String add2 = request.getParameter("mem_add2");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_id(id);
		memberVO.setMem_name(name);
		memberVO.setMem_pass(pass);
		memberVO.setMem_bir(bir);
		memberVO.setMem_hp(hp);
		memberVO.setMem_mail(mail);
		memberVO.setMem_zip(zip);
		memberVO.setMem_add1(add1);
		memberVO.setMem_add2(add2);
		
		IMemberService service = MemberServiceImpl.getInstance();
		int res = service.insertMember(memberVO);
		
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("/view/insert.jsp").forward(request, response);
		
	}

}
