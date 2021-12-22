package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDTO;
import service.MemberDAO;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Login>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		String mid = request.getParameter("id1");
		String mpassword = request.getParameter("pw1");
		
		HttpSession session = request.getSession();

		MemberDAO dao = new MemberDAO();

		int result = dao.memberLogin(mid, mpassword);
		List<MemberDTO> admim01 = dao.selectMember(mid);
		String admin =  admim01.get(0).getAdmin();
		System.out.println(result);
		if(result==1) {
			
		session.setAttribute("userId", mid);
		session.setAttribute("admin", admin);
		response.getWriter().print(result);
		System.out.println("Login>>>>>>>>>>>>>>>>>>>>>>>>>>>end");		


		}else {
			response.getWriter().print(result);
		}
			

		
		
	}

}
