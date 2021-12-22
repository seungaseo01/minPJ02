package controller;

import java.io.IOException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommentDAO;

@WebServlet("/CommentDelete")
public class CommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String testSession = (String) session.getAttribute("userId");
		

		String bnum = request.getParameter("bnum");
		String cnum = request.getParameter("cnum");

		
		CommentDAO dao =new CommentDAO();

		dao.commentdelete(cnum);

		response.sendRedirect("/minPJ02/BoardSelectView?bnum="+bnum);

		
		
		
	}


}
