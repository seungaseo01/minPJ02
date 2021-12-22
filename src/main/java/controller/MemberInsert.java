package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberDAO;

@WebServlet("/MemberInsert")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		String mpassword = request.getParameter("mpassword");
		String mem_phone = request.getParameter("mem_phone");
	    String mem_phone1 = request.getParameter("mem_phone1");
	    String mem_phone2 = request.getParameter("mem_phone2");
	    String mtel = (mem_phone + "-" + mem_phone1 + "-" + mem_phone2);
		String mbirth = request.getParameter("mbirth");
		String memail = request.getParameter("memail01")+"@"+request.getParameter("memail02");
		String mgender = request.getParameter("mgender");
		
		System.out.println(mid+mname+mpassword+mtel+mbirth+memail+mgender);
		MemberDAO dao = new MemberDAO();

		int result = dao.joinMember(mid, mname, mpassword, mtel, mbirth, memail, mgender);
		
		response.getWriter().print(result);

	
		

		


	}

}
