package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberDAO;

@WebServlet("/MemberDelete")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String mid = request.getParameter("mid");
	
		dao.deleteMember(mid);
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("/minPJ02/MemberList");

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberDelete>>>>>>>>>>>");

		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("userId");
	     String[] chkArr = request.getParameterValues("chkArr");
		
		
		MemberDAO dao = new MemberDAO();
		
		if(chkArr != null) {
			
			dao.memberListDelete(chkArr);
		}else {
			int result =  dao.deleteMember(mid);
			session.invalidate();
			response.getWriter().print(result);
			System.out.println("MemberDelete.response>>>>>>>>>>>end");
		}

	}

}
